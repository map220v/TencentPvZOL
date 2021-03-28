package com.qq.utils.db
{
import flash.debugger.enterDebugger;
import flash.utils.ByteArray;
import flash.utils.Dictionary;

import org.as3commons.logging.api.getLogger;

public class ClientDB
   {
      
      private static var _instance:ClientDB;
       
      
      private var _database:Dictionary;
      
      public function ClientDB()
      {
         super();
         this._database = new Dictionary();
      }
      
      public static function getInstance() : ClientDB
      {
         if(null == _instance)
         {
            _instance = new ClientDB();
         }
         return _instance;
      }
      
      public function load(param1:ByteArray) : void
      {
         var _loc3_:int = 0;
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc6_:String = null;
         var _loc2_:Dictionary = new Dictionary();
         _loc2_["tdZombieInfo.txt"] = ClientDBTableName.Table_ZombieInfo;
         _loc2_["tdPlantTypeInfo.txt"] = ClientDBTableName.Table_PlantTypeInfo;
         _loc2_["tdPlantInfo.txt"] = ClientDBTableName.Table_PlantInfo;
         _loc2_["tdAvatarInfo.txt"] = ClientDBTableName.Table_TDAvaterInfo;
         _loc2_["tdBulletInfo.txt"] = ClientDBTableName.Table_BulletInfo;
         _loc2_["tdObjectInfo.txt"] = ClientDBTableName.Table_ObjectInfo;
         _loc2_["soundInfo.txt"] = ClientDBTableName.Table_SoundInfo;
         _loc2_["soundSceneInfo.txt"] = ClientDBTableName.Table_TDSoundSceneInfo;
         _loc2_["buffInfo.txt"] = ClientDBTableName.Table_TDBuffInfo;
         _loc2_["levelselectInfo.txt"] = ClientDBTableName.Table_TDLevelSelectInfo;
         _loc2_["levelselectGateInfo.txt"] = ClientDBTableName.Table_TDLevelGateInfo;
         _loc2_["achievementInfo.txt"] = ClientDBTableName.Table_AchievementInfo;
         _loc2_["buildingInfo.txt"] = ClientDBTableName.Table_BuildingInfo;
         _loc2_["plantTalentInfo.txt"] = ClientDBTableName.Table_PlantTalentInfo;
         _loc2_["plantTalentTip.txt"] = ClientDBTableName.Table_PlantTalentTip;
         _loc2_["levelInfo.txt"] = ClientDBTableName.Table_RoleLevelInfo;
         _loc2_["cardLevel.txt"] = ClientDBTableName.BattleLineupCardLevelTemplate;
         _loc2_["battleCard.txt"] = ClientDBTableName.BattleLineupCardTemplate;
         _loc2_["BattleLineupCardSkillTemplate.txt"] = ClientDBTableName.BattleLineupCardSkillTemplate;
         _loc2_["BattleLineupCardFeature.txt"] = ClientDBTableName.BattleLineupCardFeatureTemp;
         _loc2_["FarmItemTemplate.txt"] = ClientDBTableName.FarmItemTemplate;
         _loc2_["FarmPlantTemplate.txt"] = ClientDBTableName.FarmPlantTemplate;
         _loc2_["FarmPlotTemplate.txt"] = ClientDBTableName.FarmPlotTemplate;
         _loc2_["FriendshipInfoTemplate.txt"] = ClientDBTableName.FriendshipInfoTemplate;
         _loc2_["fuben.txt"] = ClientDBTableName.FubenTemplate;
         _loc2_["FubenChapterTemplate.txt"] = ClientDBTableName.FubenChapterTemplate;
         _loc2_["FubenBonusTemplate.txt"] = ClientDBTableName.FubenBonusTemplate;
         _loc2_["FubenEnargysTemplate.txt"] = ClientDBTableName.FubenEnargysTemplate;
         _loc2_["hdfuben.txt"] = ClientDBTableName.HDFubenTemplate;
         _loc2_["FubenChapterForUnion.txt"] = ClientDBTableName.FubenChapterForUnionTemplate;
         _loc2_["FubenChapterForUnionRankReward.txt"] = ClientDBTableName.FubenChapterForUnionRankRewardTemplate;
         _loc2_["ErrorInfo.txt"] = ClientDBTableName.Table_ErrorInfo;
         _loc2_["ItemInfo.txt"] = ClientDBTableName.Table_ItemInfo;
         _loc2_["QuestInfo.txt"] = ClientDBTableName.Table_QuestInfo;
         _loc2_["DailyQuestInfo.txt"] = ClientDBTableName.Table_DailyQuestInfo;
         _loc2_["DailyActInfo.txt"] = ClientDBTableName.Table_DailyActInfo;
         _loc2_["tdGameType.txt"] = ClientDBTableName.Table_TDGameType;
         _loc2_["GuideProcessTemplate.txt"] = ClientDBTableName.GuideProcessTemplate;
         _loc2_["FriendLogTemplate.txt"] = ClientDBTableName.FriendLogTemplate;
         _loc2_["OpenButtonInfoTemplate.txt"] = ClientDBTableName.Table_OpenButtonInfo;
         _loc2_["RecruitCardInfoTemplate.txt"] = ClientDBTableName.Table_RecruitCardInfo;
         _loc2_["cardChestAvatar.txt"] = ClientDBTableName.CardChestAvatarTemp;
         _loc2_["cardChestForgeAvatar.txt"] = ClientDBTableName.CardChestForgeAvatarTemp;
         _loc2_["CardUpgradeTemplate.txt"] = ClientDBTableName.CardUpgradeTemplate;
         _loc2_["CardForgeTemplate.txt"] = ClientDBTableName.CardForgeTemplate;
         _loc2_["CardForgeChance.txt"] = ClientDBTableName.CardForgeChanceTemplate;
         _loc2_["cardPuzzle.txt"] = ClientDBTableName.CardPuzzleTemplate;
         _loc2_["cardPiece.txt"] = ClientDBTableName.CardPieceTemplate;
         _loc2_["puzzlePrice.txt"] = ClientDBTableName.CardPuzzlePriceTemplate;
         _loc2_["ServerConfigTemplate.txt"] = ClientDBTableName.ServerConfigTemplate;
         _loc2_["pieceDrop.txt"] = ClientDBTableName.CardPieceDropTemplate;
         _loc2_["BattleCardMarketSetting.txt"] = ClientDBTableName.BattleCardMarketSetting;
         _loc2_["Lab.txt"] = ClientDBTableName.LabTemplate;
         _loc2_["Equip.txt"] = ClientDBTableName.EquipTemplate;
         _loc2_["Suit.txt"] = ClientDBTableName.SuitTemplate;
         _loc2_["LSStageSound.txt"] = ClientDBTableName.LSStageSound;
         _loc2_["ArenaWinLevelSetting.txt"] = ClientDBTableName.ArenaWinLevelSetting;
         _loc2_["ArenaGroupSetting.txt"] = ClientDBTableName.ArenaGroupSetting;
         _loc2_["Buff.txt"] = ClientDBTableName.Table_Buff;
         _loc2_["MapCellPropTemplate.txt"] = ClientDBTableName.MapCellPropTemplate;
         _loc2_["MapCellSkinTemplate.txt"] = ClientDBTableName.MapCellSkinTemplate;
         _loc2_["MapLevelTemplate.txt"] = ClientDBTableName.MapLevelTemplate;
         _loc2_["MapTempleTemplate.txt"] = ClientDBTableName.MapTempleTemplate;
         _loc2_["MapMineInfoTemplate.txt"] = ClientDBTableName.MapMineInfoTemplateTable;
         _loc2_["MapMineBuffTemplate.txt"] = ClientDBTableName.MapMineBuffTemplateTable;
         _loc2_["MallItemTemplate.txt"] = ClientDBTableName.MallItemTemplateTable;
         _loc2_["ActivityIcon.txt"] = ClientDBTableName.TABLE_ACTIVITY_ICON;
         _loc2_["SystemIcon.txt"] = ClientDBTableName.TABLE_SYSTEM_ICON;
         _loc2_["UnionLevelInfo.txt"] = ClientDBTableName.Table_UnionLevelInfo;
         _loc2_["UnionMuckInfo.txt"] = ClientDBTableName.Table_UnionMuckInfo;
         _loc2_["UnionWelfareInfo.txt"] = ClientDBTableName.Table_UnionWelfareInfo;
         _loc2_["UnionNPCInfo.txt"] = ClientDBTableName.Table_UnionNPCInfo;
         _loc2_["VipInfo.txt"] = ClientDBTableName.Table_VipInfo;
         _loc2_["vipBuyCount.txt"] = ClientDBTableName.TABLE_VIP_BUY_COUNT;
         _loc2_["VipPrivilegeInfo.txt"] = ClientDBTableName.Table_PrivilegeInfo;
         _loc2_["PrivilegeConditoin.txt"] = ClientDBTableName.Table_PrivilegeConditoin;
         _loc2_["MapTempleTypeInfoTemplate.txt"] = ClientDBTableName.MapTempleTypeInfoTable;
         _loc2_["MapTempleReward.txt"] = ClientDBTableName.MapTempleReward;
         _loc2_["DailyTDInfoTemplate.txt"] = ClientDBTableName.Table_DailyTDInfo;
         _loc2_["DailyTDTradeTemplate.txt"] = ClientDBTableName.Table_DailyTDTradeInfo;
         _loc2_["DailyTDZombieTemplate.txt"] = ClientDBTableName.Table_DailyZombieInfo;
         _loc2_["WorldBoss.txt"] = ClientDBTableName.TABLE_WORLD_BOSS;
         _loc2_["dailyActivityInfo.txt"] = ClientDBTableName.TABLE_DAILY_ACTIVITY_INFO;
         _loc2_["dailyActivityReward.txt"] = ClientDBTableName.TABLE_DAILY_ACTIVITY_REWARD;
         _loc2_["giftPackage.txt"] = ClientDBTableName.TABLE_GIFT_PACKAGE;
         _loc2_["onlineDailyReward.txt"] = ClientDBTableName.Table_Online_Daily_Reward;
         _loc2_["onlineWeekReward.txt"] = ClientDBTableName.Table_Online_Week_Reward;
         _loc2_["nutritionObtain.txt"] = ClientDBTableName.TABLE_NUTRITION_OBTIAN;
         _loc2_["nutritionExchange.txt"] = ClientDBTableName.TABLE_NUTRITION_EXCHANGE;
         _loc2_["nutritionProperty.txt"] = ClientDBTableName.TABLE_NUTRITION_PROPERTY;
         _loc2_["sevenDay.txt"] = ClientDBTableName.TABLE_SEVEN_DAY;
         _loc2_["BuyMallTemplate.txt"] = ClientDBTableName.BuyMallTemplate;
         _loc2_["exitGameTip.txt"] = ClientDBTableName.TABLE_EXIT_TIPS;
         _loc2_["ZombieIslandTemplate.txt"] = ClientDBTableName.TABLE_ZOMBIE_ISLAND;
         _loc2_["ZombieIslandLevel.txt"] = ClientDBTableName.TABLE_ZOMBIE_ISLAND_LEVEL;
         _loc2_["ShortcutPay.txt"] = ClientDBTableName.Table_SHORTCUT_PAY;
         _loc2_["EveryDayBuyExchange.txt"] = ClientDBTableName.Table_EVERY_DAY_BUY_EXCHANGE;
         _loc2_["endlessMode.txt"] = ClientDBTableName.TABLE_ENDLESS_MODE;
         _loc2_["tdEndlessStrengthen.txt"] = ClientDBTableName.TABLE_ENDLESS_STRENGTHEN;
         _loc2_["endlessDiamond.txt"] = ClientDBTableName.TABLE_ENDLESS_USE_DIAMOND;
         _loc2_["endlessLevel.txt"] = ClientDBTableName.TABLE_ENDLESS_LEVEL;
         _loc2_["endlessReward.txt"] = ClientDBTableName.TABLE_ENDLESS_REWARD;
         _loc2_["thanksgiving.txt"] = ClientDBTableName.TABLE_THANKSGIVING;
         _loc2_["offlineLogin.txt"] = ClientDBTableName.TABLE_OFFLINE_LOGIN;
         _loc2_["offlineActivity.txt"] = ClientDBTableName.TABLE_OFFLINE_ACTIVITY;
         _loc2_["pvpHealthParam.txt"] = ClientDBTableName.TABLE_CARD_HEALTH;
         _loc2_["pvpWinStreakParam.txt"] = ClientDBTableName.TABLE_CARD_WIN_STREAK;
         _loc2_["qzoneShare.txt"] = ClientDBTableName.TABLE_QZONE_SHARE;
         _loc2_["trialRoad.txt"] = ClientDBTableName.TABLE_TRIAL_ROAD_NORMAL;
         _loc2_["trialRoadHard.txt"] = ClientDBTableName.TABLE_TRIAL_ROAD_HARD;
         _loc2_["guideData.txt"] = ClientDBTableName.TABLE_GUIDE_DATA;
         _loc2_["guideText.txt"] = ClientDBTableName.TABLE_GUIDE_TEXT;
         _loc2_["battleState.txt"] = ClientDBTableName.BattleLineupCardStateTemplate;
         _loc2_["battleBuff.txt"] = ClientDBTableName.BattleLineupCardBuffTemplate;
         _loc2_["EntryTemplateCE.txt"] = ClientDBTableName.EntryTemplateCE;
         _loc2_["strengthenContent.txt"] = ClientDBTableName.TABLE_STRENGTHEN_CONTENT;
         _loc2_["strengthenType.txt"] = ClientDBTableName.TABLE_STRENGTHEN_TYPE;
         _loc2_["YetiTDMode.txt"] = ClientDBTableName.TABLE_YETI_TD_MODE;
         _loc2_["YetiTDMap.txt"] = ClientDBTableName.TABLE_YETI_TD_MAP;
         _loc2_["FuzionInspire.txt"] = ClientDBTableName.TABLE_FUZION_INSPIRE;
         _loc2_["GardenUnlock.txt"] = ClientDBTableName.TABLE_GARDEN_UNLOCK;
         _loc2_["GardenUpgrade.txt"] = ClientDBTableName.TABLE_GARDEN_UPGRADE;
         _loc2_["GardenPet.txt"] = ClientDBTableName.TABLE_GARDEN_PET;
         _loc2_["GardenSeed.txt"] = ClientDBTableName.TABLE_GARDEN_SEED;
         _loc2_["GardenFertilizer.txt"] = ClientDBTableName.TABLE_GARDEN_FERTILIZER;
         _loc2_["unionCompetitionReward.txt"] = ClientDBTableName.TABLE_UNION_COMPETITION_REWARD;
         _loc2_["speedPlantLevel.txt"] = ClientDBTableName.TABLE_SPEED_PLANTLEVEL;
         _loc2_["speedWorldTree.txt"] = ClientDBTableName.TABLE_SPEED_WORLDTREE;
         _loc2_["speedNutrition.txt"] = ClientDBTableName.TABLE_SPEED_NUTRITION;
         _loc2_["speedEquipment.txt"] = ClientDBTableName.TABLE_SPEED_EQUIPMENT;
         _loc2_["RenameRandom1TemplateCE.txt"] = ClientDBTableName.RenameRandom1TemplateCE;
         _loc2_["RenameRandom2TemplateCE.txt"] = ClientDBTableName.RenameRandom2TemplateCE;
         _loc2_["RenameRandom3TemplateCE.txt"] = ClientDBTableName.RenameRandom3TemplateCE;
         _loc2_["UnionRenameRandomTemplateCE.txt"] = ClientDBTableName.UnionRenameRandomTemplateCE;
         _loc2_["WTTemplateCE.txt"] = ClientDBTableName.WTTemplateCE;
         _loc2_["EquipmentItem.txt"] = ClientDBTableName.TABLE_EQUIPMENT_ITEM;
         _loc2_["EquipmentPool.txt"] = ClientDBTableName.TABLE_EQUIPMENT_POOL;
         _loc2_["EquipmentPart.txt"] = ClientDBTableName.TABLE_EQUIPMENT_PART;
         _loc2_["EquipmentLevel.txt"] = ClientDBTableName.TABLE_EQUIPMENT_LEVEL;
         _loc2_["EquipmentRank.txt"] = ClientDBTableName.TABLE_EQUIPMENT_RANK;
         _loc2_["EquipmentBead.txt"] = ClientDBTableName.TABLE_EQUIPMENT_BEAD;
         _loc2_["WelfareDaily.txt"] = ClientDBTableName.TABLE_WELFARE_DAILY;
         _loc2_["WelfareLevelReward.txt"] = ClientDBTableName.TABLE_WELFARE_LEVEL_REWARD;
         _loc2_["WelfarePowerReward.txt"] = ClientDBTableName.TABLE_WELFARE_POWER_REWARD;
         _loc2_["WelfareResourceRecover.txt"] = ClientDBTableName.TABLE_WELFARE_RESOURCE_RECOVER;
         _loc2_["WelfareNpcBubble.txt"] = ClientDBTableName.TABLE_WELFARE_NPC_BUBBLE;
         _loc2_["PlantExploreMap.txt"] = ClientDBTableName.TABLE_PLANT_EXPLORE_MAP;
         _loc2_["CastleAdventure.txt"] = ClientDBTableName.TABLE_CASTLE_ADVENTURE;
         _loc2_["CastleBox.txt"] = ClientDBTableName.TABLE_CASTLE_BOX;
         _loc2_["LSChallengeRankBonus.txt"] = ClientDBTableName.TABLE_CHALLENGE_RANK_BONUS;
         _loc2_["LSChallengePromoteBonus.txt"] = ClientDBTableName.TABLE_CHALLENGE_PROMOTE_BONUS;
         _loc2_["LSChallengeScoreBonus.txt"] = ClientDBTableName.TABLE_CHALLENGE_SCORE_BONUS;
         _loc2_["TDChallengeScore.txt"] = ClientDBTableName.TABLE_CHALLENGE_SCORE;
         _loc2_["TDChallengeAchi.txt"] = ClientDBTableName.TABLE_CHALLENGE_ACHI;
         _loc2_["dailyVowInfo.txt"] = ClientDBTableName.TABLE_DAILY_VOW_INFO;
         _loc2_["dailyVowType.txt"] = ClientDBTableName.TABLE_DAILY_VOW_TYPE;
         _loc2_["dailyVowWish.txt"] = ClientDBTableName.TABLE_DAILY_VOW_WISH;
         _loc2_["plantTestChapter.txt"] = ClientDBTableName.TABLE_PLANT_TEST_CHAPTER;
         _loc2_["plantTestCondition.txt"] = ClientDBTableName.TABLE_PLANT_TEST_CONDITION;
         _loc2_["plantTestReset.txt"] = ClientDBTableName.TABLE_PLANT_TEST_RESET;
         _loc2_["awakeConfig.txt"] = ClientDBTableName.TABLE_AWAKE_CONFIG;
         _loc2_["awakeSwap.txt"] = ClientDBTableName.TABLE_AWAKE_SWAP;
         _loc2_["energyBeanBuy.txt"] = ClientDBTableName.TABLE_ENERGY_BEAN_BUY;
         _loc2_["sunBuy.txt"] = ClientDBTableName.TABLE_SUN_BUY;
         _loc2_["cardDeckDetail.txt"] = ClientDBTableName.TABLE_CARD_DECK_DETAIL;
         _loc2_["cardDeckShow.txt"] = ClientDBTableName.TABLE_CARD_DECK_SHOW;
         _loc2_["cardDeckAttribute.txt"] = ClientDBTableName.TABLE_CARD_DECK_ATTR;
         _loc2_["levelupOpenInfo.txt"] = ClientDBTableName.Table_LevelupOpenInfo;
         _loc2_["brainOverReward.txt"] = ClientDBTableName.TABLE_BRAIN_OVER_REWARD;
         _loc2_["brainActivity.txt"] = ClientDBTableName.TABLE_BRAIN_ACTIVITY;
         _loc2_["brainQuestion.txt"] = ClientDBTableName.TABLE_BRAIN_QUESTION;
         _loc2_["baptizeLimit.txt"] = ClientDBTableName.TABLE_BAPTIZE_LIMIT;
         _loc2_["baptizeAction.txt"] = ClientDBTableName.TABLE_BAPTIZE_ACTION;
         _loc2_["unionSkillLevel.txt"] = ClientDBTableName.TABLE_UNION_SKILL_LEVEL;
         _loc2_["unionSkillInfo.txt"] = ClientDBTableName.TABLE_UNION_SKILL_INFO;
         _loc2_["unionSkillUnlock.txt"] = ClientDBTableName.TABLE_UNION_SKILL_UNLOCK;
         _loc2_["holeUseType.txt"] = ClientDBTableName.TABLE_HOLE_USE_TYPE;
         _loc2_["holeCondition.txt"] = ClientDBTableName.TABLE_HOLE_CONDITION;
         _loc2_["holeLight.txt"] = ClientDBTableName.TABLE_HOLE_BUY_LIGHT;
         _loc2_["holeReward.txt"] = ClientDBTableName.TABLE_HOLE_REWARD;
         _loc2_["cardFruitInfo.txt"] = ClientDBTableName.TABLE_CARD_FRUIT_INFO;
         _loc2_["LuckyStarItemsTemplate.txt"] = ClientDBTableName.LuckyStarItemsTemplate;
         _loc2_["LuckyStarDayBuyTemplate.txt"] = ClientDBTableName.LuckyStarDayBuyTemplate;
         _loc2_["cardFruitSwapCost.txt"] = ClientDBTableName.TABLE_CARD_FRUIT_SWAP_COST;
         _loc2_["cardBaptizeSwap.txt"] = ClientDBTableName.TABLE_CARD_BAPTIZE_SWAP_COST;
         _loc2_["topKingStageInfo.txt"] = ClientDBTableName.TABLE_TOPKING_STAGE_INFO;
         _loc2_["mysteryCardTip.txt"] = ClientDBTableName.TABLE_MYSTERYCARD_TIP;
         _loc2_["cardDNAFactorInfo.txt"] = ClientDBTableName.TABLE_CARDDNA_FACTOR;
         _loc2_["cardDNAChooseInfo.txt"] = ClientDBTableName.TABLE_CARDDNA_CHOOSE;
         _loc2_["cardDNAInfo.txt"] = ClientDBTableName.TABLE_CARDDNA_DNAINFO;
         _loc2_["cardDNAResetInfo.txt"] = ClientDBTableName.TABLE_CARDDNA_RESET;
         _loc2_["cardDNAParamInfo.txt"] = ClientDBTableName.TABLE_CARDDNA_PARAM;
         _loc2_["cardDNAChooseTypeName.txt"] = ClientDBTableName.TABLE_CARDDNA_CHOOSENAME;
         _loc2_["cardDNATestLevelInfo.txt"] = ClientDBTableName.TABLE_CARDDNA_TEST_LEVEL_INFO;
         _loc2_["cardDNATestLimit.txt"] = ClientDBTableName.TABLE_CARDDNA_TEST_STAGE_LIMIT;
         _loc2_["cardDNATestReset.txt"] = ClientDBTableName.TABLE_CARDDNA_TEST_RESET_PRICE;
         _loc2_["fourFrameBag.txt"] = ClientDBTableName.TABLE_FOUR_FRAME_BAG;
         _loc2_["topKingCoinBetInfo.txt"] = ClientDBTableName.TABLE_TOPKING_COIN_BET_INFO;
         _loc2_["cardDNASwapCost.txt"] = ClientDBTableName.TABLE_CARDDNA_SWAP_PRICE;
         _loc2_["dummyZombieInfo.txt"] = ClientDBTableName.TABLE_DUMMY_ZOMBIE_INFO;
         _loc2_["dummyZombieSkillInfo.txt"] = ClientDBTableName.TABLE_DUMMY_SKILL_INFO;
         _loc2_["dummyBuffInfo.txt"] = ClientDBTableName.TABLE_DUMMY_BUFF_INFO;
         _loc2_["dummyPropInfo.txt"] = ClientDBTableName.TABLE_DUMMY_PROP_INFO;
         _loc2_["dummyLevelInfo.txt"] = ClientDBTableName.TABLE_DUMMY_LEVEL_INFO;
         _loc2_["dummyEquipmentInfo.txt"] = ClientDBTableName.TABLE_EQUIPMENT_INFO;
         _loc2_["dummyEquipmentQuiltyInfo.txt"] = ClientDBTableName.TABLE_EQUIPMENT_QUILTY_INFO;
         _loc2_["dummyEquipmentLevelInfo.txt"] = ClientDBTableName.TABLE_EQUIPMENT_LEVEL_INFO;
         _loc2_["dummyZombieStarInfo.txt"] = ClientDBTableName.TABLE_DUMMY_STAR_INFO;
         _loc2_["dummyBuffEffectInfo.txt"] = ClientDBTableName.TABLE_DUMMY_BUFF_EFFECT_INFO;
         _loc2_["dummyFubenStageInfo.txt"] = ClientDBTableName.TABLE_DUMMY_FUBEN_STAGE_INFO;
         _loc2_["dummyZombieQuiltyInfo.txt"] = ClientDBTableName.TABLE_DUMMY_ZOMBIE_QUILTY_INFO;
         _loc2_["dummySkillUpdateInfo.txt"] = ClientDBTableName.TABLE_DUMMY_ZOMBIE_SKILL_NEED_ITEM;
         _loc2_["dummyFubenLevelInfo.txt"] = ClientDBTableName.TABLE_DUMMY_FUBEN_LEVEL_INFO;
         _loc2_["dummyZombieCallInfo.txt"] = ClientDBTableName.TABLE_DUMMY_ZOMBIE_CALL_INFO;
         _loc2_["dummyBuySkillPointInfo.txt"] = ClientDBTableName.TABLE_DUMMY_BUY_SKILL_POINT_INFO;
         _loc2_["dummyBuyFubenEnemgyInfo.txt"] = ClientDBTableName.TABLE_DUMMY_BUY_FUBEN_EMENGY_INFO;
         _loc2_["dummyActiveSkillInfo.txt"] = ClientDBTableName.TABLE_DUMMY_ACTIVE_SKILL_INFO;
         _loc2_["expeditionCampTemplate.txt"] = ClientDBTableName.TABLE_EXPEDITION_CAMP_INFO;
         _loc2_["expeditionBuildingTypeTemplate.txt"] = ClientDBTableName.TABLE_EXPEDITION_BUILDING_TYPE_INFO;
         _loc2_["expeditionCDPriceTemplate.txt"] = ClientDBTableName.TABLE_EXPEDITION_CD_NEED_PRICE;
         _loc2_["expeditionCampRewardTemplate.txt"] = ClientDBTableName.TABLE_EXPEDITION_CAMP_REWARD;
         _loc2_["expeditionBuffTemplate.txt"] = ClientDBTableName.TABLE_EXPEDITION_BUFF;
         _loc2_["expeditionBossInfoTemplate.txt"] = ClientDBTableName.TABLE_EXPEDITION_BOSS;
         _loc2_["expeditionPersonalRankRewardTemplate.txt"] = ClientDBTableName.TABLE_EXPEDITION_PERSONAL_REWARD;
         _loc2_["plantArmorStarPropInfo.txt"] = ClientDBTableName.TABLE_PLANTARMOR_STAR_PROP;
         _loc2_["plantArmorStarNeedInfo.txt"] = ClientDBTableName.TABLE_PLANTARMOR_STAR_NEED;
         _loc2_["plantArmorLevelInfo.txt"] = ClientDBTableName.TABLE_PLANTARMOR_LEVLE_INFO;
         _loc2_["plantArmorCrystalInfo.txt"] = ClientDBTableName.TABLE_PLANTARMOR_CRYSTAL_INFO;
         _loc2_["plantArmorIncreaseInfo.txt"] = ClientDBTableName.TABLE_PLANTARMOR_INCREASE_INFO;
         _loc2_["plantArmorAttributeInfo.txt"] = ClientDBTableName.TABLE_PLANTARMOR_ATTRIBUTE_INFO;
         _loc2_["plantArmorAttributeDescInfo.txt"] = ClientDBTableName.TABLE_PLANTARMOR_ATTRIBUTE_DESC;
         _loc2_["endlessFubenStageTemplate.txt"] = ClientDBTableName.TABLE_ENDLESSFUBEN_STAGE;
         _loc2_["endlessFubenRankRewardTemplate.txt"] = ClientDBTableName.TABLE_ENDLESSFUBEN_RANK_REWARD;
         _loc2_["dummyCombineTemplate.txt"] = ClientDBTableName.TABLE_DUMMY_COMBIE_INFO;
         _loc2_["dummyCombineNeedLevelTemplate.txt"] = ClientDBTableName.TABLE_DUMMY_COMBIE_NEED_LEVEL_INFO;
         _loc2_["dummyCombineNeedStarTemplate.txt"] = ClientDBTableName.TABLE_DUMMY_COMBIE_NEED_STAR_INFO;
         _loc2_["superArenaDailyRankRewardTemplate.txt"] = ClientDBTableName.TABLE_SUPERARENA_DAILY_RANKREWARD;
         _loc2_["superArenaMaxRankRewardTemplate.txt"] = ClientDBTableName.TABLE_SUPERARENA_MAX_RANKREWARD;
         _loc2_["superArenaScoreRewardTemplate.txt"] = ClientDBTableName.TABLE_SUPERARENA_SCORE_REWARD;
         _loc2_["plantEvolutionLevelTemplate.txt"] = ClientDBTableName.TABLE_PLANT_EVOLUTION__LEVELINFO;
         _loc2_["plantEvolutionTypeTemplate.txt"] = ClientDBTableName.TABLE_PLANT_EVOLUTION__TYPEINFO;
         if(param1 != null)
         {
            while(param1.bytesAvailable > 0)
            {
               _loc3_ = param1.readInt();
               _loc4_ = param1.readMultiByte(_loc3_,"UTF-8");
               _loc3_ = param1.readInt();
               _loc5_ = param1.readMultiByte(_loc3_,"UTF-8");
               if((_loc6_ = _loc2_[_loc4_]) == null)
               {
                  getLogger().debug("Removed table " + _loc6_);
               }
               else
               {
                  getLogger().debug("Added table " + _loc6_);
                  ClientDB.getInstance().addTable(_loc6_,_loc5_);
               }
            }
         }
         else
         {
            getLogger().debug("clientDB loading failed");
         }
      }
      
      private function excelDataToArray(param1:String) : Array
      {
         var _loc5_:Array = null;
         var _loc8_:String = null;
         var _loc9_:Array = null;
         var _loc10_:Object = null;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:String = null;
         var _loc2_:Array = param1.split("\n");
         var _loc3_:Number = _loc2_.length;
         var _loc4_:Number = 0;
         var _loc6_:Array = new Array();
         var _loc7_:Number = 0;
         while(_loc7_ < _loc3_)
         {
            _loc8_ = _loc2_[_loc7_];
            if(_loc8_.charCodeAt(_loc8_.length - 1) == 13)
            {
               _loc8_ = _loc8_.substr(0,_loc8_.length - 1);
            }
            if(!(_loc8_ == "" || _loc8_.substr(0,2) == "//"))
            {
               _loc9_ = _loc8_.split("\t");
               if(_loc7_ == 0)
               {
                  _loc5_ = _loc9_;
               }
               else
               {
                  _loc10_ = new Object();
                  _loc11_ = _loc5_.length;
                  _loc12_ = 0;
                  while(_loc12_ < _loc11_)
                  {
                     _loc13_ = _loc9_[_loc12_];
                     _loc10_[_loc5_[_loc12_]] = _loc13_;
                     _loc12_++;
                  }
                  _loc6_.push(_loc10_);
               }
            }
            _loc7_++;
         }
         return _loc6_;
      }
      
      public function readAll(param1:String) : Array
      {
         if(this._database[param1] is String)
         {
            this._database[param1] = this.excelDataToArray(this._database[param1]);
         }
         return this._database[param1];
      }
      
      public function deleteDB(param1:String) : void
      {
         delete this._database[param1];
      }
      
      public function addTable(param1:String, param2:String) : void
      {
         this._database[param1] = param2;
      }
      
      public function search(param1:String, param2:Array, param3:Array) : Array
      {
         var _loc8_:Object = null;
         var _loc9_:Boolean = false;
         var _loc10_:int = 0;
         var _loc11_:String = null;
         var _loc12_:String = null;
         var _loc13_:String = null;
         var _loc4_:Array = new Array();
         if(param2 == null || param3 == null)
         {
            return _loc4_;
         }
         var _loc5_:Array;
         var _loc6_:Number = (_loc5_ = this.readAll(param1)).length;
         var _loc7_:Number = 0;
         while(_loc7_ < _loc6_)
         {
            _loc8_ = _loc5_[_loc7_];
            _loc9_ = true;
            _loc10_ = 0;
            while(_loc10_ < param2.length)
            {
               _loc11_ = param2[_loc10_];
               _loc12_ = param3[_loc10_];
               if((_loc13_ = _loc8_[_loc11_]) != _loc12_)
               {
                  _loc9_ = false;
                  break;
               }
               _loc10_++;
            }
            if(_loc9_)
            {
               _loc4_.push(_loc8_);
            }
            _loc7_++;
         }
         return _loc4_;
      }
      
      public function read(param1:String, param2:String, param3:Object, param4:String = null) : Object
      {
         var _loc8_:Object = null;
         var _loc10_:Object = null;
         var _loc11_:* = undefined;
         if(param2 != "id")
         {
            getLogger().debug(param1 + " Must be queried by ID");
            return null;
         }
         var _loc5_:Array = this.readAll(param1);
         var _loc6_:* = param3;
         var _loc7_:Number = 0;
         var _loc9_:Number = 0;
         while(_loc9_ < _loc5_.length)
         {
            if((_loc11_ = (_loc10_ = _loc5_[_loc9_]).id) == _loc6_)
            {
               _loc8_ = _loc10_;
               break;
            }
            _loc9_++;
         }
         if(_loc8_ != null && param4 != null)
         {
            if(_loc8_.hasOwnProperty(param4))
            {
               return _loc8_[param4];
            }
            getLogger().debug(param1 + " No column " + param4);
            return null;
         }
         return _loc8_;
      }
   }
}
