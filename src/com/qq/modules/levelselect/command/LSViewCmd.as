package com.qq.modules.levelselect.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class LSViewCmd
   {
       
      
      public function LSViewCmd()
      {
         super();
      }
      
      public static function enterStage(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("LSViewCommand","enterStage",[param1]));
      }
      
      public static function showLevelWd(param1:int, param2:int = 1) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("LSViewCommand","showLevelWd",[param1,param2]));
      }
      
      public static function showLevelChallengeWd(param1:int, param2:int = 1) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("LSViewCommand","showLevelChallengeWd",[param1,param2]));
      }
      
      public static function showLevelChallengeEnterWd(param1:int, param2:int = 1) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("LSViewCommand","showLevelChallengeEnterWd",[param1,param2]));
      }
      
      public static function showPromotionWd(param1:int, param2:int, param3:Array) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("LSViewCommand","showPromotionWd",[param1,param2,param3]));
      }
      
      public static function showChallengeRankWd(param1:int, param2:int, param3:int = 1, param4:int = 1) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("LSViewCommand","showChallengeRankWd",[param1,param2,param3,param4]));
      }
      
      public static function showChallengeBonusWd(param1:int = 1) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("LSViewCommand","showChallengeBonusWd",[param1]));
      }
      
      public static function addInitCmd(param1:int, param2:Object, param3:Object = null) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("LSViewCommand","addInitCmd",[param1,param2,param3]));
      }
      
      public static function showScoreWindow() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("LSViewCommand","showScoreWindow",[]));
      }
   }
}
