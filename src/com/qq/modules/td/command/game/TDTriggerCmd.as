package com.qq.modules.td.command.game
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class TDTriggerCmd
   {
       
      
      public function TDTriggerCmd()
      {
         super();
      }
      
      public static function wakeupBossSphinx() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDTriggerCommand","wakeupBossSphinx",[]));
      }
      
      public static function angleAttackBossSphinx() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDTriggerCommand","angleAttackBossSphinx",[]));
      }
      
      public static function enterEmperorQinFirstPhase() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDTriggerCommand","enterEmperorQinFirstPhase",[]));
      }
      
      public static function enterEmperorQinSecondPhase() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDTriggerCommand","enterEmperorQinSecondPhase",[]));
      }
      
      public static function castBossSkill(param1:int, param2:String, param3:*) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDTriggerCommand","castBossSkill",[param1,param2,param3]));
      }
      
      public static function setEmperorSummonSwitch(param1:int, param2:Boolean) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDTriggerCommand","setEmperorSummonSwitch",[param1,param2]));
      }
      
      public static function initWaveTerracotta(param1:int, param2:int, param3:Array = null, param4:int = 5, param5:int = -1, param6:int = 3) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDTriggerCommand","initWaveTerracotta",[param1,param2,param3,param4,param5,param6]));
      }
      
      public static function dispatchTDEvent(param1:String, param2:Object = null) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDTriggerCommand","dispatchTDEvent",[param1,param2]));
      }
      
      public static function castZombieSkill(param1:String, param2:Array = null) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDTriggerCommand","castZombieSkill",[param1,param2]));
      }
   }
}
