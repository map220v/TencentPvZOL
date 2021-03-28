package com.qq.utils.blit
{
   import asgui.blit.display.BlitStage;
   import asgui.utils.IAnimatable;
   import asgui.utils.WorldClock;
   
   public class QBlitStage extends BlitStage implements IAnimatable
   {
       
      
      public function QBlitStage(param1:int, param2:int)
      {
         super(param1,param2);
         BlitStage._abstractStage = this;
      }
      
      override protected function addJuggle() : void
      {
         WorldClock.clock.add(this);
      }
      
      override protected function removeJuggle() : void
      {
         WorldClock.clock.remove(this);
      }
      
      public function advanceTime(param1:Number) : void
      {
         AdvanceTime(param1);
      }
   }
}
