package com.qq.modules.embattle.command
{
   import asgui.containers.Canvas;
   import asgui.controls.Image;
   import flash.geom.Point;
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class EmbattleCmd
   {
       
      
      public function EmbattleCmd()
      {
         super();
      }
      
      public static function removeCityHomeView(param1:Canvas, param2:Image) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("EmbattleCommand","removeCityHomeView",[param1,param2]));
      }
      
      public static function updateCurFormation() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("EmbattleCommand","updateCurFormation",[]));
      }
      
      public static function showGuideMovie(param1:int, param2:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("EmbattleCommand","showGuideMovie",[param1,param2]));
      }
      
      public static function zoomInCityHomeView(param1:Image, param2:uint = 0, param3:Boolean = false) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("EmbattleCommand","zoomInCityHomeView",[param1,param2,param3]));
      }
      
      public static function zoomOutCityHomeView(param1:Boolean = true) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("EmbattleCommand","zoomOutCityHomeView",[param1]));
      }
      
      public static function embattleByMapFight(param1:Point, param2:int, param3:uint) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("EmbattleCommand","embattleByMapFight",[param1,param2,param3]));
      }
      
      public static function embattleByHome(param1:Image) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("EmbattleCommand","embattleByHome",[param1]));
      }
      
      public static function embattleByArena(param1:Boolean, param2:Function) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("EmbattleCommand","embattleByArena",[param1,param2]));
      }
      
      public static function embattleByWorldBoss(param1:Function) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("EmbattleCommand","embattleByWorldBoss",[param1]));
      }
      
      public static function embattleByMap() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("EmbattleCommand","embattleByMap",[]));
      }
      
      public static function embattleBySearchTreasure(param1:Function, param2:Boolean) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("EmbattleCommand","embattleBySearchTreasure",[param1,param2]));
      }
      
      public static function embattleBySnatchTreasure(param1:Function) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("EmbattleCommand","embattleBySnatchTreasure",[param1]));
      }
      
      public static function embattle(param1:int, param2:Function) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("EmbattleCommand","embattle",[param1,param2]));
      }
      
      public static function embattleByTopKing(param1:Function) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("EmbattleCommand","embattleByTopKing",[param1]));
      }
      
      public static function embattleByHole(param1:Function, param2:Array) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("EmbattleCommand","embattleByHole",[param1,param2]));
      }
      
      public static function embattleByLadderDef() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("EmbattleCommand","embattleByLadderDef",[]));
      }
      
      public static function embattleByFuzion(param1:Function, param2:Array, param3:Function, param4:Array) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("EmbattleCommand","embattleByFuzion",[param1,param2,param3,param4]));
      }
      
      public static function embattleByUnionCompetition(param1:Function, param2:Array, param3:Function, param4:Array) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("EmbattleCommand","embattleByUnionCompetition",[param1,param2,param3,param4]));
      }
   }
}
