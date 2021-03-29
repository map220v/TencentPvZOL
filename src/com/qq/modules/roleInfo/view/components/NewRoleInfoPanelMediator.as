package com.qq.modules.roleInfo.view.components
{
   import PVZ.Cmd.Dto_CardPosInfo;
   import PVZ.Cmd.Dto_CardPower;
   import asgui.managers.ToolTipManager;
   import asgui.resources.AssetManager;
   import com.greensock.TweenMax;
   import com.qq.CommandName;
   import com.qq.ConstGlobal;
   import com.qq.GameGloble;
   import com.qq.data.DataCacheManager;
   import com.qq.modules.basic.model.templates.ServerConfigTemplateFactory;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.battleLineup.constant.BattleLineupConst;
   import com.qq.modules.goldExchange.command.GoldExchangeViewCmd;
   import com.qq.modules.main.constant.PrivilegeConst;
   import com.qq.modules.main.model.vo.BattleCardFormationVO;
   import com.qq.modules.main.service.PrivilegeProxy;
   import com.qq.modules.mapinfo.command.MapInfoViewCmd;
   import com.qq.modules.roleInfo.command.RoleInfoCmd;
   import com.qq.modules.roleInfo.model.templates.ce.LevelInfoTemplateCE;
   import com.qq.modules.strengthen.command.StrengthenViewCmd;
   import com.qq.modules.vip.command.VipCmd;
   import com.qq.modules.vip.model.templates.VipInfoFactory;
   import com.qq.modules.vip.model.templates.VipInfoSetting;
   import com.qq.templates.font.FontHKHB;
   import com.qq.templates.font.FontNormal;
   import com.qq.utils.DateUtils;
   import com.qq.utils.UtilsManager;
   import com.qq.utils.db.ClientDBTableName;
   import com.qq.utils.external.QExternalUtil;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import tencent.base.utils.StringUtil;
   
   public class NewRoleInfoPanelMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:NewRoleInfoPanel;
      
      [Inject]
      public var privilegeProxy:PrivilegeProxy;
      
      private var _coinMax_tween:TweenMax;
      
      public function NewRoleInfoPanelMediator()
      {
         super();
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         addComponentListener(this.view.roleHead,MouseEvent.CLICK,this.onClickRoleHead);
         addContextListener(CommandName.ChangeExp,this.onChangeExp);
         addContextListener(CommandName.ChangeLevel,this.onChangeExp);
         addContextListener(CommandName.ChangeCoin,this.refreshCoin);
         addContextListener(CommandName.ChangeEnergy,this.refreshPhysicalBar);
         addContextListener(PrivilegeConst.PRIVILEGE_CHANGE,this.refreshVip);
         addContextListener(PrivilegeConst.PRIVILEGE_CHANGE,this.refreshPhysicalBar);
         addContextListener(CommandName.ChangeGoldDiamond,this.refreshGoldDiamond);
         addContextListener(CommandName.ChangeGiftDiamond,this.refreshGiftDiamond);
         addComponentListener(this.view.roleValuePanel.image_add_coin,MouseEvent.CLICK,this.buyCoinHandler);
         addComponentListener(this.view.roleValuePanel.image_add_gold_diamond,MouseEvent.CLICK,this.buyGoldDiamondHandler);
         addComponentListener(this.view.physicalBar["btn_add"],MouseEvent.CLICK,this.buyPhysicalHandler);
         addComponentListener(this.view.roleValuePanel.button_stronger,MouseEvent.CLICK,this.onClickStronger);
         addComponentListener(this.view.roleValuePanel.image_vip_flag,MouseEvent.CLICK,this.openVipWindsHandler);
         addContextListener(BattleLineupConst.LINEUP_UPDATE,this.refreshFightPower);
         addContextListener(CommandName.ROLE_NAME_CHANGED,this.onROLE_NAME_CHANGED);
      }
      
      override protected function initialized() : void
      {
         super.initialized();
      }
      
      override public function reset(param1:Object = null) : void
      {
         super.reset(param1);
         this.refreshExpAndLv();
         this.refreshRoleHead();
         this.refreshPhysicalBar();
         this.refreshFightPower();
         this.refreshCoin();
         this.refreshGoldDiamond();
         this.refreshGiftDiamond();
         this.refreshVip();
      }
      
      private function onROLE_NAME_CHANGED(param1:Event) : void
      {
         var _loc2_:String = GameGloble.actorModel.actorName.substr(0,10);
         this.view.roleHead.nameLabel.text = _loc2_;
      }
      
      private function onClickRoleHead(param1:Event) : void
      {
         MapInfoViewCmd.showMapRoleWndByRoleId(GameGloble.actorModel.roleId);
      }
      
      private function refreshExpAndLv(param1:Event = null) : void
      {
         var _loc2_:LevelInfoTemplateCE = DataCacheManager.getInstance().getTemplateDataById(ClientDBTableName.Table_RoleLevelInfo,GameGloble.actorModel.actorLevel,LevelInfoTemplateCE);
         var _loc3_:int = 10000;
         if(_loc2_ != null)
         {
            _loc3_ = _loc2_.needExp;
         }
         this.view.setExp(GameGloble.actorModel.actorExp,_loc3_);
         ToolTipManager.RegisterToolTip(this.view.expBar,StringUtil.substitute(FontNormal.RoleInfo_Tooltip_Exp,GameGloble.actorModel.actorLevel,GameGloble.actorModel.actorExp,_loc3_));
         this.view.label_exp.text = GameGloble.actorModel.actorLevel.toString();
      }
      
      private function refreshRoleHead() : void
      {
         if(this.view.roleHead.headIcon.source != GameGloble.actorModel.headIconUrl)
         {
            this.view.roleHead.headIcon.source = GameGloble.actorModel.headIconUrl;
         }
         var _loc1_:String = GameGloble.actorModel.actorName.substr(0,10);
         this.view.roleHead.nameLabel.text = _loc1_;
         this.view.roleHead.setPrivilege(GameGloble.actorModel.selfPrivilegeModel.privilegeDiamond);
         this.view.roleHead.growLevel = GameGloble.actorModel.selfPrivilegeModel.growLevel;
      }
      
      private function refreshPhysicalBar(param1:Event = null) : void
      {
         this.view.setPhysicalBar(GameGloble.actorModel.currEnergy,this.privilegeProxy.maxEnergy);
         this.view.label_physical.text = GameGloble.actorModel.currEnergy + "/" + this.privilegeProxy.maxEnergy;
         this.view.label_physical.toolTip = this.getPhysicalBarToolTip();
      }
      
      private function refreshFightPower(param1:Event = null) : void
      {
         /*var _loc4_:BattleCardFormationVO = null;
         var _loc10_:BattleCardFormationVO = null;
         var _loc11_:Dto_CardPosInfo = null;
         var _loc12_:Dto_CardPower = null;
         var _loc13_:int = 0;
         var _loc14_:String = null;
         var _loc15_:int = 0;
         var _loc2_:Vector.<BattleCardFormationVO> = GameGloble.actorModel.battleCardModel.getAttackBattleTeam();
         var _loc3_:int = 0;
         var _loc5_:int = 0;
         while(_loc5_ < _loc2_.length)
         {
            _loc10_ = _loc2_[_loc5_];
            if(_loc3_ < _loc10_.totalPower)
            {
               _loc3_ = _loc10_.totalPower;
               _loc4_ = _loc10_;
            }
            _loc5_++;
         }
         var _loc6_:Array = new Array();
         _loc5_ = 0;
         while(_loc5_ < _loc4_.dto.cardPos.length)
         {
            _loc11_ = _loc4_.dto.cardPos[_loc5_];
            for each(_loc12_ in _loc11_.powerEle)
            {
               if(_loc6_[_loc12_.ele] == null)
               {
                  _loc6_[_loc12_.ele] = _loc12_.value.toNumber();
               }
               else
               {
                  _loc6_[_loc12_.ele] += _loc12_.value.toNumber();
               }
            }
            _loc5_++;
         }
         var _loc7_:String = "";
         var _loc8_:int = ConstGlobal.PROP_SHOW_ORDER.length;
         var _loc9_:int = 0;
         while(_loc9_ < _loc8_)
         {
            _loc13_ = ConstGlobal.PROP_SHOW_ORDER[_loc9_];
            if(_loc6_[_loc13_] != null)
            {
               if(_loc13_ == 0)
               {
                  _loc7_ = _loc7_.concat("<font color=\'#ffc000\'>",FontHKHB.RANK_TITLE_UNION_POWER,"：",_loc6_[_loc13_],"</font><br>");
               }
               else if((_loc15_ = _loc6_[_loc13_]) >= 0)
               {
                  _loc7_ = _loc7_.concat("<font color=\'#00ff00\'>",FontHKHB["BATTLE_POWER_" + _loc13_],"：",_loc6_[_loc13_],"</font><br>");
               }
               else
               {
                  _loc7_ = _loc7_.concat("<font color=\'#00ff00\'>",FontHKHB["BATTLE_POWER_" + _loc13_],"：</font><font color=\'#ff0000\'>",_loc6_[_loc13_],"</font><br>");
               }
            }
            _loc9_++;
         }*/
         this.view.roleValuePanel.label_fight_power.text = "9001";//_loc3_.toString();
         this.view.roleValuePanel.label_fight_power.toolTip = "Work in Progress!";//_loc7_;
      }
      
      private function refreshCoin(param1:Event = null) : void
      {
         this.view.roleValuePanel.label_coin.text = UtilsManager.converNum(GameGloble.actorModel.actorCoin);
         var _loc2_:String = StringUtil.substitute(FontNormal.RoleInfo_Tooltip_Coin,GameGloble.actorModel.actorCoin);
         if(GameGloble.actorModel.isMaxCoin)
         {
            _loc2_ += FontNormal.RoleInfo_Tooltip_MaxCoin;
         }
         this.view.roleValuePanel.label_coin.toolTip = _loc2_;
         this.cleanCoinMaxTween();
         if(GameGloble.actorModel.isMaxCoin)
         {
            this.addCoinMaxTween();
         }
      }
      
      private function refreshGoldDiamond(param1:Event = null) : void
      {
         this.view.roleValuePanel.label_gold_diamond.text = UtilsManager.converNum(GameGloble.actorModel.goldDiamond);
         this.view.roleValuePanel.label_gold_diamond.toolTip = StringUtil.substitute(FontNormal.RoleInfo_Tooltip_Diamond,GameGloble.actorModel.goldDiamond);
      }
      
      private function refreshGiftDiamond(param1:Event = null) : void
      {
         this.view.roleValuePanel.label_gift_diamond.text = UtilsManager.converNum(GameGloble.actorModel.giftDiamond);
         this.view.roleValuePanel.label_gift_diamond.toolTip = StringUtil.substitute(FontNormal.RoleInfo_Tooltip_GiftDiamond,GameGloble.actorModel.giftDiamond);
      }
      
      private function refreshVip(param1:Event = null) : void
      {
         var _loc2_:MovieClip = null;
         var _loc3_:int = 0;
         var _loc4_:String = null;
         var _loc5_:Number = NaN;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:VipInfoSetting = null;
         _loc2_ = this.view.roleValuePanel.image_vip_flag.mcHolder as MovieClip;
         if(GameGloble.actorModel.selfPrivilegeModel.vipCardId == 0)
         {
            _loc4_ = FontNormal.VIP_TIP;
            _loc3_ = 1;
            this.view.roleValuePanel.label_vip_time.text = FontNormal.VIP_TIP_NO_OPEN;
         }
         else
         {
            _loc5_ = GameGloble.actorModel.selfPrivilegeModel.vipEndTime - DateUtils.getInstance().getServerTime();
            _loc5_ = Math.max(0,_loc5_);
            _loc6_ = Math.floor(_loc5_ / 60 / 60 / 24);
            _loc7_ = Math.floor(_loc5_ % DateUtils.ONE_DAY_SECOND / DateUtils.ONE_HOUR_SECOND);
            _loc8_ = VipInfoFactory.instance.getVipInfoById(GameGloble.actorModel.selfPrivilegeModel.vipCardId);
            _loc4_ = StringUtil.substitute(FontNormal.VIP_TIP_LEFT_DAY,_loc6_,_loc7_,_loc8_.name);
            if(GameGloble.actorModel.selfPrivilegeModel.vipGotTicket != 0 && this.privilegeProxy.hasPrivilege(PrivilegeConst.PRIVILEGE_DAILY_DIAMOND))
            {
               _loc4_ += "\n" + VipInfoFactory.instance.getVipPrivilegeDesc(GameGloble.actorModel.selfPrivilegeModel.vipCardId,PrivilegeConst.PRIVILEGE_DAILY_DIAMOND);
            }
            _loc3_ = _loc8_.level + 1;
            this.view.roleValuePanel.label_vip_time.text = StringUtil.substitute(FontNormal.VIP_TIP_OPEN,_loc6_);
         }
         this.view.roleValuePanel.image_vip_flag.toolTip = _loc4_;
         if(_loc2_ != null)
         {
            _loc2_.gotoAndStop(_loc3_);
         }
         this.updateRepayEffect();
      }
      
      private function updateRepayEffect() : void
      {
         var _loc1_:MovieClip = null;
         if(!GameGloble.actorModel.selfPrivilegeModel.hasVip() || GameGloble.actorModel.selfPrivilegeModel.isRepay())
         {
            if(this.view.vipTipEffect == null)
            {
               this.view.vipTipEffect = AssetManager.GetNewClass("ModuleRole_VIP_Effect") as MovieClip;
            }
            _loc1_ = this.view.roleValuePanel.image_vip_flag.mcHolder as MovieClip;
            if(_loc1_ != null)
            {
               this.view.vipTipEffect.x = 5;
               this.view.roleValuePanel.image_vip_flag.scrollRectEnabled = false;
               this.view.vipTipEffect.mouseChildren = false;
               this.view.vipTipEffect.mouseEnabled = false;
               this.view.roleValuePanel.image_vip_flag.addChild(this.view.vipTipEffect);
            }
         }
         else if(this.view.vipTipEffect != null)
         {
            UtilsManager.removeFromContainer(this.view.vipTipEffect);
         }
      }
      
      private function onChangeExp(param1:Event) : void
      {
         this.refreshExpAndLv();
      }
      
      private function getPhysicalBarToolTip() : String
      {
         var _loc1_:int = int(ServerConfigTemplateFactory.instance.iRecoverEnergyInterval) / 60;
         var _loc2_:int = int(ServerConfigTemplateFactory.instance.iRecoverEnergyPerInterval);
         var _loc3_:String = StringUtil.substitute(FontNormal.RoleInfo_Tooltip_Physical,GameGloble.actorModel.currEnergy,_loc1_,_loc2_,this.privilegeProxy.maxEnergy);
         if(this.privilegeProxy.hasPrivilege(PrivilegeConst.PRIVILEGE_ENERGY_ADD_MAX))
         {
            _loc3_ += StringUtil.substitute(FontNormal.VIP_ADD_ENGERY,VipInfoFactory.instance.getVipName(GameGloble.actorModel.selfPrivilegeModel.vipCardId),this.privilegeProxy.getPrivilegeParamById(PrivilegeConst.PRIVILEGE_ENERGY_ADD_MAX));
         }
         else
         {
            _loc3_ += FontNormal.VIP_NO_ADD_ENGERY;
         }
         return _loc3_;
      }
      
      private function buyCoinHandler(param1:MouseEvent = null) : void
      {
         GoldExchangeViewCmd.showBuyCoinPanel();
      }
      
      private function buyPhysicalHandler(param1:MouseEvent = null) : void
      {
         RoleInfoCmd.buyPhysical();
      }
      
      private function onClickStronger(param1:Event) : void
      {
         StrengthenViewCmd.openWindow();
      }
      
      private function openVipWindsHandler(param1:Event) : void
      {
         VipCmd.openVipWinds();
      }
      
      private function buyGoldDiamondHandler(param1:MouseEvent = null) : void
      {
         QExternalUtil.showPay(GameGloble.actorModel.actorName);
      }
      
      private function addCoinMaxTween() : void
      {
         if(this._coinMax_tween == null)
         {
            this.view.roleValuePanel.label_coin.SetStyle("color","#ff0000");
            this._coinMax_tween = TweenMax.to(this.view.roleValuePanel.label_coin,1,{"glowFilter":{
               "color":16711680,
               "alpha":1,
               "blurX":2,
               "blurY":2,
               "strength":10,
               "quality":3
            }});
            this._coinMax_tween.repeat = -1;
            this._coinMax_tween.yoyo = true;
         }
      }
      
      private function cleanCoinMaxTween() : void
      {
         if(this._coinMax_tween != null)
         {
            this.view.roleValuePanel.label_coin.SetStyle("color","#ffffff");
            this._coinMax_tween.pause();
            this._coinMax_tween.kill();
            this._coinMax_tween = null;
            this.view.roleValuePanel.label_coin.filters = null;
         }
      }
      
      override public function dispose() : void
      {
         this.cleanCoinMaxTween();
         ToolTipManager.RegisterToolTip(this.view.expBar,null);
         super.dispose();
      }
   }
}
