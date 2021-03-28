package com.qq.modules.td.view.chooseCard.friendCard
{
   import com.greensock.TweenLite;
   import com.greensock.TweenMax;
   import com.qq.CommandName;
   import com.qq.GameGloble;
   import com.qq.data.DataCacheManager;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.model.templates.ServerConfigTemplateFactory;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.main.constant.PrivilegeConst;
   import com.qq.modules.main.model.SettingsModel;
   import com.qq.modules.main.model.settings.achievement.ce.TDAchievementInfoTemplate;
   import com.qq.modules.main.service.PrivilegeProxy;
   import com.qq.modules.roleInfo.model.templates.ce.FriendshipInfoTemplateCE;
   import com.qq.modules.td.command.TDProxyCmd;
   import com.qq.modules.td.command.game.TDGameFlowCmd;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.logic.trigger.TDTriggerManager;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.model.TDStageInfo;
   import com.qq.modules.td.model.vo.TDCardData;
   import com.qq.modules.td.model.vo.TDDataVO;
   import com.qq.modules.td.view.ui.TDAchievementCt;
   import com.qq.templates.font.FontHKHB;
   import com.qq.templates.font.FontNormal;
   import com.qq.utils.CommandDispatcher;
   import com.qq.utils.db.ClientDBTableName;
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import tencent.base.utils.StringUtil;
   
   public class TDChooseFriendCardPanelMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:TDChooseFriendCardPanel;
      
      [Inject]
      public var settingsModel:SettingsModel;
      
      [Inject]
      public var privilegeProxy:PrivilegeProxy;
      
      [Inject]
      public var tdDataVO:TDDataVO;
      
      private var cacheCardListPanelY:Number;
      
      private var _entering:Boolean;
      
      private var lastParent:DisplayObjectContainer;
      
      public function TDChooseFriendCardPanelMediator()
      {
         super();
      }
      
      override protected function initListener() : void
      {
         addContextListener(CommandName.TDGameEvent_EnterChooseFriendCardScreen,this.onEnterChooseFriendCardScreen,CommonEvent);
         addContextListener(CommandName.TDGameEnter_StartReadyTDGame,this.onStartReadyTDGame,CommonEvent);
         addContextListener(CommandName.TDGameEvent_BackToChooseCardScreen,this.onBackToChooseCardScreen,CommonEvent);
         addContextListener(CommandName.TDGameEvent_EndlessTD_BackToChooseCardScreen,this.onBackToChooseCardScreen,CommonEvent);
         addContextListener(CommandName.TDGameEvent_RestartGame,this.onRestartGame,CommonEvent);
         addContextListener(CommandName.TD_ChangeChoosePlant,this.onChangeChosencard,CommonEvent);
         addComponentListener(this.view.okBtn,MouseEvent.CLICK,this.clickHandler);
         addComponentListener(this.view.prevBtn,MouseEvent.CLICK,this.clickHandler);
         addComponentListener(this.view.pager,Event.CHANGE,this.onChangePage);
         addComponentListener(GameGloble.stage,Event.RESIZE,this.onResize);
      }
      
      private function onChangePage(param1:Event) : void
      {
         TDProxyCmd.requestFriendCardInfo(Math.max(0,this.view.pager.currentPage - 1));
      }
      
      private function clickHandler(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:* = undefined;
         switch(param1.currentTarget)
         {
            case this.view.okBtn:
               TDSoundCmd.clickStartGame();
               TweenLite.to(this.view,0.3,{
                  "x":-this.view.width,
                  "alpha":0,
                  "onComplete":this.readyTDGameHandler
               });
               break;
            case this.view.prevBtn:
               _loc2_ = this.view.cardChooseListPanel.cardBox.numChildren;
               _loc3_ = 0;
               while(_loc3_ < _loc2_)
               {
                  if((_loc4_ = this.view.cardChooseListPanel.cardBox.getChildAt(_loc3_)) is TDBeChoosedFriendCard)
                  {
                     CommandDispatcher.send(CommandName.TD_CancelChooseFriendCard,{
                        "chooseCard":_loc4_,
                        "needFly":-1
                     });
                  }
                  _loc3_++;
               }
               TweenLite.to(this.view.cardListPanel,0.3,{
                  "y":this.cacheCardListPanelY - 30,
                  "alpha":0,
                  "onComplete":this.backToChooseHandler
               });
               TweenLite.to(this.view.cardChooseListPanel,0.3,{
                  "y":-30,
                  "alpha":0
               });
         }
      }
      
      public function readyTDGameHandler() : void
      {
         TDGameInfo.getInstance().addCardToSlot(this.view.vipCard.cardData);
         TDGameFlowCmd.readyTDGame();
      }
      
      public function backToChooseHandler() : void
      {
         TDGameFlowCmd.backToChooseCardScreen();
      }
      
      private function checkEnable() : void
      {
         this.view.okBtn.enabled = true;
      }
      
      private function showAchievementPanel() : void
      {
         var _loc1_:Array = null;
         var _loc2_:int = 0;
         var _loc3_:TDAchievementCt = null;
         var _loc4_:TDAchievementInfoTemplate = null;
         if(this.view.achievementBox.numChildren == 0)
         {
            _loc1_ = TDTriggerManager.instance.getTriggerListByString(TDStageInfo.getInstance().achievementInfo,TDGameInfo.getInstance().achievementList);
            _loc2_ = 0;
            while(_loc2_ < _loc1_.length)
            {
               _loc3_ = new TDAchievementCt();
               _loc3_.width = 200;
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
      
      private function onRestartGame(param1:CommonEvent) : void
      {
         this.view.x = GameGloble.stage.stageWidth;
         this.setVisible(false);
      }
      
      private function onChangeChosencard(param1:CommonEvent) : void
      {
         this.refresh();
      }
      
      private function refresh() : void
      {
         var _loc8_:TDCardData = null;
         this.checkEnable();
         var _loc1_:FriendshipInfoTemplateCE = DataCacheManager.getInstance().getTemplateDataById(ClientDBTableName.FriendshipInfoTemplate,GameGloble.actorModel.actorLevel,FriendshipInfoTemplateCE) as FriendshipInfoTemplateCE;
         if(_loc1_ == null)
         {
            return;
         }
         var _loc2_:int = 1;
         var _loc3_:* = "";
         var _loc4_:int = 0;
         var _loc5_:Array = TDGameInfo.getInstance().friendCardsData.slotCardData;
         _loc4_ = _loc1_.addFriendPoint * _loc5_.length;
         var _loc6_:int = _loc1_.addFriendPoint * _loc2_;
         this.view.friendPointTipText.text = StringUtil.substitute(FontHKHB.TD_FriendPointTip,_loc4_,_loc6_);
         var _loc7_:int = 0;
         while(_loc7_ < _loc5_.length)
         {
            _loc8_ = _loc5_[_loc7_];
            _loc3_ += _loc8_.friendInfoData.name;
            if(_loc7_ != _loc5_.length - 1)
            {
               _loc3_ += " , ";
            }
            _loc7_++;
         }
         if(_loc4_ > 0)
         {
            this.view.resultText.htmlText = StringUtil.substitute(FontNormal.TD_Str_ChooseFriendCardResult,_loc3_,_loc4_);
         }
         else
         {
            this.view.resultText.htmlText = "";
         }
         this.view.pager.currentPage = this.tdDataVO.curPage;
         this.view.pager.totalPage = this.tdDataVO.totalPage;
      }
      
      private function onEnterChooseFriendCardScreen(param1:CommonEvent) : void
      {
         this.checkEnable();
         this.onResize(null);
         this.view.x = 0;
         this.view.alpha = 1;
         this.setVisible(true);
         this.view.cardListPanel.visible = true;
         this.view.cardChooseListPanel.visible = true;
         if(!this._entering)
         {
            this.view.cardListPanel.alpha = 0;
            this.view.cardChooseListPanel.alpha = 0;
            this.cacheCardListPanelY = this.view.cardListPanel.y;
            this.view.cardListPanel.y = this.cacheCardListPanelY - 30;
            this.onFinishShowChooseCardPanel();
            this.view.cardChooseListPanel.y = -30;
            this._entering = true;
            TweenLite.to(this.view.cardListPanel,0.3,{
               "alpha":1,
               "y":this.cacheCardListPanelY,
               "onComplete":this.onFinishShowChooseCardPanel
            });
            TweenLite.to(this.view.cardChooseListPanel,0.3,{
               "alpha":1,
               "y":0
            });
         }
         this.view.resultText.text = "";
         var _loc2_:TDCardData = new TDCardData(GameGloble.actorModel.getUnlockPlant(ServerConfigTemplateFactory.instance.tdVipPlantID));
         _loc2_.cardSourceType = TDCardData.CARD_SOURCE_VIP;
         _loc2_.isCanUse = this.privilegeProxy.hasPrivilege(PrivilegeConst.PRIVILEGE_TD_EXCLUSIVE_PLANT);
         this.view.vipCard.cardData = _loc2_;
         this.refresh();
      }
      
      private function onFinishShowChooseCardPanel() : void
      {
         this._entering = false;
         TDGameFlowCmd.finishEnterChooseFriendCardScreen();
      }
      
      private function onBackToChooseCardScreen(param1:CommonEvent) : void
      {
         this.setVisible(false);
         this.view.cardListPanel.y = this.cacheCardListPanelY;
      }
      
      private function onStartReadyTDGame(param1:CommonEvent) : void
      {
         TweenMax.to(this.view,0.5,{
            "y":GameGloble.TDScreenH,
            "onComplete":this.onFinishHideChooseCardPanel
         });
      }
      
      private function onFinishHideChooseCardPanel() : void
      {
         this.setVisible(false);
         TDGameFlowCmd.startBackToWarfield();
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
