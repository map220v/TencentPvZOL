package com.qq.modules.levelselect.view.components
{
   import PVZ.Cmd.E_RankType;
   import asgui.managers.PopUpManager;
   import com.qq.display.QCanvas;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.levelselect.LSGlobals;
   import com.qq.modules.levelselect.command.LSProxyCmd;
   import com.qq.modules.levelselect.model.LSProxy;
   import com.qq.modules.rank.RankGlobal;
   import com.qq.modules.rank.command.RankProxyCmd;
   import com.qq.modules.rank.model.RankProxy;
   import com.qq.utils.func.setGrayEnabled;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class LSChallengeRankWdMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:LSChallengeRankWd;
      
      [Inject]
      public var rankProxy:RankProxy;
      
      [Inject]
      public var lsProxy:LSProxy;
      
      public const PAGE_SIZE:uint = 10;
      
      private var scoreWd:LSChallengeRankScoreWd;
      
      private var levelWd:LSChallengeRankLevelWd;
      
      private var _curWd:QCanvas;
      
      private var _curWdIndex:int = -1;
      
      private var m_currentPage:int;
      
      private var m_totalPage:int = 1;
      
      public function LSChallengeRankWdMediator()
      {
         super();
      }
      
      override protected function init() : void
      {
         super.init();
         if(this.view.selectTab == 1)
         {
            this.onTab1(null);
         }
         else
         {
            this.onTab2(null);
         }
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         addComponentListener(this.view.tab_1,MouseEvent.CLICK,this.onTab1);
         addComponentListener(this.view.tab_2,MouseEvent.CLICK,this.onTab2);
         addComponentListener(this.view.closeBtn,MouseEvent.CLICK,this.onClose);
         addComponentListener(this.view.btnEnd,MouseEvent.CLICK,this.onEndClick);
         addComponentListener(this.view.btnLeft,MouseEvent.CLICK,this.onLeftClick);
         addComponentListener(this.view.btnRight,MouseEvent.CLICK,this.onRightClick);
         addComponentListener(this.view.btnStart,MouseEvent.CLICK,this.onStartClick);
         addComponentListener(this.view.btnJump,MouseEvent.CLICK,this.onJumpClick);
         addComponentListener(this.view.txtInput,Event.CHANGE,this.onPageInputChange);
         addContextListener(RankGlobal.EVENT_RANK_LIST_UPDATE,this.onRankListUpdate,CommonEvent);
         addContextListener(LSGlobals.LS_GET_RANK,this.getRankHandler,CommonEvent);
      }
      
      private function onRankListUpdate(param1:CommonEvent) : void
      {
         this.m_totalPage = Math.max(1,Math.ceil(this.rankProxy.totalCount / RankGlobal.PAGE_BOUNDS));
         this.updatePage();
      }
      
      private function getRankHandler(param1:CommonEvent) : void
      {
         this.m_totalPage = Math.max(1,this.lsProxy.rankData.totalPageNum);
         this.updatePage();
      }
      
      public function switchPanel(param1:int = 0) : void
      {
         if(this._curWdIndex == param1)
         {
            return;
         }
         if(this._curWdIndex != -1)
         {
            if(this.view.panelCanv.contains(this._curWd))
            {
               this.view.panelCanv.removeChild(this._curWd);
            }
         }
         if(this._curWdIndex != param1)
         {
            if(param1 == 0)
            {
               if(this.scoreWd == null)
               {
                  this.scoreWd = new LSChallengeRankScoreWd();
               }
               this._curWd = this.scoreWd;
            }
            else
            {
               if(this.levelWd == null)
               {
                  this.levelWd = new LSChallengeRankLevelWd(this.lsProxy.data.stageId,this.view.levelId,this.view.subLevelId,this.view.challengeId);
               }
               this._curWd = this.levelWd;
            }
            this._curWdIndex = param1;
            this.view.panelCanv.addChild(this._curWd);
            this.currentPage = 1;
         }
      }
      
      public function onTab1(param1:MouseEvent) : void
      {
         this.view.tab_1.gotoAndStop(2);
         this.view.tab_2.gotoAndStop(1);
         this.view.l_tab_1.SetStyle("color","#feff5c");
         this.view.l_tab_1.SetStyle("textShadowColor","#ea7e19");
         this.view.l_tab_2.SetStyle("color","#f8bf70");
         this.view.l_tab_2.SetStyle("textShadowColor","#0");
         this.switchPanel(0);
      }
      
      public function onTab2(param1:MouseEvent) : void
      {
         this.view.tab_1.gotoAndStop(1);
         this.view.tab_2.gotoAndStop(2);
         this.view.l_tab_2.SetStyle("color","#feff5c");
         this.view.l_tab_2.SetStyle("textShadowColor","#ea7e19");
         this.view.l_tab_1.SetStyle("color","#f8bf70");
         this.view.l_tab_1.SetStyle("textShadowColor","#0");
         this.switchPanel(1);
      }
      
      private function onClose(param1:MouseEvent) : void
      {
         PopUpManager.impl.RemovePopUp(this.view);
         this.dispose();
      }
      
      private function onEndClick(param1:MouseEvent) : void
      {
         this.currentPage = this.m_totalPage;
      }
      
      private function onLeftClick(param1:MouseEvent) : void
      {
         this.currentPage = this.m_currentPage - 1;
      }
      
      private function onRightClick(param1:MouseEvent) : void
      {
         this.currentPage = this.m_currentPage + 1;
      }
      
      private function onStartClick(param1:MouseEvent) : void
      {
         this.currentPage = 1;
      }
      
      private function onJumpClick(param1:MouseEvent) : void
      {
         var _loc2_:int = parseInt(this.view.txtInput.text);
         if(_loc2_ > 0)
         {
            this.currentPage = _loc2_;
         }
      }
      
      private function onPageInputChange(param1:Event) : void
      {
         var _loc2_:int = parseInt(this.view.txtInput.text);
         if(_loc2_ > this.m_totalPage)
         {
            this.view.txtInput.text = this.m_totalPage.toString();
         }
         else if(_loc2_ <= 0)
         {
            this.view.txtInput.text = "1";
         }
      }
      
      private function set currentPage(param1:int) : void
      {
         if(param1 > this.m_totalPage)
         {
            param1 = this.m_totalPage;
         }
         else if(param1 <= 0)
         {
            param1 = 1;
         }
         if(this.m_currentPage != param1)
         {
            this.m_currentPage = param1;
         }
         this.updatePage();
         this.queryList();
      }
      
      private function updatePage() : void
      {
         this.view.txtPage.text = this.m_currentPage + "/" + this.m_totalPage;
         setGrayEnabled(this.view.btnEnd,this.m_currentPage != this.m_totalPage);
         setGrayEnabled(this.view.btnRight,this.m_currentPage != this.m_totalPage);
         setGrayEnabled(this.view.btnStart,this.m_currentPage != 1);
         setGrayEnabled(this.view.btnLeft,this.m_currentPage != 1);
      }
      
      private function queryList() : void
      {
         if(this._curWdIndex == 0)
         {
            RankProxyCmd.querySelfList(E_RankType.E_RankType_RoleAchievement);
            RankProxyCmd.queryRankList(E_RankType.E_RankType_RoleAchievement,this.m_currentPage);
         }
         else
         {
            LSProxyCmd.getRank(this.view.levelId,this.view.subLevelId,this.view.challengeId,this.m_currentPage - 1,this.PAGE_SIZE);
         }
      }
      
      private function updateView() : void
      {
         this.updatePage();
      }
      
      override public function dispose() : void
      {
         if(this.scoreWd)
         {
            this.scoreWd.Dispose();
            this.scoreWd = null;
         }
         if(this.levelWd)
         {
            this.levelWd.Dispose();
            this.levelWd = null;
         }
         super.dispose();
      }
   }
}
