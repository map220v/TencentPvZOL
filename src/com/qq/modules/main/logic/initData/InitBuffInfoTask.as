package com.qq.modules.main.logic.initData
{
   import com.qq.GameGloble;
   import com.qq.modules.main.command.BuffProxyCmd;
   import com.qq.modules.main.logic.initData.basic.BasicInitDataTask;
   import com.qq.modules.main.service.BuffProxy;
   import org.as3commons.logging.api.getLogger;
   
   public class InitBuffInfoTask extends BasicInitDataTask
   {
       
      
      public function InitBuffInfoTask(param1:Boolean = true)
      {
         super(InitDataManager.Init_BuffInfo,param1);
      }
      
      override public function start() : void
      {
         super.start();
         getLogger("loading").debug("Loading Player Buff Information");
         var _loc1_:BuffProxy = GameGloble.injector.getInstance(BuffProxy);
         _loc1_.init();
         BuffProxyCmd.getBuffList();
      }
   }
}
