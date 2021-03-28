package com.qq.modules.roleInfo.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class RoleInfoCmd
   {
       
      
      public function RoleInfoCmd()
      {
         super();
      }
      
      public static function buyPhysical() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("RoleInfoCommand","buyPhysical",[]));
      }
      
      public static function addRoleSunDelay(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("RoleInfoCommand","addRoleSunDelay",[param1]));
      }
      
      public static function addRoleExpDelay(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("RoleInfoCommand","addRoleExpDelay",[param1]));
      }
      
      public static function addRoleCoinDelay(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("RoleInfoCommand","addRoleCoinDelay",[param1]));
      }
      
      public static function configBar(param1:int = 0) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("RoleInfoCommand","configBar",[param1]));
      }
   }
}
