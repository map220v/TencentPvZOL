package com.qq.modules.main.logic.initData
{
   import com.qq.modules.main.command.modules.ModuleGuideCmd;
   import com.qq.modules.main.logic.initData.basic.BasicInitDataTask;
   import org.as3commons.logging.api.getLogger;
   
   public class InitPlayerGuideInfoTask extends BasicInitDataTask
   {
       
      
      public function InitPlayerGuideInfoTask(param1:Boolean = true)
      {
         super(InitDataManager.Init_PlayerGuideInfo,param1);
      }
      
      override public function start() : void
      {
         super.start();
         getLogger("loading").debug("Loading Player Guide Information");
         ModuleGuideCmd.start();
      }
   }
}
