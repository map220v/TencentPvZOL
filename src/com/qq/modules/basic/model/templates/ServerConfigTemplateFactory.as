package com.qq.modules.basic.model.templates
{
   import PVZ.Cmd.Dto_ServerConfig;
   import com.qq.data.DataCacheManager;
   import com.qq.modules.basic.model.templates.ce.EntryTemplateCE;
   import com.qq.utils.db.ClientDBTableName;
   
   public final class ServerConfigTemplateFactory
   {
      
      private static var _instance:ServerConfigTemplateFactory;
       
      
      private var _equipLvRequired:Array;
      
      private var _sChatSecureStr:Array;
      
      private var cacheServerConfigTemplate:Vector.<ServerConfigTemplate>;
      
      private var entryTemplates:Vector.<EntryTemplateCE>;
      
      private var serverConfig:Array;
      
      private var _expeditionFightSpycostArr:Array;
      
      private var _expeditiontMoveToFrontcostArr:Array;
      
      private var _recycleGeneList:Array;
      
      public function ServerConfigTemplateFactory()
      {
         super();
      }
      
      public static function get instance() : ServerConfigTemplateFactory
      {
         if(_instance == null)
         {
            _instance = new ServerConfigTemplateFactory();
         }
         return _instance;
      }
      
      private function getServerConfigTemplate(param1:String) : ServerConfigTemplate
      {
         var _loc2_:int = 0;
         this.build();
         var _loc3_:int = this.cacheServerConfigTemplate.length;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            if(this.cacheServerConfigTemplate[_loc2_].id == param1)
            {
               return this.cacheServerConfigTemplate[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      public function getEquipLvRequired(param1:int) : int
      {
         var _loc2_:Array = null;
         var _loc3_:Array = null;
         var _loc4_:String = null;
         if(!this._equipLvRequired)
         {
            this._equipLvRequired = [];
            _loc2_ = this.getServerConfigTemplate("sEquipmentUnlock").value.split(";");
            for each(_loc4_ in _loc2_)
            {
               _loc3_ = _loc4_.split(",");
               this._equipLvRequired[int(_loc3_[0])] = int(_loc3_[1]);
            }
         }
         return this._equipLvRequired[param1];
      }
      
      public function get maxForgeLv() : int
      {
         return int(this.getServerConfigTemplate("iCardMaxForgeLevel").value);
      }
      
      public function get iUnlockCardTrain() : int
      {
         return int(this.getServerConfigTemplate("iUnlockCardTrain").value);
      }
      
      public function get iContribValFactor() : int
      {
         return int(this.getServerConfigTemplate("iContribValFactor").value);
      }
      
      public function get iUnlockCardForge() : int
      {
         return int(this.getServerConfigTemplate("iUnlockCardForge").value);
      }
      
      public function get iWorldChatCoolDown() : int
      {
         return int(this.getServerConfigTemplate("iWorldChatCoolDown").value);
      }
      
      public function get iEquipOpenCloneScore() : int
      {
         return int(this.getServerConfigTemplate("iEquipOpenCloneScore").value);
      }
      
      public function get iEquipScoreA() : int
      {
         return int(this.getServerConfigTemplate("iEquipScoreA").value);
      }
      
      public function get iEquipScoreB() : int
      {
         return int(this.getServerConfigTemplate("iEquipScoreB").value);
      }
      
      public function get iEquipScoreC() : int
      {
         return int(this.getServerConfigTemplate("iEquipScoreC").value);
      }
      
      public function get iEquipScoreN() : int
      {
         return int(this.getServerConfigTemplate("iEquipScoreN").value);
      }
      
      public function get iRecoverEnergyInterval() : int
      {
         return int(this.getServerConfigTemplate("iRecoverEnergyInterval").value);
      }
      
      public function get iRecoverEnergyPerInterval() : int
      {
         return int(this.getServerConfigTemplate("iRecoverEnergyPerInterval").value);
      }
      
      public function get iTimerRewardInterval() : int
      {
         return int(this.getServerConfigTemplate("iTimerRewardInterval").value);
      }
      
      public function get iMaxPromotionRewardGold() : int
      {
         return int(this.getServerConfigTemplate("iMaxPromotionRewardGold").value);
      }
      
      public function get iUnlockCardUpgrade() : int
      {
         return int(this.getServerConfigTemplate("iUnlockCardUpgradeStar").value);
      }
      
      public function get sTempleWarStartTime() : String
      {
         return this.getServerConfigTemplate("sTempleWarStartTime").value;
      }
      
      public function get sTempleWarEndTime() : String
      {
         return this.getServerConfigTemplate("sTempleWarEndTime").value;
      }
      
      public function get iUnlockCardRecycle() : int
      {
         return int(this.getServerConfigTemplate("iUnlockCardRecycle").value);
      }
      
      public function get freeRemainCount() : int
      {
         return int(this.getServerConfigTemplate(ServerConfigConst.FREE_REMAIN_COUNT).value);
      }
      
      public function get iCreateGuildNameSize() : int
      {
         return int(int(this.getServerConfigTemplate("iCreateGuildNameSize").value));
      }
      
      public function get iCreateGuildNeedCoin() : int
      {
         return int(this.getServerConfigTemplate("iCreateGuildNeedCoin").value);
      }
      
      public function get iCreateGuildNeedLevel() : int
      {
         return int(this.getServerConfigTemplate("iCreateGuildNeedLevel").value);
      }
      
      public function get iGuildManifestoMaxLen() : int
      {
         return int(int(this.getServerConfigTemplate("iGuildManifestoMaxLen").value));
      }
      
      public function get iMineCollectCDTime() : int
      {
         return int(this.getServerConfigTemplate("iMineCollectCDTime").value);
      }
      
      public function get iGuildNoticeMaxLen() : int
      {
         return int(int(this.getServerConfigTemplate("iGuildNoticeMaxLen").value));
      }
      
      public function get iGuildJoinListMax() : int
      {
         return int(this.getServerConfigTemplate("iGuildJoinListMax").value);
      }
      
      public function get iGuildDonateLevelLimit() : int
      {
         return int(this.getServerConfigTemplate("iGuildDonateLevelLimit").value);
      }
      
      public function get sGuildDonateGoldLimit() : String
      {
         return this.getServerConfigTemplate("sGuildDonateGoldLimit").value;
      }
      
      public function get sTempleWarPreStartTime() : String
      {
         return this.getServerConfigTemplate("sTempleWarPreStartTime").value;
      }
      
      public function get iBalancePkLevel() : int
      {
         var _loc1_:ServerConfigTemplate = this.getServerConfigTemplate("iBalancePkLevel");
         return !!_loc1_ ? int(int(_loc1_.value)) : 1;
      }
      
      public function get sBalancePkAttackAttributes() : String
      {
         var _loc1_:ServerConfigTemplate = this.getServerConfigTemplate("sBalancePkAttackAttributes");
         return !!_loc1_ ? _loc1_.value : null;
      }
      
      public function get sBalancePkDefenseAttributes() : String
      {
         var _loc1_:ServerConfigTemplate = this.getServerConfigTemplate("sBalancePkDefenseAttributes");
         return !!_loc1_ ? _loc1_.value : null;
      }
      
      public function get sBalancePkAuxiliaryAttributes() : String
      {
         var _loc1_:ServerConfigTemplate = this.getServerConfigTemplate("sBalancePkAuxiliaryAttributes");
         return !!_loc1_ ? _loc1_.value : null;
      }
      
      public function get iEnergyBuyTimes() : int
      {
         return int(this.getServerConfigTemplate("iEnergyBuyTimes").value);
      }
      
      public function get templeWarStart() : String
      {
         return this.getServerConfigTemplate(ServerConfigConst.TEMPLE_WAR_START).value;
      }
      
      public function get templeWarEnd() : String
      {
         return this.getServerConfigTemplate(ServerConfigConst.TEMPLE_WAR_END).value;
      }
      
      public function get sIconDownloadLocation() : String
      {
         return String(this.getServerConfigTemplate("sIconDownloadLocation").value);
      }
      
      public function get sStatLogLocation() : String
      {
         return String(this.getServerConfigTemplate("sStatLogLocation").value);
      }
      
      public function get iWorldBossInspireCoin() : uint
      {
         return uint(this.getServerConfigTemplate("iWorldBossInspireCoin").value);
      }
      
      public function get iWorldBossInspireParam() : uint
      {
         return uint(this.getServerConfigTemplate("iWorldBossInspireParam").value);
      }
      
      public function get iDayTreasureSearchTimesMax() : uint
      {
         return uint(this.getServerConfigTemplate("iDayTreasureSearchTimesMax").value);
      }
      
      public function get iDayTreasureSeizeTimesMax() : uint
      {
         return uint(this.getServerConfigTemplate("iDayTreasureSeizeTimesMax").value);
      }
      
      public function get iTreasureSearchWaitTime() : uint
      {
         return uint(this.getServerConfigTemplate("iTreasureSearchWaitTime").value);
      }
      
      public function get sTreasureBeginTime1() : String
      {
         return this.getServerConfigTemplate("sTreasureBeginTime1").value;
      }
      
      public function get sTreasureEndTime1() : String
      {
         return this.getServerConfigTemplate("sTreasureEndTime1").value;
      }
      
      public function get sTreasureBeginTime2() : String
      {
         return this.getServerConfigTemplate("sTreasureBeginTime2").value;
      }
      
      public function get sTreasureEndTime2() : String
      {
         return this.getServerConfigTemplate("sTreasureEndTime2").value;
      }
      
      public function get iTreasureSeizeCDTime() : uint
      {
         return uint(this.getServerConfigTemplate("iTreasureSeizeCDTime").value);
      }
      
      public function get iTreasureGuildLevelLimit() : uint
      {
         return uint(this.getServerConfigTemplate("iTreasureGuildLevelLimit").value);
      }
      
      public function get iTreasureSearchExpireTime() : uint
      {
         return uint(this.getServerConfigTemplate("iTreasureSearchExpireTime").value);
      }
      
      public function get iExpItemPara1() : int
      {
         return int(this.getServerConfigTemplate("iExpItemPara1").value);
      }
      
      public function get iExpItemPara2() : int
      {
         return int(this.getServerConfigTemplate("iExpItemPara2").value);
      }
      
      public function get iEquipRoleLevelParam() : int
      {
         return int(this.getServerConfigTemplate("iEquipRoleLevelParam").value);
      }
      
      public function get iExitNoticeCount() : int
      {
         var _loc1_:ServerConfigTemplate = this.getServerConfigTemplate("iExitNoticeCount");
         if(_loc1_)
         {
            return int(_loc1_.value);
         }
         return 5;
      }
      
      public function get sScrewUpAddNumCost() : String
      {
         return this.getServerConfigTemplate("sScrewUpAddNumCost").value;
      }
      
      public function get dailyActivityLevelLimit() : int
      {
         return int(this.getServerConfigTemplate("iactivelimitgrade").value);
      }
      
      public function get iNoEndTDRankBoardDownCoinCost() : int
      {
         var _loc1_:ServerConfigTemplate = this.getServerConfigTemplate("iNoEndTDRankBoardDownCoinCost");
         return !!_loc1_ ? int(int(_loc1_.value)) : 0;
      }
      
      public function get iNoEndTDRankBoardUpCoinCost() : int
      {
         var _loc1_:ServerConfigTemplate = this.getServerConfigTemplate("iNoEndTDRankBoardUpCoinCost");
         return !!_loc1_ ? int(int(_loc1_.value)) : 0;
      }
      
      public function get sVIP3GiftBagItemList() : String
      {
         var _loc1_:ServerConfigTemplate = this.getServerConfigTemplate("sVIP3GiftBagItemList");
         return !!_loc1_ ? _loc1_.value : "";
      }
      
      public function get mapWarSetoutTimesCost() : String
      {
         var _loc1_:ServerConfigTemplate = this.getServerConfigTemplate("sMapWarSetoutTimesCost");
         return !!_loc1_ ? _loc1_.value : "";
      }
      
      public function get dailyDeclareWarTimes() : int
      {
         var _loc1_:ServerConfigTemplate = this.getServerConfigTemplate("iDailyDeclareWarTimes");
         return !!_loc1_ ? int(int(_loc1_.value)) : 0;
      }
      
      public function get mapWarSetoutTownDurabilityLimit() : int
      {
         var _loc1_:ServerConfigTemplate = this.getServerConfigTemplate("iMapWarSetoutTownDurabilityLimit");
         return !!_loc1_ ? int(int(_loc1_.value)) : 0;
      }
      
      public function get iMysteryCardPrice() : int
      {
         var _loc1_:ServerConfigTemplate = this.getServerConfigTemplate("iMysteryCardPrice");
         return !!_loc1_ ? int(int(_loc1_.value)) : 0;
      }
      
      public function get iMysteryCardLuckValue() : int
      {
         var _loc1_:ServerConfigTemplate = this.getServerConfigTemplate("iMysteryCardLuckValue");
         return !!_loc1_ ? int(int(_loc1_.value)) : 0;
      }
      
      public function get iMysteryCardLuckValueMax() : int
      {
         var _loc1_:ServerConfigTemplate = this.getServerConfigTemplate("iMysteryCardLuckValueMax");
         return !!_loc1_ ? int(int(_loc1_.value)) : 0;
      }
      
      public function get iMysteryCardLuckValueMin() : int
      {
         var _loc1_:ServerConfigTemplate = this.getServerConfigTemplate("iMysteryCardLuckValueMin");
         return !!_loc1_ ? int(int(_loc1_.value)) : 0;
      }
      
      public function get sMysteryCardItem() : String
      {
         var _loc1_:ServerConfigTemplate = this.getServerConfigTemplate("sMysteryCardItem");
         return !!_loc1_ ? _loc1_.value : "";
      }
      
      public function get rankArenaChallengeNumLimit() : int
      {
         var _loc1_:ServerConfigTemplate = this.getServerConfigTemplate("iRankArenaChallengeNumLimit");
         return !!_loc1_ ? int(int(_loc1_.value)) : 5;
      }
      
      public function get rankArenaPayChallengeNumLimit() : int
      {
         var _loc1_:ServerConfigTemplate = this.getServerConfigTemplate("sRankArenaPayChallenge");
         return !!_loc1_ ? int(_loc1_.value.split(",").length) : 5;
      }
      
      public function getRankArenaPayPriceByCount(param1:int) : int
      {
         var _loc3_:Array = null;
         var _loc2_:ServerConfigTemplate = this.getServerConfigTemplate("sRankArenaPayChallenge");
         if(_loc2_)
         {
            _loc3_ = _loc2_.value.split(",");
            return int(_loc3_[_loc3_.length - param1]);
         }
         return 0;
      }
      
      public function get iRankArenaClearCoolDownCost() : int
      {
         var _loc1_:ServerConfigTemplate = this.getServerConfigTemplate("iRankArenaClearCoolDownCost");
         return !!_loc1_ ? int(int(_loc1_.value)) : 0;
      }
      
      public function get sTDInheritNeedItem() : String
      {
         return this.getServerConfigTemplate("sTDInheritNeedItem").value;
      }
      
      public function get iMeleeAllSignInStartTime() : uint
      {
         var _loc1_:ServerConfigTemplate = this.getServerConfigTemplate("iMeleeVipSignInStartTime");
         return !!_loc1_ ? uint(uint(_loc1_.value)) : uint(25200);
      }
      
      public function get iMeleeBattleStartTime() : uint
      {
         var _loc1_:ServerConfigTemplate = this.getServerConfigTemplate("iMeleeBattleStartTime");
         return !!_loc1_ ? uint(uint(_loc1_.value)) : uint(80000);
      }
      
      public function get iMeleeBattleEndTime() : uint
      {
         var _loc1_:ServerConfigTemplate = this.getServerConfigTemplate("iMeleeBattleEndTime");
         return !!_loc1_ ? uint(uint(_loc1_.value)) : uint(90000);
      }
      
      public function get iMeleeScoreRewardRate() : uint
      {
         var _loc1_:ServerConfigTemplate = this.getServerConfigTemplate("iMeleeScoreRewardRate");
         return !!_loc1_ ? uint(uint(_loc1_.value)) : uint(100);
      }
      
      public function get iGuildCohesion() : uint
      {
         var _loc1_:ServerConfigTemplate = this.getServerConfigTemplate("iGuildCohesion");
         return !!_loc1_ ? uint(uint(_loc1_.value)) : uint(50000);
      }
      
      public function get iDayCohesion() : uint
      {
         var _loc1_:ServerConfigTemplate = this.getServerConfigTemplate("iDayCohesion");
         return !!_loc1_ ? uint(uint(_loc1_.value)) : uint(550);
      }
      
      public function get sGuildFubenDayRewardItem() : String
      {
         var _loc1_:ServerConfigTemplate = this.getServerConfigTemplate("sGuildFubenDayRewardItem");
         return !!_loc1_ ? String(_loc1_.value) : "";
      }
      
      public function get iHelpCardPrice() : uint
      {
         var _loc1_:ServerConfigTemplate = this.getServerConfigTemplate("iHelpCardPrice");
         return !!_loc1_ ? uint(uint(_loc1_.value)) : uint(10);
      }
      
      public function get sCardAttributeSwapCost() : int
      {
         var _loc1_:ServerConfigTemplate = this.getServerConfigTemplate("sCardAttributeSwapCost");
         return !!_loc1_ ? int(uint(_loc1_.value.split(":")[1])) : 0;
      }
      
      public function get iBatchOpenChestGiftLimit() : uint
      {
         var _loc1_:ServerConfigTemplate = this.getServerConfigTemplate("iBatchOpenChestGiftLimit");
         return !!_loc1_ ? uint(uint(_loc1_.value)) : uint(2);
      }
      
      public function get iAdventureDayFreeRefreshTime() : uint
      {
         var _loc1_:ServerConfigTemplate = this.getServerConfigTemplate("iAdventureDayFreeRefreshTime");
         return !!_loc1_ ? uint(uint(_loc1_.value)) : uint(10);
      }
      
      public function get iArenaChallengeCDUnitFee() : uint
      {
         var _loc1_:ServerConfigTemplate = this.getServerConfigTemplate("iArenaChallengeCDUnitFee");
         return !!_loc1_ ? uint(uint(_loc1_.value)) : uint(10);
      }
      
      public function get iGoldExchangeBaseCount() : uint
      {
         var _loc1_:ServerConfigTemplate = this.getServerConfigTemplate("iGoldExchangeBaseCount");
         return !!_loc1_ ? uint(uint(_loc1_.value)) : uint(60);
      }
      
      public function get iPlantTestDailyChallengeTimes() : int
      {
         var _loc1_:ServerConfigTemplate = this.getServerConfigTemplate("iPlantTestDailyChallengeTimes");
         return !!_loc1_ ? int(int(_loc1_.value)) : 0;
      }
      
      public function get iChallengeCost() : uint
      {
         var _loc1_:ServerConfigTemplate = this.getServerConfigTemplate("iChallengeCost");
         return !!_loc1_ ? uint(uint(_loc1_.value)) : uint(50);
      }
      
      public function get iPlantTestUnResetNum() : int
      {
         var _loc1_:ServerConfigTemplate = this.getServerConfigTemplate("iPlantTestUnResetNum");
         return !!_loc1_ ? int(int(_loc1_.value)) : 0;
      }
      
      public function get iDailyRefineTimes() : int
      {
         var _loc1_:ServerConfigTemplate = this.getServerConfigTemplate("iDailyRefineTimes");
         return !!_loc1_ ? int(int(_loc1_.value)) : 0;
      }
      
      public function get sChatSecureStr() : Array
      {
         if(!this._sChatSecureStr)
         {
            this._sChatSecureStr = this.getServerConfigTemplate(ServerConfigConst.CHAT_SECURITY_CHAR).value.split(",");
         }
         return this._sChatSecureStr;
      }
      
      public function get dailyTDDrawCost() : int
      {
         return int(this.getServerConfigTemplate(ServerConfigConst.DAILYTD_DRAW_COST).value);
      }
      
      public function get tdVipPlantID() : int
      {
         return int(this.getServerConfigTemplate(ServerConfigConst.TD_VIP_PLANT_ID).value);
      }
      
      public function get vipLabTechDesc() : String
      {
         return this.getServerConfigTemplate(ServerConfigConst.iVIPLabTechDesc).value;
      }
      
      public function get iDailyVowTotalTimesLimit() : int
      {
         var _loc1_:ServerConfigTemplate = this.getServerConfigTemplate("iDailyVowTotalTimesLimit");
         return !!_loc1_ ? int(int(_loc1_.value)) : 0;
      }
      
      public function get iDailyBigVowDiscount() : int
      {
         var _loc1_:ServerConfigTemplate = this.getServerConfigTemplate("iDailyBigVowDiscount");
         return !!_loc1_ ? int(int(_loc1_.value)) : 0;
      }
      
      public function getEntryTemplateAvatar() : EntryTemplateCE
      {
         return this.getEntryTemplate(1);
      }
      
      public function getEntryTemplateNutrition() : EntryTemplateCE
      {
         return this.getEntryTemplate(18);
      }
      
      public function getEntryTemplateArena() : EntryTemplateCE
      {
         return this.getEntryTemplate(2);
      }
      
      public function getEntryTemplateRankArena() : EntryTemplateCE
      {
         return this.getEntryTemplate(5);
      }
      
      public function getEntryTemplateRankMapinfoHistory() : EntryTemplateCE
      {
         return this.getEntryTemplate(3);
      }
      
      public function getEntryTemplateMapTemple() : EntryTemplateCE
      {
         return this.getEntryTemplate(4);
      }
      
      public function getEntryTemplateCoinExchange() : EntryTemplateCE
      {
         return this.getEntryTemplate(12);
      }
      
      public function getEntryTemplateEquipment() : EntryTemplateCE
      {
         return this.getEntryTemplate(17);
      }
      
      public function getEntryTemplateBaptize() : EntryTemplateCE
      {
         return this.getEntryTemplate(24);
      }
      
      public function getEntryTemplateUnionFuben() : EntryTemplateCE
      {
         return this.getEntryTemplate(7);
      }
      
      public function getEntryTemplateEveryDayBuy() : EntryTemplateCE
      {
         return this.getEntryTemplate(13);
      }
      
      public function getEntryTemplateAwake() : EntryTemplateCE
      {
         return this.getEntryTemplate(21);
      }
      
      public function getEntryTemplateCardFruit() : EntryTemplateCE
      {
         return this.getEntryTemplate(26);
      }
      
      public function getEntryTemplateCardDNA() : EntryTemplateCE
      {
         return this.getEntryTemplate(28);
      }
      
      public function getEntryTemplatePlantArmor() : EntryTemplateCE
      {
         return this.getEntryTemplate(32);
      }
      
      public function getEntryTemplateNewZombieIsland() : EntryTemplateCE
      {
         return this.getEntryTemplate(29);
      }
      
      public function getEntryTemplateTest() : EntryTemplateCE
      {
         return this.getEntryTemplate(20);
      }
      
      public function getEntryDummy() : EntryTemplateCE
      {
         return this.getEntryTemplate(30);
      }
      
      public function getEntryTemplateTemple() : EntryTemplateCE
      {
         return this.getEntryTemplate(4);
      }
      
      public function getEntryTemplateFuzion() : EntryTemplateCE
      {
         return this.getEntryTemplate(8);
      }
      
      public function getEntryTemplateBalance() : EntryTemplateCE
      {
         return this.getEntryTemplate(23);
      }
      
      public function getEntryTemplateHole() : EntryTemplateCE
      {
         return this.getEntryTemplate(25);
      }
      
      public function getEntryTemplateExpedition() : EntryTemplateCE
      {
         return this.getEntryTemplate(31);
      }
      
      public function getEntryTemplateEndlessFuben() : EntryTemplateCE
      {
         return this.getEntryTemplate(130);
      }
      
      public function getEntryTemplateSuperArena() : EntryTemplateCE
      {
         return this.getEntryTemplate(131);
      }
      
      public function getEntryTemplate(param1:int) : EntryTemplateCE
      {
         var _loc2_:int = 0;
         this.build();
         var _loc3_:int = this.entryTemplates.length;
         while(_loc2_ < _loc3_)
         {
            if(this.entryTemplates[_loc2_].id == param1)
            {
               return this.entryTemplates[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      public function getYetiChallengePrice() : int
      {
         return int(this.getServerConfigTemplate("iSnowManChallengeCost").value);
      }
      
      public function getJoinSameGuildCD() : int
      {
         return int(this.getServerConfigTemplate("iJoinSameGuildCD").value);
      }
      
      public function getAdventureTotalTimes() : int
      {
         return int(this.getServerConfigTemplate("iAdventureDayTakeTime").value);
      }
      
      public function getTDSkillPlantUseTimes() : int
      {
         var _loc1_:ServerConfigTemplate = this.getServerConfigTemplate("iBuySkillTimesLimit");
         return !!_loc1_ ? int(int(_loc1_.value)) : 6;
      }
      
      public function getTDToyCarBuyCost() : int
      {
         var _loc1_:ServerConfigTemplate = this.getServerConfigTemplate("iBuyCartCostTicket");
         return !!_loc1_ ? int(int(_loc1_.value)) : 30;
      }
      
      public function getTDToyCarBuyTimes() : int
      {
         var _loc1_:ServerConfigTemplate = this.getServerConfigTemplate("iBuyCartTimesLimit");
         return !!_loc1_ ? int(int(_loc1_.value)) : 1;
      }
      
      public function getTDBuySunAmount() : int
      {
         var _loc1_:ServerConfigTemplate = this.getServerConfigTemplate("iBuySunAmount");
         return !!_loc1_ ? int(int(_loc1_.value)) : 50;
      }
      
      public function getOnekeyJoinPower() : int
      {
         return int(this.getServerConfigTemplate("iQuickJoinGuildPowerMin").value);
      }
      
      public function get iMarchTimeThreshold() : int
      {
         return int(this.getServerConfigTemplate("iMarchTimeThreshold").value);
      }
      
      public function get iGeneTestDailyChallengeTimes() : int
      {
         return int(this.getServerConfigTemplate("iGeneTestDailyChallengeTimes").value);
      }
      
      public function get iGuardMaxRenewLight() : int
      {
         return int(this.getServerConfigTemplate("iGuardMaxRenewLight").value);
      }
      
      public function get iGuardRenewLight() : int
      {
         return int(this.getServerConfigTemplate("iGuardRenewLight").value);
      }
      
      public function get iGuardRobCostLight() : int
      {
         return int(this.getServerConfigTemplate("iGuardRobCostLight").value);
      }
      
      public function get iGuardRobDuration() : int
      {
         return int(this.getServerConfigTemplate("iGuardRobDuration").value);
      }
      
      public function get iGuardLimitDuration() : int
      {
         return int(this.getServerConfigTemplate("iGuardLimitDuration").value);
      }
      
      public function get iGuardRefreshFactor() : int
      {
         return int(this.getServerConfigTemplate("iGuardRefreshFactor").value);
      }
      
      public function get iGuardRefreshMaxCost() : int
      {
         return int(this.getServerConfigTemplate("iGuardRefreshMaxCost").value);
      }
      
      public function get iGuardRefreshDuration() : int
      {
         return int(this.getServerConfigTemplate("iGuardRefreshDuration").value);
      }
      
      public function get iGuardWarningFactor() : int
      {
         return int(this.getServerConfigTemplate("iGuardWarningFactor").value);
      }
      
      public function get iDailyBuyLightTimes() : int
      {
         return int(this.getServerConfigTemplate("iDailyBuyLightTimes").value);
      }
      
      private function build() : void
      {
         var _loc1_:int = 0;
         var _loc2_:Dto_ServerConfig = null;
         if(this.cacheServerConfigTemplate == null)
         {
            this.cacheServerConfigTemplate = new Vector.<ServerConfigTemplate>(this.serverConfig.length,true);
            _loc1_ = 0;
            while(_loc1_ < this.serverConfig.length)
            {
               _loc2_ = this.serverConfig[_loc1_];
               this.cacheServerConfigTemplate[_loc1_] = new ServerConfigTemplate();
               this.cacheServerConfigTemplate[_loc1_].load({
                  "id":_loc2_.id,
                  "value":_loc2_.value
               });
               _loc1_++;
            }
         }
         if(!this.entryTemplates)
         {
            this.entryTemplates = Vector.<EntryTemplateCE>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.EntryTemplateCE,EntryTemplateCE));
         }
      }
      
      public function loadCmd_Init_SC(param1:Array) : void
      {
         this.serverConfig = param1;
      }
      
      public function conver_daily_act_exp(param1:int) : int
      {
         return int(this.getServerConfigTemplate("iExpItemPara2").value) + int(this.getServerConfigTemplate("iExpItemPara1").value) * param1;
      }
      
      public function getIEquipNumLmt() : int
      {
         return int(this.getServerConfigTemplate("iEquipNumLmt").value);
      }
      
      public function get unionDonate2Exp() : int
      {
         return int(this.getServerConfigTemplate("iGuildExpFactor").value);
      }
      
      public function get iTopFightCoolDownDays() : int
      {
         return int(this.getServerConfigTemplate("iTopFightCoolDown").value);
      }
      
      public function get betCoinReqireLv() : int
      {
         return int(this.getServerConfigTemplate("iTopFightCoinBetLevel").value);
      }
      
      public function get betBlueDiamondReqireLv() : int
      {
         return int(this.getServerConfigTemplate("iTopFightTicketBetLevel").value);
      }
      
      public function get betBlueDiamondMax() : int
      {
         return int(this.getServerConfigTemplate("iTopFightTicketBetLimit").value);
      }
      
      public function get betMaxTimes() : int
      {
         return int(this.getServerConfigTemplate("iTopFightBetCountPerStage").value);
      }
      
      public function get iTreasureOnlySameGuildLevelLimit() : int
      {
         if(this.getServerConfigTemplate("iTreasureOnlySameGuildLevelLimit") != null)
         {
            return int(this.getServerConfigTemplate("iTreasureOnlySameGuildLevelLimit").value);
         }
         return 0;
      }
      
      public function get iGuildLearderDelateLoginDay() : int
      {
         if(this.getServerConfigTemplate("iGuildLearderDelateLoginDay") != null)
         {
            return int(this.getServerConfigTemplate("iGuildLearderDelateLoginDay").value);
         }
         return 5;
      }
      
      public function get iItemMaxBagSize() : int
      {
         if(this.getServerConfigTemplate("iItemMaxBagSize") != null)
         {
            return int(this.getServerConfigTemplate("iItemMaxBagSize").value);
         }
         return 800;
      }
      
      public function get iItemReserveBagSize() : int
      {
         if(this.getServerConfigTemplate("iItemReserveBagSize") != null)
         {
            return int(this.getServerConfigTemplate("iItemReserveBagSize").value);
         }
         return 10;
      }
      
      public function get iBlackListMaxNum() : int
      {
         if(this.getServerConfigTemplate("iBlackListMaxNum") != null)
         {
            return int(this.getServerConfigTemplate("iBlackListMaxNum").value);
         }
         return 10;
      }
      
      public function get iPuppetEnergyBuyTimes() : int
      {
         if(this.getServerConfigTemplate("iPuppetEnergyBuyTimes") != null)
         {
            return int(this.getServerConfigTemplate("iPuppetEnergyBuyTimes").value);
         }
         return 20;
      }
      
      public function get iMaxPuppetEnergy() : int
      {
         if(this.getServerConfigTemplate("iMaxPuppetEnergy") != null)
         {
            return int(this.getServerConfigTemplate("iMaxPuppetEnergy").value);
         }
         return 120;
      }
      
      public function get iMaxPuppetSkillVal() : int
      {
         if(this.getServerConfigTemplate("iMaxPuppetSkillVal") != null)
         {
            return int(this.getServerConfigTemplate("iMaxPuppetSkillVal").value);
         }
         return 60;
      }
      
      public function get iPuppetSkillValBuyTimes() : int
      {
         if(this.getServerConfigTemplate("iPuppetSkillValBuyTimes") != null)
         {
            return int(this.getServerConfigTemplate("iPuppetSkillValBuyTimes").value);
         }
         return 10;
      }
      
      public function get iRecoverPuppetSkillValPerInterval() : int
      {
         if(this.getServerConfigTemplate("iRecoverPuppetSkillValPerInterval") != null)
         {
            return int(this.getServerConfigTemplate("iRecoverPuppetSkillValPerInterval").value);
         }
         return 1;
      }
      
      public function get iRecoverPuppetSkillValInterval() : int
      {
         if(this.getServerConfigTemplate("iRecoverPuppetSkillValInterval") != null)
         {
            return int(this.getServerConfigTemplate("iRecoverPuppetSkillValInterval").value);
         }
         return 300;
      }
      
      public function get iRecoverPuppetEnergyPerInterval() : int
      {
         if(this.getServerConfigTemplate("iRecoverPuppetEnergyPerInterval") != null)
         {
            return int(this.getServerConfigTemplate("iRecoverPuppetEnergyPerInterval").value);
         }
         return 1;
      }
      
      public function get iRecoverPuppetEnergyInterval() : int
      {
         if(this.getServerConfigTemplate("iRecoverPuppetEnergyInterval") != null)
         {
            return int(this.getServerConfigTemplate("iRecoverPuppetEnergyInterval").value);
         }
         return 300;
      }
      
      public function getRecycleAvatarCost() : Array
      {
         var _loc2_:Array = null;
         var _loc1_:String = String(this.getServerConfigTemplate("sRecycleAvatarCost").value);
         var _loc3_:Array = _loc1_.split(";");
         if(_loc3_.length > 0)
         {
            _loc2_ = _loc3_[0].split(":");
         }
         return _loc2_;
      }
      
      public function get iSignatureMaxLen() : int
      {
         if(this.getServerConfigTemplate("iSignatureMaxLen") != null)
         {
            return int(this.getServerConfigTemplate("iSignatureMaxLen").value);
         }
         return 30;
      }
      
      public function get iNewScrewUpRoleLevelLimit() : int
      {
         if(this.getServerConfigTemplate("iNewScrewUpRoleLevelLimit") != null)
         {
            return int(this.getServerConfigTemplate("iNewScrewUpRoleLevelLimit").value);
         }
         return 55;
      }
      
      public function get iExpeditionFightOpenWeek() : int
      {
         if(this.getServerConfigTemplate("iExpeditionFightOpenWeek") != null)
         {
            return int(this.getServerConfigTemplate("iExpeditionFightOpenWeek").value);
         }
         return 3;
      }
      
      public function get iExpeditionFightSideMaxLeaderNum() : int
      {
         if(this.getServerConfigTemplate("iExpeditionFightSideMaxLeaderNum") != null)
         {
            return int(this.getServerConfigTemplate("iExpeditionFightSideMaxLeaderNum").value);
         }
         return 5;
      }
      
      public function get iExpeditionFightSeeDetailScore() : int
      {
         if(this.getServerConfigTemplate("iExpeditionFightSeeDetailScore") != null)
         {
            return int(this.getServerConfigTemplate("iExpeditionFightSeeDetailScore").value);
         }
         return 300;
      }
      
      public function get iExpeditionFightSideMaxRoleNum() : int
      {
         if(this.getServerConfigTemplate("iExpeditionFightSideMaxRoleNum") != null)
         {
            return int(this.getServerConfigTemplate("iExpeditionFightSideMaxRoleNum").value);
         }
         return 200;
      }
      
      public function get sExpeditionFightSpyCost() : Array
      {
         var _loc1_:String = null;
         if(this._expeditionFightSpycostArr != null)
         {
            return this._expeditionFightSpycostArr;
         }
         if(this.getServerConfigTemplate("sExpeditionFightSpyCost") != null)
         {
            _loc1_ = this.getServerConfigTemplate("sExpeditionFightSpyCost").value;
            this._expeditionFightSpycostArr = _loc1_.split(":");
            return this._expeditionFightSpycostArr;
         }
         return [4,50];
      }
      
      public function get sExpeditionFightMoveToFrontCost() : Array
      {
         var _loc1_:String = null;
         if(this.getServerConfigTemplate("sExpeditionFightMoveToFrontCost") != null)
         {
            _loc1_ = this.getServerConfigTemplate("sExpeditionFightMoveToFrontCost").value;
            this._expeditiontMoveToFrontcostArr = _loc1_.split(":");
            return this._expeditiontMoveToFrontcostArr;
         }
         return [4,50];
      }
      
      public function get iExpeditionFightStageFightEndTime() : int
      {
         if(this.getServerConfigTemplate("iExpeditionFightStageFightEndTime") != null)
         {
            return int(this.getServerConfigTemplate("iExpeditionFightStageFightEndTime").value);
         }
         return 388800;
      }
      
      public function get iExpeditionFightBeginTime() : int
      {
         if(this.getServerConfigTemplate("iExpeditionFightBeginTime") != null)
         {
            return int(this.getServerConfigTemplate("iExpeditionFightBeginTime").value);
         }
         return 68400;
      }
      
      public function get iExpeditionFightEndTime() : int
      {
         if(this.getServerConfigTemplate("iExpeditionFightEndTime") != null)
         {
            return int(this.getServerConfigTemplate("iExpeditionFightEndTime").value);
         }
         return 72000;
      }
      
      public function get iExpeditionFightStageSignUpEndTime() : int
      {
         if(this.getServerConfigTemplate("iExpeditionFightStageSignUpEndTime") != null)
         {
            return int(this.getServerConfigTemplate("iExpeditionFightStageSignUpEndTime").value);
         }
         return 216000;
      }
      
      public function get iExpeditionFightHealthRecoverValue() : int
      {
         if(this.getServerConfigTemplate("iExpeditionFightHealthRecoverValue") != null)
         {
            return int(this.getServerConfigTemplate("iExpeditionFightHealthRecoverValue").value);
         }
         return 2;
      }
      
      public function get iExpeditionFightHpRecoverPercent() : int
      {
         if(this.getServerConfigTemplate("iExpeditionFightHpRecoverPercent") != null)
         {
            return int(int(this.getServerConfigTemplate("iExpeditionFightHpRecoverPercent").value) * 0.01);
         }
         return 2;
      }
      
      public function get iEliteFightLuckyTimes() : int
      {
         if(this.getServerConfigTemplate("iEliteFightLuckyTimes") != null)
         {
            return int(this.getServerConfigTemplate("iEliteFightLuckyTimes").value);
         }
         return 300;
      }
      
      public function get iExpeditionFightRobScoreRate() : String
      {
         if(this.getServerConfigTemplate("iExpeditionFightRobScoreRate") != null)
         {
            return (int(this.getServerConfigTemplate("iExpeditionFightRobScoreRate").value) * 0.01).toFixed(1);
         }
         return "3.5";
      }
      
      public function get iExpeditionFightCleanCDCoolDown() : int
      {
         if(this.getServerConfigTemplate("iExpeditionFightCleanCDCoolDown") != null)
         {
            return int(this.getServerConfigTemplate("iExpeditionFightCleanCDCoolDown").value);
         }
         return 5;
      }
      
      public function getsRecycleGeneFactorPercentByType(param1:int) : Number
      {
         var _loc3_:ServerConfigTemplate = null;
         var _loc4_:String = null;
         var _loc2_:Number = 0;
         if(this._recycleGeneList == null)
         {
            _loc3_ = this.getServerConfigTemplate("sRecycleGeneFactorPercent");
            if(_loc3_ != null)
            {
               if((_loc4_ = this.getServerConfigTemplate("sRecycleGeneFactorPercent").value) != null)
               {
                  this._recycleGeneList = _loc4_.split(",");
               }
            }
         }
         param1--;
         if(param1 < 0 || this._recycleGeneList == null)
         {
            return 0;
         }
         if(param1 < this._recycleGeneList.length)
         {
            _loc2_ = this._recycleGeneList[param1];
            _loc2_ = Number((_loc2_ * 0.0001).toFixed(2));
         }
         return _loc2_;
      }
      
      public function get iExpeditionFightRobRoleCount() : Number
      {
         if(this.getServerConfigTemplate("iExpeditionFightRobRoleCount") != null)
         {
            return int(this.getServerConfigTemplate("iExpeditionFightRobRoleCount").value);
         }
         return 20;
      }
      
      public function get iArmorGemCardLevel() : int
      {
         if(this.getServerConfigTemplate("iArmorGemCardLevel") != null)
         {
            return int(this.getServerConfigTemplate("iArmorGemCardLevel").value);
         }
         return 50;
      }
      
      public function get iGuildFubenNewDayRewardFactor() : int
      {
         if(this.getServerConfigTemplate("iGuildFubenNewDayRewardFactor") != null)
         {
            return int(this.getServerConfigTemplate("iGuildFubenNewDayRewardFactor").value);
         }
         return 10;
      }
      
      public function get iNoEndFubenLoseTimes() : int
      {
         if(this.getServerConfigTemplate("iNoEndFubenLoseTimes") != null)
         {
            return int(this.getServerConfigTemplate("iNoEndFubenLoseTimes").value);
         }
         return 30;
      }
      
      public function get sNoEndFubenOpenWeek() : Array
      {
         var _loc1_:Array = null;
         var _loc2_:String = null;
         if(this.getServerConfigTemplate("sNoEndFubenOpenWeek") != null)
         {
            _loc2_ = this.getServerConfigTemplate("sNoEndFubenOpenWeek").value;
            _loc1_ = _loc2_.split(",");
         }
         else
         {
            _loc1_ = [1,4];
         }
         return _loc1_;
      }
      
      public function get iNoEndFubenEndTime() : int
      {
         if(this.getServerConfigTemplate("iNoEndFubenEndTime") != null)
         {
            return int(this.getServerConfigTemplate("iNoEndFubenEndTime").value);
         }
         return 172800;
      }
      
      public function get iNoEndFubenResetTimes() : int
      {
         if(this.getServerConfigTemplate("iNoEndFubenResetTimes") != null)
         {
            return int(this.getServerConfigTemplate("iNoEndFubenResetTimes").value);
         }
         return 2;
      }
      
      public function get iNoEndFubenResetGoldTicket() : int
      {
         if(this.getServerConfigTemplate("iNoEndFubenResetGoldTicket") != null)
         {
            return int(this.getServerConfigTemplate("iNoEndFubenResetGoldTicket").value);
         }
         return 10;
      }
      
      public function get iAllServerRankArenaChallengeTopLimit() : int
      {
         if(this.getServerConfigTemplate("iAllServerRankArenaChallengeTopLimit") != null)
         {
            return int(this.getServerConfigTemplate("iAllServerRankArenaChallengeTopLimit").value);
         }
         return 20;
      }
      
      public function get iAllServerRankArenaRankRewardTime() : int
      {
         if(this.getServerConfigTemplate("iAllServerRankArenaRankRewardTime") != null)
         {
            return int(this.getServerConfigTemplate("iAllServerRankArenaRankRewardTime").value);
         }
         return 0;
      }
      
      public function get iAllServerRankArenaRankFreeChallengeTimes() : int
      {
         if(this.getServerConfigTemplate("iAllServerRankArenaRankFreeChallengeTimes") != null)
         {
            return int(this.getServerConfigTemplate("iAllServerRankArenaRankFreeChallengeTimes").value);
         }
         return 5;
      }
      
      public function get sAllServerRankArenaRankPayChallengeFee() : String
      {
         if(this.getServerConfigTemplate("sAllServerRankArenaRankPayChallengeFee") != null)
         {
            return this.getServerConfigTemplate("sAllServerRankArenaRankPayChallengeFee").value;
         }
         return "";
      }
      
      public function get iNoEndFubenFightHistoryStageCount() : int
      {
         if(this.getServerConfigTemplate("iNoEndFubenFightHistoryStageCount") != null)
         {
            return int(this.getServerConfigTemplate("iNoEndFubenFightHistoryStageCount").value);
         }
         return 20;
      }
   }
}
