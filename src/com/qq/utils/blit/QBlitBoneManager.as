package com.qq.utils.blit
{
   import asgui.blit.bone.BlitBoneManager;
   import asgui.utils.IAnimatable;
   import asgui.utils.WorldClock;
   
   public class QBlitBoneManager extends BlitBoneManager implements IAnimatable
   {
       
      
      public function QBlitBoneManager(param1:int)
      {
         super(param1);
      }
      
      override public function get isPreferBatch() : Boolean
      {
         return true;
      }
      
      override protected function addJuggle() : void
      {
         WorldClock.clock.add(this);
      }
      
      override protected function removeJuggle() : void
      {
         WorldClock.clock.remove(this);
      }
      
      override public function advanceTime(param1:Number) : void
      {
         super.advanceTime(param1 * 1000);
      }
   }
}
