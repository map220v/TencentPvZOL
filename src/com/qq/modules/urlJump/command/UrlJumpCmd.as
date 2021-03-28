package com.qq.modules.urlJump.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class UrlJumpCmd
   {
       
      
      public function UrlJumpCmd()
      {
         super();
      }
      
      public static function openUrlJumpWindow() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UrlJumpCommand","openUrlJumpWindow",[]));
      }
   }
}
