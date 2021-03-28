package com.qq.modules.main.model
{
   import com.qq.modules.bag.model.ItemTemplateFactory;
   import com.qq.modules.fuben.model.templates.FubenTemplateFactory;
   import com.qq.modules.main.model.settings.achievement.TDAchievementInfoSettings;
   import com.qq.modules.main.model.settings.battle.BattleCardFeatureSettings;
   import com.qq.modules.main.model.settings.battle.BattleCardLevelSettings;
   import com.qq.modules.main.model.settings.battle.BattleCardSettings;
   import com.qq.modules.main.model.settings.battle.BattleCartoonSettings;
   import com.qq.modules.main.model.settings.battle.BattleLineupTemplateFactory;
   import com.qq.modules.main.model.settings.battleCard.BattleCardMarketSettings;
   import com.qq.modules.main.model.settings.plantTalent.PlantTalentSettings;
   import com.qq.modules.td.data.TDDataFactory;
   import com.qq.modules.vip.model.templates.VipInfoFactory;
   import org.robotlegs.mvcs.Actor;
   
   public class SettingsModel extends Actor
   {
      
      private static var _instance:SettingsModel;
       
      
      private var _plantTalentSets:PlantTalentSettings;
      
      private var _TDAchievementInfoSettings:TDAchievementInfoSettings;
      
      private var _battleCardSettings:BattleCardSettings;
      
      private var _battleCardLevelSettings:BattleCardLevelSettings;
      
      private var _battleCardFeatureSettings:BattleCardFeatureSettings;
      
      private var _battleCartoonSettings:BattleCartoonSettings;
      
      private var _battleCardMarketSetting:BattleCardMarketSettings;
      
      public function SettingsModel()
      {
         super();
         _instance = this;
      }
      
      public static function get instance() : SettingsModel
      {
         if(_instance == null)
         {
            _instance = new SettingsModel();
         }
         return _instance;
      }
      
      public function get plantTalentSets() : PlantTalentSettings
      {
         if(!this._plantTalentSets)
         {
            this._plantTalentSets = new PlantTalentSettings();
         }
         return this._plantTalentSets;
      }
      
      public function get plantAchievementSettings() : TDAchievementInfoSettings
      {
         if(!this._TDAchievementInfoSettings)
         {
            this._TDAchievementInfoSettings = new TDAchievementInfoSettings();
         }
         return this._TDAchievementInfoSettings;
      }
      
      public function get battleCardSettings() : BattleCardSettings
      {
         if(!this._battleCardSettings)
         {
            this._battleCardSettings = new BattleCardSettings();
         }
         return this._battleCardSettings;
      }
      
      public function get battleCardLevelSettings() : BattleCardLevelSettings
      {
         if(!this._battleCardLevelSettings)
         {
            this._battleCardLevelSettings = new BattleCardLevelSettings();
         }
         return this._battleCardLevelSettings;
      }
      
      public function get battleCardFeatureSettings() : BattleCardFeatureSettings
      {
         if(!this._battleCardFeatureSettings)
         {
            this._battleCardFeatureSettings = new BattleCardFeatureSettings();
         }
         return this._battleCardFeatureSettings;
      }
      
      public function get battleCartoonSettings() : BattleCartoonSettings
      {
         if(!this._battleCartoonSettings)
         {
            this._battleCartoonSettings = new BattleCartoonSettings();
         }
         return this._battleCartoonSettings;
      }
      
      public function get battleCardMarketSetting() : BattleCardMarketSettings
      {
         if(!this._battleCardMarketSetting)
         {
            this._battleCardMarketSetting = new BattleCardMarketSettings();
         }
         return this._battleCardMarketSetting;
      }
      
      public function get battleCardSkillSetting() : BattleLineupTemplateFactory
      {
         return BattleLineupTemplateFactory.instance;
      }
      
      public function get itemSetting() : ItemTemplateFactory
      {
         return ItemTemplateFactory.instance;
      }
      
      public function get fubenSetting() : FubenTemplateFactory
      {
         return FubenTemplateFactory.instance;
      }
      
      public function get TDPlantSetting() : TDDataFactory
      {
         return TDDataFactory.instance;
      }
      
      public function get VipSetting() : VipInfoFactory
      {
         return VipInfoFactory.instance;
      }
   }
}
