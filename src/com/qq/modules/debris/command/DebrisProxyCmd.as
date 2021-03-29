package com.qq.modules.debris.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class DebrisProxyCmd
   {
       
      
      public function DebrisProxyCmd()
      {
         super();
      }
      
      public static function doDebris(param1:int, param2:int, param3:Boolean = false, param4:uint = 0) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("DebrisProxyCommand","doDebris",[param1,param2,param3,param4]));
      }
   }
}
