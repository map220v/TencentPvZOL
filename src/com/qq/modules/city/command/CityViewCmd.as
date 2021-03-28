package com.qq.modules.city.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class CityViewCmd
   {
       
      
      public function CityViewCmd()
      {
         super();
      }
      
      public static function initBuilding() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CityViewCommand","initBuilding",[]));
      }
      
      public static function initBuildState() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CityViewCommand","initBuildState",[]));
      }
      
      public static function moveMapByCenter(param1:int, param2:int, param3:Number = NaN, param4:Boolean = true) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CityViewCommand","moveMapByCenter",[param1,param2,param3,param4]));
      }
      
      public static function moveMapByBuilding(param1:int, param2:Number = NaN) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CityViewCommand","moveMapByBuilding",[param1,param2]));
      }
      
      public static function enableMap(param1:Boolean, param2:Boolean) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CityViewCommand","enableMap",[param1,param2]));
      }
      
      public static function setTopRightToolBarVisible(param1:Boolean) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CityViewCommand","setTopRightToolBarVisible",[param1]));
      }
      
      public static function playAddBuildingAnimation(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CityViewCommand","playAddBuildingAnimation",[param1]));
      }
      
      public static function setBlur(param1:Boolean) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CityViewCommand","setBlur",[param1]));
      }
   }
}
