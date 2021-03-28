package com.qq.modules.td.view.components
{
   import asgui.utils.StringUtil;
   import com.qq.CommandName;
   import com.qq.GameGloble;
   import com.qq.TDPrivilegeInfo;
   import com.qq.managers.FilterManager;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.model.templates.ServerConfigTemplateFactory;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.main.command.CommonCmd;
   import com.qq.modules.td.command.TDProxyCmd;
   import com.qq.modules.td.command.game.TDGameCmd;
   import com.qq.modules.td.command.ui.TDUICmd;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.model.TDStageInfo;
   import com.qq.modules.td.model.TDStartParam;
   import com.qq.modules.td.model.vo.TDCardData;
   import com.qq.templates.font.FontHKHB;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class TDSkillPlantPanelMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:TDSkillPlantPanel;
      
      public var useSkillPlantTimes:int;
      
      private var useFromSkillPanel:Boolean = false;
      
      private var m_trigger_on:Boolean = false;
      
      private var m_triggering:Boolean = false;
      
      public function TDSkillPlantPanelMediator()
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
         addContextListener(CommandName.TD_Init_SkillCardSlot_UI,this.onInit,CommonEvent);
         addContextListener(CommandName.TDGameEvent_EndlessTD_EnterChooseCard,this.onEnterChooseCardScreen,CommonEvent);
         addContextListener(CommandName.TDGameEnter_StartReadyTDGame,this.onStartReadyTDGame,CommonEvent);
         addContextListener(CommandName.TDGameEvent_StartTDGame,this.onStartTDGame,CommonEvent);
         addContextListener(CommandName.TD_CancelUseCard,this.onCancelCropPlant,CommonEvent);
         addContextListener(CommandName.TD_StartCardCooldown,this.onDoCropPlant,CommonEvent);
         addContextListener(CommandName.TD_ChangeRain,this.onChangeRain);
         addContextListener(CommandName.TD_UseSkillPlant,this.onUseSkillPlant);
      }
      
      private function onTriggerOver(param1:MouseEvent) : void
      {
         param1.stopImmediatePropagation();
         if(this.m_triggering)
         {
            return;
         }
         if(this.m_trigger_on)
         {
            return;
         }
         this.view.setContainerVisible(true);
      }
      
      private function onTriggerOut(param1:MouseEvent) : void
      {
         param1.stopImmediatePropagation();
         if(this.m_triggering)
         {
            return;
         }
         if(!this.m_trigger_on)
         {
            return;
         }
         this.view.setContainerVisible(false);
      }
      
      private function onInit(param1:Event) : void
      {
         var _loc3_:TDCardData = null;
         this.cleanAllCardSlot();
         var _loc2_:Array = TDGameInfo.getInstance().skillCardsData.slotCardData;
         for each(_loc3_ in _loc2_)
         {
            this.addCard(_loc3_);
         }
         this.view.updateLocation();
         if(TDStageInfo.getInstance().startParam.gameType == TDStartParam.Endless)
         {
            this.view.l_leftUseTimes.visible = false;
         }
         else
         {
            this.view.l_leftUseTimes.visible = true;
            this.updatePanelUseStatus();
         }
      }
      
      private function onEnterChooseCardScreen(param1:CommonEvent) : void
      {
         this.setCardCanUse(false);
         this.updateBuyStatus();
         this.view.updateLocation();
      }
      
      private function onStartReadyTDGame(param1:CommonEvent) : void
      {
         this.setCardCanUse(true);
      }
      
      private function onStartTDGame(param1:CommonEvent) : void
      {
         this.view.updateLocation();
      }
      
      private function setCardCanUse(param1:Boolean) : void
      {
         var _loc3_:TDSkillCard = null;
         var _loc2_:Array = this.view.cardList;
         for each(_loc3_ in _loc2_)
         {
            if(param1)
            {
               addComponentListener(_loc3_.plantImg,MouseEvent.CLICK,this.clickHandler);
            }
            else
            {
               removeComponentListener(_loc3_.plantImg,MouseEvent.CLICK,this.clickHandler);
            }
         }
      }
      
      private function updateBuyStatus() : void
      {
         var _loc1_:int = 0;
         var _loc2_:Array = null;
         var _loc3_:TDSkillCard = null;
         if(TDStageInfo.getInstance().startParam.gameType == TDStartParam.Endless)
         {
            _loc1_ = TDGameInfo.getInstance().rain.get();
            _loc2_ = this.view.cardList;
            for each(_loc3_ in _loc2_)
            {
               _loc3_.updateEnoughRain();
            }
         }
         else
         {
            _loc2_ = this.view.cardList;
            for each(_loc3_ in _loc2_)
            {
               _loc3_.updateEnoughTicket(GameGloble.actorModel.goldDiamond);
            }
         }
      }
      
      private function cleanAllCardSlot() : void
      {
         var _loc1_:TDSkillCard = null;
         for each(_loc1_ in this.view.cardList)
         {
            removeComponentListener(_loc1_.plantImg,MouseEvent.CLICK,this.clickHandler);
         }
         this.view.cardList.length = 0;
      }
      
      private function addCard(param1:TDCardData) : void
      {
         var _loc2_:TDSkillCard = new TDSkillCard(param1);
         this.view.addCard(_loc2_);
         _loc2_.setUseEnvironment(TDStageInfo.getInstance().startParam.gameType == TDStartParam.Endless);
      }
      
      private function useCard(param1:int) : void
      {
         var _loc3_:TDSkillCard = null;
         var _loc2_:Array = this.view.cardList;
         for each(_loc3_ in _loc2_)
         {
            if(_loc3_.cardData.plantStaticInfo.type == param1)
            {
               if(TDStageInfo.getInstance().startParam.gameType == TDStartParam.Endless)
               {
                  TDGameCmd.changeRain(-_loc3_.cardData.plantStaticInfo.baseInfo.costWater);
                  TDProxyCmd.useSkillPlant(param1);
                  _loc3_.selected = false;
                  _loc3_.startCoolDown();
               }
               else
               {
                  this.useFromSkillPanel = false;
                  if(!GameGloble.actorModel.isEnoughDiamond(_loc3_.cardData.plantStaticInfo.baseInfo.costDiamond,true))
                  {
                     CommonCmd.txtFly("金钻不足");
                  }
                  else
                  {
                     TDProxyCmd.useSkillPlantByDiamond(param1);
                     for each(_loc3_ in _loc2_)
                     {
                        _loc3_.selected = false;
                     }
                     ++this.useSkillPlantTimes;
                  }
               }
            }
         }
      }
      
      private function updatePanelUseStatus() : void
      {
         var _loc1_:TDSkillCard = null;
         this.view.l_leftUseTimes.text = StringUtil.substitute(FontHKHB.TD_SKILL_PLANT_USE_TIMES_LIMIT,ServerConfigTemplateFactory.instance.getTDSkillPlantUseTimes() - this.useSkillPlantTimes);
         if(TDPrivilegeInfo.getInstance().hasTDPrivilege)
         {
            if(this.useSkillPlantTimes >= ServerConfigTemplateFactory.instance.getTDSkillPlantUseTimes())
            {
               for each(_loc1_ in this.view.cardList)
               {
                  _loc1_.setTimesUsed(true);
                  _loc1_.filters = [FilterManager.getGaryFilter()];
                  _loc1_.enabled = false;
                  _loc1_.toolTip = "使用次数已用完";
               }
            }
         }
         else
         {
            for each(_loc1_ in this.view.cardList)
            {
               _loc1_.setTimesUsed(true);
               _loc1_.filters = [FilterManager.getGaryFilter()];
               _loc1_.enabled = false;
               _loc1_.toolTip = "需要拥有塔防特权才能使用哦";
            }
         }
      }
      
      protected function clickHandler(param1:MouseEvent) : void
      {
         var _loc2_:TDSkillCard = null;
         var _loc3_:TDSkillCard = null;
         for each(_loc3_ in this.view.cardList)
         {
            if(_loc3_.plantImg == param1.currentTarget)
            {
               _loc2_ = _loc3_;
            }
         }
         if(!_loc2_.isCoolDown())
         {
            if(TDStageInfo.getInstance().startParam.gameType == TDStartParam.Endless)
            {
               if(_loc2_.cardData.plantStaticInfo.baseInfo.costWater <= TDGameInfo.getInstance().rain.get())
               {
                  TDUICmd.startPlantSettingByID(_loc2_.cardData.plantStaticInfo.type,this.view.id,true,null,false);
                  _loc2_.selected = true;
               }
            }
            else
            {
               if(!TDPrivilegeInfo.getInstance().hasTDPrivilege)
               {
                  return;
               }
               if(this.useSkillPlantTimes >= ServerConfigTemplateFactory.instance.getTDSkillPlantUseTimes())
               {
                  return;
               }
               if(GameGloble.actorModel.isEnoughDiamond(_loc2_.cardData.plantStaticInfo.baseInfo.costDiamond,true))
               {
                  this.useFromSkillPanel = true;
                  TDUICmd.startPlantSettingByID(_loc2_.cardData.plantStaticInfo.type,this.view.id,true,null,false);
                  _loc2_.selected = true;
               }
               else
               {
                  CommonCmd.txtFly("金钻不足");
               }
            }
         }
      }
      
      private function onChangeRain(param1:CommonEvent) : void
      {
         this.updateBuyStatus();
      }
      
      private function onUseSkillPlant(param1:CommonEvent) : void
      {
         if(TDStageInfo.getInstance().startParam.gameType != TDStartParam.Endless)
         {
            this.useSkillPlantTimes = ServerConfigTemplateFactory.instance.getTDSkillPlantUseTimes() - int(param1.param);
            this.updatePanelUseStatus();
         }
      }
      
      private function onCancelCropPlant(param1:CommonEvent) : void
      {
         var _loc3_:TDSkillCard = null;
         var _loc2_:Array = this.view.cardList;
         for each(_loc3_ in _loc2_)
         {
            _loc3_.selected = false;
         }
      }
      
      private function onDoCropPlant(param1:CommonEvent) : void
      {
         var _loc2_:int = param1.readCustomParam_Number("plantType");
         if(TDStageInfo.getInstance().startParam.gameType == TDStartParam.Endless)
         {
            this.useCard(_loc2_);
         }
         else if(this.useFromSkillPanel)
         {
            this.useCard(_loc2_);
         }
      }
      
      override public function dispose() : void
      {
         this.cleanAllCardSlot();
         super.dispose();
      }
   }
}
