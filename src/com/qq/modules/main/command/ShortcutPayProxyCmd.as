package com.qq.modules.main.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class ShortcutPayProxyCmd
   {
       
      
      public function ShortcutPayProxyCmd()
      {
         super();
      }
      
      public static function setShortcutPayTip(param1:int, param2:Boolean) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ShortcutPayProxyCommand","setShortcutPayTip",[param1,param2]));
      }
      
      public static function setShortcutAllTrue(param1:Array) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ShortcutPayProxyCommand","setShortcutAllTrue",[param1]));
      }
      
      public static function setShortcutAllFalse() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ShortcutPayProxyCommand","setShortcutAllFalse",[]));
      }
      
      public static function getShortcutPay() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ShortcutPayProxyCommand","getShortcutPay",[]));
      }
   }
}
