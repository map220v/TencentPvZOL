package com.qq.modules.main.model.settings.battle.ce
{
   import com.qq.modules.bag.model.vo.ItemVO;
   import com.qq.modules.card.model.templates.CardChestAvatarTemp;
   import com.qq.modules.card.model.templates.CardTemplateFactory;
   import com.qq.modules.main.model.SettingsModel;
   import com.qq.modules.main.model.settings.battle.BattleLineupCardSkillTemplate;
   import com.qq.modules.main.model.settings.battle.BattleLineupTemplateFactory;
   import com.qq.templates.font.FontNormal;
   import tencent.base.utils.StringUtil;
   
   public class BattleLineupCardTemp extends BattleLineupCardTemplateCE
   {
       
      
      private var _hideBoneList:Array;
      
      private var _skill2Template:BattleLineupCardSkillTemplate;
      
      private var _skill1Template:BattleLineupCardSkillTemplate;
      
      private var _leaderSkillTemplate:BattleLineupCardSkillTemplate;
      
      private var _features:Array;
      
      private var m_recycleItem:ItemVO;
      
      private var _newItem:ItemVO;
      
      private var _defaultCardAvatar:CardChestAvatarTemp;
      
      public function BattleLineupCardTemp()
      {
         this._features = [];
         super();
      }
      
      public function get hideBoneList() : Array
      {
         if(!this._hideBoneList)
         {
            this._hideBoneList = !!this.defaultCardAvatar ? (!!this.defaultCardAvatar.hidePartCardList ? this.defaultCardAvatar.hidePartCardList : _hideBone.split("|")) : _hideBone.split("|");
         }
         return this._hideBoneList;
      }
      
      public function get skill2Template() : BattleLineupCardSkillTemplate
      {
         if(this._skill2Template == null)
         {
            this._skill2Template = BattleLineupTemplateFactory.instance.getBattleLineupCardSkillTemplateById(this.skillId2);
         }
         return this._skill2Template;
      }
      
      public function get skill1Template() : BattleLineupCardSkillTemplate
      {
         if(this._skill1Template == null)
         {
            this._skill1Template = BattleLineupTemplateFactory.instance.getBattleLineupCardSkillTemplateById(this.skillId1);
         }
         return this._skill1Template;
      }
      
      public function get leaderSkillTemplate() : BattleLineupCardSkillTemplate
      {
         if(this._leaderSkillTemplate == null)
         {
            this._leaderSkillTemplate = BattleLineupTemplateFactory.instance.getBattleLineupCardSkillTemplateById(this.leaderSkillId);
         }
         return this._leaderSkillTemplate;
      }
      
      public function get features() : Array
      {
         if(_feature)
         {
            this._features = feature.split(",");
         }
         return this._features;
      }
      
      public function get recycleItem() : ItemVO
      {
         if(_recycleItemString && _recycleItemString.length > 0)
         {
            if(this.m_recycleItem == null)
            {
               this.m_recycleItem = ItemVO.createByString(_recycleItemString,",");
            }
         }
         return this.m_recycleItem;
      }
      
      public function get newItem() : ItemVO
      {
         var _loc1_:String = this.recycleItemString;
         var _loc2_:Array = _loc1_.split(",");
         if(this._newItem == null)
         {
            this._newItem = new ItemVO(_loc2_[0],_loc2_[1]);
         }
         return this._newItem;
      }
      
      public function get defaultCardAvatar() : CardChestAvatarTemp
      {
         if(!this._defaultCardAvatar)
         {
            this._defaultCardAvatar = CardTemplateFactory.instance.getPlantAvatarByTdPlantId(this.tdId);
         }
         return this._defaultCardAvatar;
      }
      
      public function getRarityDesc() : String
      {
         return StringUtil.substitute(FontNormal.Card_Rarity_info,_rarity,this.skillStrength,this.skillDefense);
      }
      
      override public function get skillDefense() : Number
      {
         return int((10000 - _skillDefense) * 0.01);
      }
      
      override public function get skillStrength() : Number
      {
         return int((_skillStrength - 10000) * 0.01);
      }
      
      public function getRarityTooltip() : String
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc1_:String = StringUtil.substitute(FontNormal.Card_Rarity_Tooltip,this.skillStrength,this.skillDefense);
         var _loc2_:BattleLineupCardTemp = SettingsModel.instance.battleCardSettings.getBattleCardNextUpgradeCardInfo(_id);
         if(_loc2_ != null)
         {
            _loc3_ = _loc2_.skillStrength + "%";
            if(_loc2_.skillStrength > this.skillStrength)
            {
               _loc3_ = "<font color=\'#00ff00\'>" + _loc3_ + "</font>";
            }
            _loc4_ = _loc2_.skillDefense + "%";
            if(_loc2_.skillDefense > this.skillDefense)
            {
               _loc4_ = "<font color=\'#00ff00\'>" + _loc4_ + "</font>";
            }
            _loc1_ = _loc1_.concat("<br>",StringUtil.substitute(FontNormal.Card_Rarity_Tooltip2,_loc3_,_loc4_));
         }
         return _loc1_;
      }
   }
}
