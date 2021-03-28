package com.qq.modules.td.view.chooseCard.endlessTD
{
   import asgui.controls.Alert;
   import asgui.events.CloseEvent;
   import com.qq.CommandName;
   import com.qq.GameGloble;
   import com.qq.TDPrivilegeInfo;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.buy.command.BuyViewCmd;
   import com.qq.modules.td.command.TDProxyCmd;
   import com.qq.modules.td.command.ui.TDUICmd;
   import com.qq.modules.td.model.TDStageInfo;
   import com.qq.modules.td.view.helpers.TDStaticInfoToolTipHelper;
   import flash.events.MouseEvent;
   
   public class TDUnlockCardWithEndlessTDMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:TDUnlockCardWithEndlessTD;
      
      private var toolTipHelper:TDStaticInfoToolTipHelper;
      
      public function TDUnlockCardWithEndlessTDMediator()
      {
         super();
      }
      
      override protected function init() : void
      {
         this.view.buttonMode = true;
         this.toolTipHelper = new TDStaticInfoToolTipHelper();
         this.toolTipHelper.addListen(this.view,this.view.cardData);
         this.updateStatus();
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         addComponentListener(this.view,MouseEvent.CLICK,this.onViewClick);
      }
      
      private function onViewClick(param1:MouseEvent) : void
      {
         var event:MouseEvent = param1;
         if(TDPrivilegeInfo.getInstance().hasTDPrivilege)
         {
            Alert.Show("是否花费" + this.view.costTicket + "钻石解锁塔防" + this.view.cardData.plantStaticInfo.baseInfo.name + "的使用","",Alert.YES | Alert.NO,null,this.onConfirm);
         }
         else
         {
            Alert.Show("你需要先开通塔防特权才能解锁植物使用哦，是否立即开通","",Alert.YES | Alert.NO,null,function(param1:CloseEvent):void
            {
               if(param1.detail == Alert.YES)
               {
                  TDUICmd.showPrivilegeWindow();
               }
            });
         }
      }
      
      private function onConfirm(param1:CloseEvent) : void
      {
         var e:CloseEvent = param1;
         if(e.detail == Alert.YES)
         {
            if(!GameGloble.actorModel.isEnoughDiamond(this.view.costTicket))
            {
               Alert.Show("您的钻石数量不足" + this.view.costTicket + "钻，是否立即前往获得？","",Alert.YES | Alert.NO,null,function(param1:CloseEvent):void
               {
                  if(param1.detail == Alert.YES)
                  {
                     BuyViewCmd.openMallWnd();
                  }
               });
            }
            else
            {
               addContextListener(CommandName.TD_GET_UNLOCK_PLANT_INFO,this.getUnlockPlantInfoHanlder,CommonEvent);
               TDProxyCmd.ticketUnlockPlant(this.view.cardData.plantStaticInfo.id);
            }
         }
      }
      
      private function getUnlockPlantInfoHanlder(param1:CommonEvent) : void
      {
         removeContextListener(CommandName.TD_GET_UNLOCK_PLANT_INFO,this.getUnlockPlantInfoHanlder,CommonEvent);
         TDStageInfo.getInstance().plantIDList.push(this.view.cardData.plantInfo);
         var _loc2_:Array = TDPrivilegeInfo.getInstance().unlockPlantIDList;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            if(_loc2_[_loc3_] == this.view.cardData.plantStaticInfo.id)
            {
               break;
            }
            _loc3_++;
         }
         _loc2_ = _loc2_.splice(_loc3_,1);
         dispatch(new CommonEvent(CommandName.TD_ADD_UNLOCK_PLANT_TO_CHOOSE,this.view));
      }
      
      private function updateStatus() : void
      {
         this.view.forbidFlag.visible = false;
         this.view.notRecommendedSp.visible = true;
         this.view.lockMc.visible = true;
         this.view.ticketCostBg.visible = true;
         this.view.txtTicketCost.visible = true;
      }
   }
}
