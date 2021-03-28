package com.qq.modules.td.logic.action.object.loot
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.action.basic.BasicAction;
   import com.qq.modules.td.model.TDGameInfo;
   
   public class LootItemActionPopup extends BasicAction
   {
       
      
      private var _startX:Number;
      
      private var _startY:Number;
      
      private var _xSpeed:Number;
      
      private var _ySpeed:Number;
      
      private var _curTime:int;
      
      private var _allTime:int;
      
      private var _gravity:Number;
      
      public function LootItemActionPopup()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         if(!_gameObject.animation.isPlaying)
         {
            _gameObject.animation.gotoAndPlay(TDConstant.ObjectAnmi_Idle);
         }
         _gameObject.scaleX = _gameObject.scaleY = 0.3;
         this._startX = _gameObject.x;
         this._startY = _gameObject.y;
         var _loc2_:int = _gameObject.x + (Math.random() > 0.5 ? 60 : -60);
         _loc2_ = Math.min(Math.max(TDGameInfo.getInstance().gameArea.x + _gameObject.damageArea.width,_loc2_),TDGameInfo.getInstance().gameArea.x + TDGameInfo.getInstance().gameArea.width - _gameObject.damageArea.width);
         this._curTime = 0;
         this._allTime = 22;
         this._gravity = 2;
         this._xSpeed = (_loc2_ - this._startX) / this._allTime;
         this._ySpeed = (this._startY - this._startY - this._gravity * this._allTime * this._allTime / 2) / this._allTime;
      }
      
      override public function runningState() : void
      {
         _gameObject.x = this._startX + this._curTime * this._xSpeed;
         _gameObject.y = this._startY + this._curTime * this._ySpeed + this._gravity * this._curTime * this._curTime / 2;
         _gameObject.scaleX = _gameObject.scaleY = 0.3 + (this._curTime / this._allTime - 0.3);
         if(this._curTime >= this._allTime)
         {
            _gameObject.setAction(TDConstant.LootItemAction_Idle);
         }
         else
         {
            ++this._curTime;
         }
      }
   }
}
