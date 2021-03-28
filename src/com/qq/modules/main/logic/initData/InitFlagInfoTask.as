package com.qq.modules.main.logic.initData
{
   import com.qq.GameGloble;
   import com.qq.modules.main.command.FlagInfoServiceCmd;
   import com.qq.modules.main.logic.initData.basic.BasicInitDataTask;
   import com.qq.modules.main.service.FlagInfoProxy;
   import org.as3commons.logging.api.getLogger;
   
   public class InitFlagInfoTask extends BasicInitDataTask
   {
       
      
      public function InitFlagInfoTask(param1:Boolean = true)
      {
         super(InitDataManager.Init_FlagInfo,param1);
      }
      
      override public function start() : void
      {
         super.start();
         getLogger("loading").debug("Loading Player Flag Information");
         var _loc1_:FlagInfoProxy = GameGloble.injector.getInstance(FlagInfoProxy);
         _loc1_.init();
         FlagInfoServiceCmd.initFlagInfo();
      }
   }
}
