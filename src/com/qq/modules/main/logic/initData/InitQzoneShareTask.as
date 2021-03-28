package com.qq.modules.main.logic.initData
{
   import com.qq.modules.main.logic.initData.basic.BasicInitDataTask;
   import com.qq.modules.qzoneShare.command.QZoneShareCmd;
   
   public class InitQzoneShareTask extends BasicInitDataTask
   {
       
      
      public function InitQzoneShareTask()
      {
         super(InitDataManager.Init_QZoneShare);
      }
      
      override public function start() : void
      {
         super.start();
         QZoneShareCmd.getQZoneShareState();
         InitDataManager.getInstance().finishTask(InitDataManager.Init_QZoneShare);
      }
   }
}
