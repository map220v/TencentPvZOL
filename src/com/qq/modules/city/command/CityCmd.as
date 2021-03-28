package com.qq.modules.city.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class CityCmd
   {
       
      
      public function CityCmd()
      {
         super();
      }
      
      public static function initBuilding() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CityCommand","initBuilding",[]));
      }
      
      public static function moveMapByCenter(param1:int, param2:int, param3:Boolean) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CityCommand","moveMapByCenter",[param1,param2,param3]));
      }
      
      public static function showNewButtonTip(param1:String) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CityCommand","showNewButtonTip",[param1]));
      }
   }
}
