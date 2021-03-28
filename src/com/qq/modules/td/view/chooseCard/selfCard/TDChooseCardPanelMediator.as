package com.qq.modules.td.view.chooseCard.selfCard
{
   import com.greensock.TweenLite;
   import com.greensock.TweenMax;
   import com.qq.CommandName;
   import com.qq.GameGloble;
   import com.qq.TDPrivilegeInfo;
   import com.qq.constant.QuickPayType;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.main.model.SettingsModel;
   import com.qq.modules.main.model.settings.achievement.ce.TDAchievementInfoTemplate;
   import com.qq.modules.main.service.ShortcutPayProxy;
   import com.qq.modules.td.command.game.TDGameFlowCmd;
   import com.qq.modules.td.command.ui.TDUICmd;
   import com.qq.modules.td.logic.trigger.TDTriggerManager;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.model.TDStageInfo;
   import com.qq.modules.td.model.TDStartParam;
   import com.qq.modules.td.view.ui.TDAchievementCt;
   import com.qq.templates.font.FontHKHB;
   import com.qq.templates.font.FontNormal;
   import com.qq.utils.external.QExternalUtil;
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import tencent.base.utils.StringUtil;
   
   public class TDChooseCardPanelMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:TDChooseCardPanel;
      
      [Inject]
      public var settingsModel:SettingsModel;
      
      [Inject]
      public var shortcutPayProxy:ShortcutPayProxy;
      
      private var _isHasInit:Boolean = false;
      
      private var cacheCardListPanelY:int;
      
      private var cacheCardListChoosePanelY:int;
      
      private var lastParent:DisplayObjectContainer;
      
      public function TDChooseCardPanelMediator()
      {
         super();
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
      
      override protected function init() : void
      {
         super.init();
         if(TDPrivilegeInfo.getInstance().hasTDPrivilege)
         {
            this.view.selectCBSun.gotoAndStop(2);
            TDGameInfo.getInstance().autoCollectSun(true);
         }
         else
         {
            this.view.selectCBSun.gotoAndStop(1);
            TDGameInfo.getInstance().autoCollectSun(false);
         }
         if(this.shortcutPayProxy.flags.indexOf(QuickPayType.BUY_TD) < 0 || this.shortcutPayProxy.getFlag(QuickPayType.BUY_TD) == false)
         {
            this.view.selectCBPay.gotoAndStop(2);
            if(this.shortcutPayProxy.flags.indexOf(QuickPayType.BUY_TD) < 0)
            {
               TDGameInfo.getInstance().openPayAlert(true);
            }
         }
         else
         {
            this.view.selectCBPay.gotoAndStop(1);
         }
         this.refreshDiamond(null);
      }
      
      override protected function initListener() : void
      {
         addContextListener(CommandName.TD_ChangeChoosePlant,this.onChangeChosencard,CommonEvent);
         addContextListener(CommandName.TDGameEvent_EnterChooseCardScreen,this.onEnterChooseCardScreen,CommonEvent);
         addContextListener(CommandName.TDGameEvent_EnterChooseFriendCardScreen,this.onEnterChooseFriendCardScreen,CommonEvent);
         addContextListener(CommandName.TDGameEvent_BackToChooseCardScreen,this.onBackToChooseCardScreen,CommonEvent);
         addContextListener(CommandName.TDGameEvent_RestartGame,this.onRestartGame,CommonEvent);
         addComponentListener(this.view.okBtn,MouseEvent.CLICK,this.clickHandler);
         addComponentListener(this.view.privilegeImageBtn,MouseEvent.CLICK,this.clickHandler);
         addComponentListener(this.view.selectCBSun,MouseEvent.CLICK,this.clickHandler);
         addComponentListener(this.view.selectCBPay,MouseEvent.CLICK,this.clickHandler);
         addComponentListener(this.view.diamondBar.buyBar,MouseEvent.CLICK,this.clickHandler);
         addContextListener(CommandName.ChangeGoldDiamond,this.refreshDiamond);
         addContextListener(CommandName.TDGameEnter_StartReadyTDGame,this.onStartReadyTDGame,CommonEvent);
         addContextListener(CommandName.TD_GET_UNLOCK_PLANT_INFO,this.onPrivilegeUpdate,CommonEvent);
         addComponentListener(GameGloble.stage,Event.RESIZE,this.onResize);
      }
      
      private function clickHandler(param1:MouseEvent) : void
      {
         var _loc2_:Number = NaN;
         switch(param1.currentTarget)
         {
            case this.view.okBtn:
               _loc2_ = this.cacheCardListPanelY - 30;
               TweenLite.to(this.view.cardAllListPanel,0.3,{
                  "alpha":0,
                  "y":_loc2_
               });
               _loc2_ = this.cacheCardListChoosePanelY - 30;
               TweenLite.to(this.view.externCardChoosenListPanel,0.3,{
                  "alpha":0,
                  "y":_loc2_ + 3
               });
               TweenLite.to(this.view.cardChoosenListPanel,0.3,{
                  "alpha":0,
                  "y":_loc2_,
                  "onComplete":this.switchPanelHandler
               });
               break;
            case this.view.privilegeImageBtn:
               TDUICmd.showPrivilegeWindow();
               break;
            case this.view.selectCBPay:
               if(TDGameInfo.getInstance().payAlertOpen)
               {
                  this.view.selectCBPay.gotoAndStop(1);
                  TDGameInfo.getInstance().openPayAlert(false);
               }
               else
               {
                  this.view.selectCBPay.gotoAndStop(2);
                  TDGameInfo.getInstance().openPayAlert(true);
               }
               break;
            case this.view.selectCBSun:
               if(TDPrivilegeInfo.getInstance().hasTDPrivilege)
               {
                  if(TDGameInfo.getInstance().sunAutoCollect)
                  {
                     this.view.selectCBSun.gotoAndStop(1);
                     TDGameInfo.getInstance().autoCollectSun(false);
                  }
                  else
                  {
                     this.view.selectCBSun.gotoAndStop(2);
                     TDGameInfo.getInstance().autoCollectSun(true);
                  }
               }
               else
               {
                  TDUICmd.showPrivilegeWindow();
               }
               break;
            case this.view.diamondBar.buyBar:
               QExternalUtil.showPay(GameGloble.actorModel.actorName);
         }
      }
      
      private function refreshDiamond(param1:CommonEvent) : void
      {
         this.view.diamondBar.setValue(GameGloble.actorModel.totalDiamond,true);
         this.view.diamondBar.toolTip = StringUtil.substitute(FontNormal.RoleInfo_Tooltip_GiftDiamond,GameGloble.actorModel.totalDiamond);
      }
      
      private function switchPanelHandler() : void
      {
         if(TDStageInfo.getInstance().startParam.gameType == TDStartParam.Daily)
         {
            TDGameFlowCmd.readyTDGame();
         }
         else
         {
            TDGameFlowCmd.loadFriendCardInfo();
         }
         this.setVisible(false);
      }
      
      private function checkEnable() : void
      {
         var _loc1_:Boolean = false;
         var _loc2_:Array = TDStageInfo.getInstance().getAvailablePlantList();
         if(TDGameInfo.getInstance().normalCardsData.getCardSlotIndex() == -1 || _loc2_.length <= TDGameInfo.getInstance().normalCardsData.slotCardData.length)
         {
            _loc1_ = true;
         }
         this.view.okBtn.enabled = _loc1_;
      }
      
      private function onRestartGame(param1:CommonEvent) : void
      {
         this.setVisible(false);
      }
      
      private function onChangeChosencard(param1:CommonEvent) : void
      {
         this.checkEnable();
      }
      
      private function onEnterChooseFriendCardScreen(param1:CommonEvent) : void
      {
         this.setVisible(false);
      }
      
      private function onEnterChooseCardScreen(param1:CommonEvent) : void
      {
         this.setVisible(true);
         this.checkEnable();
         this.showPanel();
      }
      
      private function showPanel() : void
      {
         this.view.cardChoosenListPanel.width = TDGameInfo.getInstance().normalCardsData.maxSlotNum * 54 + 57;
         this.view.cardChoosenListPanel.x = (this.view.width - this.view.cardChoosenListPanel.width) * 0.5;
         this.view.externCardChoosenListPanel.width = 73;
         this.onResize(null);
         this.view.x = -this.view.width;
         this.view.cardAllListPanel.visible = false;
         this.view.cardChoosenListPanel.visible = false;
         this.view.externCardChoosenListPanel.visible = false;
         if(!this._isHasInit)
         {
            this.cacheCardListPanelY = this.view.cardAllListPanel.y;
            this.cacheCardListChoosePanelY = this.view.cardChoosenListPanel.y;
            this._isHasInit = true;
         }
         TweenMax.to(this.view,0.5,{
            "x":0,
            "onComplete":this.showContent
         });
         this.showAchievementPanel();
      }
      
      private function showAchievementPanel() : void
      {
         var _loc1_:Array = null;
         var _loc2_:int = 0;
         var _loc3_:TDAchievementCt = null;
         var _loc4_:TDAchievementInfoTemplate = null;
         if(this.view.achievementBox.numChildren == 0 && TDGameInfo.getInstance().achievementList && TDGameInfo.getInstance().achievementList.length > 0)
         {
            _loc1_ = TDTriggerManager.instance.getTriggerListByString(TDStageInfo.getInstance().achievementInfo,TDGameInfo.getInstance().achievementList);
            _loc2_ = 0;
            while(_loc2_ < _loc1_.length)
            {
               _loc3_ = new TDAchievementCt();
               _loc3_.width = 250;
               _loc4_ = this.settingsModel.plantAchievementSettings.getAchievementInfoById(_loc1_[_loc2_][0]);
               _loc3_.setData(_loc1_[_loc2_][0],_loc4_.getDesc(TDStageInfo.getInstance().achievementList),2);
               this.view.achievementBox.addChild(_loc3_);
               if(_loc1_[_loc2_][1] == true)
               {
                  _loc3_.txt.text = FontHKHB.SUCCESS;
               }
               _loc2_++;
            }
         }
      }
      
      private function onBackToChooseCardScreen(param1:CommonEvent) : void
      {
         this.setVisible(true);
         this.checkEnable();
         this.showContent();
      }
      
      private function showContent() : void
      {
         this.view.cardAllListPanel.visible = true;
         this.view.cardChoosenListPanel.visible = true;
         this.view.cardAllListPanel.alpha = 0;
         this.view.cardChoosenListPanel.alpha = 0;
         this.view.cardAllListPanel.y = this.cacheCardListPanelY - 30;
         this.view.cardChoosenListPanel.y = this.cacheCardListChoosePanelY - 30;
         this.view.externCardChoosenListPanel.y = this.view.cardChoosenListPanel.y + 3;
         var _loc1_:Number = this.cacheCardListPanelY;
         TweenLite.to(this.view.cardAllListPanel,0.3,{
            "alpha":1,
            "y":_loc1_
         });
         _loc1_ = this.cacheCardListChoosePanelY;
         TweenLite.to(this.view.cardChoosenListPanel,0.3,{
            "alpha":1,
            "y":_loc1_,
            "onComplete":this.onFinishShowContent
         });
         this.view.setUnlockPanelVisible(true);
         if(TDPrivilegeInfo.getInstance().hasTDPrivilege)
         {
            TDGameInfo.getInstance().normalCardsData.maxSlotNum = TDStageInfo.getInstance().originalCardSlotNum.get() + 1;
            this.view.privilegeWordMC.gotoAndStop(2);
            this.view.cardChoosenListPanel.x = (this.view.width - this.view.cardChoosenListPanel.width) * 0.5 - 27;
            this.view.externCardChoosenListPanel.toolTip = null;
            this.view.privilegeImageBtn.toolTip = null;
            this.view.collectSunMC.toolTip = null;
         }
         else
         {
            this.view.privilegeWordMC.gotoAndStop(1);
            this.view.externCardChoosenListPanel.toolTip = FontNormal.TD_PRIVILEGE_EXTERN_CARD_TIPS;
            this.view.privilegeImageBtn.toolTip = FontNormal.TD_PRIVILEGE_ENTRY_ICON_TIPS;
            this.view.collectSunMC.toolTip = FontNormal.TD_PRIVILEGE_AUTO_COLLECT_SUN_TIPS;
         }
         TweenLite.to(this.view.externCardChoosenListPanel,0.3,{
            "alpha":1,
            "y":_loc1_ + 3,
            "onComplete":this.onFinishShowContent
         });
         this.view.externCardChoosenListPanel.x = this.view.cardChoosenListPanel.x + this.view.cardChoosenListPanel.width - 2;
         dispatch(new CommonEvent(CommandName.TD_PRIVILEGE_CHANGED));
      }
      
      private function onFinishShowContent() : void
      {
         TDGameFlowCmd.finishEnterChoosePlantCardScreen();
      }
      
      private function onStartReadyTDGame(param1:CommonEvent) : void
      {
         TweenMax.to(this.view,0.5,{"y":GameGloble.TDScreenH});
      }
      
      private function onPrivilegeUpdate(param1:CommonEvent) : void
      {
         if(TDPrivilegeInfo.getInstance().hasTDPrivilege)
         {
            TDGameInfo.getInstance().normalCardsData.maxSlotNum = TDStageInfo.getInstance().originalCardSlotNum.get() + 1;
            this.view.privilegeWordMC.gotoAndStop(2);
            this.view.cardChoosenListPanel.x = (this.view.width - this.view.cardChoosenListPanel.width) * 0.5 - 27;
            this.view.selectCBSun.gotoAndStop(2);
            TDGameInfo.getInstance().autoCollectSun(true);
            this.view.externCardChoosenListPanel.toolTip = null;
            this.view.privilegeImageBtn.toolTip = null;
            this.view.collectSunMC.toolTip = null;
         }
         else
         {
            this.view.privilegeWordMC.gotoAndStop(1);
            this.view.selectCBSun.gotoAndStop(1);
            TDGameInfo.getInstance().autoCollectSun(false);
            this.view.externCardChoosenListPanel.toolTip = FontNormal.TD_PRIVILEGE_EXTERN_CARD_TIPS;
            this.view.privilegeImageBtn.toolTip = FontNormal.TD_PRIVILEGE_ENTRY_ICON_TIPS;
            this.view.collectSunMC.toolTip = FontNormal.TD_PRIVILEGE_AUTO_COLLECT_SUN_TIPS;
         }
         dispatch(new CommonEvent(CommandName.TD_PRIVILEGE_CHANGED));
      }
      
      public function setVisible(param1:Boolean) : void
      {
         this.view.visible = param1;
         if(param1)
         {
            if(this.view.parent == null)
            {
               this.lastParent.addChild(this.view);
            }
         }
         else if(this.view.parent)
         {
            this.lastParent = this.view.parent;
            this.lastParent.removeChild(this.view);
         }
      }
      
      private function onResize(param1:Event) : void
      {
         this.view.y = (GameGloble.stage.stageHeight - this.view.height) * 0.5;
      }
   }
}
