package com.qq.modules.worldBoss.command
{
   import com.tencent.protobuf.Int64;
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class WorldBossCmd
   {
       
      
      public function WorldBossCmd()
      {
         super();
      }
      
      public static function onClickWorldBossIcon() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("WorldBossCommand","onClickWorldBossIcon",[]));
      }
      
      public static function getBossInfo() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("WorldBossCommand","getBossInfo",[]));
      }
      
      public static function getRoleInfo() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("WorldBossCommand","getRoleInfo",[]));
      }
      
      public static function inspire() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("WorldBossCommand","inspire",[]));
      }
      
      public static function startBattle() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("WorldBossCommand","startBattle",[]));
      }
      
      public static function embattleFight() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("WorldBossCommand","embattleFight",[]));
      }
      
      public static function showRelivePanel(param1:Boolean = false) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("WorldBossCommand","showRelivePanel",[param1]));
      }
      
      public static function showConfirmClosePanel() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("WorldBossCommand","showConfirmClosePanel",[]));
      }
      
      public static function getBossRank() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("WorldBossCommand","getBossRank",[]));
      }
      
      public static function getBossWeekRank() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("WorldBossCommand","getBossWeekRank",[]));
      }
      
      public static function getOthFormationInfo(param1:uint, param2:Int64) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("WorldBossCommand","getOthFormationInfo",[param1,param2]));
      }
      
      public static function openBossDetaiWindow() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("WorldBossCommand","openBossDetaiWindow",[]));
      }
   }
}
