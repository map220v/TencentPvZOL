package com.qq.modules.actDf51.model
{
   import PVZ.Cmd.Cmd_DaveLabor_AddScore_SC;
   import PVZ.Cmd.Cmd_DaveLabor_GetInfo_CS;
   import PVZ.Cmd.Cmd_DaveLabor_GetInfo_SC;
   import PVZ.Cmd.Cmd_Item_OpenGift_SC;
   import com.qq.modules.actDf51.ActDf51Const;
   import com.qq.modules.actDf51.command.ActDf51Cmd;
   import com.qq.modules.activity.ActivityGlobal;
   import com.qq.modules.activity.command.ActivityProxyCmd;
   import com.qq.modules.activity.model.ActivityCommonInfo;
   import com.qq.modules.activity.model.ActivityProxy;
   import com.qq.modules.bag.BagGlobals;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.modle.BasicProxy;
   import com.qq.modules.main.server.PvzSocketService;
   import flash.events.Event;
   import org.as3commons.logging.api.getLogger;
   import tencent.io.service.events.SocketServiceEvent;
   
   public class ActDf51Proxy extends BasicProxy
   {
       
      
      [Inject]
      public var actProxy:ActivityProxy;
      
      [Inject]
      public var pvzService:PvzSocketService;
      
      public var todayAct:ActivityCommonInfo;
      
      public var totalAct:ActivityCommonInfo;
      
      public var todayCount:uint;
      
      public var totalCount:uint;
      
      public var todayActId:uint;
      
      public var totalActId:uint;
      
      public var totalCurStep:uint;
      
      public var todayClientParam:ActDf51ClientStepVo;
      
      public var totalClientParam:ActDf51ClientParam;
      
      private var giftOpenEffect:Boolean;
      
      private var getItemCount:uint;
      
      public function ActDf51Proxy()
      {
         super();
      }
      
      override public function listMsgInterests() : Array
      {
         return [[Cmd_DaveLabor_GetInfo_SC.$MessageID,this.onCmd_DaveLabor_GetInfo_SC],[ActivityGlobal.EVENT_ACTIVITY_UPDATE,this.onGetActvityInfo],[Cmd_DaveLabor_AddScore_SC.$MessageID,this.onCmd_DaveLabor_AddScore_SC],[BagGlobals.BAG_ITEM_OPEN_EFFECT_OVER,this.onOpenEffectOver],[Cmd_Item_OpenGift_SC.$MessageID,this.openGiftHandler]];
      }
      
      private function openGiftHandler(param1:Event) : void
      {
         this.giftOpenEffect = true;
      }
      
      private function onOpenEffectOver(param1:Event) : void
      {
         this.giftOpenEffect = false;
         getLogger().debug("宝箱特效关闭");
         if(this.getItemCount != 0)
         {
            ActDf51Cmd.showGetItemView(this.getItemCount);
            this.getItemCount = 0;
         }
      }
      
      public function getDf51Info() : void
      {
         var _loc1_:Cmd_DaveLabor_GetInfo_CS = new Cmd_DaveLabor_GetInfo_CS();
         this.pvzService.sendMessage(_loc1_);
         this.initActInfo();
      }
      
      private function onCmd_DaveLabor_AddScore_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_DaveLabor_AddScore_SC = param1.socketData as Cmd_DaveLabor_AddScore_SC;
         this.totalCount = _loc2_.totalNum;
         if(!this.giftOpenEffect)
         {
            this.getItemCount = 0;
            ActDf51Cmd.showGetItemView(_loc2_.addNum);
         }
         else
         {
            this.getItemCount = _loc2_.addNum;
         }
      }
      
      private function initActInfo() : void
      {
         var _loc1_:Vector.<ActivityCommonInfo> = this.actProxy.getGroupByViewType(ActivityGlobal.VIEW_TYPE_DF51);
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_.length)
         {
            if(_loc2_ == 0)
            {
               this.todayAct = _loc1_[_loc2_];
               this.todayActId = _loc1_[_loc2_].id;
               this.todayClientParam = new ActDf51ClientStepVo();
               this.todayClientParam.initWithJson(_loc1_[_loc2_].clientParam);
            }
            else if(_loc2_ == 1)
            {
               this.totalAct = _loc1_[_loc2_];
               this.totalActId = _loc1_[_loc2_].id;
               this.totalClientParam = new ActDf51ClientParam(_loc1_[_loc2_].clientParam,this.totalActId);
            }
            ActivityProxyCmd.getActivityInfo(_loc1_[_loc2_].id);
            _loc2_++;
         }
      }
      
      private function onGetActvityInfo(param1:CommonEvent) : void
      {
         var _loc2_:ActivityCommonInfo = param1.param as ActivityCommonInfo;
         if(_loc2_.id == this.todayActId)
         {
            dispatch(new Event(ActDf51Const.ACT_DF_51_UPDATE_TODAY));
         }
         else if(_loc2_.id == this.totalActId)
         {
            dispatch(new Event(ActDf51Const.ACT_DF_51_UPDATE_TOTAL));
         }
      }
      
      private function onCmd_DaveLabor_GetInfo_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_DaveLabor_GetInfo_SC = param1.socketData as Cmd_DaveLabor_GetInfo_SC;
         this.todayCount = _loc2_.todayNum;
         this.totalCount = _loc2_.totalNum;
         var _loc3_:int = 0;
         while(_loc3_ < this.totalClientParam.steps.length)
         {
            if(this.totalCount >= this.totalClientParam.steps[_loc3_].score)
            {
               this.totalCurStep = _loc3_ + 1;
            }
            _loc3_++;
         }
         dispatch(new Event(ActDf51Const.ACT_DF_51_INFO_BACK));
      }
   }
}
