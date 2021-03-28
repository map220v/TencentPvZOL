package com.qq.modules.plantTalent.service
{
   import PVZ.Cmd.Cmd_Talent_GetList_SC;
   import PVZ.Cmd.Cmd_Talent_Study_SC;
   import com.qq.modules.basic.modle.BasicProxy;
   import com.qq.modules.main.model.SettingsModel;
   import com.qq.modules.main.server.PvzSocketService;
   import com.qq.modules.plantTalent.model.PlantTalentModel;
   import com.qq.modules.qzoneShare.command.QZoneShareCmd;
   import org.as3commons.logging.api.getLogger;
   import tencent.io.service.events.SocketServiceEvent;
   
   public class PlantTalentService extends BasicProxy
   {
       
      
      [Inject]
      public var pvzServer:PvzSocketService;
      
      [Inject]
      public var plantTalentModel:PlantTalentModel;
      
      [Inject]
      public var settingModel:SettingsModel;
      
      public var initEnterTalentStageId:uint;
      
      private var hasInited:Boolean = false;
      
      public function PlantTalentService()
      {
         super();
      }
      
      override public function listMsgInterests() : Array
      {
         return [[Cmd_Talent_GetList_SC.$MessageID,this.cmdHandler],[Cmd_Talent_Study_SC.$MessageID,this.cmdHandler]];
      }
      
      private function cmdHandler(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_Talent_GetList_SC = null;
         var _loc3_:Cmd_Talent_Study_SC = null;
         if(param1.retCode != 0)
         {
            getLogger("Socket").error("socket error: " + param1.retCode);
            return;
         }
         switch(param1.type)
         {
            case Cmd_Talent_GetList_SC.$MessageID:
               _loc2_ = param1.socketData as Cmd_Talent_GetList_SC;
               this.plantTalentModel.curStageId = _loc2_.stageId;
               this.plantTalentModel.setUnlockPlantList(_loc2_.unlockPlantList,_loc2_.talentList);
               break;
            case Cmd_Talent_Study_SC.$MessageID:
               _loc3_ = param1.socketData as Cmd_Talent_Study_SC;
               this.plantTalentModel.setTalentStudy(_loc3_.talentId);
               QZoneShareCmd.checkTalentShareMsg(_loc3_.talentId,null,null);
         }
      }
   }
}
