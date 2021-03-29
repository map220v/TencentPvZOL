package com.qq.modules.levelselect.view.components
{
   import PVZ.Cmd.E_RewardState;
   import asgui.managers.ToolTipManager;
   import com.qq.CommandName;
   import com.qq.constant.ItemID;
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
   import com.qq.modules.levelselect.model.templates.ce.LSChallengeScoreBonusTemplateCE;
   import com.qq.modules.levelselect.model.vo.LSChallengePromotionBonusVO;
   import com.qq.tooltip.ItemTooltip;
   import com.qq.utils.CommandDispatcher;
   import flash.events.MouseEvent;
   
   public class LSChallengePromotionBonusCellMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:LSChallengePromotionBonusCell;
      
      [Inject]
      public var lsProxy:LSProxy;
      
      private var vo:LSChallengePromotionBonusVO;
      
      public function LSChallengePromotionBonusCellMediator()
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
         addComponentListener(this.view.btn_go,MouseEvent.CLICK,this.onGo);
         addComponentListener(this.view.btn_get,MouseEvent.CLICK,this.onGet);
      }
      
      private function onGo(param1:MouseEvent) : void
      {
         if(this.lsProxy.data.stageId == this.vo.stageId)
         {
            LSViewCmd.showLevelChallengeEnterWd(this.vo.levelId,this.vo.subLevelId);
            CommandDispatcher.send(CommandName.LS_SWITCH_STAGE_CAMERA,[this.vo.levelId,this.vo.subLevelId]);
         }
         else
         {
            CommandDispatcher.send(CommandName.LS_SELECT_STAGE_ENTER,this.vo.stageId);
            addContextListener(LSGlobals.LS_STAGE_INFO_UPDATED,this.stageInfoUpdated,CommonEvent);
         }
      }
      
      private function stageInfoUpdated(param1:CommonEvent) : void
      {
         removeContextListener(LSGlobals.LS_STAGE_INFO_UPDATED,this.stageInfoUpdated,CommonEvent);
         CommandDispatcher.send(CommandName.LS_SWITCH_STAGE_CAMERA,[this.vo.levelId,this.vo.subLevelId]);
         LSViewCmd.showLevelChallengeEnterWd(this.vo.levelId,this.vo.subLevelId);
         CommandDispatcher.send(LSGlobals.BONUS_WINDOW_CLOSE);
      }
      
      private function onGet(param1:MouseEvent) : void
      {
         LSProxyCmd.getPromoteBonus(this.vo.stageId,this.vo.levelId,this.vo.subLevelId,this.vo.challengeId,this.vo.rankAfter);
      }
      
      override public function reset(param1:Object = null) : void
      {
         var _loc2_:LSLevelTemplate = null;
         var _loc3_:int = 0;
         var _loc4_:Date = null;
         var _loc5_:Vector.<LSChallengeScoreBonusTemplateCE> = null;
         var _loc6_:LSChallengeScoreBonusTemplateCE = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         super.reset(param1);
         if(param1 != null)
         {
            this.vo = param1 as LSChallengePromotionBonusVO;
            this.view.mcTag.gotoAndStop(this.vo.index % 5 + 1);
            _loc2_ = LSLevelTemplateFactory.instance.getTemplateByChallengeId(this.vo.stageId,this.vo.levelId,this.vo.subLevelId,this.vo.challengeId);
            if(_loc2_)
            {
               this.view.l_name.text = _loc2_.name;
            }
            _loc3_ = 0;
            while(_loc3_ < 1)
            {
               this.view["img_item"].visible = false;
               this.view.vecItemIcon[_loc3_].visible = false;
               _loc3_++;
            }
            this.view.l_rank.text = this.vo.rankBefore + " -> " + this.vo.rankAfter;
            (_loc4_ = new Date()).time = uint(this.vo.time) * 1000;
            this.view.l_date.text = _loc4_.fullYear + "-" + (_loc4_.month + 1) + "-" + _loc4_.date + " " + _loc4_.hours + ":" + _loc4_.minutes + ":" + _loc4_.seconds;
            _loc5_ = LSChallengeFactory.instance.getAllScoreBonus(this.vo.stageId,this.vo.levelId,this.vo.subLevelId,this.vo.challengeId);
            _loc7_ = 0;
            _loc3_ = _loc5_.length - 1;
            while(_loc3_ >= 0)
            {
               if((_loc6_ = _loc5_[_loc3_]).scoreMax > this.vo.rankBefore)
               {
                  _loc8_ = Math.max(this.vo.rankBefore,_loc6_.scoreMin);
                  if((_loc10_ = (_loc9_ = Math.min(this.vo.rankAfter,_loc6_.scoreMax)) - _loc8_) <= 0)
                  {
                     break;
                  }
                  _loc7_ += _loc10_ * _loc6_.gold;
               }
               _loc3_--;
            }
            _loc7_ = Math.min(ServerConfigTemplateFactory.instance.iMaxPromotionRewardGold,_loc7_);
            this.view["img_item"].visible = true;
            this.view.vecItemIcon[0].visible = true;
            this.view.vecItemIcon[0].setData(ItemID.Coin,_loc7_);
            ToolTipManager.RegisterToolTip(this.view.vecItemIcon[0],ItemID.Coin,ItemTooltip);
            if(this.vo.rewardStatus == E_RewardState.E_RewardState_CanTake)
            {
               this.view.l_got.visible = false;
               this.view.btn_get.visible = true;
               this.view.btn_go.visible = false;
            }
            else
            {
               this.view.l_got.visible = true;
               this.view.btn_get.visible = false;
               this.view.btn_go.visible = false;
            }
         }
      }
      
      override public function dispose() : void
      {
         ToolTipManager.RegisterToolTip(this.view.vecItemIcon[0],null);
         super.dispose();
      }
   }
}
