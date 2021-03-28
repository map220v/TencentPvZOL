package com.qq.modules.main.logic.initData
{
   import com.qq.GameGloble;
   import com.qq.modules.basic.modle.BasicProxy;
   import com.qq.modules.main.logic.initData.basic.BasicInitDataTask;
   import com.qq.modules.onlineReward.command.OnlineRewardServiceCmd;
   import com.qq.modules.onlineReward.model.OnlineRewardService;
   import com.qq.utils.update.DataUpdateManager;
   import org.as3commons.logging.api.getLogger;
   
   public class InitOnlineRewardTask extends BasicInitDataTask
   {
       
      
      public function InitOnlineRewardTask(param1:Boolean = true)
      {
         super(InitDataManager.Init_OnlineReward,param1);
      }
      
      override public function start() : void
      {
         super.start();
         getLogger("loading").debug("Loading Online Rewards Info");
         var _loc1_:BasicProxy = GameGloble.injector.getInstance(OnlineRewardService);
         _loc1_.init();
         OnlineRewardServiceCmd.requestOnlineRewardInfo();
         DataUpdateManager.getInstance().addUpdateHandler(DataUpdateManager.ID_OnlineDailyReward,OnlineRewardServiceCmd.requestOnlineRewardInfo);
      }
   }
}
