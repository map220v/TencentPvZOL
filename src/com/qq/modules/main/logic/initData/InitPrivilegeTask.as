package com.qq.modules.main.logic.initData
{
   import com.qq.modules.main.command.PrivilegeProxyCmd;
   import com.qq.modules.main.logic.initData.basic.BasicInitDataTask;
   
   public class InitPrivilegeTask extends BasicInitDataTask
   {
       
      
      public function InitPrivilegeTask(param1:Boolean = true)
      {
         super(InitDataManager.Init_Privilege,param1);
      }
      
      override public function start() : void
      {
         super.start();
         PrivilegeProxyCmd.getPrivilege();
         InitDataManager.getInstance().finishTask(InitDataManager.Init_Privilege);
      }
   }
}
