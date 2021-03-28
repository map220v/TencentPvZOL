package com.qq.modules.td.logic.action.object.coin
{
   import com.greensock.TweenMax;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.action.basic.BasicAction;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.utils.DMath;
   
   public class CoinActionCollect extends BasicAction
   {
       
      
      private var _lastUpdateTime:Number;
      
      private var _targetX:int;
      
      private var _targetY:int;
      
      protected var _isWaitDisappear:Boolean;
      
      private var _speed:int;
      
      private var hasCollected:Boolean;
      
      public function CoinActionCollect()
      {
         super();
      }
      
      protected function disappear() : void
      {
         if(_gameObject != null)
         {
            _gameObject.dispose();
         }
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         this._isWaitDisappear = false;
         this._targetX = param1[0];
         this._targetY = param1[1];
         var _loc2_:Number = DMath.getDistance(_gameObject.x,_gameObject.y,this._targetX,this._targetY);
         this._speed = _loc2_ / 0.5;
         this._lastUpdateTime = TDGameInfo.getInstance().getCurGameTime();
         _gameObject.animation.gotoAndPlay(TDConstant.Coin_Idle);
      }
      
      override public function runningState() : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:int = 0;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:int = 0;
         var _loc1_:Number = TDGameInfo.getInstance().getCurGameTime();
         if(!this._isWaitDisappear)
         {
            _loc2_ = this._targetY - _gameObject.y;
            _loc3_ = this._targetX - _gameObject.x;
            _loc4_ = Math.atan2(_loc2_,_loc3_);
            _loc6_ = (_loc5_ = _loc1_ - this._lastUpdateTime) / 1000 * this._speed;
            _loc7_ = Math.sin(_loc4_) * _loc6_;
            _loc8_ = Math.cos(_loc4_) * _loc6_;
            _gameObject.x += _loc8_;
            _gameObject.y += _loc7_;
            if((_loc9_ = DMath.getDistance(_gameObject.x,_gameObject.y,this._targetX,this._targetY)) < 20)
            {
               this._isWaitDisappear = true;
               _gameObject.x = this._targetX;
               _gameObject.y = this._targetY;
            }
            this._lastUpdateTime = _loc1_;
         }
         else if(!this.hasCollected)
         {
            TweenMax.to(_gameObject,1.2,{
               "scaleX":0.1,
               "scaleY":0.1,
               "alpha":0,
               "onComplete":this.onCollectFinish
            });
            this.hasCollected = true;
         }
      }
      
      override public function leaveState() : void
      {
         super.leaveState();
         TweenMax.killTweensOf(_gameObject);
      }
      
      private function onCollectFinish() : void
      {
         this.disappear();
      }
   }
}
