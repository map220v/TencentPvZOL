package com.qq.modules.td.logic.action.object.lawnMower
{
   import com.qq.constant.td.TDChallengeScoreType;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.TDGameObjectCmd;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.TDChallengeScoreManager;
   import com.qq.modules.td.logic.action.basic.BasicAction;
   import com.qq.modules.td.logic.numeric.TDCheckCollision;
   import com.qq.modules.td.logic.numeric.TDDamageCaculete;
   import com.qq.modules.td.logic.unit.zombie.BasicZombie;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.view.game.layer.floor.TDFloorManager;
   import flash.events.Event;
   
   public class LawnMowerActionRun extends BasicAction
   {
       
      
      private var _lastTime:Number;
      
      private var _speed:Number;
      
      private var _isAttacking:Boolean;
      
      public function LawnMowerActionRun()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _gameObject.animation.gotoAndPlay("transition");
         _gameObject.animation.addEventListener(Event.COMPLETE,this.onFinishTransition);
         this._isAttacking = false;
         TDSoundCmd.playLawnMowerRun();
         TDChallengeScoreManager.instance.addScoreByType(TDChallengeScoreType.Keep_Toycar,1);
      }
      
      override public function leaveState() : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinishTransition);
         super.leaveState();
      }
      
      private function onFinishTransition(param1:Event) : void
      {
         _gameObject.animation.gotoAndPlay("attack",true);
         this._lastTime = TDGameInfo.getInstance().getCurGameTime();
         this._speed = _gameObject.objectModel.staticInfo.getParam(TDConstant.NormalObj_Param_MoveSpeed);
         this._isAttacking = true;
         TDGameObjectCmd.addSampleMower(_gameObject.objectModel.roadIndex,_gameObject.x,_gameObject.y);
      }
      
      override public function runningState() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc3_:TDMapTileData = null;
         var _loc4_:Array = null;
         var _loc5_:BasicZombie = null;
         if(this._isAttacking)
         {
            _loc1_ = TDGameInfo.getInstance().getCurGameTime();
            _loc2_ = this._speed * (_loc1_ - this._lastTime) * 0.001;
            _gameObject.setLocation(_gameObject.x + _loc2_,_gameObject.y);
            this._lastTime = _loc1_;
            if(_gameObject.x > TDGameInfo.getInstance().gameArea.x + TDGameInfo.getInstance().gameArea.width)
            {
               TDGameInfo.getInstance().removeGameoObjectFromGame(_gameObject);
               return;
            }
            _loc3_ = TDGameInfo.getInstance().getRoadTileByGamePos(_gameObject.x,_gameObject.y);
            if(_loc3_ && TDFloorManager.instance.hasWaterAt(_loc3_.roadRow,_loc3_.roadCol))
            {
               _gameObject.setAction(TDConstant.LawnMowerAction_Sink);
               return;
            }
            _loc4_ = TDGameInfo.getInstance().getZombieList([_gameObject.objectModel.roadIndex],TDConstant.TDCamp_Enemy,true,true,false);
            for each(_loc5_ in _loc4_)
            {
               if(_loc5_.zombieData.zombiestaticInfo.notKillByLawnMower != 1)
               {
                  if(_loc5_.zombieData.isAlive())
                  {
                     if(TDCheckCollision.isCollision(_gameObject,_gameObject.attackArea,_loc5_,_loc5_.damageArea))
                     {
                        TDDamageCaculete.executeDamage(_loc5_,-int.MAX_VALUE,TDConstant.AttackType_Normal,TDConstant.AttackMode_KillByToyCar,null);
                     }
                  }
               }
            }
         }
      }
   }
}
