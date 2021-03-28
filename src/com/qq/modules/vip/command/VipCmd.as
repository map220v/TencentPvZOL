package com.qq.modules.vip.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class VipCmd
   {
       
      
      public function VipCmd()
      {
         super();
      }
      
      public static function openVipWinds(param1:int = 0) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("VipCommand","openVipWinds",[param1]));
      }
      
      public static function unloaderVipModule() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("VipCommand","unloaderVipModule",[]));
      }
   }
}
