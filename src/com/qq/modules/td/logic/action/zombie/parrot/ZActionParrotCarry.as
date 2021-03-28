package com.qq.modules.td.logic.action.zombie.parrot
{
   import asgui.blit.display.IBlitClip;
   import asgui.blit.display.IBlitDisplayContainer;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.action.zombie.BasicZombieAction;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.utils.blit.QBlitUI;
   import flash.display.Bitmap;
   
   public class ZActionParrotCarry extends BasicZombieAction
   {
      
      private static const RISE_SPEED:int = 200;
      
      private static const MAX_RISE_HEIGHT:int = 150;
       
      
      private var _lastTime:Number;
      
      private var _enterTime:Number;
      
      private var _isRising:Boolean;
      
      private var _risingHeight:int;
      
      private var _target:IGameObject;
      
      public function ZActionParrotCarry()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         this._target = param1[0] as IGameObject;
         _zombie.animation.gotoAndPlay("carry",true);
         this._isRising = false;
         this._risingHeight = 0;
         this._enterTime = TDGameInfo.getInstance().getCurGameTime();
      }
      
      override public function runningState() : void
      {
         var _loc2_:IBlitClip = null;
         var _loc3_:IBlitDisplayContainer = null;
         var _loc4_:Number = NaN;
         if(!this._isRising && this._target.hasDisposed || this._risingHeight > MAX_RISE_HEIGHT)
         {
            _zombie.Dispose();
            return;
         }
         var _loc1_:int = TDGameInfo.getInstance().getCurGameTime();
         if(!this._isRising && this._enterTime + 3000 < _loc1_ && _zombie.zombieData.isAlive())
         {
            this._isRising = true;
            this._lastTime = _loc1_;
            _zombie.zombieData.addBuff(TDConstant.TDBuffID_God,_zombie);
            this._target.animation.gotoAndStop("idle");
            _loc2_ = QBlitUI.createClipFromSource(new Bitmap(this._target.animation.getSnapshot()));
            _loc3_ = QBlitUI.createContainer();
            _loc3_.AddChild(_loc2_);
            _loc3_.x = -100;
            _loc3_.y = -120;
            _zombie.frontLayer.addChild(_loc3_.asset);
            this._target.Dispose();
         }
         if(this._isRising)
         {
            _loc4_ = RISE_SPEED * (_loc1_ - this._lastTime) * 0.001;
            this._lastTime = _loc1_;
            this._risingHeight += _loc4_;
            _zombie.y -= _loc4_;
         }
         super.runningState();
      }
   }
}
