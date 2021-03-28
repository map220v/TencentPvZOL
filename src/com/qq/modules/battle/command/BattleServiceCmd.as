package com.qq.modules.battle.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class BattleServiceCmd
   {
       
      
      public function BattleServiceCmd()
      {
         super();
      }
      
      public static function setData(param1:Object, param2:Array = null, param3:Function = null) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("BattleServiceCommand","setData",[param1,param2,param3]));
      }
      
      public static function replay() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("BattleServiceCommand","replay",[]));
      }
      
      public static function battleReady() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("BattleServiceCommand","battleReady",[]));
      }
      
      public static function friendFight() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("BattleServiceCommand","friendFight",[]));
      }
   }
}
