package com.qq.modules.main.logic.initData
{
   import com.qq.GameGloble;
   import com.qq.modules.login.service.LoginService;
   import com.qq.modules.main.logic.initData.basic.BasicInitDataTask;
   
   public class InitMergeServer extends BasicInitDataTask
   {
       
      
      public function InitMergeServer(param1:Boolean = true)
      {
         super(InitDataManager.Init_MergeServer,param1);
      }
      
      override public function start() : void
      {
         super.start();
         var _loc1_:LoginService = GameGloble.injector.getInstance(LoginService);
         _loc1_.getMergeServerFlag();
         InitDataManager.getInstance().finishTask(InitDataManager.Init_MergeServer);
      }
   }
}
