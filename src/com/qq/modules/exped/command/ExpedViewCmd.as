package com.qq.modules.exped.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class ExpedViewCmd
   {
       
      
      public function ExpedViewCmd()
      {
         super();
      }
      
      public static function openExpedWindow() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ExpedViewCommand","openExpedWindow",[]));
      }
   }
}
