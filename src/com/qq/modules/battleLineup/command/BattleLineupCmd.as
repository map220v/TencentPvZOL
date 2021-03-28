package com.qq.modules.battleLineup.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class BattleLineupCmd
   {
       
      
      public function BattleLineupCmd()
      {
         super();
      }
      
      public static function preFight_PVE(param1:uint, param2:uint, param3:uint, param4:int = 0, param5:int = 0, param6:Boolean = false, param7:Boolean = false, param8:int = 0, param9:Function = null) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("BattleLineupCommand","preFight_PVE",[param1,param2,param3,param4,param5,param6,param7,param8,param9]));
      }
      
      public static function preActFight_PVE(param1:uint, param2:int = 0, param3:Function = null) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("BattleLineupCommand","preActFight_PVE",[param1,param2,param3]));
      }
      
      public static function showSelfBattleLineup(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("BattleLineupCommand","showSelfBattleLineup",[param1]));
      }
      
      public static function getFriendCardList() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("BattleLineupCommand","getFriendCardList",[]));
      }
      
      public static function removeHelpCard() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("BattleLineupCommand","removeHelpCard",[]));
      }
   }
}
