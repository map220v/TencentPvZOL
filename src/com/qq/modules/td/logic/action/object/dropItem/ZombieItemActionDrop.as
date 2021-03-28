package com.qq.modules.td.logic.action.object.dropItem
{
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.utils.DMath;
   
   public class ZombieItemActionDrop extends ZombieHeadActionDrop
   {
       
      
      public function ZombieItemActionDrop()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _velocityX = (Math.random() > 0.5 ? 1 : -1) * DMath.randNum(75,85);
         _velocityY = -66;
         _roateAngle = int(Math.random() * 5) + 3;
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
               _isWaitDisappear = true;
            }
            _lastTime = _loc1_;
         }
         else if(_isWaitDisappear && _loc2_ > 1)
         {
            disappear();
         }
         else if(_bodyPart.alpha != 0)
         {
            _bodyPart.alpha -= 0.1;
         }
      }
   }
}
