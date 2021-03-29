package com.qq.modules.levelselect.view.components
{
   import PVZ.Cmd.Dto_TD_ChallengeLevelInfo;
   import com.qq.CommandName;
   import com.qq.GameGloble;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.levelselect.LSGlobals;
   import com.qq.modules.levelselect.command.LSViewCmd;
   import com.qq.modules.levelselect.model.LSProxy;
   import com.qq.modules.levelselect.model.templates.LSLevelTemplateFactory;
   import com.qq.modules.main.command.GameFlowCmd;
   import com.qq.modules.main.model.ActorModel;
   import com.qq.templates.font.FontHKHB;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class LevelSelectMainCtMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:LevelSelectMainCt;
      
      [Inject]
      public var proxy:LSProxy;
      
      private var _curSelectStageID:int;
      
      private var _stageBtnList:Array;
      
      public function LevelSelectMainCtMediator()
      {
         super();
      }
      
      override protected function init() : void
      {
         var _loc1_:int = 0;
         var _loc2_:LSMapStageIcon = null;
         var _loc3_:int = 0;
         super.init();
         this._curSelectStageID = -1;
         this._stageBtnList = new Array();
         _loc1_ = 0;
         while(_loc1_ < ActorModel.MAX_STAGE)
         {
            _loc2_ = new LSMapStageIcon(_loc1_ + 1,false);
            this._stageBtnList.push(_loc2_);
            _loc3_ = LSLevelTemplateFactory.instance.getMaxChallengeStageId();
            if(_loc1_ + 1 <= _loc3_)
            {
               _loc2_.setChallengeLevel(true);
            }
            else
            {
               _loc2_.setChallengeLevel(false);
            }
            this.view.menuStage.addChild(_loc2_);
            _loc1_++;
         }
         this.view.menuBtns.addChild(new LSMainIcon(FontHKHB.TD_TICKET,"#93C0D9",2));
         this.view.menuBtns.addChild(new LSMainIcon(FontHKHB.ACHIEVEMENT,"#93C0D9",1));
         this.onGetChallengeLevelInfo(null);
      }
      
      override protected function initListener() : void
      {
         var _loc2_:LSMapStageIcon = null;
         super.initListener();
         this.addContextListener(LSGlobals.LS_STAGE_INFO_UPDATED,this.onStageUpdate);
         var _loc1_:int = 0;
         while(_loc1_ < ActorModel.MAX_STAGE)
         {
            _loc2_ = this._stageBtnList[_loc1_];
            addComponentListener(_loc2_,MouseEvent.CLICK,this.onClickStageBtn);
            _loc1_++;
         }
         addComponentListener(this.view.btnRetrun,MouseEvent.CLICK,this.onClick);
         addContextListener(CommandName.ChangeLevel,this.refresh);
         addContextListener(CommandName.LS_SELECT_STAGE_ENTER,this.lsSelectStageEnterHandler);
         addContextListener(LSGlobals.LS_STAGE_INFO_UPDATED,this.refresh);
         addContextListener(LSGlobals.LS_GET_CHALLENGE_LEVEL_INFO,this.onGetChallengeLevelInfo);
      }
      
      override protected function initialized() : void
      {
         super.initialized();
         LSViewCmd.showScoreWindow();
      }
      
      override public function reset(param1:Object = null) : void
      {
         super.reset(param1);
         var _loc2_:int = int(param1);
         if(_loc2_ > 0)
         {
            this._curSelectStageID = _loc2_;
         }
         this.refresh();
      }
      
      private function refresh(param1:Event = null) : void
      {
         this.refreshStageButtonState();
         LSViewCmd.enterStage(this._curSelectStageID);
         this.proxy.recordLastStageId = 0;
      }
      
      private function lsSelectStageEnterHandler(param1:CommonEvent = null) : void
      {
         var _loc3_:LSMapStageIcon = null;
         this._curSelectStageID = int(param1.param);
         LSViewCmd.enterStage(this._curSelectStageID);
         var _loc2_:int = 0;
         while(_loc2_ < ActorModel.MAX_STAGE)
         {
            _loc3_ = this._stageBtnList[_loc2_];
            if(_loc2_ == this._curSelectStageID - 1)
            {
               _loc3_.setSelected(true);
            }
            else
            {
               _loc3_.setSelected(false);
            }
            _loc2_++;
         }
      }
      
      private function onGetChallengeLevelInfo(param1:CommonEvent) : void
      {
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         var _loc4_:Dto_TD_ChallengeLevelInfo = null;
         var _loc5_:LSMapStageIcon = null;
         if(this.proxy.challengeLevelInfo)
         {
            _loc2_ = [];
            _loc3_ = 0;
            while(_loc3_ < this.proxy.challengeLevelInfo.length)
            {
               if((_loc4_ = this.proxy.challengeLevelInfo[_loc3_]).remainTimes > 0)
               {
                  if(_loc2_[_loc4_.stageId] != null)
                  {
                     _loc2_[_loc4_.stageId] += 1;
                  }
                  else
                  {
                     _loc2_[_loc4_.stageId] = 1;
                  }
               }
               _loc3_++;
            }
            _loc3_ = 0;
            while(_loc3_ < ActorModel.MAX_STAGE)
            {
               if((_loc5_ = this._stageBtnList[_loc3_]).hasChallengeLevel() && _loc2_[_loc3_ + 1] != null)
               {
                  _loc5_.setChallengeTimes(_loc2_[_loc3_ + 1]);
               }
               _loc3_++;
            }
         }
      }
      
      private function refreshStageButtonState() : void
      {
         var _loc3_:LSMapStageIcon = null;
         var _loc1_:int = GameGloble.actorModel.getTDOpenedStageID();
         if(this.proxy.recordLastStageId > 0)
         {
            this._curSelectStageID = this.proxy.recordLastStageId;
         }
         var _loc2_:int = 0;
         while(_loc2_ < ActorModel.MAX_STAGE)
         {
            _loc3_ = this._stageBtnList[_loc2_];
            if(this.proxy.data && this.proxy.data.hasSwapTD && (_loc2_ == 0 || _loc2_ == 1))
            {
               _loc3_.setEnabled(true);
            }
            else if(_loc1_ >= _loc2_ + 1)
            {
               _loc3_.setEnabled(true);
            }
            else
            {
               _loc3_.setEnabled(false);
            }
            if(this._curSelectStageID == -1 && _loc1_ == _loc2_ + 1)
            {
               this._curSelectStageID = _loc1_;
               _loc3_.setSelected(true);
            }
            _loc2_++;
         }
      }
      
      private function onClickStageBtn(param1:MouseEvent) : void
      {
         var _loc4_:LSMapStageIcon = null;
         var _loc2_:LSMapStageIcon = param1.currentTarget as LSMapStageIcon;
         if(_loc2_ == null || !_loc2_.isEnabled() || _loc2_.isSelected())
         {
            return;
         }
         var _loc3_:int = 0;
         while(_loc3_ < ActorModel.MAX_STAGE)
         {
            if((_loc4_ = this._stageBtnList[_loc3_]) == param1.currentTarget)
            {
               _loc4_.setSelected(true);
               this._curSelectStageID = _loc3_ + 1;
            }
            else
            {
               _loc4_.setSelected(false);
            }
            _loc3_++;
         }
         LSViewCmd.enterStage(this._curSelectStageID);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.currentTarget)
         {
            case this.view.btnRetrun:
               GameFlowCmd.gotoCity();
         }
      }
      
      private function onStageUpdate(param1:CommonEvent = null) : void
      {
         this.refreshStageButtonState();
      }
      
      override public function dispose() : void
      {
         this._stageBtnList = null;
         super.dispose();
      }
   }
}
