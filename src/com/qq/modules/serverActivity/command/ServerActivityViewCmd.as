package com.qq.modules.serverActivity.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class ServerActivityViewCmd
   {
       
      
      public function ServerActivityViewCmd()
      {
         super();
      }
      
      public static function openServerActivityWindow() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ServerActivityViewCommand","openServerActivityWindow",[]));
      }
   }
}
