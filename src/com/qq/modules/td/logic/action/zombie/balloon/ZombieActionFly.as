package com.qq.modules.td.logic.action.zombie.balloon
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.data.game.unit.basic.TDGameObjectData;
   import com.qq.modules.td.logic.action.zombie.BasicZombieAction;
   import com.qq.modules.td.model.TDGameInfo;
   
   public class ZombieActionFly extends BasicZombieAction
   {
       
      
      private var _lastTime:Number;
      
      private var _lastHp:Number;
      
      public function ZombieActionFly()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _zombie.animation.gotoAndPlay(TDConstant.ZombieAnmi_Idle);
         this._lastHp = _zombie.zombieData.curHp.get();
         this._lastTime = TDGameInfo.getInstance().getCurGameTime();
      }
      
      override public function runningState() : void
      {
         var _loc1_:Number = TDGameInfo.getInstance().getCurGameTime();
         var _loc2_:Number = _zombie.model.getSpeed(TDGameObjectData.SPEED_FLY) * (_loc1_ - this._lastTime) * 0.001 * _gameObject.objectModel.dirction;
         _zombie.setLocation(_zombie.x - _loc2_,_zombie.y);
         this._lastTime = _loc1_;
         super.runningState();
      }
   }
}
