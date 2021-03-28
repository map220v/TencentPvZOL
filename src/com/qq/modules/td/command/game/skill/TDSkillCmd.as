package com.qq.modules.td.command.game.skill
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class TDSkillCmd
   {
       
      
      public function TDSkillCmd()
      {
         super();
      }
      
      public static function addZombieSpeedUpBuff(param1:Array = null, param2:Array = null) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDSkillCommand","addZombieSpeedUpBuff",[param1,param2]));
      }
      
      public static function addZombieSpeedUpBuffWithGameObjects(param1:Array) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDSkillCommand","addZombieSpeedUpBuffWithGameObjects",[param1]));
      }
      
      public static function changePath(param1:Object) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDSkillCommand","changePath",[param1]));
      }
      
      public static function changeTerrain(param1:Object) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDSkillCommand","changeTerrain",[param1]));
      }
      
      public static function castFireBall(param1:Object) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDSkillCommand","castFireBall",[param1]));
      }
      
      public static function castQuickSand(param1:Object) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDSkillCommand","castQuickSand",[param1]));
      }
   }
}
