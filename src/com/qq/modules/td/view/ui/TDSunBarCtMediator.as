package com.qq.modules.td.view.ui
{
   import asgui.managers.ToolTipManager;
   import asgui.utils.StringUtil;
   import com.qq.CommandName;
   import com.qq.GameGloble;
   import com.qq.TDPrivilegeInfo;
   import com.qq.managers.FilterManager;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.model.templates.ServerConfigTemplateFactory;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.main.command.CommonCmd;
   import com.qq.modules.td.command.TDProxyCmd;
   import com.qq.modules.td.command.game.TDGameCmd;
   import com.qq.modules.td.data.TDDataFactory;
   import com.qq.modules.td.data.game.unit.ce.TDSunBuyCE;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.model.TDStageInfo;
   import com.qq.modules.td.model.TDStartParam;
   import com.qq.templates.font.FontNormal;
   import com.qq.utils.DelayManager;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class TDSunBarCtMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:TDSunBarCt;
      
      private var m_delayId:int;
      
      private var m_addEnable:Boolean;
      
      public function TDSunBarCtMediator()
      {
         super();
      }
      
      override protected function init() : void
      {
         super.init();
         this.view.btnAdd.visible = false;
         this.view.fireEffect.visible = false;
         this.view.fireEffect.stop();
         this.updateAddStatus();
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         addContextListener(CommandName.TD_ChangeSun,this.onChangeSun);
         addContextListener(CommandName.TD_ShowOrHideSunBar,this.onShowOrHide);
         addContextListener(CommandName.TD_StartTDGame,this.onStartTDGame);
         addContextListener(CommandName.ChangeGoldDiamond,this.onChangeGoldDiamond);
         addContextListener(CommandName.TD_Buy_Sun,this.onBuySun);
      }
      
      private function onStartTDGame(param1:CommonEvent) : void
      {
         if(!TDStageInfo.getInstance().hasGuide && TDStageInfo.getInstance().startParam.gameType != TDStartParam.Yeti)
         {
            this.view.btnAdd.visible = true;
            this.m_delayId = DelayManager.getInstance().addDelay(30000,this.hidefireEffect);
            if(TDPrivilegeInfo.getInstance().hasTDPrivilege)
            {
               this.setAddEnable(true);
               this.updateAddStatus();
            }
            else
            {
               this.setAddEnable(false);
               ToolTipManager.RegisterToolTip(this.view.btnAdd,"塔防特权玩家可以购买阳光哦！");
            }
            if(this.m_addEnable)
            {
               this.view.fireEffect.visible = true;
               this.view.fireEffect.play();
            }
         }
         else
         {
            this.view.btnAdd.visible = false;
         }
      }
      
      private function onChangeGoldDiamond(param1:CommonEvent) : void
      {
         this.updateAddStatus();
      }
      
      private function hidefireEffect() : void
      {
         DelayManager.getInstance().removeDelay(this.m_delayId);
         this.view.fireEffect.visible = false;
         this.view.fireEffect.stop();
      }
      
      private function onShowOrHide(param1:CommonEvent) : void
      {
         this.view.visible = Boolean(param1.param);
      }
      
      private function onChangeSun(param1:Event) : void
      {
         this.view.sunTF.text = TDGameInfo.getInstance().sun.get().toString();
      }
      
      private function onBuySun(param1:CommonEvent) : void
      {
         TDGameInfo.getInstance().buySunTimes = int(param1.param);
         TDGameCmd.changeSun(ServerConfigTemplateFactory.instance.getTDBuySunAmount());
         this.updateAddStatus();
      }
      
      private function onAdd(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         var ce:TDSunBuyCE = TDDataFactory.instance.getSunBuyPrice(TDGameInfo.getInstance().buySunTimes + 1);
         if(ce)
         {
            if(GameGloble.actorModel.isEnoughDiamond(ce.cost,true))
            {
               if(TDGameInfo.getInstance().payAlertOpen)
               {
                  TDGameCmd.pauseGame();
                  CommonCmd.confirmUseDiamond(StringUtil.substitute(FontNormal.TD_PRIVILEGE_BUY_SUN_ALERT,ServerConfigTemplateFactory.instance.getTDBuySunAmount()),ce.cost,function():void
                  {
                     TDGameCmd.resumeGame();
                     TDProxyCmd.buySun(TDStageInfo.getInstance().startParam.gameType);
                  },function():void
                  {
                     TDGameCmd.resumeGame();
                  },0,true);
               }
               else
               {
                  TDProxyCmd.buySun(TDStageInfo.getInstance().startParam.gameType);
               }
            }
         }
      }
      
      private function updateAddStatus() : void
      {
         var _loc1_:TDSunBuyCE = TDDataFactory.instance.getSunBuyPrice(TDGameInfo.getInstance().buySunTimes + 1);
         if(_loc1_)
         {
            if(TDPrivilegeInfo.getInstance().hasTDPrivilege)
            {
               if(GameGloble.actorModel.isEnoughDiamond(_loc1_.cost,true))
               {
                  this.setAddEnable(true);
                  ToolTipManager.RegisterToolTip(this.view.btnAdd,"花费<font color=\'#ffff00\'>" + _loc1_.cost + "金钻</font>购买" + ServerConfigTemplateFactory.instance.getTDBuySunAmount() + "阳光");
               }
               else
               {
                  this.setAddEnable(false);
                  ToolTipManager.RegisterToolTip(this.view.btnAdd,"需要<font color=\'#ffff00\'>" + _loc1_.cost + "金钻，您的金钻不足");
               }
            }
         }
      }
      
      private function setAddEnable(param1:Boolean) : void
      {
         this.m_addEnable = param1;
         if(param1)
         {
            this.view.btnAdd.filters = [];
            addComponentListener(this.view.btnAdd,MouseEvent.CLICK,this.onAdd);
         }
         else
         {
            this.view.btnAdd.filters = [FilterManager.getGaryFilter()];
            removeComponentListener(this.view.btnAdd,MouseEvent.CLICK,this.onAdd);
         }
      }
   }
}
