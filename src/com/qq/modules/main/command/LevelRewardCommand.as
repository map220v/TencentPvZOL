package com.qq.modules.main.command
{
   import PVZ.Cmd.Cmd_GetLevelRewardInfo_CS;
   import PVZ.Cmd.Cmd_TakeLevelReward_CS;
   import com.qq.modules.main.server.PvzSocketService;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   
   public class LevelRewardCommand extends StrongRobotlegCommand
   {
      
      public static const NAME:String = "LevelRewardCommand";
       
      
      [Inject]
      public var pvzService:PvzSocketService;
      
      public function LevelRewardCommand()
      {
         super();
      }
      
      public function queryReward() : void
      {
         var _loc1_:Cmd_GetLevelRewardInfo_CS = new Cmd_GetLevelRewardInfo_CS();
         this.pvzService.sendMessage(_loc1_);
      }
      
      public function takeReward() : void
      {
         var _loc1_:Cmd_TakeLevelReward_CS = new Cmd_TakeLevelReward_CS();
         this.pvzService.sendMessage(_loc1_);
      }
   }
}
