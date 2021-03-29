package com.qq.modules.levelselect.view.components
{
   import asgui.managers.PopUpManager;
   import asgui.managers.ToolTipManager;
   import com.qq.constant.ls.LSConstant;
   import com.qq.display.QCanvas;
   import com.qq.managers.FilterManager;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.levelselect.LSGlobals;
   import com.qq.modules.levelselect.command.LSProxyCmd;
   import com.qq.modules.levelselect.model.LSProxy;
   import com.qq.utils.CommandDispatcher;
   import com.qq.utils.UtilsManager;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.utils.Dictionary;
   
   public class LSChallengeBonusWindowMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:LSChallengeBonusWindow;
      
      [Inject]
      public var lsProxy:LSProxy;
      
      private var TAB_TYPE_LIST:Array;
      
      private var TAB_PANEL_CLS_LIST:Array;
      
      private var m_curTabPanel:QCanvas;
      
      private var m_curTabType:uint;
      
      private var tabPanelDic:Dictionary;
      
      private var tabTagCheckerDic:Dictionary;
      
      public function LSChallengeBonusWindowMediator()
      {
         this.TAB_TYPE_LIST = [LSConstant.LS_CHALLENGE_WEEKLY_BONUS,LSConstant.LS_CHALLENGE_PROMOTION_BONUS];
         this.TAB_PANEL_CLS_LIST = [LSChallengeWeeklyBonusWindow,LSChallengePromotionBonusWindow];
         this.tabPanelDic = new Dictionary();
         this.tabTagCheckerDic = new Dictionary();
         super();
      }
      
      override protected function init() : void
      {
         super.init();
         this.registerPanel();
         this.registerChecker();
         this.view.initTabList(this.TAB_TYPE_LIST);
         this.refreshTag();
         LSProxyCmd.getOldPromotionRewardInfo();
      }
      
      private function registerPanel() : void
      {
         var _loc2_:QCanvas = null;
         var _loc1_:int = 0;
         while(_loc1_ < this.TAB_TYPE_LIST.length)
         {
            if(this.TAB_PANEL_CLS_LIST[_loc1_])
            {
               _loc2_ = new this.TAB_PANEL_CLS_LIST[_loc1_]() as QCanvas;
               this.tabPanelDic[this.TAB_TYPE_LIST[_loc1_]] = _loc2_;
            }
            _loc1_++;
         }
      }
      
      private function registerChecker() : void
      {
         this.tabTagCheckerDic[LSConstant.LS_CHALLENGE_WEEKLY_BONUS] = this.lsProxy.checkChallengeWeeklyBonusTag;
         this.tabTagCheckerDic[LSConstant.LS_CHALLENGE_PROMOTION_BONUS] = this.lsProxy.checkChallengePromotionBonusTag;
      }
      
      override protected function initListener() : void
      {
         var _loc1_:LSChallengeBonusTabCell = null;
         super.initListener();
         addContextListener(LSGlobals.LS_GET_RANK_REWARD_INFO,this.onGetRankInfo,CommonEvent);
         addContextListener(LSGlobals.LS_GET_PROMOTION_REWARD_INFO,this.onGetPromotionInfo,CommonEvent);
         addContextListener(LSGlobals.LS_GET_OLD_PROMOTION_REWARD_INFO,this.onGetOldPromotionInfo,CommonEvent);
         addComponentListener(this.view.closeBtn,MouseEvent.CLICK,this.onClose);
         addComponentListener(this.view.btnGetHistory,MouseEvent.CLICK,this.onGetHistory);
         for each(_loc1_ in this.view.vecTabCellList)
         {
            addComponentListener(_loc1_,MouseEvent.CLICK,this.onCellClick);
         }
      }
      
      private function onGetRankInfo(param1:CommonEvent) : void
      {
         this.refreshTag();
      }
      
      private function onGetPromotionInfo(param1:CommonEvent) : void
      {
         this.refreshTag();
      }
      
      private function onGetOldPromotionInfo(param1:CommonEvent) : void
      {
         var _loc2_:Boolean = param1.param as Boolean;
         if(_loc2_)
         {
            this.view.btnGetHistory.filters = [];
            ToolTipManager.RegisterToolTip(this.view.btnGetHistory,"领取2015年8月25日前所有挑战关累计的全部个人晋级奖励");
            addComponentListener(this.view.btnGetHistory,MouseEvent.CLICK,this.onGetHistory);
         }
         else
         {
            this.view.btnGetHistory.filters = [FilterManager.getGaryFilter()];
            ToolTipManager.RegisterToolTip(this.view.btnGetHistory,"当前无奖励可领取");
            removeComponentListener(this.view.btnGetHistory,MouseEvent.CLICK,this.onGetHistory);
         }
      }
      
      private function onClose(param1:Event) : void
      {
         PopUpManager.RemovePopUp(this.view);
         this.view.Dispose();
      }
      
      private function onGetHistory(param1:Event) : void
      {
         LSProxyCmd.takeOldPromotionReward();
         this.view.btnGetHistory.filters = [FilterManager.getGaryFilter()];
         ToolTipManager.RegisterToolTip(this.view.btnGetHistory,"当前无奖励可领取");
         removeComponentListener(this.view.btnGetHistory,MouseEvent.CLICK,this.onGetHistory);
      }
      
      private function onCellClick(param1:MouseEvent) : void
      {
         var _loc2_:LSChallengeBonusTabCell = param1.currentTarget as LSChallengeBonusTabCell;
         this.curTabType = _loc2_.tabType;
      }
      
      override public function reset(param1:Object = null) : void
      {
         if(param1 == null)
         {
            this.curTabType = LSConstant.LS_CHALLENGE_WEEKLY_BONUS;
         }
         else
         {
            this.curTabType = param1 as uint;
         }
      }
      
      private function set curTabType(param1:uint) : void
      {
         var _loc2_:LSChallengeBonusTabCell = null;
         this.m_curTabType = param1;
         for each(_loc2_ in this.view.vecTabCellList)
         {
            if(_loc2_.tabType != this.m_curTabType)
            {
               _loc2_.selected = false;
            }
            else
            {
               _loc2_.selected = true;
            }
         }
         if(this.m_curTabPanel)
         {
            UtilsManager.removeFromContainer(this.m_curTabPanel);
         }
         this.m_curTabPanel = this.tabPanelDic[this.m_curTabType];
         this.view.cv_tabPanel.addChild(this.m_curTabPanel);
         var _loc3_:int = this.TAB_TYPE_LIST.indexOf(this.m_curTabType);
         UtilsManager.bringToTop(this.view.cv_tabPanel);
         CommandDispatcher._dispatcher.addEventListener(LSGlobals.BONUS_WINDOW_CLOSE,this.onClose);
      }
      
      private function refreshTag() : void
      {
         var _loc1_:LSChallengeBonusTabCell = null;
         var _loc2_:Function = null;
         var _loc3_:Boolean = false;
         for each(_loc1_ in this.view.vecTabCellList)
         {
            _loc2_ = this.tabTagCheckerDic[_loc1_.tabType];
            if(_loc2_ != null)
            {
               _loc3_ = _loc2_();
               _loc1_.hasReward = _loc3_;
            }
            else
            {
               _loc1_.hasReward = false;
            }
         }
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
