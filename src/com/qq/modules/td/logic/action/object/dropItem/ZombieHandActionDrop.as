package com.qq.modules.td.logic.action.object.dropItem
{
   import com.qq.modules.td.model.TDGameInfo;
   
   public class ZombieHandActionDrop extends ZombieHeadActionDrop
   {
       
      
      public function ZombieHandActionDrop()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _velocityX = 0;
         _velocityY = -166;
         _roateAngle = Math.random() * 20 - 10 >> 0;
         _headBoundCounter = 0;
         _isWaitDisappear = false;
         _lastTime = TDGameInfo.getInstance().getCurGameTime();
      }
      
      override public function update() : void
      {
         var _loc1_:int = TDGameInfo.getInstance().getCurGameTime();
         var _loc2_:Number = (_loc1_ - _lastTime) * 0.001;
         if(!_isWaitDisappear)
         {
            _bodyPart.x += _velocityX * _loc2_;
            _bodyPart.y += _velocityY * _loc2_;
            _velocityY += 1080 * _loc2_;
            if(_bodyPart.y > _bodyPart.groundY)
            {
               if(_bodyPart.y - _bodyPart.groundY > 0.5 && _headBoundCounter < 5)
               {
                  ++_headBoundCounter;
                  _velocityY = -50 + int(Math.random() * (20 / _headBoundCounter));
               }
               else
               {
                  _isWaitDisappear = true;
               }
            }
            _lastTime = _loc1_;
         }
         else if(_isWaitDisappear && _loc2_ > 1)
         {
            disappear();
         }
      }
   }
}
