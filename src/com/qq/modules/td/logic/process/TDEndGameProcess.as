package com.qq.modules.td.logic.process
{
   import com.qq.CommandName;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.endlessTD.command.EndlessTDProxyCmd;
   import com.qq.modules.td.command.TDItemCmd;
   import com.qq.modules.td.command.game.TDGameCmd;
   import com.qq.modules.td.logic.log.TDLogger;
   import com.qq.modules.td.logic.trigger.TDTriggerManager;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.logic.unit.zombie.BasicZombie;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.model.TDMiniGameCoconutCannonData;
   import com.qq.modules.td.model.TDStageInfo;
   import com.qq.modules.td.model.TDStartParam;
   import com.qq.utils.CommandDispatcher;
   import com.qq.utils.tqos.TQOSUtils;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   import org.as3commons.logging.api.getLogger;
   
   public class TDEndGameProcess extends TDBasicProcess implements IProcess
   {
      
      public static var ID:uint = 6;
       
      
      private var _iswaitEndGame:Boolean;
      
      private var _startEndTime:Number;
      
      private var _isWin:Boolean;
      
      private var aliveFuncId:int;
      
      private var waitEndErrorFuncId:int;
      
      public function TDEndGameProcess()
      {
         super();
         updateDuration = 1000;
      }
      
      override public function doProcess() : void
      {
         super.doProcess();
         if(TDGameInfo.getInstance().isRunningGame)
         {
            this.checkEndTDGame();
         }
      }
      
      public function checkEndTDGame() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Boolean = false;
         var _loc3_:Array = null;
         var _loc4_:BasicZombie = null;
         if(TDGameInfo.getInstance().isStopCheckEndGame)
         {
            return;
         }
         if(this._iswaitEndGame)
         {
            _loc1_ = TDGameInfo.getInstance().getCurGameTime();
            if(_loc1_ - this._startEndTime > 2000)
            {
               this.cleanErrorCheck();
               this.doEndGame();
            }
            return;
         }
         if(TDGameInfo.getInstance().isRunningGame)
         {
            _loc2_ = false;
            _loc3_ = TDGameInfo.getInstance().getGameObjectMapByCatalg(TDConstant.UnitCatalog_Zombie);
            TDGameInfo.getInstance().aliveZombieNum = 0;
            TDGameInfo.getInstance().realAliveZombieNum = 0;
            for each(_loc4_ in _loc3_)
            {
               if(_loc4_.isVaild)
               {
                  if(_loc4_.zombieData.isAlive())
                  {
                     if(!(_loc4_.animation == null || _loc4_.animation.bone == null))
                     {
                        if(_loc4_.isPassWarfield())
                        {
                           _loc2_ = true;
                           if(this.waitEndErrorFuncId == 0)
                           {
                              this.waitEndErrorFuncId = setTimeout(this.checkWaitEndError,5000);
                           }
                           break;
                        }
                        if(!_loc4_.zombieData.isFinishDying)
                        {
                           ++TDGameInfo.getInstance().aliveZombieNum;
                           if(!_loc4_.zombieData.isDying)
                           {
                              ++TDGameInfo.getInstance().realAliveZombieNum;
                           }
                        }
                        if(_loc4_.isLeaveWarfield() == true)
                        {
                           _loc4_.dispose();
                        }
                     }
                  }
               }
            }
            if(!_loc2_)
            {
               if(TDGameInfo.getInstance().isFinishCreateWave && TDGameInfo.getInstance().aliveZombieNum == 0 && this.externalConditionCheck())
               {
                  _loc2_ = true;
                  if(TDStageInfo.getInstance().tdGameType == TDConstant.TDGameType_CoconutCannonShooting)
                  {
                     this._isWin = TDMiniGameCoconutCannonData.getInstance().totalScore >= TDStageInfo.getInstance().needScore.get();
                  }
                  else
                  {
                     this._isWin = true;
                  }
               }
               if(TDGameInfo.getInstance().isFinishCreateWave && TDGameInfo.getInstance().realAliveZombieNum == 0 && this.externalConditionCheck())
               {
                  if(this.aliveFuncId == 0)
                  {
                     this.aliveFuncId = setTimeout(this.checkEndError,10000);
                  }
               }
            }
            if(_loc2_)
            {
               this._iswaitEndGame = true;
               this._startEndTime = TDGameInfo.getInstance().getCurGameTime();
               if(this._isWin)
               {
                  if(TDStageInfo.getInstance().startParam.gameType == TDStartParam.Normal)
                  {
                     TDItemCmd.showFinalItemAt(TDGameInfo.getInstance().lastDieZombiePos.x,TDGameInfo.getInstance().lastDieZombiePos.y);
                  }
               }
            }
         }
         else
         {
            getLogger("TD").debug("游戏已经结束");
         }
      }
      
      private function externalConditionCheck() : Boolean
      {
         return this.popupZombieCheck();
      }
      
      private function popupZombieCheck() : Boolean
      {
         var _loc3_:IGameObject = null;
         var _loc1_:Array = TDGameInfo.getInstance().getGameObjectMapByCatalg(TDConstant.UnitCatalog_Zombie);
         var _loc2_:Array = TDGameInfo.getInstance().getGameObjectMapByCatalg(TDConstant.UnitCatalog_Object);
         for each(_loc3_ in _loc1_.concat(_loc2_))
         {
            if(_loc3_ && _loc3_.getRunningProp(TDConstant.Gameobject_Prop_Die_Popup_Zombie) == true)
            {
               return false;
            }
         }
         return true;
      }
      
      private function doEndGame() : void
      {
         CommandDispatcher.send(CommandName.TD_READY_ENDGAME);
         if(this._isWin)
         {
            this.doWinGame();
         }
         else
         {
            TDGameCmd.failGame();
         }
      }
      
      private function doWinGame() : void
      {
         if(TDStageInfo.getInstance().startParam.gameType == TDStartParam.Endless)
         {
            TDGameInfo.getInstance().isRunningGame = false;
            EndlessTDProxyCmd.reportResult(1,TDGameInfo.getInstance().endlessScore.get(),TDLogger.getInstance().getLog(),false);
         }
         else
         {
            TDTriggerManager.instance.triggerNotify(null,null,true);
            TDGameCmd.winGame();
         }
      }
      
      override public function reset() : void
      {
         this._iswaitEndGame = false;
         this._isWin = false;
         this.cleanErrorCheck();
         super.reset();
      }
      
      override public function dispose() : void
      {
         super.dispose();
         this.cleanErrorCheck();
      }
      
      private function checkEndError() : void
      {
         this.cleanErrorCheck();
         if(!TDGameInfo.getInstance().isPause)
         {
            TQOSUtils.getInstance().reportMsg("TdDyingZombieError");
            this.doWinGame();
         }
      }
      
      private function checkWaitEndError() : void
      {
         this.cleanErrorCheck();
         if(!TDGameInfo.getInstance().isPause)
         {
            TQOSUtils.getInstance().reportMsg("TdWaitEndError");
            TDGameCmd.failGame();
         }
      }
      
      private function cleanErrorCheck() : void
      {
         if(this.aliveFuncId)
         {
            clearTimeout(this.aliveFuncId);
            this.aliveFuncId = 0;
         }
         if(this.waitEndErrorFuncId)
         {
            clearTimeout(this.waitEndErrorFuncId);
            this.waitEndErrorFuncId = 0;
         }
      }
   }
}
