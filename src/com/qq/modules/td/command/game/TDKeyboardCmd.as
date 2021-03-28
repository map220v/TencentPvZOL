package com.qq.modules.td.command.game
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class TDKeyboardCmd
   {
       
      
      public function TDKeyboardCmd()
      {
         super();
      }
      
      public static function registerDebugKey() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDKeyboardCommand","registerDebugKey",[]));
      }
      
      public static function unregisterDebugKey() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDKeyboardCommand","unregisterDebugKey",[]));
      }
      
      public static function registerTDKey() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDKeyboardCommand","registerTDKey",[]));
      }
      
      public static function unregisterTDKey() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDKeyboardCommand","unregisterTDKey",[]));
      }
   }
}
