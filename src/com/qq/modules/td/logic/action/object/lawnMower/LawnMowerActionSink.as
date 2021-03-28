package com.qq.modules.td.logic.action.object.lawnMower
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.effects.TDEffectCmd;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.logic.action.basic.BasicAction;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.events.Event;
   
   public class LawnMowerActionSink extends BasicAction
   {
       
      
      private var _lastTime:Number;
      
      private var _xSpeed:Number = 0;
      
      private var _ySpeed:Number = 0;
      
      public function LawnMowerActionSink()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _gameObject.animation.gotoAndPlay("animation",1);
         _gameObject.animation.addEventListener(Event.COMPLETE,this.onFinish);
         this._lastTime = TDGameInfo.getInstance().getCurGameTime();
         this._xSpeed = _gameObject.objectModel.staticInfo.getParam(TDConstant.NormalObj_Param_MoveSpeed);
      }
      
      override public function runningState() : void
      {
         if(this._xSpeed < 0)
         {
            this._xSpeed = 0;
         }
         else
         {
            this._xSpeed -= 6;
         }
         this._ySpeed += 4;
         var _loc1_:Number = TDGameInfo.getInstance().getCurGameTime();
         var _loc2_:Number = this._xSpeed * (_loc1_ - this._lastTime) * 0.001;
         var _loc3_:Number = this._ySpeed * (_loc1_ - this._lastTime) * 0.001;
         _gameObject.setLocation(_gameObject.x + _loc2_,_gameObject.y + _loc3_);
         this._lastTime = _loc1_;
      }
      
      private function onFinish(param1:Event) : void
      {
         TDEffectCmd.showWaterSplash(_gameObject.x,_gameObject.y,false);
         TDSoundCmd.toyCardDropWater();
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinish);
         _gameObject.setAction();
         _gameObject.Dispose();
      }
      
      override public function leaveState() : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinish);
         super.leaveState();
      }
   }
}
