package com.qq.modules.main.logic.initData
{
   import com.qq.GameGloble;
   import com.qq.modules.main.logic.initData.basic.BasicInitDataTask;
   import com.qq.modules.plantTalent.command.PlantTalentCmd;
   import com.qq.modules.plantTalent.service.PlantTalentService;
   import org.as3commons.logging.api.getLogger;
   
   public class InitTalentTask extends BasicInitDataTask
   {
       
      
      public function InitTalentTask()
      {
         super(InitDataManager.Init_Talent);
      }
      
      override public function start() : void
      {
         super.start();
         getLogger("loading").debug("Loading Talent Information");
         var _loc1_:PlantTalentService = GameGloble.injector.getInstance(PlantTalentService);
         _loc1_.init();
         PlantTalentCmd.getTalentList(0);
         InitDataManager.getInstance().finishTask(InitDataManager.Init_Talent);
      }
   }
}
