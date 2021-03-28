package com.qq.modules.td.view.ui
{
   import asgui.managers.ToolTipManager;
   import com.qq.CommandName;
   import com.qq.GameGloble;
   import com.qq.TDPrivilegeInfo;
   import com.qq.display.QAlert;
   import com.qq.managers.FilterManager;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.main.command.CommonCmd;
   import com.qq.modules.td.command.TDProxyCmd;
   import com.qq.modules.td.command.debug.TDDebugCmd;
   import com.qq.modules.td.command.game.TDGameCmd;
   import com.qq.modules.td.data.TDDataFactory;
   import com.qq.modules.td.data.game.unit.ce.TDEnergyBeanBuyCE;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.model.TDStageInfo;
   import com.qq.modules.td.model.TDStartParam;
   import com.qq.templates.font.FontNormal;
   import com.qq.utils.CommandDispatcher;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class TDPlantFoodProgressCtMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:TDPlantFoodProgressCt;
      
      public function TDPlantFoodProgressCtMediator()
      {
         super();
      }
      
      override protected function init() : void
      {
         super.init();
         this.view.setProgress(0,3);
         this.view.addEventListener(TDPlantFoodProgressCt.LOAD_COMPLETE,this.onLoadComplete);
         if(this.view.flashEffect)
         {
            this.view.flashEffect.visible = false;
            this.view.flashEffect.stop();
         }
      }
      
      protected function onLoadComplete(param1:Event) : void
      {
         this.view.btnAdd.visible = false;
         this.view.flashEffect.visible = false;
         this.view.flashEffect.stop();
         addComponentListener(this.view.btnAdd,MouseEvent.CLICK,this.onAddClick);
         this.updateAddTips();
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         addContextListener(CommandName.TD_ChangeFuel,this.onChangeFuel);
         addContextListener(CommandName.TD_ShowOrHideFuelBar,this.onShowOrHide);
         addContextListener(CommandName.TD_BuyEnergyBean,this.onBuyEnergyBean);
         addContextListener(CommandName.TD_StartTDGame,this.onStartTDGame);
         addContextListener(CommandName.ChangeGoldDiamond,this.onChangeGoldDiamond);
         CommandDispatcher._dispatcher.addEventListener(CommandName.TD_Zombie_Move,this.onZombieMoveHandler);
      }
      
      private function onAddClick(param1:MouseEvent) : void
      {
         var event:MouseEvent = param1;
         var ce:TDEnergyBeanBuyCE = TDDataFactory.instance.getEnergyBeanBuyPrice(TDGameInfo.getInstance().buyBeanTimes + 1);
         if(ce)
         {
            if(GameGloble.actorModel.isEnoughDiamond(ce.cost,true))
            {
               if(TDGameInfo.getInstance().payAlertOpen)
               {
                  TDGameCmd.pauseGame();
                  CommonCmd.confirmUseDiamond(FontNormal.TD_PRIVILEGE_BUY_BEAN_ALERT,ce.cost,function():void
                  {
                     TDGameCmd.resumeGame();
                     TDProxyCmd.buyEnergyBean(TDStageInfo.getInstance().startParam.gameType);
                  },function():void
                  {
                     TDGameCmd.resumeGame();
                  },0,true);
               }
               else
               {
                  TDProxyCmd.buyEnergyBean(TDStageInfo.getInstance().startParam.gameType);
               }
            }
         }
         else
         {
            QAlert.Show("购买次数超过配置次数");
         }
      }
      
      private function onShowOrHide(param1:CommonEvent) : void
      {
         this.view.visible = Boolean(param1.param);
      }
      
      private function onBuyEnergyBean(param1:CommonEvent) : void
      {
         var _loc2_:int = param1.param as int;
         TDGameInfo.getInstance().leftBuyBeanTimes = _loc2_;
         ++TDGameInfo.getInstance().buyBeanTimes;
         TDDebugCmd.changeFuel(TDGameInfo.getInstance().useFuelValue.get());
         var _loc3_:TDEnergyBeanBuyCE = TDDataFactory.instance.getEnergyBeanBuyPrice(TDGameInfo.getInstance().buyBeanTimes + 1);
         if(_loc3_ == null)
         {
            this.view.flashEffect.visible = false;
            this.view.flashEffect.stop();
         }
      }
      
      private function onStartTDGame(param1:CommonEvent) : void
      {
         if(TDStageInfo.getInstance().startParam.gameType != TDStartParam.Yeti && !TDStageInfo.getInstance().hasGuide)
         {
            this.view.btnAdd.visible = true;
         }
         if(TDPrivilegeInfo.getInstance().hasTDPrivilege && TDStageInfo.getInstance().startParam.gameType != TDStartParam.Yeti && !TDStageInfo.getInstance().hasGuide)
         {
            this.view.btnAdd.filters = [];
            addComponentListener(this.view.btnAdd,MouseEvent.CLICK,this.onAddClick);
            this.updateAddTips();
         }
         else
         {
            this.view.btnAdd.filters = [FilterManager.getGaryFilter()];
            removeComponentListener(this.view.btnAdd,MouseEvent.CLICK,this.onAddClick);
            ToolTipManager.RegisterToolTip(this.view.btnAdd,"需要拥有塔防特权才能使用哦");
         }
      }
      
      private function onChangeGoldDiamond(param1:CommonEvent) : void
      {
         this.updateAddTips();
      }
      
      private function onZombieMoveHandler(param1:CommonEvent) : void
      {
         var _loc4_:TDEnergyBeanBuyCE = null;
         var _loc2_:IGameObject = (param1.param as Array)[0];
         var _loc3_:TDMapTileData = TDGameInfo.getInstance().getRoadTileByGamePos(_loc2_.x,_loc2_.y);
         if(TDGameInfo.getInstance().leftBuyBeanTimes > 0 && TDGameInfo.getInstance().fuel.get() < TDStageInfo.getInstance().fuelMax.get())
         {
            if(_loc3_ && _loc3_.roadCol >= TDGameInfo.getInstance().minCol + 5)
            {
               if(this.view.flashEffect && TDPrivilegeInfo.getInstance().hasTDPrivilege && TDStageInfo.getInstance().startParam.gameType != TDStartParam.Yeti && !TDStageInfo.getInstance().hasGuide)
               {
                  if((_loc4_ = TDDataFactory.instance.getEnergyBeanBuyPrice(TDGameInfo.getInstance().buyBeanTimes + 1)) != null)
                  {
                     this.view.flashEffect.visible = true;
                     this.view.flashEffect.play();
                  }
               }
            }
         }
      }
      
      override public function dispose() : void
      {
         this.view.removeEventListener("LOAD_COMPLETE",this.onLoadComplete);
         super.dispose();
      }
      
      private function onChangeFuel(param1:Event) : void
      {
         this.view.setProgress(TDGameInfo.getInstance().fuel.get(),TDStageInfo.getInstance().fuelMax.get());
         if(this.view.btnAdd)
         {
            if(TDGameInfo.getInstance().leftBuyBeanTimes <= 0 || TDGameInfo.getInstance().fuel.get() == TDStageInfo.getInstance().fuelMax.get())
            {
               this.view.btnAdd.filters = [FilterManager.getGaryFilter()];
               removeComponentListener(this.view.btnAdd,MouseEvent.CLICK,this.onAddClick);
               this.view.flashEffect.visible = false;
               this.view.flashEffect.stop();
            }
            else
            {
               this.view.btnAdd.filters = [];
               addComponentListener(this.view.btnAdd,MouseEvent.CLICK,this.onAddClick);
            }
            if(TDPrivilegeInfo.getInstance().hasTDPrivilege && TDStageInfo.getInstance().startParam.gameType != TDStartParam.Yeti && !TDStageInfo.getInstance().hasGuide)
            {
               this.updateAddTips();
            }
         }
      }
      
      private function updateAddTips() : void
      {
         var _loc1_:TDEnergyBeanBuyCE = null;
         if(this.view.btnAdd)
         {
            _loc1_ = TDDataFactory.instance.getEnergyBeanBuyPrice(TDGameInfo.getInstance().buyBeanTimes + 1);
            if(_loc1_)
            {
               if(!GameGloble.actorModel.isEnoughDiamond(_loc1_.cost,true))
               {
                  this.view.btnAdd.filters = [FilterManager.getGaryFilter()];
                  ToolTipManager.RegisterToolTip(this.view.btnAdd,"需要<font color=\'#ffff00\'>" + _loc1_.cost + "金钻，您的金钻不足");
               }
               else
               {
                  ToolTipManager.RegisterToolTip(this.view.btnAdd,"花费<font color=\'#ffff00\'>" + _loc1_.cost + "金钻</font>购买一个能量豆");
               }
            }
            else
            {
               ToolTipManager.RegisterToolTip(this.view.btnAdd,"已经达到购买次数上限");
            }
         }
      }
   }
}
