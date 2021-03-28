package com.qq.modules.iwan.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class IWanVeiwCmd
   {
       
      
      public function IWanVeiwCmd()
      {
         super();
      }
      
      public static function openPrivilegeIWanWindow() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("IWanVeiwCommand","openPrivilegeIWanWindow",[]));
      }
   }
}
