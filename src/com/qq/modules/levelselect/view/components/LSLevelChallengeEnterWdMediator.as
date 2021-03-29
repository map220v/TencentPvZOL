package com.qq.modules.levelselect.view.components
{
   import PVZ.Cmd.Dto_IdNum;
   import PVZ.Cmd.Dto_TD_ChallengeLevelInfo;
   import PVZ.Cmd.Dto_TD_RankInfo;
   import asgui.managers.PopUpManager;
   import asgui.managers.ToolTipManager;
   import asgui.utils.StringUtil;
   import com.qq.GameGloble;
   import com.qq.constant.QuickPayType;
   import com.qq.display.QAlert;
   import com.qq.managers.FilterManager;
   import com.qq.modules.bag.model.vo.BagProxy;
   import com.qq.modules.bag.model.vo.ItemVO;
   import com.qq.modules.bag.view.components.BagItemIcon;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.model.templates.ServerConfigTemplateFactory;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.levelselect.LSGlobals;
   import com.qq.modules.levelselect.command.LSProxyCmd;
   import com.qq.modules.levelselect.command.LSViewCmd;
   import com.qq.modules.levelselect.model.LSProxy;
   import com.qq.modules.levelselect.model.templates.LSChallengeFactory;
   import com.qq.modules.levelselect.model.templates.LSLevelTemplate;
   import com.qq.modules.levelselect.model.templates.LSLevelTemplateFactory;
   import com.qq.modules.levelselect.model.templates.ce.LSChallengeRankBonusTemplateCE;
   import com.qq.modules.levelselect.model.vo.LSChallengeScoreRankVO;
   import com.qq.modules.levelselect.model.vo.LSLevelInfoVO;
   import com.qq.modules.main.command.CommonCmd;
   import com.qq.modules.main.command.GameFlowCmd;
   import com.qq.modules.main.service.PrivilegeProxy;
   import com.qq.modules.main.service.ShortcutPayProxy;
   import com.qq.modules.mapinfo.command.MapInfoViewCmd;
   import com.qq.modules.shop.command.ShopCmd;
   import com.qq.templates.font.FontNormal;
   import com.qq.tooltip.ItemTooltip;
   import com.tencent.protobuf.Int64;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class LSLevelChallengeEnterWdMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:LSLevelChallengeEnterWd;
      
      [Inject]
      public var proxy:LSProxy;
      
      [Inject]
      public var shortcutProxy:ShortcutPayProxy;
      
      [Inject]
      public var privilegeProxy:PrivilegeProxy;
      
      [Inject]
      public var bagProxy:BagProxy;
      
      public var vo:LSLevelInfoVO;
      
      private var roleCellList:Vector.<LSLevelWdRankRoleCell>;
      
      private var bonusCellList:Vector.<LSLevelChallengeEnterBonusCell>;
      
      private var bonusIconList:Vector.<BagItemIcon>;
      
      private var _page:int;
      
      private var m_extendItem:ItemVO;
      
      public function LSLevelChallengeEnterWdMediator()
      {
         this.roleCellList = new Vector.<LSLevelWdRankRoleCell>();
         this.bonusCellList = new Vector.<LSLevelChallengeEnterBonusCell>();
         this.bonusIconList = new Vector.<BagItemIcon>();
         super();
      }
      
      override protected function init() : void
      {
         var _loc3_:LSLevelWdRankRoleCell = null;
         var _loc4_:int = 0;
         var _loc5_:LSChallengeAchivementIcon = null;
         var _loc6_:BagItemIcon = null;
         var _loc7_:LSLevelChallengeEnterBonusCell = null;
         super.init();
         this.m_extendItem = ItemVO.createByString(ServerConfigTemplateFactory.instance.sTDInheritNeedItem,":");
         this.updateInheritInfo();
         this.vo = this.proxy.getChallengeLevelInfo(this.view.levelId,this.view.subLevelId,this.view.challengeId);
         this.view.label_336.text = this.vo.stageId + "-" + this.vo.levelId + "-" + this.vo.subLevelId + " " + this.vo.challengeTemplate.name;
         var _loc1_:int = 0;
         while(_loc1_ < 3)
         {
            _loc3_ = new LSLevelWdRankRoleCell();
            _loc3_.visible = false;
            this.view.addChild(_loc3_);
            this.roleCellList.push(_loc3_);
            _loc3_.x = 65 + _loc1_ * _loc3_.width;
            _loc3_.bottom = 130.5;
            _loc3_.addEventListener(Event.SELECT,this.onCellSelect);
            _loc1_++;
         }
         var _loc2_:Array = this.vo.challengeTemplate.achievementIntro.split(",");
         _loc1_ = 0;
         while(_loc1_ < _loc2_.length)
         {
            _loc4_ = int(_loc2_[_loc1_]);
            _loc5_ = new LSChallengeAchivementIcon(_loc4_,_loc4_);
            this.view.boxAch.addChild(_loc5_);
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < 3)
         {
            _loc6_ = new BagItemIcon();
            this.bonusIconList.push(_loc6_);
            this.view.boxRankReward.addChild(_loc6_);
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < 3)
         {
            _loc7_ = new LSLevelChallengeEnterBonusCell();
            this.bonusCellList.push(_loc7_);
            this.view.addChild(_loc7_);
            _loc7_.x = 50;
            _loc7_.top = 138 + _loc1_ * 24;
            _loc7_.setBonusRank(_loc1_ + 1);
            _loc7_.selected = _loc1_ == 0;
            _loc1_++;
         }
         this.showRewardList(1);
         this.page = 0;
         if(GameGloble.actorModel.actorLevel < 22)
         {
            this.view.btnStart.enabled = false;
            this.view.btnStart.toolTip = "需要先通关该普通关卡并且达到22级";
         }
         else if(this.vo.remainFreeChallengeTimes + this.vo.remainPayChallengeTimes > 0)
         {
            this.view.btnStart.enabled = true;
            this.view.btnStart.toolTip = null;
         }
         else
         {
            this.view.btnStart.enabled = false;
            this.view.btnStart.toolTip = "本日挑战次数已用完";
         }
         this.view.l_free_times.text = this.vo.remainFreeChallengeTimes.toString() + "次";
         this.view.l_vip_times.text = this.vo.remainPayChallengeTimes.toString() + "次";
         ToolTipManager.RegisterToolTip(this.view.giftBtn,"前往挑战关卡排行");
      }
      
      private function updateInheritInfo() : void
      {
         var _loc1_:Dto_TD_ChallengeLevelInfo = this.proxy.getDto_TD_ChallengeLevelInfo(this.view.stageId,this.view.levelId,this.view.subLevelId,this.view.challengeId);
         this.view.btnExtend.enabled = _loc1_.isCanInherit == 1;
         this.view.btnExtend.toolTip = StringUtil.substitute(FontNormal.LS_STAGE_INHERIT_TOOLTIP,_loc1_.iLastWeekScore,this.m_extendItem.template.name,this.m_extendItem.amount);
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         addComponentListener(this.view.closeBtn,MouseEvent.CLICK,this.onClick);
         addComponentListener(this.view.btnStart,MouseEvent.CLICK,this.onClick);
         addComponentListener(this.view.imgBtnLevelReward,MouseEvent.CLICK,this.onClick);
         addComponentListener(this.view.imgBtnNormalMode,MouseEvent.CLICK,this.onClick);
         addComponentListener(this.view.imgBtnLeft,MouseEvent.CLICK,this.onClick);
         addComponentListener(this.view.imgBtnRight,MouseEvent.CLICK,this.onClick);
         addComponentListener(this.view.btnTop,MouseEvent.CLICK,this.onClick);
         addComponentListener(this.view.btnMe,MouseEvent.CLICK,this.onClick);
         addComponentListener(this.view.giftBtn,MouseEvent.CLICK,this.onClick);
         addComponentListener(this.view.btnExtend,MouseEvent.CLICK,this.onClick);
         var _loc1_:int = 0;
         while(_loc1_ < this.bonusCellList.length)
         {
            this.bonusCellList[_loc1_].addEventListener(MouseEvent.ROLL_OVER,this.onCellRollOver);
            _loc1_++;
         }
         addContextListener(LSGlobals.LS_GET_RANK,this.getRankHandler,CommonEvent);
         addContextListener(LSGlobals.LS_INHERIT_LAST_WEEK_SCORE,this.onInheritLastWeekScore);
      }
      
      private function onInheritLastWeekScore(param1:CommonEvent) : void
      {
         this.updateInheritInfo();
         this.getPageInfo();
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         var hasCount:int = 0;
         var event:MouseEvent = param1;
         switch(event.currentTarget)
         {
            case this.view.closeBtn:
               PopUpManager.RemovePopUp(this.view);
               this.dispose();
               break;
            case this.view.btnExtend:
               hasCount = this.bagProxy.getItemNumByItemID(this.m_extendItem.itemId);
               if(hasCount < this.m_extendItem.amount)
               {
                  ShopCmd.buyItemByItemID(this.m_extendItem.itemId,LSProxyCmd.inheritLastWeekScore,[this.vo.levelId,this.vo.subLevelId,this.vo.challengeLevelId]);
               }
               else
               {
                  LSProxyCmd.inheritLastWeekScore(this.vo.levelId,this.vo.subLevelId,this.vo.challengeLevelId);
               }
               break;
            case this.view.btnStart:
               if(GameGloble.actorModel.actorLevel < LSGlobals.LS_CHALLENGE_OPENED_LEVEL)
               {
                  QAlert.Show("小镇到" + LSGlobals.LS_CHALLENGE_OPENED_LEVEL + "级开放挑战关，加油升级哦！");
               }
               else if(this.vo.remainFreeChallengeTimes <= 0 && this.vo.remainPayChallengeTimes > 0)
               {
                  if(GameGloble.actorModel.isEnoughDiamond(ServerConfigTemplateFactory.instance.iChallengeCost,true))
                  {
                     if(!this.shortcutProxy.getFlag(QuickPayType.BUY_TD))
                     {
                        CommonCmd.confirmUseDiamond(FontNormal.TD_BUY_CHALLENGE_TIMES,ServerConfigTemplateFactory.instance.iChallengeCost,function():void
                        {
                           GameFlowCmd.gotoTD(proxy.data.stageId,view.levelId,view.subLevelId,view.challengeId);
                           PopUpManager.RemovePopUp(view);
                           dispose();
                        },null,0,true);
                     }
                     else
                     {
                        GameFlowCmd.gotoTD(this.proxy.data.stageId,this.view.levelId,this.view.subLevelId,this.view.challengeId);
                        PopUpManager.RemovePopUp(this.view);
                        this.dispose();
                     }
                  }
                  else
                  {
                     CommonCmd.showDiamondNotEnough(ServerConfigTemplateFactory.instance.iChallengeCost,true);
                  }
               }
               else if(this.vo.remainFreeChallengeTimes <= 0 && this.vo.remainPayChallengeTimes <= 0)
               {
                  QAlert.Show(FontNormal.TD_CHALLENGE_TIMES_USED);
               }
               else
               {
                  GameFlowCmd.gotoTD(this.proxy.data.stageId,this.view.levelId,this.view.subLevelId,this.view.challengeId);
                  PopUpManager.RemovePopUp(this.view);
                  this.dispose();
               }
               break;
            case this.view.imgBtnLevelReward:
               LSViewCmd.showChallengeBonusWd(2);
               break;
            case this.view.imgBtnNormalMode:
               PopUpManager.RemovePopUp(this.view);
               this.dispose();
               LSViewCmd.showLevelChallengeWd(this.view.levelId,this.view.subLevelId);
               break;
            case this.view.btnTop:
               this.page = 0;
               break;
            case this.view.btnMe:
               if(this.proxy.rankData)
               {
                  if(this.proxy.rankData.selfRank == 0)
                  {
                     QAlert.Show("您尚未进入排行榜");
                  }
                  else
                  {
                     this.page = int(this.proxy.rankData.selfRank / LSGlobals.RANK_PAGE_SIZE);
                  }
               }
               break;
            case this.view.imgBtnLeft:
               this.page = this._page - 1;
               break;
            case this.view.imgBtnRight:
               this.page = this._page + 1;
               break;
            case this.view.giftBtn:
               LSViewCmd.showChallengeRankWd(this.view.levelId,this.view.subLevelId,1,2);
         }
      }
      
      private function getPageInfo() : void
      {
         var _loc1_:LSLevelTemplate = LSLevelTemplateFactory.instance.getTemplateByChallengeId(this.proxy.data.stageId,this.vo.levelId,this.vo.subLevelId,this.vo.challengeLevelId);
         LSProxyCmd.getRank(this.vo.levelId,this.vo.subLevelId,_loc1_.challengeLevelId,this._page,LSGlobals.RANK_PAGE_SIZE);
      }
      
      private function set page(param1:int) : void
      {
         this._page = param1;
         this.refreshPageBtnStatus();
         this.getPageInfo();
      }
      
      private function refreshPageBtnStatus() : void
      {
         if(this._page <= 0)
         {
            this.view.imgBtnLeft.mouseEnabled = this.view.imgBtnLeft.mouseChildren = false;
            this.view.imgBtnLeft.filters = [FilterManager.getGaryFilter()];
         }
         else
         {
            this.view.imgBtnLeft.mouseEnabled = this.view.imgBtnLeft.mouseChildren = true;
            this.view.imgBtnLeft.filters = [];
         }
         if(this.proxy.rankData == null || this._page >= this.proxy.rankData.totalPageNum - 1)
         {
            this.view.imgBtnRight.mouseEnabled = this.view.imgBtnRight.mouseChildren = false;
            this.view.imgBtnRight.filters = [FilterManager.getGaryFilter()];
         }
         else
         {
            this.view.imgBtnRight.mouseEnabled = this.view.imgBtnRight.mouseChildren = true;
            this.view.imgBtnRight.filters = [];
         }
      }
      
      private function onCellRollOver(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.bonusCellList.length)
         {
            if(this.bonusCellList[_loc2_] == param1.currentTarget)
            {
               this.bonusCellList[_loc2_].selected = true;
               this.showRewardList(_loc2_ + 1);
            }
            else
            {
               this.bonusCellList[_loc2_].selected = false;
            }
            _loc2_++;
         }
      }
      
      private function showRewardList(param1:int) : void
      {
         var _loc3_:int = 0;
         var _loc4_:String = null;
         var _loc5_:Array = null;
         var _loc6_:Array = null;
         var _loc7_:Dto_IdNum = null;
         var _loc2_:LSChallengeRankBonusTemplateCE = LSChallengeFactory.instance.getRankBonusTemplateBySection(this.proxy.data.stageId,this.view.levelId,this.view.subLevelId,this.view.challengeId,param1,param1);
         if(_loc2_)
         {
            _loc3_ = 0;
            while(_loc3_ < this.bonusIconList.length)
            {
               this.bonusIconList[_loc3_].visible = false;
               _loc3_++;
            }
            _loc5_ = (_loc4_ = _loc2_.bonus).split(";");
            _loc3_ = 0;
            while(_loc3_ < _loc5_.length)
            {
               _loc6_ = _loc5_[_loc3_].split(":");
               (_loc7_ = new Dto_IdNum()).id = parseInt(_loc6_[0]);
               _loc7_.num = parseInt(_loc6_[1]);
               if(this.bonusIconList[_loc3_])
               {
                  this.bonusIconList[_loc3_].itemData = _loc7_;
                  this.bonusIconList[_loc3_].visible = true;
                  this.bonusIconList[_loc3_].toolTip = _loc7_.id.toString();
                  this.bonusIconList[_loc3_].toolTipClass = ItemTooltip;
               }
               _loc3_++;
            }
         }
      }
      
      private function getRankHandler(param1:CommonEvent) : void
      {
         var _loc4_:Dto_TD_RankInfo = null;
         var _loc5_:LSChallengeScoreRankVO = null;
         var _loc2_:Array = this.proxy.rankData.info;
         var _loc3_:int = 0;
         while(_loc3_ < this.roleCellList.length)
         {
            this.roleCellList[_loc3_].visible = false;
            _loc4_ = _loc2_[_loc3_] as Dto_TD_RankInfo;
            if(_loc2_[_loc3_])
            {
               (_loc5_ = new LSChallengeScoreRankVO()).rank = this._page * LSGlobals.RANK_PAGE_SIZE + _loc3_;
               _loc5_.level = _loc4_.level;
               _loc5_.roleId = _loc4_.roleId;
               _loc5_.roleName = _loc4_.name;
               _loc5_.score = _loc4_.score;
               _loc5_.QQFaceUrl = _loc4_.qQFaceUrl;
               _loc5_.faceId = _loc4_.faceId;
               this.roleCellList[_loc3_].visible = true;
               this.roleCellList[_loc3_].data = _loc5_;
            }
            _loc3_++;
         }
         this.refreshPageBtnStatus();
      }
      
      private function onCellSelect(param1:Event) : void
      {
         var _loc4_:Object = null;
         var _loc2_:int = this.roleCellList.indexOf(param1.currentTarget as LSLevelWdRankRoleCell);
         var _loc3_:Int64 = (this.proxy.rankData.info[_loc2_] as Dto_TD_RankInfo).roleId;
         if(_loc2_ == 0 && this._page == 0)
         {
            _loc4_ = {
               "stageId":this.proxy.data.stageId,
               "levelId":this.view.levelId,
               "subLevelId":this.view.subLevelId
            };
            MapInfoViewCmd.showMapRoleWndByChallenge(_loc3_,_loc4_);
         }
         else
         {
            MapInfoViewCmd.showMapRoleWndByRoleId(_loc3_);
         }
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
