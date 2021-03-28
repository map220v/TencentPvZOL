package com.qq.modules.td.view.components
{
   import PVZ.Cmd.Dto_TalentInfo;
   import asgui.managers.PopUpManager;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.main.model.SettingsModel;
   import com.qq.modules.main.model.settings.battle.ce.BattleLineupCardTemp;
   import com.qq.modules.main.model.settings.plantTalent.PlantTalentSetting;
   import com.qq.modules.plantTalent.command.PlantTalentCmd;
   import com.qq.modules.plantTalent.model.PlantTalentModel;
   import com.qq.modules.plantTalent.service.PlantTalentService;
   import com.qq.modules.td.data.game.unit.TDPlantBaseStaticInfo;
   import com.qq.modules.td.logic.talent.constant.TalentAdvancedConditionType;
   import com.qq.utils.UrlManager;
   import flash.events.MouseEvent;
   
   public class TalentAdvancedWindowMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:TalentAdvancedWindow;
      
      [Inject]
      public var settingModel:SettingsModel;
      
      [Inject]
      public var ptModel:PlantTalentModel;
      
      [Inject]
      public var plantTalentService:PlantTalentService;
      
      private var m_talentId:uint;
      
      private var m_condType:uint;
      
      public function TalentAdvancedWindowMediator()
      {
         super();
      }
      
      override protected function init() : void
      {
         super.init();
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         addComponentListener(this.view.closeBtn,MouseEvent.CLICK,this.onClose);
         addComponentListener(this.view.btnAdvanced,MouseEvent.CLICK,this.onAdvance);
         addComponentListener(this.view.l_power,MouseEvent.CLICK,this.onPower);
         addComponentListener(this.view.l_condition,MouseEvent.CLICK,this.onCondition);
      }
      
      private function onClose(param1:MouseEvent) : void
      {
         PopUpManager.RemovePopUp(this.view);
         this.view.Dispose();
      }
      
      private function onAdvance(param1:MouseEvent) : void
      {
         PlantTalentCmd.studyTalent(this.m_talentId);
         this.onClose(null);
      }
      
      private function onPower(param1:MouseEvent) : void
      {
         PlantTalentCmd.addLinkGuide(TalentAdvancedConditionType.POWER);
         this.onClose(null);
      }
      
      private function onCondition(param1:MouseEvent) : void
      {
         var _loc2_:PlantTalentSetting = this.settingModel.plantTalentSets.getPlantTalentSetById(this.m_talentId);
         var _loc3_:uint = _loc2_.getConditionType();
         var _loc4_:Array = _loc2_.advancedCond.split(":");
         var _loc5_:Array = [];
         var _loc6_:int = 1;
         while(_loc6_ < _loc4_.length)
         {
            if(_loc4_[_loc6_])
            {
               _loc5_.push(parseInt(_loc4_[_loc6_]));
            }
            _loc6_++;
         }
         PlantTalentCmd.addLinkGuide(_loc3_,_loc5_);
         this.onClose(null);
      }
      
      override public function reset(param1:Object = null) : void
      {
         var _loc2_:PlantTalentSetting = null;
         var _loc3_:BattleLineupCardTemp = null;
         var _loc4_:TDPlantBaseStaticInfo = null;
         var _loc5_:Dto_TalentInfo = null;
         if(param1)
         {
            this.m_talentId = param1 as uint;
            _loc2_ = this.settingModel.plantTalentSets.getPlantTalentSetById(this.m_talentId);
            this.view.avater.data = _loc2_.plantId;
            _loc3_ = this.settingModel.battleCardSkillSetting.getBattleLineupCardTemplateByTdPlantId(_loc2_.plantId);
            if(_loc3_)
            {
               this.view.avater.setBattleCardAssetUrl(_loc3_,0);
            }
            else
            {
               this.view.avater.setTdAssetUrl(_loc2_.plantId);
            }
            _loc4_ = this.settingModel.TDPlantSetting.getPlantBaseInfoByID(_loc2_.plantId);
            this.view.l_plantName.text = _loc4_.name;
            this.view.l_ability.text = _loc2_.desc;
            this.view.l_abilityName.text = _loc2_.name;
            this.view.l_power.text = _loc2_.power.toString();
            this.view.icon.source = UrlManager.getUrl(UrlManager.Url_PlantTalentIcon,_loc2_.icon + ".png");
            this.view.l_condition.text = _loc2_.condName;
            this.view.l_condition.toolTip = _loc2_.condDesc;
            if((_loc5_ = this.ptModel.getTalentInfoById(this.m_talentId)) && _loc5_.satisfyPower && _loc5_.satisfyCondition && (_loc2_.parentTalentId == 0 || this.ptModel.hasTalentStudyed(_loc2_.plantId,_loc2_.parentTalentId)))
            {
               this.view.btnAdvanced.enabled = true;
            }
            else
            {
               if(!this.ptModel.hasTalentStudyed(_loc2_.plantId,_loc2_.parentTalentId))
               {
                  this.view.btnAdvanced.toolTip = "需要先学习前置天赋";
               }
               else
               {
                  this.view.btnAdvanced.toolTip = null;
               }
               this.view.btnAdvanced.enabled = false;
            }
            if(_loc5_ && (_loc5_.hasStudy || _loc5_.satisfyPower))
            {
               this.view.l_power.SetStyle("color","#63F5F0");
            }
            else
            {
               this.view.l_power.SetStyle("color","#ff0000");
            }
            if(_loc5_ && (_loc5_.hasStudy || _loc5_.satisfyCondition))
            {
               this.view.l_condition.SetStyle("color","#00ff22");
            }
            else
            {
               this.view.l_condition.SetStyle("color","#ff0000");
            }
         }
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
