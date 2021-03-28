package com.qq.modules.treasure.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class TreasureCmd
   {
       
      
      public function TreasureCmd()
      {
         super();
      }
      
      public static function openTreasure() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TreasureCommand","openTreasure",[]));
      }
      
      public static function enterTreasureHallWithHouseId(param1:uint) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TreasureCommand","enterTreasureHallWithHouseId",[param1]));
      }
      
      public static function enterTreasureHall() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TreasureCommand","enterTreasureHall",[]));
      }
      
      public static function levelTreasureHall() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TreasureCommand","levelTreasureHall",[]));
      }
      
      public static function beginTreasure() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TreasureCommand","beginTreasure",[]));
      }
      
      public static function sendLevelHall() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TreasureCommand","sendLevelHall",[]));
      }
      
      public static function getTreasureMap() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TreasureCommand","getTreasureMap",[]));
      }
      
      public static function getTreasureHallList(param1:int = 0, param2:Boolean = false) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TreasureCommand","getTreasureHallList",[param1,param2]));
      }
      
      public static function searchTreasureHouse(param1:uint) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TreasureCommand","searchTreasureHouse",[param1]));
      }
      
      public static function enterHouse(param1:Boolean) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TreasureCommand","enterHouse",[param1]));
      }
      
      public static function levelHouse() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TreasureCommand","levelHouse",[]));
      }
      
      public static function snatchTreasure() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TreasureCommand","snatchTreasure",[]));
      }
   }
}
