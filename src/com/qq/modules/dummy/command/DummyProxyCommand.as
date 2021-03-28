package com.qq.modules.dummy.command
{
   import PVZ.Cmd.Cmd_Market_BuyPuppetEnergy_CS;
   import PVZ.Cmd.Cmd_Market_BuyPuppetSkillVal_CS;
   import PVZ.Cmd.Cmd_PuppetFuben_Fight_CS;
   import PVZ.Cmd.Cmd_PuppetFuben_GetChapterInfo_CS;
   import PVZ.Cmd.Cmd_PuppetFuben_GetStageInfo_CS;
   import PVZ.Cmd.Cmd_PuppetFuben_Sweep_CS;
   import PVZ.Cmd.Cmd_Puppet_Extract_CS;
   import PVZ.Cmd.Cmd_Puppet_GetExtractInfo_CS;
   import PVZ.Cmd.Cmd_Puppet_GetFormation_CS;
   import PVZ.Cmd.Cmd_Puppet_GetInfo_CS;
   import PVZ.Cmd.Cmd_Puppet_Recruit_CS;
   import PVZ.Cmd.Cmd_Puppet_RecycleSparDraw_CS;
   import PVZ.Cmd.Cmd_Puppet_SetFormation_CS;
   import PVZ.Cmd.Cmd_Puppet_Swap_CS;
   import PVZ.Cmd.Cmd_Puppet_UpgradeLevel_CS;
   import PVZ.Cmd.Cmd_Puppet_UpgradeQuality_CS;
   import PVZ.Cmd.Cmd_Puppet_UpgradeSkillLevel_CS;
   import PVZ.Cmd.Cmd_Puppet_UpgradeSkillQuality_CS;
   import PVZ.Cmd.Cmd_Puppet_UpgradeSparLevel_CS;
   import PVZ.Cmd.Cmd_Puppet_UpgradeSparQuality_CS;
   import PVZ.Cmd.Cmd_Puppet_UpgradeStar_CS;
   import PVZ.Cmd.Dto_PuppetFormation;
   import PVZ.Cmd.Dto_PuppetInfo;
   import com.qq.modules.dummy.DummyGlobel;
   import com.qq.modules.dummy.model.DummyProxy;
   import com.qq.modules.dummy.model.DummyZombieInfo;
   import com.qq.modules.main.server.PvzSocketService;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   
   public class DummyProxyCommand extends StrongRobotlegCommand
   {
       
      
      [Inject]
      public var pvzService:PvzSocketService;
      
      [Inject]
      public var proxy:DummyProxy;
      
      public function DummyProxyCommand()
      {
         super();
      }
      
      public function requestDummyZombieListInfo(param1:Array = null) : void
      {
         var _loc2_:Cmd_Puppet_GetInfo_CS = new Cmd_Puppet_GetInfo_CS();
         if(param1 != null)
         {
            _loc2_.baseId = param1;
         }
         this.pvzService.sendMessage(_loc2_);
      }
      
      public function getLineup() : void
      {
         var _loc1_:Cmd_Puppet_GetFormation_CS = new Cmd_Puppet_GetFormation_CS();
         this.pvzService.sendMessage(_loc1_);
      }
      
      public function setLineup(param1:Array) : void
      {
         var _loc7_:int = 0;
         var _loc8_:Array = null;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:DummyZombieInfo = null;
         var _loc15_:Dto_PuppetInfo = null;
         if(param1 == null)
         {
            return;
         }
         var _loc2_:int = param1.length;
         var _loc3_:Array = this.proxy.model.getLineupList();
         var _loc4_:int = _loc3_.length;
         if(_loc3_ != null)
         {
            _loc7_ = 0;
            while(_loc7_ < _loc2_)
            {
               _loc9_ = (_loc8_ = param1[_loc7_])[0];
               _loc10_ = _loc8_[1];
               _loc11_ = 0;
               while(_loc11_ < _loc4_)
               {
                  if(_loc11_ == _loc9_)
                  {
                     if(_loc10_ == 0)
                     {
                        _loc3_[_loc11_] = DummyGlobel.conver2Dto_PuppetInfo(null);
                     }
                     else
                     {
                        _loc12_ = _loc3_.length;
                        _loc13_ = 0;
                        while(_loc13_ < _loc12_)
                        {
                           if((_loc15_ = _loc3_[_loc13_]) != null)
                           {
                              if(_loc15_.baseId == _loc10_)
                              {
                                 _loc3_[_loc13_] = DummyGlobel.conver2Dto_PuppetInfo(null);
                              }
                           }
                           _loc13_++;
                        }
                        _loc14_ = this.proxy.model.getDummyDataByID(_loc10_);
                        _loc3_[_loc11_] = DummyGlobel.conver2Dto_PuppetInfo(_loc14_);
                     }
                     break;
                  }
                  _loc11_++;
               }
               _loc7_++;
            }
         }
         var _loc5_:Cmd_Puppet_SetFormation_CS = new Cmd_Puppet_SetFormation_CS();
         var _loc6_:Dto_PuppetFormation;
         (_loc6_ = new Dto_PuppetFormation()).puppetInfo = _loc3_;
         _loc5_.formation = _loc6_;
         this.pvzService.sendMessage(_loc5_);
      }
      
      public function compostiteCard(param1:int) : void
      {
         var _loc2_:Cmd_Puppet_Recruit_CS = new Cmd_Puppet_Recruit_CS();
         _loc2_.baseId = param1;
         this.pvzService.sendMessage(_loc2_);
      }
      
      public function requestBuildEquipment(param1:int, param2:int) : void
      {
         var _loc3_:Cmd_Puppet_UpgradeSparQuality_CS = new Cmd_Puppet_UpgradeSparQuality_CS();
         _loc3_.baseId = param1;
         _loc3_.sparType = param2;
         this.pvzService.sendMessage(_loc3_);
      }
      
      public function requestLevelupEquipment(param1:int, param2:int, param3:int) : void
      {
         var _loc4_:Cmd_Puppet_UpgradeSparLevel_CS;
         (_loc4_ = new Cmd_Puppet_UpgradeSparLevel_CS()).baseId = param1;
         _loc4_.sparType = param2;
         _loc4_.maxUpgradeCount = param3;
         this.pvzService.sendMessage(_loc4_);
      }
      
      public function requestPromotEquipment(param1:int, param2:int) : void
      {
         var _loc3_:Cmd_Puppet_UpgradeSparQuality_CS = new Cmd_Puppet_UpgradeSparQuality_CS();
         _loc3_.baseId = param1;
         _loc3_.sparType = param2;
         this.pvzService.sendMessage(_loc3_);
      }
      
      public function requestStarUpZombie(param1:int) : void
      {
         var _loc2_:Cmd_Puppet_UpgradeStar_CS = new Cmd_Puppet_UpgradeStar_CS();
         _loc2_.baseId = param1;
         this.pvzService.sendMessage(_loc2_);
      }
      
      public function requestLevelUpZombie(param1:int, param2:int, param3:int) : void
      {
         var _loc4_:Cmd_Puppet_UpgradeLevel_CS;
         (_loc4_ = new Cmd_Puppet_UpgradeLevel_CS()).baseId = param1;
         _loc4_.itemId = param2;
         _loc4_.num = param3;
         this.pvzService.sendMessage(_loc4_);
      }
      
      public function requestQuiltyUpZombie(param1:int, param2:Boolean) : void
      {
         var _loc3_:Cmd_Puppet_UpgradeQuality_CS = new Cmd_Puppet_UpgradeQuality_CS();
         _loc3_.baseId = param1;
         _loc3_.useItem = param2;
         this.pvzService.sendMessage(_loc3_);
      }
      
      public function requestZombieSkillLevelup(param1:int, param2:Boolean) : void
      {
         var _loc3_:Cmd_Puppet_UpgradeSkillLevel_CS = new Cmd_Puppet_UpgradeSkillLevel_CS();
         _loc3_.baseId = param1;
         _loc3_.passiveSkill = param2;
         this.pvzService.sendMessage(_loc3_);
      }
      
      public function requestZombieSkillActive(param1:int, param2:Boolean) : void
      {
         var _loc3_:Cmd_Puppet_UpgradeSkillQuality_CS = new Cmd_Puppet_UpgradeSkillQuality_CS();
         _loc3_.baseId = param1;
         _loc3_.passiveSkill = param2;
         this.pvzService.sendMessage(_loc3_);
      }
      
      public function requestChapterInfo() : void
      {
         var _loc1_:Cmd_PuppetFuben_GetChapterInfo_CS = new Cmd_PuppetFuben_GetChapterInfo_CS();
         this.pvzService.sendMessage(_loc1_);
      }
      
      public function requestStageInfo(param1:int, param2:int) : void
      {
         var _loc3_:Cmd_PuppetFuben_GetStageInfo_CS = new Cmd_PuppetFuben_GetStageInfo_CS();
         _loc3_.chapterId = param1;
         _loc3_.modeId = param2;
         this.pvzService.sendMessage(_loc3_);
      }
      
      public function requestFightFuben(param1:int, param2:int, param3:int, param4:int) : void
      {
         var _loc5_:Cmd_PuppetFuben_Fight_CS;
         (_loc5_ = new Cmd_PuppetFuben_Fight_CS()).chapterId = param1;
         _loc5_.modeId = param2;
         _loc5_.stageId = param3;
         _loc5_.subStageId = param4;
         this.pvzService.sendMessage(_loc5_);
      }
      
      public function requestSweepFuben(param1:int, param2:int, param3:int, param4:int = 1) : void
      {
         var _loc5_:Cmd_PuppetFuben_Sweep_CS;
         (_loc5_ = new Cmd_PuppetFuben_Sweep_CS()).chapterId = param1;
         _loc5_.modeId = param2;
         _loc5_.stageId = param3;
         _loc5_.times = param4;
         this.pvzService.sendMessage(_loc5_);
      }
      
      public function requestZombieCallInfo() : void
      {
         var _loc1_:Cmd_Puppet_GetExtractInfo_CS = new Cmd_Puppet_GetExtractInfo_CS();
         this.pvzService.sendMessage(_loc1_);
      }
      
      public function requestCallDummy(param1:int, param2:int, param3:Boolean) : void
      {
         var _loc4_:Cmd_Puppet_Extract_CS;
         (_loc4_ = new Cmd_Puppet_Extract_CS()).groupId = param1;
         _loc4_.count = param2;
         _loc4_.useItem = param3;
         this.proxy.model.lastDrarCardTimes = param2;
         this.pvzService.sendMessage(_loc4_);
      }
      
      public function requestBuySkillPoint() : void
      {
         var _loc1_:Cmd_Market_BuyPuppetSkillVal_CS = new Cmd_Market_BuyPuppetSkillVal_CS();
         this.pvzService.sendMessage(_loc1_);
      }
      
      public function requstBuyFubenEnergy() : void
      {
         var _loc1_:Cmd_Market_BuyPuppetEnergy_CS = new Cmd_Market_BuyPuppetEnergy_CS();
         this.pvzService.sendMessage(_loc1_);
      }
      
      public function recycleDummyDrawing(param1:int, param2:int) : void
      {
         var _loc3_:Cmd_Puppet_RecycleSparDraw_CS = new Cmd_Puppet_RecycleSparDraw_CS();
         _loc3_.id = param1;
         _loc3_.num = param2;
         this.pvzService.sendMessage(_loc3_);
      }
      
      public function exchangeCard(param1:int, param2:int) : void
      {
         var _loc3_:Cmd_Puppet_Swap_CS = new Cmd_Puppet_Swap_CS();
         _loc3_.srcBaseId = param1;
         _loc3_.dstBaseId = param2;
         this.pvzService.sendMessage(_loc3_);
      }
   }
}
