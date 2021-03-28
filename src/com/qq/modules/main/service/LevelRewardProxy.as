package com.qq.modules.main.service
{
   import PVZ.Cmd.Cmd_GetLevelRewardInfo_SC;
   import PVZ.Cmd.Cmd_TakeLevelReward_SC;
   import com.qq.modules.basic.modle.BasicProxy;
   import com.qq.modules.main.command.CommonCmd;
   import com.qq.utils.UrlManager;
   import tencent.io.service.events.SocketServiceEvent;
   
   public class LevelRewardProxy extends BasicProxy
   {
       
      
      private var m_rewardLevel:int;
      
      private var m_aryReward:Array;
      
      public function LevelRewardProxy()
      {
         super();
      }
      
      override public function listMsgInterests() : Array
      {
         return [[Cmd_GetLevelRewardInfo_SC.$MessageID,this.onCmd_GetLevelRewardInfo_SC],[Cmd_TakeLevelReward_SC.$MessageID,this.onCmd_TakeLevelReward_SC]];
      }
      
      private function onCmd_GetLevelRewardInfo_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_GetLevelRewardInfo_SC = param1.socketData as Cmd_GetLevelRewardInfo_SC;
         this.setLevel(_loc2_.level);
         this.m_aryReward = _loc2_.rewards;
      }
      
      private function onCmd_TakeLevelReward_SC(param1:SocketServiceEvent) : void
      {
         CommonCmd.itemFly(this.m_aryReward);
         var _loc2_:Cmd_TakeLevelReward_SC = param1.socketData as Cmd_TakeLevelReward_SC;
         this.setLevel(_loc2_.level);
         this.m_aryReward = _loc2_.rewards;
      }
      
      public function get rewards() : Array
      {
         return this.m_aryReward;
      }
      
      public function get level() : int
      {
         return this.m_rewardLevel;
      }
      
      private function setLevel(param1:int) : void
      {
         var _loc2_:String = null;
         this.m_rewardLevel = param1;
         if(this.m_rewardLevel > 0)
         {
            _loc2_ = UrlManager.getInstance().getUrl(UrlManager.Url_CollectCoin,"flag.png");
         }
      }
   }
}
