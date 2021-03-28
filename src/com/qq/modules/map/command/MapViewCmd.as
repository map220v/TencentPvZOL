package com.qq.modules.map.command
{
   import flash.geom.Point;
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class MapViewCmd
   {
       
      
      public function MapViewCmd()
      {
         super();
      }
      
      public static function cameraToCell(param1:Point, param2:int = 0) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("MapViewCommand","cameraToCell",[param1,param2]));
      }
      
      public static function cameraToMapInfoWarHistoryVO(param1:Object) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("MapViewCommand","cameraToMapInfoWarHistoryVO",[param1]));
      }
      
      public static function showCityBuildingTag(param1:Boolean = true) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("MapViewCommand","showCityBuildingTag",[param1]));
      }
      
      public static function hideCityBuildingTag(param1:Boolean = true) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("MapViewCommand","hideCityBuildingTag",[param1]));
      }
      
      public static function showMineWnd(param1:Object) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("MapViewCommand","showMineWnd",[param1]));
      }
      
      public static function showTempleWnd(param1:Object) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("MapViewCommand","showTempleWnd",[param1]));
      }
   }
}
