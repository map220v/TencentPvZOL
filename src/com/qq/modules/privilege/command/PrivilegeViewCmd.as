package com.qq.modules.privilege.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class PrivilegeViewCmd
   {
       
      
      public function PrivilegeViewCmd()
      {
         super();
      }
      
      public static function openHall() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("PrivilegeViewCommand","openHall",[]));
      }
      
      public static function openZone() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("PrivilegeViewCommand","openZone",[]));
      }
   }
}
