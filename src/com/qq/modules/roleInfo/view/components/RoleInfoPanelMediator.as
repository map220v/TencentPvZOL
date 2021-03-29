package com.qq.modules.roleInfo.view.components
{
   import asgui.resources.AssetManager;
   import com.qq.CommandName;
   import com.qq.SceneCenter;
   import com.qq.constant.SceneName;
   import com.qq.constant.roleInfo.RoleInfoPanelID;
   import com.qq.data.DataCacheManager;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.model.templates.ServerConfigTemplateFactory;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.battle.command.BattleCmd;
   import com.qq.modules.goldExchange.command.GoldExchangeViewCmd;
   import com.qq.modules.hole.command.HoleProxyCmd;
   import com.qq.modules.hole.model.HoleTemplateFactory;
   import com.qq.modules.hole.model.templates.HoleBuyLightTemplate;
   import com.qq.modules.login.service.LoginService;
   import com.qq.modules.main.constant.PrivilegeConst;
   import com.qq.modules.main.model.ActorModel;
   import com.qq.modules.main.service.PrivilegeProxy;
   import com.qq.modules.roleInfo.command.RoleInfoCmd;
   import com.qq.modules.roleInfo.model.templates.ce.LevelInfoTemplateCE;
   import com.qq.modules.vip.command.VipCmd;
   import com.qq.modules.vip.constant.VipConst;
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
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   import tencent.base.utils.StringUtil;
   
   public class RoleInfoPanelMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var loginService:LoginService;
      
      [Inject]
      public var actorModel:ActorModel;
      
      [Inject]
      public var privilegeProxy:PrivilegeProxy;
      
      private var _vipTipEffect:MovieClip;
      
      private var resetActorExpDelayTimeout:uint;
      
      private var lastSunDelay:int;
      
      private var lastExpDelay:int;
      
      public function RoleInfoPanelMediator()
      {
         super();
      }
      
      override protected function init() : void
      {
         super.init();
      }
      
      override public function reset(param1:Object = null) : void
      {
         var _loc2_:RolePhysicalBar = null;
         var _loc3_:RoleGoldDiamondBar = null;
         var _loc4_:RoleGiftDiamondBar = null;
         var _loc5_:RoleVipBar = null;
         var _loc6_:RoleCoinBar = null;
         var _loc7_:RoleLightBar = null;
         super.reset(param1);
         if(this.view.getBar(RoleInfoPanelID.Bar_Physical) != null)
         {
            _loc2_ = this.view.getBar(RoleInfoPanelID.Bar_Physical) as RolePhysicalBar;
            addComponentListener(_loc2_.buyBar,MouseEvent.CLICK,this.buyPhysicalHandler);
         }
         if(this.view.getBar(RoleInfoPanelID.Bar_GoldDiamond) != null)
         {
            _loc3_ = this.view.getBar(RoleInfoPanelID.Bar_GoldDiamond) as RoleGoldDiamondBar;
            addComponentListener(_loc3_.buyBar,MouseEvent.CLICK,this.buyTicketHandler);
         }
         if(this.view.getBar(RoleInfoPanelID.Bar_GiftDiamondBar) != null)
         {
            _loc4_ = this.view.getBar(RoleInfoPanelID.Bar_GiftDiamondBar) as RoleGiftDiamondBar;
         }
         if(this.view.getBar(RoleInfoPanelID.Bar_Vip) != null)
         {
            _loc5_ = this.view.getBar(RoleInfoPanelID.Bar_Vip) as RoleVipBar;
            addComponentListener(_loc5_,MouseEvent.CLICK,this.openVipWindsHandler);
         }
         if(this.view.getBar(RoleInfoPanelID.Bar_Coin) != null)
         {
            _loc6_ = this.view.getBar(RoleInfoPanelID.Bar_Coin) as RoleCoinBar;
            addComponentListener(_loc6_.buyBar,MouseEvent.CLICK,this.buyCoinHandler);
         }
         if(this.view.getBar(RoleInfoPanelID.Bar_LightBar) != null)
         {
            _loc7_ = this.view.getBar(RoleInfoPanelID.Bar_LightBar) as RoleLightBar;
            addComponentListener(_loc7_.btnBuy,MouseEvent.CLICK,this.onBuyLightClick);
         }
         this.refresh();
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         addContextListener(CommandName.ChangeLevel,this.refreshExp);
         addContextListener(CommandName.ChangeExp,this.refreshExp);
         addContextListener(CommandName.ChangeSun,this.refreshSun);
         addContextListener(CommandName.ChangeCoin,this.refreshCoin);
         addContextListener(CommandName.Role_Flash_Exp,this.flashExp);
         addContextListener(CommandName.Role_Flash_Sun,this.flashSun);
         addContextListener(CommandName.Role_Flash_Coin,this.flashCoin);
         addContextListener(CommandName.ChangeEnergy,this.flashPhysical);
         addContextListener(CommandName.ChangeGoldDiamond,this.refreshGoldDiamond);
         addContextListener(CommandName.ChangeGiftDiamond,this.refreshGiftDiamond);
         addContextListener(CommandName.ChangeFriendPoint,this.refreshFriendPoint);
         addContextListener(CommandName.RoleInfo_ResetBar,this.onResetBar);
         addContextListener(CommandName.ChangeVip,this.onUpdateRoleVip);
         addContextListener(CommandName.ROLE_FOSTERTICKET_CHANGED,this.onROLE_FOSTERTICKET_CHANGED);
         addContextListener(PrivilegeConst.PRIVILEGE_CHANGE,this.flashPhysical);
         addContextListener(CommandName.ChangeHoleLight,this.refreshLight);
         addContextListener(CommandName.ChangeHoleLightBuyCount,this.refreshLightTip);
         addContextListener(CommandName.ROLE_NAME_CHANGED,this.onROLE_NAME_CHANGED);
      }
      
      private function onBuyLightClick(param1:MouseEvent) : void
      {
         HoleProxyCmd.buyLight();
      }
      
      private function onROLE_NAME_CHANGED(param1:Event) : void
      {
         this.refresh();
      }
      
      private function buyTicketHandler(param1:MouseEvent = null) : void
      {
         QExternalUtil.showPay(this.actorModel.actorName);
      }
      
      private function buyPhysicalHandler(param1:MouseEvent = null) : void
      {
         RoleInfoCmd.buyPhysical();
      }
      
      private function openVipWindsHandler(param1:MouseEvent = null) : void
      {
         VipCmd.openVipWinds();
         if(RoleVipBar.isShow)
         {
            RoleVipBar.isShow = false;
         }
         var _loc2_:RoleVipBar = this.view.getBar(RoleInfoPanelID.Bar_Vip) as RoleVipBar;
         if(_loc2_)
         {
            _loc2_.tipVisible = RoleVipBar.isShow;
         }
      }
      
      private function buyCoinHandler(param1:MouseEvent = null) : void
      {
         GoldExchangeViewCmd.showBuyCoinPanel();
      }
      
      private function refresh() : void
      {
         if(this.view.roleHead.headIcon.source != this.actorModel.headIconUrl)
         {
            this.view.roleHead.headIcon.source = this.actorModel.headIconUrl;
         }
         var _loc1_:String = this.actorModel.actorName.substr(0,10);
         this.view.roleHead.nameLabel.text = _loc1_;
         this.view.roleHead.setPrivilege(this.actorModel.selfPrivilegeModel.privilegeDiamond);
         this.view.roleHead.growLevel = this.actorModel.selfPrivilegeModel.growLevel;
         this.refreshExp();
         this.refreshSun();
         this.refreshCoin();
         this.refreashPhysical();
         this.refreshGoldDiamond();
         this.refreshFriendPoint();
         this.onUpdateRoleVip();
         this.refreshGiftDiamond();
         this.updateRepayEffect();
         this.refreshLight();
         this.onROLE_FOSTERTICKET_CHANGED();
      }
      
      private function refreshExp(param1:Event = null) : void
      {
         var isUpgrade:Boolean = false;
         var sceneName:String = null;
         var e:Event = param1;
         if(this.view == null)
         {
            return;
         }
         var expBar:RoleExpBar = this.view.getBar(RoleInfoPanelID.Bar_Exp) as RoleExpBar;
         if(expBar == null)
         {
            return;
         }
         var levelInfo:LevelInfoTemplateCE = DataCacheManager.getInstance().getTemplateDataById(ClientDBTableName.Table_RoleLevelInfo,this.actorModel.actorLevel,LevelInfoTemplateCE);
         var maxExp:int = 10000;
         if(levelInfo != null)
         {
            maxExp = levelInfo.needExp;
         }
         expBar.setExp(this.actorModel.actorLevel,this.actorModel.actorExp - this.actorModel.actorExpDelay,maxExp,this.actorModel.actorExpDelay > 0 || this.lastExpDelay > 0);
         this.lastExpDelay = this.actorModel.actorExpDelay;
         if(this.actorModel.actorExpDelay != 0)
         {
            clearTimeout(this.resetActorExpDelayTimeout);
            this.resetActorExpDelayTimeout = setTimeout(function():void
            {
               actorModel.actorExpDelay = 0;
               refreshExp();
            },3000);
         }
         if(e)
         {
            isUpgrade = CommonEvent(e).param;
            sceneName = SceneCenter.getInstance().currentScene;
            if(isUpgrade && e.type == CommandName.ChangeLevel && sceneName != SceneName.fuben)
            {
               switch(this.actorModel.actorLevel)
               {
                  case VipConst.BATTLE_SPEED_LEVEL:
                     BattleCmd.battleFightRate(2,true);
                     break;
                  case VipConst.BATTLE_SPEED_LEVEL_2:
                     BattleCmd.battleFightRate(4,true);
               }
            }
         }
      }
      
      private function refreshSun(param1:Event = null) : void
      {
         var _loc2_:BasicRoleBar = this.view.getBar(RoleInfoPanelID.Bar_Sun);
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.setValue(this.actorModel.actorSun,this.actorModel.actorSunDelay > 0 || this.lastSunDelay > 0);
         _loc2_.toolTip = StringUtil.substitute(FontNormal.RoleInfo_Tooltip_Sun,this.actorModel.actorSun);
         this.lastSunDelay = this.actorModel.actorSunDelay;
      }
      
      private function refreshCoin(param1:Event = null) : void
      {
         var _loc2_:BasicRoleBar = this.view.getBar(RoleInfoPanelID.Bar_Coin);
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.setValue(this.actorModel.actorCoin,true,this.actorModel.isMaxCoin);
         var _loc3_:String = StringUtil.substitute(FontNormal.RoleInfo_Tooltip_Coin,this.actorModel.actorCoin);
         if(this.actorModel.isMaxCoin)
         {
            _loc3_ += FontNormal.RoleInfo_Tooltip_MaxCoin;
         }
         _loc2_.toolTip = _loc3_;
      }
      
      private function refreashPhysical(param1:Event = null) : void
      {
         var _loc2_:RolePhysicalBar = this.view.getBar(RoleInfoPanelID.Bar_Physical) as RolePhysicalBar;
         if(_loc2_ == null)
         {
            return;
         }
         if(this.actorModel.levelTemplate != null)
         {
            _loc2_.update(this.actorModel.currEnergy,this.privilegeProxy.maxEnergy,false);
         }
         _loc2_.toolTip = this.getPhysicalBarToolTip();
      }
      
      private function refreshGoldDiamond(param1:Event = null) : void
      {
         var _loc2_:BasicRoleBar = this.view.getBar(RoleInfoPanelID.Bar_GoldDiamond);
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.setValue(this.actorModel.goldDiamond,true);
         _loc2_.toolTip = StringUtil.substitute(FontNormal.RoleInfo_Tooltip_Diamond,this.actorModel.goldDiamond);
      }
      
      private function refreshGiftDiamond(param1:Event = null) : void
      {
         var _loc2_:BasicRoleBar = this.view.getBar(RoleInfoPanelID.Bar_GiftDiamondBar);
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.setValue(this.actorModel.giftDiamond,true);
         _loc2_.toolTip = StringUtil.substitute(FontNormal.RoleInfo_Tooltip_GiftDiamond,this.actorModel.giftDiamond);
      }
      
      private function onROLE_FOSTERTICKET_CHANGED(param1:Event = null) : void
      {
         var _loc2_:BasicRoleBar = this.view.getBar(RoleInfoPanelID.Bar_RoleMudBar);
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.setValue(this.actorModel.fosterTicket,true);
         _loc2_.toolTip = "土壤：" + this.actorModel.fosterTicket;
      }
      
      private function refreshFriendPoint(param1:Event = null) : void
      {
         var _loc2_:BasicRoleBar = this.view.getBar(RoleInfoPanelID.Bar_FriendPoint);
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.setValue(this.actorModel.friendPoint,true);
         _loc2_.toolTip = StringUtil.substitute(FontNormal.RoleInfo_Tooltip_FriendPoint,this.actorModel.friendPoint);
      }
      
      private function flashExp(param1:Event = null) : void
      {
         var _loc2_:RoleExpBar = this.view.getBar(RoleInfoPanelID.Bar_Exp) as RoleExpBar;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:LevelInfoTemplateCE = DataCacheManager.getInstance().getTemplateDataById(ClientDBTableName.Table_RoleLevelInfo,this.actorModel.actorLevel,LevelInfoTemplateCE);
         var _loc4_:int = 10000;
         if(_loc3_ != null)
         {
            _loc4_ = _loc3_.needExp;
         }
         _loc2_.setExp(this.actorModel.actorLevel,this.actorModel.actorExp,_loc4_);
      }
      
      private function flashSun(param1:Event = null) : void
      {
         var _loc2_:BasicRoleBar = this.view.getBar(RoleInfoPanelID.Bar_Sun);
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.setValue(this.actorModel.actorSun,true);
      }
      
      private function flashCoin(param1:Event = null) : void
      {
         var _loc2_:BasicRoleBar = this.view.getBar(RoleInfoPanelID.Bar_Coin);
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.setValue(this.actorModel.actorCoin,true);
      }
      
      private function flashPhysical(param1:Event = null) : void
      {
         var _loc2_:RolePhysicalBar = this.view.getBar(RoleInfoPanelID.Bar_Physical) as RolePhysicalBar;
         if(_loc2_ == null)
         {
            return;
         }
         if(this.actorModel.levelTemplate != null)
         {
            _loc2_.update(this.actorModel.currEnergy,this.privilegeProxy.maxEnergy,true);
         }
         _loc2_.toolTip = this.getPhysicalBarToolTip();
      }
      
      private function refreshLight(param1:Event = null) : void
      {
         var _loc2_:RoleLightBar = this.view.getBar(RoleInfoPanelID.Bar_LightBar) as RoleLightBar;
         if(_loc2_)
         {
            _loc2_.update(this.actorModel.holeLight,ServerConfigTemplateFactory.instance.iGuardMaxRenewLight);
            this.refreshLightTip();
         }
      }
      
      private function refreshLightTip(param1:Event = null) : void
      {
         var _loc3_:String = null;
         var _loc4_:HoleBuyLightTemplate = null;
         var _loc2_:RoleLightBar = this.view.getBar(RoleInfoPanelID.Bar_LightBar) as RoleLightBar;
         if(_loc2_)
         {
            if(this.actorModel.holeLightBuyCount < ServerConfigTemplateFactory.instance.iDailyBuyLightTimes)
            {
               _loc4_ = HoleTemplateFactory.instance.getBuyTemplate(this.actorModel.holeLightBuyCount + 1);
               _loc3_ = StringUtil.substitute(FontHKHB.HOLE_LIGHT_COST,_loc4_.buyItem.amount,_loc4_.costItem.amount);
            }
            else
            {
               _loc3_ = FontHKHB.HOLE_LIGHT_BUY_COUNT_LIMIT;
            }
            _loc2_.toolTip = StringUtil.substitute(FontHKHB.HOLE_LIGHT_TIP,this.actorModel.holeLight,ServerConfigTemplateFactory.instance.iGuardMaxRenewLight,this.actorModel.holeLightBuyCount,ServerConfigTemplateFactory.instance.iDailyBuyLightTimes,_loc3_);
         }
      }
      
      public function get view() : RoleInfoPanel
      {
         return viewComponent as RoleInfoPanel;
      }
      
      private function getPhysicalBarToolTip() : String
      {
         var _loc1_:int = int(ServerConfigTemplateFactory.instance.iRecoverEnergyInterval) / 60;
         var _loc2_:int = int(ServerConfigTemplateFactory.instance.iRecoverEnergyPerInterval);
         var _loc3_:String = StringUtil.substitute(FontNormal.RoleInfo_Tooltip_Physical,this.actorModel.currEnergy,_loc1_,_loc2_,this.privilegeProxy.maxEnergy);
         if(this.privilegeProxy.hasPrivilege(PrivilegeConst.PRIVILEGE_ENERGY_ADD_MAX))
         {
            _loc3_ += StringUtil.substitute(FontNormal.VIP_ADD_ENGERY,VipInfoFactory.instance.getVipName(this.actorModel.selfPrivilegeModel.vipCardId),this.privilegeProxy.getPrivilegeParamById(PrivilegeConst.PRIVILEGE_ENERGY_ADD_MAX));
         }
         else
         {
            _loc3_ += FontNormal.VIP_NO_ADD_ENGERY;
         }
         return _loc3_;
      }
      
      private function onResetBar(param1:CommonEvent) : void
      {
         var _loc2_:int = param1.readCustomParam_Number("barSetting");
         this.view.reset(_loc2_);
      }
      
      private function onUpdateRoleVip(param1:Event = null) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:VipInfoSetting = null;
         var _loc7_:String = null;
         var _loc2_:RoleVipBar = this.view.getBar(RoleInfoPanelID.Bar_Vip) as RoleVipBar;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.visible = true;
         if(this.actorModel.selfPrivilegeModel.vipCardId == 0)
         {
            _loc2_.toolTip = FontNormal.VIP_TIP;
            _loc2_.icon.gotoAndStop(1);
            _loc2_.tf.text = FontNormal.VIP_TIP_NO_OPEN;
         }
         else
         {
            _loc3_ = this.actorModel.selfPrivilegeModel.vipEndTime - DateUtils.getInstance().getServerTime();
            _loc3_ = Math.max(0,_loc3_);
            _loc4_ = Math.floor(_loc3_ / 60 / 60 / 24);
            _loc5_ = Math.floor(_loc3_ % DateUtils.ONE_DAY_SECOND / DateUtils.ONE_HOUR_SECOND);
            _loc6_ = VipInfoFactory.instance.getVipInfoById(this.actorModel.selfPrivilegeModel.vipCardId);
            _loc7_ = StringUtil.substitute(FontNormal.VIP_TIP_LEFT_DAY,_loc4_,_loc5_,_loc6_.name);
            if(this.actorModel.selfPrivilegeModel.vipGotTicket != 0 && this.privilegeProxy.hasPrivilege(PrivilegeConst.PRIVILEGE_DAILY_DIAMOND))
            {
               _loc7_ += "\n" + VipInfoFactory.instance.getVipPrivilegeDesc(this.actorModel.selfPrivilegeModel.vipCardId,PrivilegeConst.PRIVILEGE_DAILY_DIAMOND);
            }
            _loc2_.toolTip = _loc7_;
            _loc2_.icon.gotoAndStop(_loc6_.level + 1);
            _loc2_.tf.text = StringUtil.substitute(FontNormal.VIP_TIP_OPEN,_loc4_);
            this.updateRepayEffect();
         }
         if(this.actorModel.selfPrivilegeModel.vipCardId < VipConst.CARD_LEVEL_3 && RoleVipBar.isShow)
         {
            _loc2_.tipVisible = true;
         }
         else
         {
            _loc2_.tipVisible = false;
         }
         this.refreashPhysical();
      }
      
      private function updateRepayEffect() : void
      {
         var _loc1_:RoleVipBar = this.view.getBar(RoleInfoPanelID.Bar_Vip) as RoleVipBar;
         if(_loc1_ == null)
         {
            return;
         }
         if(!this.actorModel.selfPrivilegeModel.hasVip() || this.actorModel.selfPrivilegeModel.isRepay())
         {
            if(this._vipTipEffect == null)
            {
               this._vipTipEffect = AssetManager.GetNewClass("Main_Item_Flash") as MovieClip;
               this._vipTipEffect.scaleX = this._vipTipEffect.scaleY = 0.5;
            }
            _loc1_.icon.addChild(this._vipTipEffect);
         }
         else if(this._vipTipEffect != null)
         {
            UtilsManager.removeFromContainer(this._vipTipEffect);
         }
      }
   }
}
