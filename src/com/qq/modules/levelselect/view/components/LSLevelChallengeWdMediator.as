package com.qq.modules.levelselect.view.components
{
   import PVZ.Cmd.Dto_TD_RankInfo;
   import asgui.controls.Alert;
   import asgui.events.CloseEvent;
   import asgui.utils.StringUtil;
   import com.qq.constant.ItemID;
   import com.qq.data.DataCacheManager;
   import com.qq.display.QAlert;
   import com.qq.managers.FilterManager;
   import com.qq.modules.bag.model.vo.ItemVO;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.guidePlus.GuideContext;
   import com.qq.modules.guidePlus.command.GuideViewCmd;
   import com.qq.modules.levelselect.LSGlobals;
   import com.qq.modules.levelselect.command.LSProxyCmd;
   import com.qq.modules.levelselect.command.LSViewCmd;
   import com.qq.modules.levelselect.model.LSProxy;
   import com.qq.modules.levelselect.model.templates.LSLevelTemplate;
   import com.qq.modules.levelselect.model.templates.LSLevelTemplateFactory;
   import com.qq.modules.levelselect.model.vo.LSChallengeScoreRankVO;
   import com.qq.modules.levelselect.model.vo.LSLevelInfoVO;
   import com.qq.modules.levelselect.view.maps.LSAwardPlantIcon;
   import com.qq.modules.levelselect.view.maps.LSMapSunSmallIcon;
   import com.qq.modules.main.command.GameFlowCmd;
   import com.qq.modules.main.constant.PrivilegeConst;
   import com.qq.modules.main.model.AddictInfo;
   import com.qq.modules.main.service.PrivilegeProxy;
   import com.qq.modules.mapinfo.command.MapInfoViewCmd;
   import com.qq.modules.td.data.game.unit.TDPlantBaseStaticInfo;
   import com.qq.templates.font.FontHKHB;
   import com.qq.templates.font.FontNormal;
   import com.qq.utils.db.ClientDBTableName;
   import com.tencent.protobuf.Int64;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class LSLevelChallengeWdMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:LSLevelChallengeWd;
      
      [Inject]
      public var proxy:LSProxy;
      
      [Inject]
      public var privilegeProxy:PrivilegeProxy;
      
      public var vo:LSLevelInfoVO;
      
      private var _awardPlant:LSAwardPlantIcon;
      
      private var _rankCellVec:Vector.<LSLevelWdRankRoleCell>;
      
      private var _page:int;
      
      public function LSLevelChallengeWdMediator()
      {
         this._rankCellVec = new Vector.<LSLevelWdRankRoleCell>();
         super();
      }
      
      override protected function init() : void
      {
         var _loc1_:int = 0;
         var _loc2_:Number = NaN;
         var _loc3_:int = 0;
         var _loc4_:String = null;
         var _loc5_:int = 0;
         var _loc6_:LSLevelAchivementIcon = null;
         var _loc7_:LSLevelWdRankRoleCell = null;
         var _loc8_:ItemVO = null;
         var _loc9_:TDPlantBaseStaticInfo = null;
         super.init();
         this.vo = this.proxy.getLevelInfo(this.view.levelId,this.view.subLevelId);
         this.view.title = FontHKHB.LEVEL + " " + this.vo.template.levelId + " - " + this.vo.template.subLevelId;
         this.view.firstCoin.text = "* " + StringUtil.substitute(FontHKHB.FIRST_COIN,this.vo.template.firstCoin);
         if(this.privilegeProxy.hasPrivilege(PrivilegeConst.PRIVILEGE_FUBEN_TD_COIN_ADD))
         {
            _loc2_ = this.privilegeProxy.getPrivilegeParamById(PrivilegeConst.PRIVILEGE_FUBEN_TD_COIN_ADD);
            _loc3_ = this.vo.template.bonusCoin * (_loc2_ * 0.0001);
            _loc4_ = this.vo.template.bonusCoin + "+" + _loc3_ + FontHKHB.BONUS_COIN_ARG;
            this.view.txtBonusCoin.text = "* " + StringUtil.substitute(FontHKHB.BONUS_COIN,_loc4_);
         }
         else
         {
            this.view.txtBonusCoin.text = "* " + StringUtil.substitute(FontHKHB.BONUS_COIN,this.vo.template.bonusCoin);
         }
         _loc1_ = 0;
         while(_loc1_ < this.vo.template.achievementList.length)
         {
            _loc5_ = this.vo.template.achievementList[_loc1_][0];
            _loc6_ = new LSLevelAchivementIcon(_loc5_,_loc1_,this.vo.getAchievementUnlocked(_loc5_),this.vo.template);
            this.view.boxAch.addChild(_loc6_);
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < 3)
         {
            _loc7_ = new LSLevelWdRankRoleCell();
            this.view.addChild(_loc7_);
            this._rankCellVec.push(_loc7_);
            _loc7_.x = 65 + _loc1_ * _loc7_.width;
            _loc7_.bottom = 119.5;
            _loc7_.addEventListener(Event.SELECT,this.onCellSelect);
            _loc1_++;
         }
         if(this.vo.template.bonusExp > 0)
         {
            this.view.panelRightBox.addChild(new LSMapSunSmallIcon(LSMapSunSmallIcon.TYPE_EXP,AddictInfo.getInstance().updateAddictRewardNum(ItemID.Exp,this.vo.template.bonusExp)));
         }
         if(this.vo.template.bonusItemVec.length > 0)
         {
            for each(_loc8_ in this.vo.template.bonusItemVec)
            {
               this.view.panelItemsBox.addChild(new LSMapSunSmallIcon(_loc8_.itemId,_loc8_.amount));
            }
         }
         if(this.vo.template.bonusPlant > 0)
         {
            if((_loc9_ = DataCacheManager.getInstance().getTemplateDataById(ClientDBTableName.Table_PlantTypeInfo,this.vo.template.bonusPlant,TDPlantBaseStaticInfo)) != null)
            {
               this._awardPlant = new LSAwardPlantIcon();
               this._awardPlant.plantId = this.vo.template.bonusPlant;
               this.view.plantCav.addChild(this._awardPlant);
            }
         }
         this.page = 0;
         if(this.vo.passed)
         {
            this.view.imgBtnChallenge.addEventListener(MouseEvent.CLICK,this.onClick);
            this.view.imgBtnChallenge.filters = [];
            this.view.imgBtnChallenge.toolTip = null;
         }
         else
         {
            this.view.imgBtnChallenge.removeEventListener(MouseEvent.CLICK,this.onClick);
            this.view.imgBtnChallenge.filters = [FilterManager.getGaryFilter()];
            this.view.imgBtnChallenge.toolTip = "先通过普通模式，才能进入挑战模式哦！";
         }
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         this.view.btnWinDebug.addEventListener(MouseEvent.CLICK,this.onClick);
         this.view.btnGo.addEventListener(MouseEvent.CLICK,this.onClick);
         this.view.btnTop.addEventListener(MouseEvent.CLICK,this.onClick);
         this.view.btnMe.addEventListener(MouseEvent.CLICK,this.onClick);
         this.view.imgBtnLeft.addEventListener(MouseEvent.CLICK,this.onClick);
         this.view.imgBtnRight.addEventListener(MouseEvent.CLICK,this.onClick);
         addContextListener(LSGlobals.LS_GET_RANK,this.getRankHandler,CommonEvent);
      }
      
      protected function onClick(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         switch(e.currentTarget)
         {
            case this.view.btnGo:
               this.vo = this.proxy.getLevelInfo(this.view.levelId,this.view.subLevelId);
               if(this.vo.starsGot == this.vo.template.achievementList.length)
               {
                  var closeHandler:Function = function(param1:CloseEvent):void
                  {
                     if(param1.detail == Alert.YES)
                     {
                        GameFlowCmd.gotoTD(proxy.data.stageId,view.levelId,view.subLevelId);
                     }
                  };
                  QAlert.Show(FontNormal.LS_PLAY_PASSED_LEVEL_TIP,"",Alert.YES | Alert.NO,null,closeHandler);
               }
               else
               {
                  GameFlowCmd.gotoTD(this.proxy.data.stageId,this.view.levelId,this.view.subLevelId);
               }
               this.view.Close();
               break;
            case this.view.btnWinDebug:
               LSProxyCmd.finishLevel(this.vo.stageId,this.vo.levelId,this.vo.subLevelId,1,[]);
               this.view.Close();
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
            case this.view.imgBtnChallenge:
               LSViewCmd.showLevelChallengeEnterWd(this.view.levelId,this.view.subLevelId);
               this.view.Close();
               break;
            case this.view.imgBtnLeft:
               this.page = this._page - 1;
               break;
            case this.view.imgBtnRight:
               this.page = this._page + 1;
         }
      }
      
      private function getPageInfo() : void
      {
         var _loc1_:LSLevelTemplate = LSLevelTemplateFactory.instance.getTemplateByChallengeId(this.proxy.data.stageId,this.vo.levelId,this.vo.subLevelId,1);
         LSProxyCmd.getRank(this.vo.levelId,this.vo.subLevelId,_loc1_.challengeLevelId,this._page,LSGlobals.RANK_PAGE_SIZE);
      }
      
      private function getRankHandler(param1:CommonEvent) : void
      {
         var _loc4_:Dto_TD_RankInfo = null;
         var _loc5_:LSChallengeScoreRankVO = null;
         var _loc2_:Array = this.proxy.rankData.info;
         var _loc3_:int = 0;
         while(_loc3_ < this._rankCellVec.length)
         {
            this._rankCellVec[_loc3_].visible = false;
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
               this._rankCellVec[_loc3_].visible = true;
               this._rankCellVec[_loc3_].data = _loc5_;
            }
            _loc3_++;
         }
         this.refreshPageBtnStatus();
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
      
      override protected function initialized() : void
      {
         super.initialized();
         GuideViewCmd.changeContext(GuideContext.TD_SELECT_WINDOW);
      }
      
      private function onCellSelect(param1:Event) : void
      {
         var _loc4_:Object = null;
         var _loc2_:int = this._rankCellVec.indexOf(param1.currentTarget as LSLevelWdRankRoleCell);
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
         if(this._awardPlant)
         {
            this._awardPlant.Dispose();
            this._awardPlant = null;
         }
         GuideViewCmd.changeContext(GuideContext.lastContext);
         super.dispose();
      }
   }
}
