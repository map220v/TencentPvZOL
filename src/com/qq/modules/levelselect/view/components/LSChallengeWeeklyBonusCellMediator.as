package com.qq.modules.levelselect.view.components
{
   import PVZ.Cmd.E_RewardState;
   import asgui.managers.ToolTipManager;
   import com.qq.CommandName;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.levelselect.LSGlobals;
   import com.qq.modules.levelselect.command.LSProxyCmd;
   import com.qq.modules.levelselect.command.LSViewCmd;
   import com.qq.modules.levelselect.model.LSProxy;
   import com.qq.modules.levelselect.model.templates.LSChallengeFactory;
   import com.qq.modules.levelselect.model.templates.LSLevelTemplate;
   import com.qq.modules.levelselect.model.templates.LSLevelTemplateFactory;
   import com.qq.modules.levelselect.model.templates.ce.LSChallengeRankBonusTemplateCE;
   import com.qq.modules.levelselect.model.vo.LSChallengeWeeklyBonusVO;
   import com.qq.tooltip.ItemTooltip;
   import com.qq.utils.CommandDispatcher;
   import flash.events.MouseEvent;
   
   public class LSChallengeWeeklyBonusCellMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:LSChallengeWeeklyBonusCell;
      
      [Inject]
      public var lsProxy:LSProxy;
      
      private var vo:LSChallengeWeeklyBonusVO;
      
      public function LSChallengeWeeklyBonusCellMediator()
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
         LSProxyCmd.getRankBonus(this.vo.stageId,this.vo.levelId,this.vo.subLevelId,this.vo.challengeId);
      }
      
      override public function reset(param1:Object = null) : void
      {
         var _loc2_:LSLevelTemplate = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Vector.<LSChallengeRankBonusTemplateCE> = null;
         var _loc6_:String = null;
         var _loc7_:LSChallengeRankBonusTemplateCE = null;
         var _loc8_:Array = null;
         var _loc9_:String = null;
         var _loc10_:Array = null;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         super.reset(param1);
         if(param1 != null)
         {
            this.vo = param1 as LSChallengeWeeklyBonusVO;
            _loc2_ = LSLevelTemplateFactory.instance.getTemplateByChallengeId(this.vo.stageId,this.vo.levelId,this.vo.subLevelId,this.vo.challengeId);
            if(_loc2_)
            {
               this.view.l_name.text = this.vo.stageId + "-" + this.vo.levelId + "-" + this.vo.subLevelId + " " + _loc2_.name;
            }
            _loc3_ = 0;
            while(_loc3_ < 3)
            {
               this.view["img_item_" + (_loc3_ + 1)].visible = false;
               this.view.vecItemIcon[_loc3_].visible = false;
               _loc3_++;
            }
            if(this.vo.rank == 0)
            {
               this.view.l_rank.text = "暂无名次";
               _loc4_ = 1;
            }
            else
            {
               this.view.l_rank.text = this.vo.rank.toString();
               _loc4_ = this.vo.rank;
            }
            _loc5_ = LSChallengeFactory.instance.getAllrankBonus(this.vo.stageId,this.vo.levelId,this.vo.subLevelId,this.vo.challengeId);
            _loc6_ = "";
            for each(_loc7_ in _loc5_)
            {
               if(_loc4_ >= _loc7_.min && _loc4_ <= _loc7_.max)
               {
                  _loc6_ = _loc7_.bonus;
                  break;
               }
            }
            _loc8_ = _loc6_.split(";");
            _loc3_ = 0;
            while(_loc3_ < _loc8_.length)
            {
               _loc10_ = (_loc9_ = _loc8_[_loc3_]).split(":");
               _loc11_ = int(_loc10_[0]);
               _loc12_ = int(_loc10_[1]);
               this.view["img_item_" + (_loc3_ + 1)].visible = true;
               this.view.vecItemIcon[_loc3_].visible = true;
               this.view.vecItemIcon[_loc3_].setData(_loc11_,_loc12_);
               ToolTipManager.RegisterToolTip(this.view.vecItemIcon[_loc3_],_loc11_,ItemTooltip);
               _loc3_++;
            }
            if(this.vo.rewardStatus == E_RewardState.E_RewardState_AlreadyTaken)
            {
               this.view.l_got.visible = false;
               this.view.btn_get.visible = false;
               this.view.btn_go.visible = true;
               this.view.btn_go.enabled = true;
               this.view.btn_go.toolTip = null;
            }
            else if(this.vo.rewardStatus == E_RewardState.E_RewardState_CanTake)
            {
               this.view.l_got.visible = false;
               this.view.btn_get.visible = true;
               this.view.btn_go.visible = false;
            }
            else if(this.vo.rewardStatus == E_RewardState.E_RewardState_NotReached)
            {
               this.view.l_got.visible = true;
               this.view.l_got.text = "未解锁";
               this.view.btn_get.visible = false;
               this.view.btn_go.visible = false;
            }
            else if(this.vo.rewardStatus == E_RewardState.E_RewardState_NoReward)
            {
               this.view.l_got.visible = false;
               this.view.btn_get.visible = false;
               this.view.btn_go.visible = true;
               this.view.btn_go.enabled = false;
               this.view.btn_go.toolTip = "今日次数已用完";
            }
            else
            {
               this.view.l_got.visible = true;
               this.view.l_got.text = "";
               this.view.btn_get.visible = false;
               this.view.btn_go.visible = false;
            }
         }
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
