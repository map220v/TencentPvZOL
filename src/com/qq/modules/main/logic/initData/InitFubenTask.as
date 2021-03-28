package com.qq.modules.main.logic.initData
{
   import com.qq.GameGloble;
   import com.qq.modules.basic.modle.BasicProxy;
   import com.qq.modules.fuben.command.FubenProxyCmd;
   import com.qq.modules.fuben.model.FubenProxy;
   import com.qq.modules.main.logic.initData.basic.BasicInitDataTask;
   
   public class InitFubenTask extends BasicInitDataTask
   {
       
      
      public function InitFubenTask(param1:Boolean = true)
      {
         super(InitDataManager.Init_Fuben,param1);
      }
      
      override public function start() : void
      {
         super.start();
         var _loc1_:BasicProxy = GameGloble.injector.getInstance(FubenProxy);
         _loc1_.init();
         FubenProxyCmd.requestMapInfo();
         InitDataManager.getInstance().finishTask(InitDataManager.Init_Fuben);
      }
   }
}
