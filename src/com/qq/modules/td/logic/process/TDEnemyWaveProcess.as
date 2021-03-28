package com.qq.modules.td.logic.process
{
   import com.qq.CommandName;
   import com.qq.constant.td.TDConstant;
   import com.qq.constant.td.TDZombieComeModeConstant;
   import com.qq.modules.td.command.game.TDGameObjectCmd;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.command.tips.ShowTipCmd;
   import com.qq.modules.td.data.map.TDMapWaveInfo;
   import com.qq.modules.td.data.map.TDMapWaveType;
   import com.qq.modules.td.logic.TDFactory;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.model.TDStageInfo;
   import com.qq.utils.CommandDispatcher;
   import com.qq.utils.lua.LuaManager;
   import org.as3commons.logging.api.getLogger;
   
   public class TDEnemyWaveProcess extends TDBasicProcess implements IProcess
   {
      
      public static const ID:int = 1;
       
      
      public var curWaveIndex:int;
      
      private var _curEnemyIndex:int;
      
      private var _nextWaveTime:Number;
      
      private var _curWaveData:TDMapWaveInfo;
      
      private var _waveList:Array;
      
      private var _delayReduce:int;
      
      private const BIG_WAVE_MIN_GAP:int = 3000;
      
      public function TDEnemyWaveProcess()
      {
         super();
         updateDuration = 0;
      }
      
      public function get delayReduce() : int
      {
         return this._delayReduce;
      }
      
      override public function reset() : void
      {
         TDGameInfo.getInstance().isFinishCreateWave = false;
         this._curEnemyIndex = 0;
         this.curWaveIndex = 0;
         this._curWaveData = null;
         this._nextWaveTime = 0;
         this.initWaveData();
         super.reset();
      }
      
      private function initWaveData() : void
      {
         var _loc5_:TDMapWaveInfo = null;
         this._waveList = new Array();
         var _loc1_:Array = TDStageInfo.getInstance().waveList;
         var _loc2_:int = _loc1_.length;
         var _loc3_:Number = TDGameInfo.getInstance().getCurGameTime();
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            if((_loc5_ = _loc1_[_loc4_]) != null)
            {
               _loc3_ += _loc5_.delay;
               this._waveList.push([_loc3_,_loc5_]);
            }
            _loc4_++;
         }
         this._waveList.reverse();
      }
      
      override public function dispose() : void
      {
         this._curWaveData = null;
         super.dispose();
      }
      
      override public function doProcess() : void
      {
         var _loc1_:Array = null;
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         super.doProcess();
         if(isStop)
         {
            return;
         }
         if(TDGameInfo.getInstance().isFinishCreateWave)
         {
            return;
         }
         if(this._curWaveData == null)
         {
            if(this._waveList.length == 0)
            {
               TDGameInfo.getInstance().isFinishCreateWave = true;
               getLogger("td").info("所有出兵结束！");
               CommandDispatcher.send(CommandName.TD_ProcessBar_Update,{"waveIndex":this.curWaveIndex});
            }
            else
            {
               _loc1_ = this._waveList.pop();
               this._nextWaveTime = _loc1_[0];
               this._curWaveData = _loc1_[1];
            }
         }
         if(this._curWaveData != null)
         {
            switch(this._curWaveData.comeMode)
            {
               case TDZombieComeModeConstant.COME_MODE_TYPE_1:
                  if(TDGameInfo.getInstance().aliveZombieNum == 0)
                  {
                     this.setCurWaveLeafDealy(this._curWaveData.delay);
                     this.createWave(this._curWaveData);
                     this._curWaveData = null;
                  }
                  break;
               default:
                  _loc2_ = TDGameInfo.getInstance().getCurGameTime();
                  if(_loc2_ > this._nextWaveTime)
                  {
                     this.createWave(this._curWaveData);
                     this._curWaveData = null;
                  }
                  else if((this._curWaveData.isBigWave || this._curWaveData.isAdvanceTime) && TDGameInfo.getInstance().aliveZombieNum == 0)
                  {
                     if(this._nextWaveTime - _loc2_ >= this.BIG_WAVE_MIN_GAP)
                     {
                        _loc3_ = this._nextWaveTime - _loc2_ - this.BIG_WAVE_MIN_GAP;
                        this.changeWaveDealy(_loc3_);
                        this._nextWaveTime -= _loc3_;
                        getLogger("td").info("大波僵尸提前出怪");
                     }
                  }
            }
         }
      }
      
      private function changeWaveDealy(param1:int) : void
      {
         var _loc3_:Array = null;
         this._delayReduce += param1;
         var _loc2_:int = 0;
         while(_loc2_ < this._waveList.length)
         {
            _loc3_ = this._waveList[_loc2_];
            _loc3_[0] -= param1;
            _loc2_++;
         }
      }
      
      private function setCurWaveLeafDealy(param1:int) : void
      {
         var _loc2_:Array = null;
         var _loc3_:TDMapWaveInfo = null;
         if(param1 <= 0)
         {
            return;
         }
         var _loc4_:int = this._waveList.length - 1;
         while(_loc4_ >= 0)
         {
            _loc2_ = this._waveList[_loc4_];
            _loc3_ = _loc2_[1] as TDMapWaveInfo;
            if(_loc3_.waveType == TDMapWaveType.TD_WAVE_BRANCH)
            {
               return;
            }
            _loc2_[0] = TDGameInfo.getInstance().getCurGameTime() + param1;
            _loc4_--;
         }
      }
      
      private function createWave(param1:TDMapWaveInfo) : void
      {
         var _loc2_:IGameObject = null;
         if(param1 == null)
         {
            return;
         }
         if(param1.actBeforeDelay)
         {
            LuaManager.doString(param1.actBeforeDelay);
         }
         if(param1.enemyInfo == null)
         {
            getLogger("td").info(TDGameInfo.getInstance().getCurGameTime() + ":开始出兵第" + this.curWaveIndex + "波");
            if(param1.isBigWave)
            {
               ShowTipCmd.showBigWave();
               TDSoundCmd.switchToBigWaveTDMusic();
            }
            if(this.curWaveIndex == TDStageInfo.getInstance().totalWave - 1 && TDStageInfo.getInstance().tdGameType != TDConstant.TDGameType_TerracottaMemory)
            {
               ShowTipCmd.showFinalWave();
               TDSoundCmd.switchToFinalWaveTDMusic();
            }
            if(this.curWaveIndex == 0 && TDStageInfo.getInstance().tdGameType != TDConstant.TDGameType_TerracottaMemory)
            {
               CommandDispatcher.send(CommandName.TD_ProcessBar_Show);
               CommandDispatcher.send(CommandName.TD_ProcessBar_Update,{
                  "waveIndex":this.curWaveIndex,
                  "isTween":false
               });
               TDSoundCmd.firstZombieCome();
            }
            else
            {
               CommandDispatcher.send(CommandName.TD_ProcessBar_Update,{"waveIndex":this.curWaveIndex});
            }
            ++this.curWaveIndex;
         }
         else
         {
            getLogger("TD").info(TDGameInfo.getInstance().getCurGameTime() + ":出现单位" + param1.enemyInfo.type);
            ++this._curEnemyIndex;
            if(param1.enemyInfo.hasWind)
            {
               param1.enemyInfo.initBeforeCreateZombie();
               TDGameObjectCmd.addBlowZombie(param1.enemyInfo.type,param1.enemyInfo.roadIndex,param1.enemyInfo.windEndRow);
            }
            else if(param1.enemyInfo.isDrillOut)
            {
               param1.enemyInfo.initBeforeCreateZombie();
               TDGameObjectCmd.summonZombie(param1.enemyInfo.type,param1.enemyInfo.drillOutCol,param1.enemyInfo.roadIndex,false);
            }
            else
            {
               _loc2_ = TDFactory.createBT_Zombie(param1.enemyInfo.type,null,param1.enemyInfo);
               if(param1.enemyInfo.param != null)
               {
                  _loc2_.setRunningProp(TDConstant.Gameobject_Prop_InitParamXml,param1.enemyInfo.param);
               }
               CommandDispatcher.send(CommandName.TD_StartZombieWalk,{
                  "object":_loc2_,
                  "roadIndex":param1.enemyInfo.roadIndex,
                  "startCol":param1.enemyInfo.startCol
               });
               if(param1.enemyInfo.useSpars)
               {
                  CommandDispatcher.send(CommandName.TD_ADD_ZOMBIE_TO_SPARS,{"object":_loc2_});
               }
            }
         }
         if(param1.actAfterDelay != null)
         {
            LuaManager.doString(param1.actAfterDelay);
         }
      }
   }
}
