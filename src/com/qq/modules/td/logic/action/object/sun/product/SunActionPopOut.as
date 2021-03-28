package com.qq.modules.td.logic.action.object.sun.product
{
   import com.qq.GameGloble;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.action.object.sun.BasicSunAction;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.utils.DMath;
   
   public class SunActionPopOut extends BasicSunAction
   {
       
      
      private var _startX:Number;
      
      private var _startY:Number;
      
      private var _xSpeed:Number;
      
      private var _ySpeed:Number;
      
      private var _curTime:int;
      
      private var _allTime:int;
      
      private var _gravity:Number;
      
      private var _lastUpdateTime:Number;
      
      private var _tick:int;
      
      public function SunActionPopOut()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         if(_sun.beCatchingStep == 0)
         {
            _sun.animation.gotoAndPlay(TDConstant.ObjectAnmi_Idle,true);
         }
         this._startX = _sun.x;
         this._startY = _sun.y;
         var _loc2_:int = _sun.x + (Math.random() > 0.5 ? 1 : -1) * DMath.randNum(20,60);
         if(_loc2_ >= TDGameInfo.getInstance().gameArea.right)
         {
            _loc2_ = TDGameInfo.getInstance().gameArea.right;
         }
         var _loc3_:int = _sun.y + DMath.randNum(30,70);
         this._curTime = 0;
         if(GameGloble.stage.frameRate == 60)
         {
            this._allTime = 42;
            this._gravity = 0.4;
         }
         else
         {
            this._allTime = 18;
            this._gravity = 2.7;
         }
         this._xSpeed = (_loc2_ - this._startX) / this._allTime;
         this._ySpeed = (_loc3_ - this._startY - this._gravity * this._allTime * this._allTime / 2) / this._allTime;
         this._lastUpdateTime = 0;
         this._tick = 1000 / GameGloble.stage.frameRate;
      }
      
      override public function runningState() : void
      {
         var _loc1_:Number = TDGameInfo.getInstance().getCurGameTime();
         if(this._lastUpdateTime == 0)
         {
            this._lastUpdateTime = _loc1_;
         }
         _sun.x = this._startX + this._curTime * this._xSpeed;
         _sun.y = this._startY + this._curTime * this._ySpeed + this._gravity * this._curTime * this._curTime / 2;
         if(this._curTime >= this._allTime)
         {
            _sun.setAction(TDConstant.SunAction_Idle);
         }
         else if(_loc1_ - this._lastUpdateTime > this._tick)
         {
            ++this._curTime;
            this._lastUpdateTime = _loc1_;
         }
      }
   }
}
