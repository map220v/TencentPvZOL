package com.qq.modules.videoActivity.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class VideoActivityCmd
   {
       
      
      public function VideoActivityCmd()
      {
         super();
      }
      
      public static function openVideoActivityWin() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("VideoActivityCommand","openVideoActivityWin",[]));
      }
   }
}
