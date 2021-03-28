package com.qq.modules.roleInfo.command
{
   import asgui.controls.Alert;
   import asgui.events.CloseEvent;
   import asgui.utils.StringUtil;
   import com.qq.CommandName;
   import com.qq.display.QAlert;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.model.templates.ServerConfigTemplateFactory;
   import com.qq.modules.buffActivity.BuffActivityGlobal;
   import com.qq.modules.buffActivity.model.BuffActivityProxy;
   import com.qq.modules.buffActivity.model.buff.BuffBuyPhysical;
   import com.qq.modules.fuben.model.templates.FubenEnargysTemplate;
   import com.qq.modules.login.service.LoginService;
   import com.qq.modules.main.command.CommonCmd;
   import com.qq.modules.main.command.GameFlowCmd;
   import com.qq.modules.main.constant.PrivilegeConst;
   import com.qq.modules.main.model.ActorModel;
   import com.qq.modules.main.model.SettingsModel;
   import com.qq.modules.main.service.PrivilegeProxy;
   import com.qq.modules.vip.constant.VipConst;
   import com.qq.modules.vip.model.templates.VipInfoFactory;
   import com.qq.templates.font.FontHKHB;
   import com.qq.templates.font.FontNormal;
   import com.qq.utils.CommandDispatcher;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   
   public class RoleInfoCommand extends StrongRobotlegCommand
   {
       
      
      [Inject]
      public var actor:ActorModel;
      
      [Inject]
      public var loginService:LoginService;
      
      [Inject]
      public var privilegeProxy:PrivilegeProxy;
      
      [Inject]
      public var buffProxy:BuffActivityProxy;
      
      public function RoleInfoCommand()
      {
         super();
      }
      
      public function buyPhysical() : void
      {
         var leftTimes:int = 0;
         var buff:BuffBuyPhysical = null;
         var price:int = 0;
         var addEnergy:int = 0;
         var alertTxt:String = null;
         var arr:Array = null;
         if(this.actor.currEnergy >= this.privilegeProxy.maxEnergy)
         {
            var confirmCallBack:Function = function(param1:CloseEvent):void
            {
               if(param1.detail == Alert.YES)
               {
                  GameFlowCmd.gotoFuben();
               }
            };
            QAlert.Show(FontNormal.VIP_PHYSICAL_FULL,"",Alert.YES | Alert.NO,null,confirmCallBack,FontHKHB.GOTO_Adventure,FontHKHB.NO);
            return;
         }
         var ignoreVip:Boolean = false;
         if(this.buffProxy.hasBuff(BuffActivityGlobal.TYPE_ENERGY_CHARGE))
         {
            buff = this.buffProxy.buyPhysicalBuff;
            ignoreVip = buff.ignoreVip;
         }
         if(!ignoreVip)
         {
            if(!this.privilegeProxy.hasPrivilege(PrivilegeConst.PRIVILEGE_ROLE_ENERGY))
            {
               leftTimes = ServerConfigTemplateFactory.instance.iEnergyBuyTimes - this.actor.currEnergyBuyNum;
               if(leftTimes <= 0)
               {
                  CommonCmd.showVipConfirm(FontHKHB.VIP_PHYSICAL_TIME_UP);
                  return;
               }
            }
            else
            {
               addEnergy = this.privilegeProxy.getPrivilegeParamById(PrivilegeConst.PRIVILEGE_ROLE_ENERGY);
               leftTimes = ServerConfigTemplateFactory.instance.iEnergyBuyTimes + addEnergy - this.actor.currEnergyBuyNum;
               if(leftTimes <= 0)
               {
                  alertTxt = FontHKHB.VIP_PHYSICAL_BUY_MAX;
                  alertTxt += StringUtil.substitute(FontHKHB.VIP_PHYSICAL_BUY_LIST,VipInfoFactory.instance.getVipName(VipConst.CARD_LEVEL_1),VipInfoFactory.instance.getEnergyVipAdd(VipConst.CARD_LEVEL_1));
                  alertTxt += StringUtil.substitute(FontHKHB.VIP_PHYSICAL_BUY_LIST,VipInfoFactory.instance.getVipName(VipConst.CARD_LEVEL_2),VipInfoFactory.instance.getEnergyVipAdd(VipConst.CARD_LEVEL_2));
                  alertTxt += StringUtil.substitute(FontHKHB.VIP_PHYSICAL_BUY_LIST,VipInfoFactory.instance.getVipName(VipConst.CARD_LEVEL_3),VipInfoFactory.instance.getEnergyVipAdd(VipConst.CARD_LEVEL_3));
                  CommonCmd.showVipConfirm(alertTxt);
                  return;
               }
            }
         }
         else
         {
            buff = this.buffProxy.buyPhysicalBuff;
            leftTimes = buff.availableTimes;
            if(leftTimes <= 0)
            {
               CommonCmd.showVipConfirm(FontHKHB.VIP_PHYSICAL_BUY_MAX);
               return;
            }
         }
         var temp:FubenEnargysTemplate = SettingsModel.instance.fubenSetting.getFubenEnargysTemplateByBuyNum(this.actor.currEnergyBuyNum + 1);
         if(this.buffProxy.hasBuff(BuffActivityGlobal.TYPE_ENERGY_CHARGE))
         {
            buff = this.buffProxy.buyPhysicalBuff;
            price = buff.getPrice(this.actor.currEnergyBuyNum);
         }
         else
         {
            arr = temp.needRes.split(":");
            price = arr[1];
         }
         CommonCmd.confirmUseDiamond(StringUtil.substitute(FontNormal.HPYSICAL_BUY_NEW,price,temp.enargyAdd,leftTimes),price,this.onBuyPhysicalConfirmHandler,null,5,false,null,true);
      }
      
      private function onBuyPhysicalConfirmHandler() : void
      {
         this.loginService.buyPhysical();
      }
      
      public function addRoleSunDelay(param1:int) : void
      {
         this.actor.actorSunDelay += param1;
         if(this.actor.actorSunDelay < 0)
         {
            this.actor.actorSunDelay = 0;
         }
         this.dispatch(new CommonEvent(CommandName.ChangeSun));
      }
      
      public function addRoleExpDelay(param1:int) : void
      {
         this.actor.actorExpDelay += param1;
         if(this.actor.actorExpDelay < 0)
         {
            this.actor.actorExpDelay = 0;
         }
         this.dispatch(new CommonEvent(CommandName.ChangeExp));
      }
      
      public function addRoleCoinDelay(param1:int) : void
      {
         if(this.actor.actorCoin < 0)
         {
            this.actor.actorCoin = 0;
         }
         this.dispatch(new CommonEvent(CommandName.ChangeCoin));
      }
      
      public function configBar(param1:int = 0) : void
      {
         CommandDispatcher.send(CommandName.RoleInfo_ResetBar,{"barSetting":param1});
      }
   }
}
