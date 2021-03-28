package com.qq.modules.td.logic.action.zombie.basic
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.data.game.unit.basic.TDGameObjectData;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class ZombieActionWalkBackwards extends ZombieActionWalk
   {
       
      
      public function ZombieActionWalkBackwards()
      {
         super();
         _walkAnimFlagName = TDConstant.ZombieAnmi_WalkBackwards;
         _speedType = TDGameObjectData.SPEED_WALK;
      }
      
      override protected function get playLoop() : int
      {
         return 1;
      }
      
      override protected function get startFrame() : int
      {
         return 1;
      }
      
      override protected function getNextWalkTarget() : Point
      {
         return new Point(_zombie.x + 2000,_zombie.y);
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _gameObject.animation.addEventListener(Event.COMPLETE,this.onComplete);
      }
      
      private function onComplete(param1:Event) : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onComplete);
         _zombie.setAction();
      }
      
      override public function runningState() : void
      {
         super.runningState();
         if(_zombie.isLeaveWarfield())
         {
            _zombie.Dispose();
            return;
         }
      }
      
      override protected function updateBonePos() : void
      {
         var _loc1_:Number = NaN;
         moveBone = _zombie.animation.getFrameChild(TDConstant.Ground_LayerName);
         if(moveBone)
         {
            updateMoveTimeScale();
            if(moveBone.m.tx < lastMoveBonePos)
            {
               _loc1_ = lastMoveBonePos - moveBone.m.tx;
               move(_loc1_);
            }
            lastMoveBonePos = moveBone.m.tx;
         }
      }
   }
}
