package com.qq.modules.strengthen.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class StrengthenViewCmd
   {
       
      
      public function StrengthenViewCmd()
      {
         super();
      }
      
      public static function openWindow() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("StrengthenViewCommand","openWindow",[]));
      }
      
      public static function openDetail(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("StrengthenViewCommand","openDetail",[param1]));
      }
      
      public static function gotoAction(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("StrengthenViewCommand","gotoAction",[param1]));
      }
   }
}
