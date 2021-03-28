package com.qq.modules.luckystar.model
{
   import PVZ.Cmd.Cmd_LuckyStar_Buy_SC;
   import PVZ.Cmd.Cmd_LuckyStar_Info_SC;
   import PVZ.Cmd.Cmd_LuckyStar_Take_DailyPack_SC;
   import PVZ.Cmd.Dto_IdNum;
   import com.qq.modules.bag.model.vo.ItemVO;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.modle.BasicProxy;
   import com.qq.modules.buy.model.vo.BuyMallItemVO;
   import com.qq.modules.entryIcon.command.EntryIconCmd;
   import com.qq.modules.luckystar.command.LuckyStarCmd;
   import com.qq.modules.luckystar.model.templates.LuckyStarDayBuyTemplate;
   import com.qq.modules.luckystar.model.templates.LuckyStarItemsTemplate;
   import com.qq.modules.luckystar.model.templates.LuckyStarTemplateFactory;
   import com.qq.modules.luckystar.view.LuckyStarGlobal;
   import com.qq.modules.main.command.CommonCmd;
   import tencent.io.service.events.SocketServiceEvent;
   
   public class LuckyStarProxy extends BasicProxy
   {
       
      
      public var items:Vector.<BuyMallItemVO>;
      
      public var info:Cmd_LuckyStar_Info_SC;
      
      public var hasDataAndNotShowed:Boolean;
      
      public function LuckyStarProxy()
      {
         this.items = new Vector.<BuyMallItemVO>();
         super();
      }
      
      override public function listMsgInterests() : Array
      {
         return [[Cmd_LuckyStar_Info_SC.$MessageID,this.onCmd_LuckyStar_Info_SC],[Cmd_LuckyStar_Take_DailyPack_SC.$MessageID,this.onCmd_LuckyStar_Take_DailyPack_SC],[Cmd_LuckyStar_Buy_SC.$MessageID,this.onCmd_LuckyStar_Buy_SC]];
      }
      
      public function setInfoNull() : void
      {
         this.info = null;
         this.sendEvent(LuckyStarGlobal.LuckyStar_Info_Changed);
      }
      
      private function onCmd_LuckyStar_Info_SC(param1:SocketServiceEvent) : void
      {
         var sse:SocketServiceEvent = param1;
         var msg:Cmd_LuckyStar_Info_SC = sse.socketData as Cmd_LuckyStar_Info_SC;
         this.info = msg;
         this.hasDataAndNotShowed = true;
         LuckyStarCmd.tryShowMainWd();
         EntryIconCmd.addSystemIcon(1016,function():void
         {
            LuckyStarCmd.doShowMainWd();
         });
         EntryIconCmd.changeSystemEffect(1016,msg.isTakeDailyPack == 0);
      }
      
      private function onCmd_LuckyStar_Take_DailyPack_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Boolean = false;
         var _loc4_:LuckyStarItemsTemplate = null;
         var _loc5_:Array = null;
         var _loc6_:Vector.<ItemVO> = null;
         var _loc7_:int = 0;
         var _loc3_:Cmd_LuckyStar_Take_DailyPack_SC = param1.socketData as Cmd_LuckyStar_Take_DailyPack_SC;
         if(this.info.isTakeDailyPack != _loc3_.isTakeDailyPack)
         {
            _loc4_ = LuckyStarTemplateFactory.instance.getLuckyStarItemsTemplate(this.info.id,this.info.dailyPackId);
            _loc5_ = [];
            _loc6_ = _loc4_.getRewardItems();
            _loc7_ = 0;
            while(_loc7_ < _loc6_.length)
            {
               _loc5_.push(_loc6_[_loc7_].createDto_IdNum());
               _loc7_++;
            }
            CommonCmd.itemFly(_loc5_,false);
            this.info.isTakeDailyPack = _loc3_.isTakeDailyPack;
            _loc2_ = true;
         }
         this.info.dailyPackId = _loc3_.dailyPackId;
         this.sendEvent(LuckyStarGlobal.LuckyStar_Info_Changed);
         EntryIconCmd.changeSystemEffect(1016,_loc3_.isTakeDailyPack == 0);
      }
      
      private function onCmd_LuckyStar_Buy_SC(param1:SocketServiceEvent) : void
      {
         var _loc3_:Dto_IdNum = null;
         var _loc4_:int = 0;
         var _loc5_:Dto_IdNum = null;
         var _loc6_:LuckyStarDayBuyTemplate = null;
         var _loc2_:Cmd_LuckyStar_Buy_SC = param1.socketData as Cmd_LuckyStar_Buy_SC;
         if(_loc2_.product.length > 0)
         {
            _loc3_ = _loc2_.product[0];
            _loc4_ = 0;
            while(_loc4_ < this.info.product.length)
            {
               if((_loc5_ = this.info.product[_loc4_]).id == _loc3_.id)
               {
                  _loc5_.num = _loc3_.num;
                  _loc6_ = LuckyStarTemplateFactory.instance.getLuckyStarDayBuyTemplate(this.info.id,_loc3_.id);
                  CommonCmd.itemFly([_loc6_.getRewardItem().createDto_IdNum()],false);
                  break;
               }
               _loc4_++;
            }
         }
         this.sendEvent(LuckyStarGlobal.LuckyStar_Info_Changed);
      }
      
      private function sendEvent(param1:String, param2:Object = null) : void
      {
         this.dispatch(new CommonEvent(param1,param2));
      }
   }
}
