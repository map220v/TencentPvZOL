package com.qq.modules.battle.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class BattleCmd
   {
       
      
      public function BattleCmd()
      {
         super();
      }
      
      public static function battleReset() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("BattleCommand","battleReset",[]));
      }
      
      public static function battleReady() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("BattleCommand","battleReady",[]));
      }
      
      public static function battleRun() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("BattleCommand","battleRun",[]));
      }
      
      public static function battleEnd() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("BattleCommand","battleEnd",[]));
      }
      
      public static function planCallBack() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("BattleCommand","planCallBack",[]));
      }
      
      public static function battleFightRate(param1:int = 1, param2:Boolean = false) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("BattleCommand","battleFightRate",[param1,param2]));
      }
      
      public static function closeBattle(param1:Function = null, param2:Boolean = true, param3:Array = null) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("BattleCommand","closeBattle",[param1,param2,param3]));
      }
      
      public static function checkBattleCloseDelayCall() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("BattleCommand","checkBattleCloseDelayCall",[]));
      }
      
      public static function closeBattleFromOther() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("BattleCommand","closeBattleFromOther",[]));
      }
   }
}
