package com.qq.modules.main.logic.initData
{
   import com.qq.GameGloble;
   import com.qq.modules.lab.command.LabProxyCmd;
   import com.qq.modules.lab.model.LabProxy;
   import com.qq.modules.main.logic.initData.basic.BasicInitDataTask;
   import org.as3commons.logging.api.getLogger;
   
   public class InitLabInfoTask extends BasicInitDataTask
   {
       
      
      public function InitLabInfoTask(param1:Boolean = true)
      {
         super(InitDataManager.Init_LabInfo,param1);
      }
      
      override public function start() : void
      {
         super.start();
         getLogger("loading").debug("Loading Player Lab Information");
         var _loc1_:LabProxy = GameGloble.injector.getInstance(LabProxy);
         _loc1_.init();
         LabProxyCmd.getLabInfo();
      }
   }
}
