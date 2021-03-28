package com.qq.modules.td.command.debug
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class TDDebugCmd
   {
       
      
      public function TDDebugCmd()
      {
         super();
      }
      
      public static function startGameImmediately() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDDebugCommand","startGameImmediately",[]));
      }
      
      public static function changeGameSpeed(param1:Number) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDDebugCommand","changeGameSpeed",[param1]));
      }
      
      public static function changeSun(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDDebugCommand","changeSun",[param1]));
      }
      
      public static function changeFuel(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDDebugCommand","changeFuel",[param1]));
      }
      
      public static function skipCurStage() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDDebugCommand","skipCurStage",[]));
      }
      
      public static function gotoStage(param1:int, param2:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDDebugCommand","gotoStage",[param1,param2]));
      }
      
      public static function addPlant(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDDebugCommand","addPlant",[param1]));
      }
      
      public static function addZombie(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDDebugCommand","addZombie",[param1]));
      }
      
      public static function showChooseStagePanel() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDDebugCommand","showChooseStagePanel",[]));
      }
      
      public static function openPlantTalentPanel() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDDebugCommand","openPlantTalentPanel",[]));
      }
   }
}
