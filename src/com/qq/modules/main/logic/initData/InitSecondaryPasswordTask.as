package com.qq.modules.main.logic.initData
{
   import com.qq.modules.main.logic.initData.basic.BasicInitDataTask;
   import com.qq.modules.secondaryPassword.command.SecondaryPasswordCmd;
   import org.as3commons.logging.api.getLogger;
   
   public class InitSecondaryPasswordTask extends BasicInitDataTask
   {
       
      
      public function InitSecondaryPasswordTask(param1:Boolean = true)
      {
         super(InitDataManager.Init_SecondaryPassword,param1);
      }
      
      override public function start() : void
      {
         super.start();
         getLogger("loading").debug("Loading Secondary Password Information");
         SecondaryPasswordCmd.getInfo();
         InitDataManager.getInstance().finishTask(InitDataManager.Init_SecondaryPassword);
      }
   }
}
