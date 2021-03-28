package com.qq.modules.city.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class CityProxyCmd
   {
       
      
      public function CityProxyCmd()
      {
         super();
      }
      
      public static function requestCityBuildingInfo() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CityProxyCommand","requestCityBuildingInfo",[]));
      }
      
      public static function collect() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CityProxyCommand","collect",[]));
      }
      
      public static function requestCityDurability() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CityProxyCommand","requestCityDurability",[]));
      }
      
      public static function requestBuildNotice() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CityProxyCommand","requestBuildNotice",[]));
      }
      
      public static function requestCurrentStageInfo(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CityProxyCommand","requestCurrentStageInfo",[param1]));
      }
   }
}
