package com.qq.modules.plantExplore.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class PlantExploreCmd
   {
       
      
      public function PlantExploreCmd()
      {
         super();
      }
      
      public static function openPlantExploreWin() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("PlantExploreCommand","openPlantExploreWin",[]));
      }
      
      public static function getExploreInfo() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("PlantExploreCommand","getExploreInfo",[]));
      }
      
      public static function explore(param1:uint) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("PlantExploreCommand","explore",[param1]));
      }
      
      public static function refreshMap() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("PlantExploreCommand","refreshMap",[]));
      }
      
      public static function exploreOneKey() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("PlantExploreCommand","exploreOneKey",[]));
      }
   }
}
