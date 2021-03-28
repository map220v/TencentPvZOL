package com.qq.modules.main.logic.initData
{
   import com.qq.GameGloble;
   import com.qq.modules.dummy.command.DummyProxyCmd;
   import com.qq.modules.dummy.model.DummyProxy;
   import com.qq.modules.main.logic.initData.basic.BasicInitDataTask;
   import org.as3commons.logging.api.getLogger;
   
   public class InitDummyTask extends BasicInitDataTask
   {
       
      
      public function InitDummyTask()
      {
         super(InitDataManager.Init_Dummy);
      }
      
      override public function start() : void
      {
         super.start();
         getLogger("loading").debug("Loading Dummy Information");
         var _loc1_:DummyProxy = GameGloble.injector.getInstance(DummyProxy);
         _loc1_.init();
         DummyProxyCmd.requestDummyZombieListInfo();
         DummyProxyCmd.getLineup();
         InitDataManager.getInstance().finishTask(InitDataManager.Init_Dummy);
      }
   }
}
