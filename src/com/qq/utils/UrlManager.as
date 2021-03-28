package com.qq.utils
{
   import com.qq.GameGloble;
   import flash.utils.Dictionary;
   import org.as3commons.logging.api.getLogger;
   
   public class UrlManager
   {
      
      private static var _instance:UrlManager;
      
      public static const Url_TDMapFile:int = 1;
      
      public static const Url_ClientDB:int = 2;
      
      public static const Url_TDZombieAnmi:int = 3;
      
      public static const Url_TDPlantAnmi:int = 4;
      
      public static const Url_TDBulletAnmi:int = 5;
      
      public static const Url_TDMapImg:int = 6;
      
      public static const Url_TDRes:int = 7;
      
      public static const Url_TDObjectAnmi:int = 8;
      
      public static const Url_TDImageIcon:int = 9;
      
      public static const Url_Sound:int = 10;
      
      public static const Url_Module:int = 11;
      
      public static const Url_ModuleRes:int = 12;
      
      public static const Url_UI:int = 13;
      
      public static const Url_TD_EFFECTS:int = 14;
      
      public static const Url_TD_SkillEffect:int = 15;
      
      public static const Url_ICON:int = 16;
      
      public static const Url_HeadIcon:int = 17;
      
      public static const Url_CityBuilding:int = 18;
      
      public static const Url_PlantTalentIcon:int = 19;
      
      public static const Url_PlantTalentUI:int = 21;
      
      public static const Url_Battle_Unit:int = 22;
      
      public static const Url_Battle_Bullet:int = 23;
      
      public static const Url_Battle_Effect:int = 24;
      
      public static const Url_Battle_Map:int = 25;
      
      public static const Url_ItemIcon:int = 26;
      
      public static const Url_QuestIcon:int = 27;
      
      public static const Url_TDUIIcon:int = 28;
      
      public static const Url_FlyItemIcon:int = 29;
      
      public static const Url_BattleCard:int = 30;
      
      public static const Url_TD_Intro:int = 31;
      
      public static const Url_CollectCoin:int = 32;
      
      public static const Url_Card_icon:int = 33;
      
      public static const Url_Union_Flag_Sign:int = 34;
      
      public static const Url_Union_Flag_Surface:int = 35;
      
      public static const Url_RoleInfo:int = 36;
      
      public static const Url_Arena:int = 37;
      
      public static const Url_Union_Garden:int = 38;
      
      public static const Url_Union_Welfare_Icon:int = 39;
      
      public static const Url_Union_Flag:int = 40;
      
      public static const Url_Activity_Icon:int = 41;
      
      public static const Url_SignIn_Image:int = 42;
      
      public static const Url_Union_Garden_Swf:int = 43;
      
      public static const Url_BlueVip:int = 44;
      
      public static const Url_DailyTD:int = 45;
      
      public static const Url_WorldBoss:int = 46;
      
      public static const Url_Every_Icon:int = 47;
      
      public static const Url_DailyActivity:int = 48;
      
      public static const Url_ZombieIsland:int = 49;
      
      public static const Url_HealthDegree:int = 50;
      
      public static const Url_Privilege:int = 51;
      
      public static const Url_Union_Hall:int = 52;
      
      public static const Url_Union_HonorRank:int = 53;
      
      public static const URL_Treasure:int = 54;
      
      public static const URL_VIP:int = 55;
      
      public static const URL_NUTRITION:int = 56;
      
      public static const URL_Market:int = 57;
      
      public static const Url_IMAGE:int = 58;
      
      public static const URL_SEVENDAYS:int = 59;
      
      public static const URL_NOTICE:int = 60;
      
      public static const URL_FUBEN:int = 61;
      
      public static const URL_EndlessTD:int = 62;
      
      public static const URL_QZoneShare:int = 63;
      
      public static const URL_CommEmbattle:int = 64;
      
      public static const URL_ArenaEntrance:int = 65;
      
      public static const URL_RankArena:int = 66;
      
      public static const Url_Battle_UI:int = 67;
      
      public static const Url_Shop_UI:int = 68;
      
      public static const Url_Garden:int = 69;
      
      public static const Url_IMG_CARD:int = 70;
      
      public static const Url_IMG_WELFARE_HALL:int = 71;
      
      public static const Url_WELFARE_HALL:int = 72;
      
      public static const Url_ActivityChallengeLimitTime:int = 73;
      
      public static const Url_PlantExplore:int = 74;
      
      public static const Url_IMG_TGP:int = 75;
      
      public static const Url_TDPowerTile:int = 76;
      
      public static const Url_IMG_ROOKIE_CEREMONY:int = 77;
      
      public static const Url_Awake_Effect:int = 78;
      
      public static const Url_LS:int = 79;
      
      public static const Url_LEVELUP:int = 80;
      
      public static const Url_CityBuilding_Christmas:int = 81;
      
      public static const Url_Union_Skill:int = 82;
      
      public static const Url_Hole:int = 83;
      
      public static const Url_DNA_Effect:int = 84;
      
      public static const Url_PlantArmor_Effect:int = 85;
       
      
      private var _urlIDmap:Dictionary;
      
      public function UrlManager()
      {
         super();
         this._urlIDmap = new Dictionary();
         this.addUrlID(Url_TDMapFile,"conf/td/map/");
         this.addUrlID(Url_ClientDB,"");
         this.addUrlID(Url_TDZombieAnmi,"swf/td/anmi/zombie/");
         this.addUrlID(Url_TDPlantAnmi,"swf/td/anmi/plant/");
         this.addUrlID(Url_TDBulletAnmi,"swf/td/anmi/bullet/");
         this.addUrlID(Url_TD_EFFECTS,"swf/td/effects/");
         this.addUrlID(Url_TDMapImg,"swf/td/map/");
         this.addUrlID(Url_TDRes,"swf/td/");
         this.addUrlID(Url_TDObjectAnmi,"swf/td/anmi/object/");
         this.addUrlID(Url_TDImageIcon,"image/td/card/");
         this.addUrlID(Url_Sound,"sound/");
         this.addUrlID(Url_Module,"");
         this.addUrlID(Url_ModuleRes,"swf/module/");
         this.addUrlID(Url_UI,"image/ui/");
         this.addUrlID(Url_TD_SkillEffect,"swf/td/skill/");
         this.addUrlID(Url_IMG_CARD,"image/card/");
         this.addUrlID(Url_IMG_WELFARE_HALL,"image/welfareHall/");
         this.addUrlID(Url_ICON,"swf/icons/");
         this.addUrlID(Url_HeadIcon,"image/head/");
         this.addUrlID(Url_CityBuilding,"swf/city/");
         this.addUrlID(Url_CityBuilding_Christmas,"swf/city/christmas/");
         this.addUrlID(Url_PlantTalentIcon,"image/talent/talent/");
         this.addUrlID(Url_PlantTalentUI,"image/talent/ui/");
         this.addUrlID(Url_Battle_Unit,"swf/battle/animation/unit/");
         this.addUrlID(Url_Battle_Bullet,"swf/battle/animation/bullet/");
         this.addUrlID(Url_Battle_Effect,"swf/battle/animation/effect/");
         this.addUrlID(Url_Battle_UI,"swf/battle/ui/");
         this.addUrlID(Url_ItemIcon,"image/item/");
         this.addUrlID(Url_QuestIcon,"image/quest/");
         this.addUrlID(Url_Battle_Map,"swf/battle/battleMap/");
         this.addUrlID(Url_TDUIIcon,"image/td/ui/");
         this.addUrlID(Url_FlyItemIcon,"image/flyitem/");
         this.addUrlID(Url_BattleCard,"image/battleCard/");
         this.addUrlID(Url_TD_Intro,"image/td/intro/");
         this.addUrlID(Url_CollectCoin,"image/collectCoin/");
         this.addUrlID(Url_Card_icon,"swf/icons/card/");
         this.addUrlID(Url_Union_Flag_Sign,"image/union/flag/sign/");
         this.addUrlID(Url_Union_Flag_Surface,"image/union/flag/surface/");
         this.addUrlID(Url_Union_Skill,"image/union/skill/");
         this.addUrlID(Url_Hole,"swf/hole/");
         this.addUrlID(Url_RoleInfo,"swf/roleInfo/");
         this.addUrlID(Url_Arena,"image/arena/");
         this.addUrlID(Url_Union_Garden,"image/union/garden/");
         this.addUrlID(Url_Union_Flag,"image/union/flag/");
         this.addUrlID(Url_Union_Welfare_Icon,"image/union/welfare/icon/");
         this.addUrlID(Url_Activity_Icon,"swf/activity/icons/");
         this.addUrlID(Url_SignIn_Image,"image/signIn/");
         this.addUrlID(Url_Union_Garden_Swf,"swf/union/");
         this.addUrlID(Url_BlueVip,"image/bluevip/");
         this.addUrlID(Url_DailyTD,"swf/dailyTD/");
         this.addUrlID(Url_WorldBoss,"swf/worldBoss/");
         this.addUrlID(Url_Every_Icon,"swf/activity/everyDayIcons/");
         this.addUrlID(Url_DailyActivity,"image/dailyActivity/");
         this.addUrlID(Url_HealthDegree,"image/healthDegree/");
         this.addUrlID(Url_Privilege,"image/privilege/");
         this.addUrlID(Url_ZombieIsland,"swf/zombieIsland/");
         this.addUrlID(Url_Union_Hall,"image/union/hall/");
         this.addUrlID(Url_Union_HonorRank,"image/union/honorRank/");
         this.addUrlID(URL_Treasure,"swf/treasure/");
         this.addUrlID(URL_VIP,"swf/vip/");
         this.addUrlID(Url_IMAGE,"image/");
         this.addUrlID(URL_NUTRITION,"swf/nutrition/");
         this.addUrlID(URL_Market,"image/market/");
         this.addUrlID(URL_SEVENDAYS,"swf/sevenDays/");
         this.addUrlID(URL_NOTICE,"swf/notice/");
         this.addUrlID(URL_FUBEN,"swf/fuben/");
         this.addUrlID(URL_EndlessTD,"swf/endlessTD/");
         this.addUrlID(Url_Awake_Effect,"swf/awake/effect/");
         this.addUrlID(Url_LS,"swf/ls/");
         this.addUrlID(URL_QZoneShare,"swf/qzoneShare/");
         this.addUrlID(URL_CommEmbattle,"swf/commEmbattle/");
         this.addUrlID(URL_ArenaEntrance,"swf/arenaEntrance/");
         this.addUrlID(URL_RankArena,"swf/rankArena/");
         this.addUrlID(Url_Shop_UI,"swf/shop/");
         this.addUrlID(Url_Garden,"swf/garden/");
         this.addUrlID(Url_WELFARE_HALL,"swf/welfareHall/");
         this.addUrlID(Url_PlantExplore,"swf/plantExplore/");
         this.addUrlID(Url_ActivityChallengeLimitTime,"swf/activityChallengeLimitTime/");
         this.addUrlID(Url_PlantExplore,"swf/plantExplore/");
         this.addUrlID(Url_IMG_TGP,"image/tgp/");
         this.addUrlID(Url_TDPowerTile,"swf/td/ui/powerTile/");
         this.addUrlID(Url_IMG_ROOKIE_CEREMONY,"image/rookieCeremony/");
         this.addUrlID(Url_LEVELUP,"image/levelup/");
         this.addUrlID(Url_DNA_Effect,"swf/cardDNA/effect/");
         this.addUrlID(Url_PlantArmor_Effect,"swf/plantArmor/effect/");
      }
      
      public static function getUrl(param1:int, param2:String) : String
      {
         return getInstance().getUrl(param1,param2);
      }
      
      public static function getInstance() : UrlManager
      {
         if(_instance == null)
         {
            _instance = new UrlManager();
         }
         return _instance;
      }
      
      private function addUrlID(param1:int, param2:String) : void
      {
         if(this._urlIDmap[param1] == null)
         {
            this._urlIDmap[param1] = param2;
         }
         else
         {
            getLogger().debug("Adding resource path" + param1 + ":" + param2 + " Failed");
         }
      }
      
      private function getUrlByID(param1:int) : String
      {
         if(this._urlIDmap[param1] == null)
         {
            return "";
         }
         return this._urlIDmap[param1];
      }
      
      public function getUrl(param1:int, param2:String) : String
      {
         var _loc6_:String = null;
         var _loc7_:String = null;
         var _loc8_:String = null;
         var _loc9_:String = null;
         if(param1 == Url_TD_EFFECTS && param2 == null)
         {
         }
         var _loc3_:String = "";
         var _loc4_:Boolean = false;
         param2 = _loc3_.concat(UrlManager.getInstance().getUrlByID(param1),param2);
         if(!_loc4_)
         {
            if(param2.indexOf(".swf") != -1)
            {
               if(param2.indexOf("ModuleTD") != -1 || param2 == "Game.swf")
               {
                  if(GameGloble.isStalingMode)
                  {
                     _loc7_ = "p";
                     param2 = param2.replace(".swf","_" + _loc7_ + ".swf");
                  }
               }
               _loc6_ = FileVerManager.getInstance().getVer(param2);
               if (_loc6_ != "") { //Only if we use version in fileVer.xml
                  param2 = param2.replace(".swf","_" + _loc6_ + ".swf");
               }
            }
            else if(param2.indexOf(".bl") != -1)
            {
               _loc8_ = FileVerManager.getInstance().getVer(param2);
               if (_loc8_ != "") {
                  param2 = param2.replace(".bl", "_" + _loc8_ + ".bl");
               }
            }
            else if(param2.indexOf(".bbone") != -1)
            {
               _loc9_ = FileVerManager.getInstance().getVer(param2);
               if (_loc9_ != "") {
                  param2 = param2.replace(".bbone", "_" + _loc9_ + ".bbone");
               }
            }
         }
         return _loc3_.concat(param2);
      }
   }
}
