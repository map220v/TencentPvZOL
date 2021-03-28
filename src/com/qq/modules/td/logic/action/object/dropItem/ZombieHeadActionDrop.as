package com.qq.modules.td.logic.action.object.dropItem
{
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.utils.DMath;
   
   public class ZombieHeadActionDrop extends ZombieBodyPartActionDrop
   {
       
      
      protected var _velocityX:Number;
      
      protected var _velocityY:Number;
      
      protected var _roateAngle:Number;
      
      protected var _headBoundCounter:int;
      
      protected var _isWaitDisappear:Boolean;
      
      public function ZombieHeadActionDrop()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         this._velocityX = (Math.random() > 0.5 ? 1 : -1) * DMath.randNum(75,85);
         this._velocityY = -166;
         this._roateAngle = Math.random() * 20 - 10 >> 0;
         this._headBoundCounter = 0;
         this._isWaitDisappear = false;
         _lastTime = TDGameInfo.getInstance().getCurGameTime();
      }
      
      override public function update() : void
      {
         var _loc1_:int = TDGameInfo.getInstance().getCurGameTime();
         var _loc2_:Number = (_loc1_ - _lastTime) * 0.001;
         if(!this._isWaitDisappear)
         {
            _bodyPart.x += this._velocityX * _loc2_;
            _bodyPart.y += this._velocityY * _loc2_;
            this._velocityY += 1080 * _loc2_;
            if(_bodyPart.y > _bodyPart.groundY)
            {
               if(_bodyPart.y - _bodyPart.groundY > 0.5 && this._headBoundCounter < 5)
               {
                  ++this._headBoundCounter;
                  this._velocityY = -50 + int(Math.random() * (20 / this._headBoundCounter));
               }
               else
               {
                  this._isWaitDisappear = true;
               }
            }
            _lastTime = _loc1_;
         }
         else if(this._isWaitDisappear && _loc2_ > 1)
         {
            disappear();
         }
      }
   }
}
