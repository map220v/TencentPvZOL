package com.qq.modules.main.logic.initData
{
   import com.qq.GameGloble;
   import com.qq.modules.basic.modle.BasicProxy;
   import com.qq.modules.main.command.LevelRewardCmd;
   import com.qq.modules.main.logic.initData.basic.BasicInitDataTask;
   import com.qq.modules.main.service.LevelRewardProxy;
   import org.as3commons.logging.api.getLogger;
   
   public class InitLevelRewardTask extends BasicInitDataTask
   {
       
      
      public function InitLevelRewardTask()
      {
         super(InitDataManager.Init_LevelReward);
      }
      
      override public function start() : void
      {
         getLogger("loading").debug("Loading Level Reward Information");
         var _loc1_:BasicProxy = GameGloble.injector.getInstance(LevelRewardProxy);
         _loc1_.init();
         LevelRewardCmd.queryReward();
         InitDataManager.getInstance().finishTask(InitDataManager.Init_LevelReward);
      }
   }
}
