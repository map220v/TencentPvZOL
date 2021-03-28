package com.qq.modules.main.logic.initData
{
   import com.qq.modules.main.command.ShortcutPayProxyCmd;
   import com.qq.modules.main.logic.initData.basic.BasicInitDataTask;
   
   public class InitShortcutPayTask extends BasicInitDataTask
   {
       
      
      public function InitShortcutPayTask(param1:Boolean = true)
      {
         super(InitDataManager.Init_ShortcutPay,param1);
      }
      
      override public function start() : void
      {
         super.start();
         ShortcutPayProxyCmd.getShortcutPay();
         InitDataManager.getInstance().finishTask(InitDataManager.Init_ShortcutPay);
      }
   }
}
