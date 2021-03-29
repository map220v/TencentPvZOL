package com.qq.modules.levelselect.view.components
{
   import PVZ.Cmd.Dto_TD_RankInfo;
   import asgui.managers.ToolTipManager;
   import com.qq.modules.bag.model.ItemTemplateFactory;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.levelselect.LSGlobals;
   import com.qq.modules.levelselect.command.LSViewCmd;
   import com.qq.modules.levelselect.model.LSProxy;
   import com.qq.modules.levelselect.model.templates.LSChallengeFactory;
   import com.qq.modules.levelselect.model.templates.LSLevelTemplate;
   import com.qq.modules.levelselect.model.templates.LSLevelTemplateFactory;
   import com.qq.modules.levelselect.model.templates.ce.LSChallengeRankBonusTemplateCE;
   import com.qq.modules.levelselect.model.vo.LSChallengeLevelRankVO;
   import com.qq.modules.mapinfo.command.MapInfoViewCmd;
   import com.qq.utils.UtilsManager;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class LSChallengeRankLevelWdMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:LSChallengeRankLevelWd;
      
      [Inject]
      public var lsProxy:LSProxy;
      
      private const STAGE_TITLE:Array = ["塔防至尊","塔防宗师","塔防之王","冠军组","大师组","水晶组","黄金组","白银组","青铜组"];
      
      public function LSChallengeRankLevelWdMediator()
      {
         super();
      }
      
      override protected function init() : void
      {
         var _loc4_:LSChallengeRankBonusTemplateCE = null;
         var _loc5_:Array = null;
         var _loc6_:int = 0;
         var _loc7_:Array = null;
         var _loc8_:int = 0;
         var _loc9_:String = null;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         super.init();
         var _loc1_:LSLevelTemplate = LSLevelTemplateFactory.instance.getTemplateByChallengeId(this.lsProxy.data.stageId,this.view.levelId,this.view.subLevelId,this.view.challengeLevelId);
         if(_loc1_ != null)
         {
            this.view.label_level_name.text = _loc1_.stageId + "-" + _loc1_.levelId + "-" + _loc1_.subLevelId + " " + _loc1_.name;
         }
         var _loc2_:Vector.<LSChallengeRankBonusTemplateCE> = LSChallengeFactory.instance.getAllrankBonus(this.lsProxy.data.stageId,this.view.levelId,this.view.subLevelId,this.view.challengeLevelId);
         var _loc3_:int = _loc2_.length - 1;
         while(_loc3_ >= 0)
         {
            _loc5_ = (_loc4_ = _loc2_[_loc3_]).bonus.split(";");
            _loc6_ = 0;
            while(_loc6_ < _loc5_.length)
            {
               if((_loc7_ = _loc5_[_loc6_].split(":"))[0] == "1")
               {
                  _loc8_ = parseInt(_loc7_[1]);
                  this.view["l_stage_" + (8 - _loc3_)].width = 100;
                  this.view["l_stage_" + (8 - _loc3_)].text = UtilsManager.converNum(_loc8_) + "金币";
               }
               _loc6_++;
            }
            if(_loc3_ <= 4)
            {
               _loc9_ = "";
               _loc6_ = 0;
               while(_loc6_ < _loc5_.length)
               {
                  _loc10_ = int(_loc5_[_loc6_].split(":")[0]);
                  _loc11_ = int(_loc5_[_loc6_].split(":")[1]);
                  if(_loc6_ < _loc5_.length - 1)
                  {
                     _loc9_ += ItemTemplateFactory.instance.getBagItemName(_loc10_) + "x" + _loc11_ + ",";
                  }
                  else
                  {
                     _loc9_ += ItemTemplateFactory.instance.getBagItemName(_loc10_) + "x" + _loc11_;
                  }
                  _loc6_++;
               }
               ToolTipManager.RegisterToolTip(this.view.imageBG.mcHolder["mcGift" + (8 - _loc3_)],_loc9_);
            }
            _loc3_--;
         }
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         addComponentListener(this.view.btnGetReward,MouseEvent.CLICK,this.onGetReward);
         addContextListener(LSGlobals.LS_GET_RANK,this.getRankHandler,CommonEvent);
         addContextListener(LSGlobals.LS_GET_RANK_BONUS,this.getRankBonusHandler,CommonEvent);
         var _loc1_:int = 0;
         while(_loc1_ < this.view.m_cellVec.length)
         {
            this.view.m_cellVec[_loc1_].addEventListener(Event.SELECT,this.onNameLink);
            _loc1_++;
         }
         var _loc2_:Vector.<LSChallengeRankBonusTemplateCE> = LSChallengeFactory.instance.getAllrankBonus(this.lsProxy.data.stageId,this.view.levelId,this.view.subLevelId,this.view.challengeLevelId);
         _loc1_ = 0;
         while(_loc1_ < 9)
         {
            if(_loc2_[_loc1_].min == _loc2_[_loc1_].max)
            {
               ToolTipManager.impl.RegisterToolTip(this.view["img_icon_" + (8 - _loc1_)],this.STAGE_TITLE[_loc1_] + " 排名第" + _loc2_[_loc1_].min + "名");
            }
            else
            {
               ToolTipManager.impl.RegisterToolTip(this.view["img_icon_" + (8 - _loc1_)],this.STAGE_TITLE[_loc1_] + " 排名" + _loc2_[_loc1_].min + "-" + _loc2_[_loc1_].max + "名");
            }
            _loc1_++;
         }
      }
      
      private function onGetReward(param1:MouseEvent) : void
      {
         LSViewCmd.showChallengeBonusWd(1);
      }
      
      private function onNameLink(param1:Event) : void
      {
         var _loc2_:int = this.view.m_cellVec.indexOf(param1.currentTarget as LSChallengeLevelItemCell);
         var _loc3_:Object = {
            "stageId":this.lsProxy.data.stageId,
            "levelId":this.view.levelId,
            "subLevelId":this.view.subLevelId
         };
         if(_loc2_ == 0 && this.lsProxy.rankData.pageNo == 0)
         {
            MapInfoViewCmd.showMapRoleWndByChallenge(this.lsProxy.rankData.info[_loc2_].roleId,_loc3_);
         }
         else
         {
            MapInfoViewCmd.showMapRoleWndByRoleId(this.lsProxy.rankData.info[_loc2_].roleId);
         }
      }
      
      private function getRankHandler(param1:CommonEvent) : void
      {
         var _loc3_:Dto_TD_RankInfo = null;
         var _loc4_:LSChallengeLevelRankVO = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.view.m_cellVec.length)
         {
            if(this.lsProxy.rankData && this.lsProxy.rankData.info[_loc2_] && this.lsProxy.rankData.info[_loc2_].roleId != null)
            {
               _loc3_ = this.lsProxy.rankData.info[_loc2_];
               this.view.m_cellVec[_loc2_].visible = true;
               this.view.m_cellVec[_loc2_].data = this.parseDto(_loc3_,_loc2_);
            }
            else
            {
               this.view.m_cellVec[_loc2_].visible = false;
            }
            _loc2_++;
         }
         this.view.myCell.visible = false;
         if(this.lsProxy.rankData.selfInfo.score > 0)
         {
            (_loc4_ = this.parseDto(this.lsProxy.rankData.selfInfo,0)).rank = this.lsProxy.rankData.selfRank;
            this.view.myCell.data = _loc4_;
            this.view.myCell.visible = true;
         }
         this.updateRewardBtn();
      }
      
      private function getRankBonusHandler(param1:CommonEvent) : void
      {
         this.view.btnGetReward.enabled = false;
         this.view.btnGetReward.toolTip = "每周日24:00结算一周排行，根据排名领取相应奖励物品";
      }
      
      private function updateRewardBtn() : void
      {
      }
      
      private function parseDto(param1:Dto_TD_RankInfo, param2:uint) : LSChallengeLevelRankVO
      {
         var _loc3_:LSChallengeLevelRankVO = new LSChallengeLevelRankVO();
         _loc3_.rank = this.lsProxy.rankData.pageNo * 10 + param2 + 1;
         _loc3_.roleId = param1.roleId;
         _loc3_.roleName = param1.name;
         _loc3_.score = param1.score;
         _loc3_.time = param1.scoreTimestamp;
         _loc3_.stageId = this.lsProxy.data.stageId;
         _loc3_.levelId = this.view.levelId;
         _loc3_.subLevelId = this.view.subLevelId;
         _loc3_.challengeLevelId = this.view.challengeLevelId;
         return _loc3_;
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
