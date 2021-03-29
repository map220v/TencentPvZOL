package com.qq.modules.map.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class MapProxyCmd
   {
       
      
      public function MapProxyCmd()
      {
         super();
      }
      
      public static function checkRequestAreaInfo(param1:int, param2:int, param3:Boolean) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("MapProxyCommand","checkRequestAreaInfo",[param1,param2,param3]));
      }
      
      public static function doCheckRequestAreaInfo(param1:int, param2:int, param3:Boolean) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("MapProxyCommand","doCheckRequestAreaInfo",[param1,param2,param3]));
      }
      
      public static function getArmyRelativeInfo() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("MapProxyCommand","getArmyRelativeInfo",[]));
      }
      
      public static function sendLogOperateToSvr() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("MapProxyCommand","sendLogOperateToSvr",[]));
      }
   }
}
