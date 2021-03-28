package com.qq.modules.td.logic.action.object.lawnMower
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.logic.action.basic.BasicAction;
   import com.qq.modules.td.model.TDGameInfo;
   
   public class LawnMowerActionAppear extends BasicAction
   {
       
      
      private var _lastTime:Number;
      
      private var _targetX:Number;
      
      private var _speed:Number;
      
      public function LawnMowerActionAppear()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _gameObject.animation.gotoAndPlay("idle");
         this._lastTime = TDGameInfo.getInstance().getCurGameTime();
         this._targetX = _gameObject.x + 18;
         this._speed = 18 / 0.1;
         TDSoundCmd.readyTopCar();
      }
      
      override public function runningState() : void
      {
         var _loc1_:Number = TDGameInfo.getInstance().getCurGameTime();
         var _loc2_:Number = this._speed * (_loc1_ - this._lastTime) * 0.001;
         _gameObject.x += _loc2_;
         this._lastTime = _loc1_;
         if(_gameObject.x > this._targetX)
         {
            _gameObject.x = this._targetX;
            _gameObject.setAction(TDConstant.LawnMowerAction_Idle);
         }
      }
   }
}
