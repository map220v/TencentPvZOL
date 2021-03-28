package com.qq.modules.pcManager.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class PcManagerProxyCmd
   {
       
      
      public function PcManagerProxyCmd()
      {
         super();
      }
      
      public static function checkPcManager(param1:Object) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("PcManagerProxyCommand","checkPcManager",[param1]));
      }
   }
}
