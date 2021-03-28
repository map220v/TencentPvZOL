package com.qq.modules.lab.model
{
   import PVZ.Cmd.Cmd_Lab_GetLabInfo_SC;
   import PVZ.Cmd.Cmd_Lab_ProduceLab_SC;
   import PVZ.Cmd.Cmd_Lab_SyncUnlockLab_SC;
   import PVZ.Cmd.Cmd_Lab_UpgradeLab_SC;
   import PVZ.Cmd.Dto_LabItem;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.modle.BasicProxy;
   import com.qq.modules.lab.constant.LabConst;
   import com.qq.modules.lab.model.vo.LabTechVO;
   import com.qq.modules.main.logic.initData.InitDataManager;
   import com.qq.modules.qzoneShare.command.QZoneShareCmd;
   import tencent.io.service.events.SocketServiceEvent;
   
   public class LabProxy extends BasicProxy
   {
       
      
      public var labData:LabData;
      
      public var produceTech:LabTechVO;
      
      public function LabProxy()
      {
         this.labData = new LabData();
         super();
      }
      
      override public function init(param1:Array = null) : void
      {
         super.init();
      }
      
      override public function listMsgInterests() : Array
      {
         return [[Cmd_Lab_GetLabInfo_SC.$MessageID,this.onCmd_Lab_GetLabInfo_SC],[Cmd_Lab_ProduceLab_SC.$MessageID,this.onCmd_Lab_ProduceLab_SC],[Cmd_Lab_UpgradeLab_SC.$MessageID,this.onCmd_Lab_UpgradeLab_SC],[Cmd_Lab_SyncUnlockLab_SC.$MessageID,this.onCmd_Lab_SyncUnlockLab_SC]];
      }
      
      private function onCmd_Lab_GetLabInfo_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_Lab_GetLabInfo_SC = param1.socketData as Cmd_Lab_GetLabInfo_SC;
         this.labData.isHaveNewTech = _loc2_.hasNewLab;
         this.labData.setLabInfo(_loc2_.allLab);
         dispatch(new CommonEvent(LabConst.LAB_GET_ALL_INFO_EVENT));
         InitDataManager.getInstance().finishTask(InitDataManager.Init_LabInfo);
      }
      
      private function onCmd_Lab_ProduceLab_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_Lab_ProduceLab_SC = param1.socketData as Cmd_Lab_ProduceLab_SC;
         var _loc3_:LabTechVO = this.labData.updateTech(_loc2_.changeLab);
         dispatch(new CommonEvent(LabConst.LAB_PRODUCE_SUCCEED_EVENT,_loc3_));
         QZoneShareCmd.checkLabMakeShareMsg(null,null);
      }
      
      private function onCmd_Lab_UpgradeLab_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_Lab_UpgradeLab_SC = param1.socketData as Cmd_Lab_UpgradeLab_SC;
         var _loc3_:LabTechVO = this.labData.updateTech(_loc2_.changeLab);
         dispatch(new CommonEvent(LabConst.LAB_UPGRADE_SUCCEED_EVENT,_loc3_));
      }
      
      private function onCmd_Lab_SyncUnlockLab_SC(param1:SocketServiceEvent) : void
      {
         var _loc3_:Dto_LabItem = null;
         var _loc2_:Cmd_Lab_SyncUnlockLab_SC = param1.socketData as Cmd_Lab_SyncUnlockLab_SC;
         this.labData.isHaveNewTech = true;
         for each(_loc3_ in _loc2_.newLab)
         {
            this.labData.updateTech(_loc3_);
         }
         dispatch(new CommonEvent(LabConst.LAB_SYNC_UNLOCK_LAB_EVENT));
      }
   }
}
