package com.qq.modules.main.logic.initData
{
   import com.qq.GameGloble;
   import com.qq.modules.main.logic.initData.basic.BasicInitDataTask;
   import com.qq.modules.quest.service.QuestService;
   import com.qq.utils.update.DataUpdateManager;
   import org.as3commons.logging.api.getLogger;
   
   public class InitQuestInfoTask extends BasicInitDataTask
   {
       
      
      public function InitQuestInfoTask(param1:Boolean = true)
      {
         super(InitDataManager.Init_QuestInfo,param1);
      }
      
      override public function start() : void
      {
         super.start();
         getLogger("loading").debug("Loading Quest Information");
         var _loc1_:QuestService = GameGloble.injector.getInstance(QuestService);
         _loc1_.init();
         _loc1_.getQuestInfo();
         _loc1_.getDailyQusetInfo();
         _loc1_.getDailyActInfo();
         DataUpdateManager.getInstance().addUpdateHandler(DataUpdateManager.ID_DailyQuest,_loc1_.getDailyQusetInfo);
         DataUpdateManager.getInstance().addUpdateHandler(DataUpdateManager.ID_DailyAct,_loc1_.getDailyActInfo);
      }
   }
}
