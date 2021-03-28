package com.qq.modules.main.logic.initData
{
   import com.qq.GameGloble;
   import com.qq.modules.activity.command.ActivityProxyCmd;
   import com.qq.modules.activity.model.ActivityProxy;
   import com.qq.modules.basic.modle.BasicProxy;
   import com.qq.modules.buffActivity.model.BuffActivityProxy;
   import com.qq.modules.main.logic.initData.basic.BasicInitDataTask;
   import com.qq.utils.update.DataUpdateManager;
   import org.as3commons.logging.api.getLogger;
   
   public class InitActivityTask extends BasicInitDataTask
   {
       
      
      public function InitActivityTask()
      {
         super(InitDataManager.Init_Activity);
      }
      
      override public function start() : void
      {
         super.start();
         getLogger("loading").debug("Loading Event Information");
         var _loc1_:BasicProxy = GameGloble.injector.getInstance(ActivityProxy);
         _loc1_.init();
         DataUpdateManager.getInstance().addUpdateHandler(DataUpdateManager.ID_Activity,ActivityProxyCmd.getActivityList);
         _loc1_ = GameGloble.injector.getInstance(BuffActivityProxy);
         _loc1_.init();
         ActivityProxyCmd.getActivityList();
         InitDataManager.getInstance().finishTask(InitDataManager.Init_Activity);
      }
   }
}
