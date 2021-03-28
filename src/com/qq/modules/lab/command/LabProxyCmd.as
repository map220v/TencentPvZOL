package com.qq.modules.lab.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class LabProxyCmd
   {
       
      
      public function LabProxyCmd()
      {
         super();
      }
      
      public static function getLabInfo(param1:int = 1) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("LabProxyCommand","getLabInfo",[param1]));
      }
      
      public static function upgradeTech(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("LabProxyCommand","upgradeTech",[param1]));
      }
      
      public static function produceTech(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("LabProxyCommand","produceTech",[param1]));
      }
   }
}
