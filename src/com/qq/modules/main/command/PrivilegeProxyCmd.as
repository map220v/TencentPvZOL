package com.qq.modules.main.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class PrivilegeProxyCmd
   {
       
      
      public function PrivilegeProxyCmd()
      {
         super();
      }
      
      public static function getPrivilege() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("PrivilegeProxyCommand","getPrivilege",[]));
      }
   }
}
