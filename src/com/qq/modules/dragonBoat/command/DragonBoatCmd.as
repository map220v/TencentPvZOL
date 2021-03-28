package com.qq.modules.dragonBoat.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class DragonBoatCmd
   {
       
      
      public function DragonBoatCmd()
      {
         super();
      }
      
      public static function getInfo() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("DragonBoatCommand","getInfo",[]));
      }
      
      public static function exchange(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("DragonBoatCommand","exchange",[param1]));
      }
      
      public static function partSetOut() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("DragonBoatCommand","partSetOut",[]));
      }
      
      public static function allSetOut() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("DragonBoatCommand","allSetOut",[]));
      }
      
      public static function summonOne() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("DragonBoatCommand","summonOne",[]));
      }
      
      public static function summonTen() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("DragonBoatCommand","summonTen",[]));
      }
   }
}
