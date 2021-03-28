package com.qq.modules.td.logic.process
{
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.view.game.layer.TDScene;
   
   public class TDShakeEffectProcess extends TDBasicProcess implements IProcess
   {
      
      public static const ID:int = 4;
       
      
      private var _isShaking:Boolean;
      
      private var _shakeSpeedX:int;
      
      private var _shakeSpeedY:int;
      
      private var _shakeValue:Number;
      
      private var _originalX:int;
      
      private var _originalY:int;
      
      public var shakeScreen:TDScene;
      
      public function TDShakeEffectProcess()
      {
         super();
         this._shakeValue = -0.9;
         updateDuration = int(1000 / 30);
      }
      
      override public function doProcess() : void
      {
         super.doProcess();
         if(this._isShaking)
         {
            this.runShake();
         }
         else if(TDGameInfo.getInstance().isShakeScreen != 0)
         {
            this.startShake();
         }
      }
      
      private function startShake() : void
      {
         this._isShaking = true;
         if(TDGameInfo.getInstance().isShakeScreen == 1)
         {
            this._shakeSpeedX = 10 * (Math.random() > 0.5 ? 1 : -1);
            this._shakeSpeedY = 10;
         }
         else if(TDGameInfo.getInstance().isShakeScreen == 2)
         {
            this._shakeSpeedX = 0;
            this._shakeSpeedY = 10;
         }
         this._originalX = this.shakeScreen.x;
         this._originalY = this.shakeScreen.y;
      }
      
      private function endShake() : void
      {
         this._isShaking = false;
         TDGameInfo.getInstance().isShakeScreen = 0;
         this.shakeScreen.x = this._originalX;
         this.shakeScreen.y = this._originalY;
      }
      
      private function runShake() : void
      {
         if(this._shakeSpeedY <= 0)
         {
            this.endShake();
         }
         else
         {
            this._shakeSpeedX *= this._shakeValue;
            this.shakeScreen.x = this._originalX + this._shakeSpeedX;
            this._shakeSpeedY *= this._shakeValue;
            this.shakeScreen.y = this._originalY + this._shakeSpeedY;
         }
      }
      
      override public function reset() : void
      {
         this._isShaking = false;
         super.reset();
      }
      
      override public function dispose() : void
      {
         this.shakeScreen = null;
         super.dispose();
      }
   }
}
