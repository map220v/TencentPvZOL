package com.qq.modules.td.logic.action.object.coin
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.action.basic.BasicAction;
   
   public class CoinActionPopOut extends BasicAction
   {
       
      
      private var _startX:Number;
      
      private var _startY:Number;
      
      private var _xSpeed:Number;
      
      private var _ySpeed:Number;
      
      private var _curTime:int;
      
      private var _allTime:int;
      
      private var _gravity:Number;
      
      public function CoinActionPopOut()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _gameObject.animation.gotoAndPlay(TDConstant.Coin_Idle);
         this._startX = _gameObject.x;
         this._startY = _gameObject.y;
         var _loc2_:int = _gameObject.x;
         this._curTime = 0;
         this._allTime = 18;
         this._gravity = 1.7;
         this._xSpeed = (_loc2_ - this._startX) / this._allTime;
         this._ySpeed = (this._startY - this._startY - this._gravity * this._allTime * this._allTime / 2) / this._allTime;
      }
      
      override public function runningState() : void
      {
         _gameObject.x = this._startX + this._curTime * this._xSpeed;
         _gameObject.y = this._startY + this._curTime * this._ySpeed + this._gravity * this._curTime * this._curTime / 2;
         if(this._curTime >= this._allTime)
         {
            _gameObject.setAction(TDConstant.CoinAction_Flip);
         }
         else
         {
            ++this._curTime;
         }
      }
   }
}
