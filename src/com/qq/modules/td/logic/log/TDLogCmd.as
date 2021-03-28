package com.qq.modules.td.logic.log
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class TDLogCmd
   {
       
      
      public function TDLogCmd()
      {
         super();
      }
      
      public static function initTDLog(param1:String, param2:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDLogCommand","initTDLog",[param1,param2]));
      }
      
      public static function startGame() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDLogCommand","startGame",[]));
      }
      
      public static function replaceStartGameLog() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDLogCommand","replaceStartGameLog",[]));
      }
      
      public static function changeSun(param1:int, param2:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDLogCommand","changeSun",[param1,param2]));
      }
      
      public static function cropPlant(param1:int, param2:int, param3:int, param4:Boolean) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDLogCommand","cropPlant",[param1,param2,param3,param4]));
      }
      
      public static function changeFuel(param1:int, param2:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDLogCommand","changeFuel",[param1,param2]));
      }
      
      public static function killZombie(param1:int, param2:int, param3:int, param4:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDLogCommand","killZombie",[param1,param2,param3,param4]));
      }
      
      public static function recordZombieDamage(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDLogCommand","recordZombieDamage",[param1,param2,param3,param4,param5,param6,param7]));
      }
      
      public static function recordPlantDamage(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDLogCommand","recordPlantDamage",[param1,param2,param3,param4,param5,param6,param7]));
      }
      
      public static function doubleCheckError() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDLogCommand","doubleCheckError",[]));
      }
      
      public static function recordChoosePlant(param1:Array) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDLogCommand","recordChoosePlant",[param1]));
      }
   }
}
