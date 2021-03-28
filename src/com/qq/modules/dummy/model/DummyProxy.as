package com.qq.modules.dummy.model
{
   import PVZ.Cmd.Cmd_Market_BuyPuppetEnergy_SC;
   import PVZ.Cmd.Cmd_Market_BuyPuppetSkillVal_SC;
   import PVZ.Cmd.Cmd_PuppetFuben_Fight_SC;
   import PVZ.Cmd.Cmd_PuppetFuben_GetChapterInfo_SC;
   import PVZ.Cmd.Cmd_PuppetFuben_GetStageInfo_SC;
   import PVZ.Cmd.Cmd_PuppetFuben_Sweep_SC;
   import PVZ.Cmd.Cmd_PuppetFuben_SyncStageInfo_SC;
   import PVZ.Cmd.Cmd_Puppet_Extract_SC;
   import PVZ.Cmd.Cmd_Puppet_GetExtractInfo_SC;
   import PVZ.Cmd.Cmd_Puppet_GetFormation_SC;
   import PVZ.Cmd.Cmd_Puppet_GetInfo_SC;
   import PVZ.Cmd.Cmd_Puppet_Recruit_SC;
   import PVZ.Cmd.Cmd_Puppet_RecycleSparDraw_SC;
   import PVZ.Cmd.Cmd_Puppet_Swap_SC;
   import PVZ.Cmd.Cmd_Puppet_UpgradeLevel_SC;
   import PVZ.Cmd.Cmd_Puppet_UpgradeQuality_SC;
   import PVZ.Cmd.Cmd_Puppet_UpgradeSkillLevel_SC;
   import PVZ.Cmd.Cmd_Puppet_UpgradeSkillQuality_SC;
   import PVZ.Cmd.Cmd_Puppet_UpgradeSparLevel_SC;
   import PVZ.Cmd.Cmd_Puppet_UpgradeSparQuality_SC;
   import PVZ.Cmd.Cmd_Puppet_UpgradeStar_SC;
   import PVZ.Cmd.Dto_Puppet_ExtractGroupInfo;
   import PVZ.Cmd.E_FightResult;
   import com.qq.GameGloble;
   import com.qq.modules.basic.modle.BasicProxy;
   import com.qq.modules.battle.command.BattleServiceCmd;
   import com.qq.modules.dummy.DummyConst;
   import com.qq.modules.dummy.command.DummyProxyCmd;
   import com.qq.modules.main.command.CommonCmd;
   import com.qq.utils.CommandDispatcher;
   import org.as3commons.logging.api.getLogger;
   import tencent.io.service.events.SocketServiceEvent;
   
   public class DummyProxy extends BasicProxy
   {
       
      
      public var model:DummyModel;
      
      private var _requestSwapInfo:Boolean = false;
      
      public function DummyProxy()
      {
         super();
      }
      
      override public function init(param1:Array = null) : void
      {
         super.init(param1);
         this.model = new DummyModel();
      }
      
      override public function listMsgInterests() : Array
      {
         return [[Cmd_Puppet_GetInfo_SC.$MessageID,this.onCmd_Puppet_GetInfo_SC],[Cmd_Puppet_GetFormation_SC.$MessageID,this.onCmd_Puppet_GetFormation_SC],[Cmd_Puppet_UpgradeSparQuality_SC.$MessageID,this.onCmd_Puppet_UpgradeSparQuality_SC],[Cmd_Puppet_UpgradeSparLevel_SC.$MessageID,this.onCmd_Puppet_UpgradeSparLevel_SC],[Cmd_Puppet_UpgradeStar_SC.$MessageID,this.onCmd_Puppet_UpgradeStar_SC],[Cmd_Puppet_UpgradeLevel_SC.$MessageID,this.onCmd_Puppet_UpgradeLevel_SC],[Cmd_Puppet_UpgradeQuality_SC.$MessageID,this.onCmd_Puppet_UpgradeQuality_SC],[Cmd_Puppet_UpgradeSkillLevel_SC.$MessageID,this.onCmd_Puppet_UpgradeSkillLevel_SC],[Cmd_PuppetFuben_GetChapterInfo_SC.$MessageID,this.onCmd_PuppetFuben_GetChapterInfo_SC],[Cmd_PuppetFuben_GetStageInfo_SC.$MessageID,this.onCmd_PuppetFuben_GetStageInfo_SC],[Cmd_PuppetFuben_SyncStageInfo_SC.$MessageID,this.onCmd_PuppetFuben_SyncStageInfo_SC],[Cmd_PuppetFuben_Fight_SC.$MessageID,this.onCmd_PuppetFuben_Fight_SC],[Cmd_PuppetFuben_Sweep_SC.$MessageID,this.onCmd_PuppetFuben_Sweep_SC],[Cmd_Puppet_Recruit_SC.$MessageID,this.onCmd_Puppet_Recruit_SC],[Cmd_Puppet_GetExtractInfo_SC.$MessageID,this.onCmd_Puppet_GetExtractInfo_SC],[Cmd_Puppet_Extract_SC.$MessageID,this.onCmd_Puppet_Extract_SC],[Cmd_Market_BuyPuppetSkillVal_SC.$MessageID,this.onCmd_Market_BuyPuppetSkillVal_SC],[Cmd_Market_BuyPuppetEnergy_SC.$MessageID,this.onCmd_Market_BuyPuppetEnergy_SC],[Cmd_Puppet_RecycleSparDraw_SC.$MessageID,this.onCmd_Puppet_RecycleSparDraw_SC],[Cmd_Puppet_UpgradeSkillQuality_SC.$MessageID,this.onCmd_Puppet_UpgradeSkillQuality_SC],[Cmd_Puppet_Swap_SC.$MessageID,this.onCmd_Puppet_Swap_SC]];
      }
      
      private function onCmd_Puppet_Swap_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_Puppet_Swap_SC = param1.socketData as Cmd_Puppet_Swap_SC;
         DummyProxyCmd.requestDummyZombieListInfo([_loc2_.srcBaseId,_loc2_.dstBaseId]);
         this._requestSwapInfo = true;
      }
      
      private function onCmd_Puppet_UpgradeSkillQuality_SC(param1:SocketServiceEvent) : void
      {
         var _loc4_:int = 0;
         var _loc2_:Cmd_Puppet_UpgradeSkillQuality_SC = param1.socketData as Cmd_Puppet_UpgradeSkillQuality_SC;
         var _loc3_:DummyZombieInfo = this.model.getDummyDataByID(_loc2_.baseId);
         if(_loc3_ != null)
         {
            if(_loc2_.passiveSkill)
            {
               _loc4_ = _loc3_.passiveSkillLevel;
            }
            else
            {
               _loc4_ = _loc3_.activeSkillLevel;
            }
            _loc3_.setSkillInfo(_loc2_.skillId,_loc4_,_loc2_.passiveSkill);
            CommandDispatcher.send(DummyConst.DummyEvent_Update_Zombie_Skill_Active,_loc2_.skillId);
         }
      }
      
      private function onCmd_Puppet_RecycleSparDraw_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_Puppet_RecycleSparDraw_SC = param1.socketData as Cmd_Puppet_RecycleSparDraw_SC;
         CommonCmd.itemFly(_loc2_.item);
      }
      
      private function onCmd_Market_BuyPuppetEnergy_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_Market_BuyPuppetEnergy_SC = param1.socketData as Cmd_Market_BuyPuppetEnergy_SC;
         GameGloble.actorModel.dummyFubenEnergyBuyTimesToday = _loc2_.buyNum;
      }
      
      private function onCmd_Market_BuyPuppetSkillVal_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_Market_BuyPuppetSkillVal_SC = param1.socketData as Cmd_Market_BuyPuppetSkillVal_SC;
         GameGloble.actorModel.dummySkillPointBuyTimesToday = _loc2_.buyNum;
      }
      
      private function onCmd_Puppet_Extract_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_Puppet_Extract_SC = param1.socketData as Cmd_Puppet_Extract_SC;
         this.model.resetCallInfo(_loc2_.groupInfo);
         CommandDispatcher.send(DummyConst.DummyEvent_Play_Draw_Effect,[_loc2_.item,this.model.lastDrarCardTimes]);
         CommandDispatcher.send(DummyConst.DummyEvent_Update_Draw_Info,_loc2_.groupInfo.groupId);
      }
      
      private function onCmd_Puppet_GetExtractInfo_SC(param1:SocketServiceEvent) : void
      {
         var _loc5_:Dto_Puppet_ExtractGroupInfo = null;
         var _loc2_:Cmd_Puppet_GetExtractInfo_SC = param1.socketData as Cmd_Puppet_GetExtractInfo_SC;
         var _loc3_:int = _loc2_.groupInfo.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = _loc2_.groupInfo[_loc4_];
            this.model.resetCallInfo(_loc5_);
            _loc4_++;
         }
         CommandDispatcher.send(DummyConst.DummyEvent_Init_Draw_Info);
      }
      
      private function onCmd_Puppet_Recruit_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_Puppet_Recruit_SC = param1.socketData as Cmd_Puppet_Recruit_SC;
         this.model.updateDummyZombie(_loc2_.puppetInfo);
         CommandDispatcher.send(DummyConst.DummyEvent_Update_Composite_Info,_loc2_.puppetInfo.baseId);
      }
      
      private function onCmd_PuppetFuben_Sweep_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_PuppetFuben_Sweep_SC = param1.socketData as Cmd_PuppetFuben_Sweep_SC;
         CommonCmd.itemFly(_loc2_.reward);
         CommandDispatcher.send(DummyConst.DummyEvent_Fuben_Sweep_Result_Update);
      }
      
      private function onCmd_PuppetFuben_Fight_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_PuppetFuben_Fight_SC = param1.socketData as Cmd_PuppetFuben_Fight_SC;
         BattleServiceCmd.setData(_loc2_.report);
         CommandDispatcher.send(DummyConst.DummyEvent_Fuben_Level_Result_Update,_loc2_.report.result);
         if(_loc2_.report.result == E_FightResult.E_FightResult_Win)
         {
            DummyProxyCmd.requestChapterInfo();
         }
      }
      
      private function onCmd_PuppetFuben_SyncStageInfo_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_PuppetFuben_SyncStageInfo_SC = param1.socketData as Cmd_PuppetFuben_SyncStageInfo_SC;
         this.model.updateStageInfo(_loc2_.stageInfo);
         this.model.lastDropStoneFightNum = _loc2_.fightTimes;
         CommandDispatcher.send(DummyConst.DummyEvent_Fuben_Stage_Info_Update);
      }
      
      private function onCmd_PuppetFuben_GetStageInfo_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_PuppetFuben_GetStageInfo_SC = param1.socketData as Cmd_PuppetFuben_GetStageInfo_SC;
         this.model.setStageList(_loc2_.chapterId,_loc2_.modeId,_loc2_.stageInfo);
         this.model.lastDropStoneFightNum = _loc2_.fightTimes;
         CommandDispatcher.send(DummyConst.DummyEvent_Fuben_Stage_Info_Init);
      }
      
      private function onCmd_PuppetFuben_GetChapterInfo_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_PuppetFuben_GetChapterInfo_SC = param1.socketData as Cmd_PuppetFuben_GetChapterInfo_SC;
         this.model.lastPassEasyChapterId = _loc2_.lastPassEasyChapterId;
         this.model.lastPassHardChapterId = _loc2_.lastPassHardChapterId;
         CommandDispatcher.send(DummyConst.DummyEvent_Fuben_Chapter_Update);
      }
      
      private function onCmd_Puppet_UpgradeSkillLevel_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_Puppet_UpgradeSkillLevel_SC = param1.socketData as Cmd_Puppet_UpgradeSkillLevel_SC;
         var _loc3_:DummyZombieInfo = this.model.getDummyDataByID(_loc2_.baseId);
         if(_loc3_ == null)
         {
            getLogger("dummy").error("升级技能傀儡ID不存在" + _loc2_.baseId);
         }
         else if(_loc2_.passiveSkill)
         {
            _loc3_.passiveSkillLevel = _loc2_.level;
         }
         else
         {
            _loc3_.activeSkillLevel = _loc2_.level;
         }
         CommandDispatcher.send(DummyConst.DummyEvent_Update_Zombie_Skill_LevelUp);
      }
      
      private function onCmd_Puppet_UpgradeQuality_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_Puppet_UpgradeQuality_SC = param1.socketData as Cmd_Puppet_UpgradeQuality_SC;
         var _loc3_:DummyZombieInfo = this.model.getDummyDataByID(_loc2_.baseId);
         if(_loc3_ == null)
         {
            getLogger("dummy").error("晋品傀儡ID不存在" + _loc2_.baseId);
         }
         else
         {
            _loc3_.quilty = _loc2_.quality;
            if(!_loc2_.useItem)
            {
               _loc3_.cleanAllEquipment();
            }
            CommandDispatcher.send(DummyConst.DummyEvent_Update_Zombie_Quilty);
         }
      }
      
      private function onCmd_Puppet_UpgradeLevel_SC(param1:SocketServiceEvent) : void
      {
         var _loc4_:int = 0;
         var _loc2_:Cmd_Puppet_UpgradeLevel_SC = param1.socketData as Cmd_Puppet_UpgradeLevel_SC;
         var _loc3_:DummyZombieInfo = this.model.getDummyDataByID(_loc2_.baseId);
         if(_loc3_ == null)
         {
            getLogger("dummy").error("升级傀儡ID不存在" + _loc2_.baseId);
         }
         else
         {
            _loc4_ = _loc3_.level;
            _loc3_.level = _loc2_.level;
            _loc3_.exp = _loc2_.exp;
            if(_loc4_ != _loc2_.level)
            {
               CommandDispatcher.send(DummyConst.DummyEvent_Update_Zombie_Levelup);
            }
            else
            {
               CommandDispatcher.send(DummyConst.DummyEvent_Update_Zombie_Add_Exp);
            }
         }
      }
      
      private function onCmd_Puppet_UpgradeStar_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_Puppet_UpgradeStar_SC = param1.socketData as Cmd_Puppet_UpgradeStar_SC;
         var _loc3_:DummyZombieInfo = this.model.getDummyDataByID(_loc2_.baseId);
         if(_loc3_ == null)
         {
            getLogger("dummy").error("升星傀儡ID不存在" + _loc2_.baseId);
         }
         else
         {
            _loc3_.star = _loc2_.star;
         }
         CommandDispatcher.send(DummyConst.DummyEvent_Update_Zombie_StarUp);
      }
      
      private function onCmd_Puppet_UpgradeSparLevel_SC(param1:SocketServiceEvent) : void
      {
         var _loc4_:DummyEquipmentInfo = null;
         var _loc2_:Cmd_Puppet_UpgradeSparLevel_SC = param1.socketData as Cmd_Puppet_UpgradeSparLevel_SC;
         var _loc3_:DummyZombieInfo = this.model.getDummyDataByID(_loc2_.baseId);
         if(_loc3_ == null)
         {
            getLogger("dummy").error("升级装备傀儡ID不存在" + _loc2_.baseId);
         }
         else if((_loc4_ = _loc3_.getEquipmentInfoByType(_loc2_.sparType)) == null)
         {
            getLogger("dummy").error("升级装备不存在" + _loc2_.sparType);
         }
         else
         {
            _loc3_.resetEquipmentInfo(_loc2_.sparType,_loc4_.quilty,_loc2_.level);
         }
         CommandDispatcher.send(DummyConst.DummyEvent_Update_DummyEquipment_LevelUP);
      }
      
      private function onCmd_Puppet_UpgradeSparQuality_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_Puppet_UpgradeSparQuality_SC = param1.socketData as Cmd_Puppet_UpgradeSparQuality_SC;
         var _loc3_:DummyZombieInfo = this.model.getDummyDataByID(_loc2_.baseId);
         if(_loc3_ == null)
         {
            getLogger("dummy").error("制造装备傀儡ID不存在" + _loc2_.baseId);
         }
         else
         {
            _loc3_.resetEquipmentInfo(_loc2_.sparType,_loc2_.quality,_loc2_.level);
         }
         CommandDispatcher.send(DummyConst.DummyEvent_Update_DummyEquipment_Info);
      }
      
      private function onCmd_Puppet_GetFormation_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_Puppet_GetFormation_SC = param1.socketData as Cmd_Puppet_GetFormation_SC;
         this.model.resetDummyLineup(_loc2_.formation);
         CommandDispatcher.send(DummyConst.DummyEvent_Update_Lineup);
      }
      
      private function onCmd_Puppet_GetInfo_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_Puppet_GetInfo_SC = param1.socketData as Cmd_Puppet_GetInfo_SC;
         this.model.resetDummyZombieDataList(_loc2_.puppetInfo);
         CommandDispatcher.send(DummyConst.DummyEvent_DummyZombieList_Inited);
         if(this._requestSwapInfo)
         {
            CommandDispatcher.send(DummyConst.DummyEvent_Exchange_Success);
            this._requestSwapInfo = false;
         }
      }
   }
}
