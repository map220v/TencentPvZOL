package com.qq.modules.main.command.modules
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class ModuleChatCmd
   {
       
      
      public function ModuleChatCmd()
      {
         super();
      }
      
      public static function start() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ModuleChatCommand","start",[]));
      }
      
      public static function unload() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ModuleChatCommand","unload",[]));
      }
   }
}
