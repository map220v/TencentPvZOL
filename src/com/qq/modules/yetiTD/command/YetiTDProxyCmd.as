package com.qq.modules.yetiTD.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class YetiTDProxyCmd
   {
       
      
      public function YetiTDProxyCmd()
      {
         super();
      }
      
      public static function getInfo() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("YetiTDProxyCommand","getInfo",[]));
      }
      
      public static function reportResult(param1:int, param2:int, param3:String, param4:Boolean) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("YetiTDProxyCommand","reportResult",[param1,param2,param3,param4]));
      }
      
      public static function openChest() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("YetiTDProxyCommand","openChest",[]));
      }
      
      public static function openAllChest() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("YetiTDProxyCommand","openAllChest",[]));
      }
   }
}
