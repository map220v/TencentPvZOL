package com.qq.modules.onlineReward.command
{
   import PVZ.Cmd.Cmd_OnlineReward_GetInfo_CS;
   import PVZ.Cmd.Cmd_OnlineReward_TakeRewardWeekly_CS;
   import PVZ.Cmd.Cmd_OnlineReward_TakeReward_CS;
   import com.qq.modules.main.server.PvzSocketService;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   
   public class OnlineRewardServiceCommand extends StrongRobotlegCommand
   {
       
      
      [Inject]
      public var pvzServer:PvzSocketService;
      
      public function OnlineRewardServiceCommand()
      {
         super();
      }
      
      public function requestOnlineRewardInfo() : void
      {
         var _loc1_:Cmd_OnlineReward_GetInfo_CS = new Cmd_OnlineReward_GetInfo_CS();
         this.pvzServer.sendMessage(_loc1_);
      }
      
      public function takeOnlineDailyReward() : void
      {
         var _loc1_:Cmd_OnlineReward_TakeReward_CS = new Cmd_OnlineReward_TakeReward_CS();
         this.pvzServer.sendMessage(_loc1_);
      }
      
      public function takeWeeklyReward() : void
      {
         var _loc1_:Cmd_OnlineReward_TakeRewardWeekly_CS = new Cmd_OnlineReward_TakeRewardWeekly_CS();
         this.pvzServer.sendMessage(_loc1_);
      }
   }
}
