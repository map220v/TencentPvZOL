package com.qq.modules.collectCoin.model
{
   import PVZ.Cmd.Cmd_TD_CollectProduct_SC;
   import PVZ.Cmd.Cmd_TD_GetProductInfo_SC;
   import PVZ.Cmd.Cmd_Vip_GetTodayEnergy_SC;
   import PVZ.Cmd.Cmd_Vip_GetTodayTicket_SC;
   import PVZ.Cmd.Dto_ItemInfo;
   import com.qq.CommandName;
   import com.qq.GameGloble;
   import com.qq.constant.ItemID;
   import com.qq.modules.basic.modle.BasicProxy;
   import com.qq.modules.collectCoin.command.CollectCoinServiceCmd;
   import com.qq.modules.login.model.CoinCollectInfo;
   import com.qq.modules.main.command.CommonCmd;
   import com.qq.utils.CommandDispatcher;
   import com.qq.utils.UrlManager;
   import tencent.io.service.events.SocketServiceEvent;
   
   public class CollectCoinService extends BasicProxy
   {
       
      
      [Inject]
      public var tdCoinCollectInfo:CoinCollectInfo;
      
      public function CollectCoinService()
      {
         super();
      }
      
      override public function listMsgInterests() : Array
      {
         return [[Cmd_TD_GetProductInfo_SC.$MessageID,this.onCmd_TD_GetProductInfo_SC],[Cmd_TD_CollectProduct_SC.$MessageID,this.onCmd_TD_CollectProduct_SC],[Cmd_Vip_GetTodayEnergy_SC.$MessageID,this.getTodayEnergyHandler],[Cmd_Vip_GetTodayTicket_SC.$MessageID,this.onCmd_Vip_GetTodayTicket_SC]];
      }
      
      private function onCmd_TD_CollectProduct_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Dto_ItemInfo = new Dto_ItemInfo();
         _loc2_.id = ItemID.Coin;
         _loc2_.num = this.tdCoinCollectInfo.coinProduct;
         CommonCmd.itemFly([_loc2_]);
         CollectCoinServiceCmd.requestCoinCollectInfo();
      }
      
      private function onCmd_TD_GetProductInfo_SC(param1:SocketServiceEvent) : void
      {
         var _loc3_:String = null;
         var _loc2_:Cmd_TD_GetProductInfo_SC = param1.socketData as Cmd_TD_GetProductInfo_SC;
         this.tdCoinCollectInfo.canCollect = _loc2_.canCollect;
         this.tdCoinCollectInfo.coinProduct = _loc2_.coinProduct;
         this.tdCoinCollectInfo.lastCollectTime = _loc2_.lastCollectTime;
         if(this.tdCoinCollectInfo.canCollect)
         {
            _loc3_ = UrlManager.getInstance().getUrl(UrlManager.Url_CollectCoin,"flag.png");
         }
      }
      
      private function getTodayEnergyHandler(param1:SocketServiceEvent) : void
      {
         CommandDispatcher.send(CommandName.ChangeVip);
         var _loc2_:Dto_ItemInfo = new Dto_ItemInfo();
         _loc2_.id = ItemID.Power;
         _loc2_.num = GameGloble.actorModel.selfPrivilegeModel.vipGotPhysical;
         CommonCmd.itemFly([_loc2_]);
         GameGloble.actorModel.selfPrivilegeModel.vipGotPhysical = 0;
         GameGloble.actorModel.selfPrivilegeModel.vipInfo.hasTakenEnergy = true;
      }
      
      private function onCmd_Vip_GetTodayTicket_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Dto_ItemInfo = new Dto_ItemInfo();
         _loc2_.id = ItemID.GiftDiamond2;
         _loc2_.num = GameGloble.actorModel.selfPrivilegeModel.vipGotTicket;
         CommonCmd.itemFly([_loc2_]);
         GameGloble.actorModel.selfPrivilegeModel.vipGotTicket = 0;
         GameGloble.actorModel.selfPrivilegeModel.vipInfo.hasTakenTicket = true;
         CommandDispatcher.send(CommandName.ChangeVip);
      }
   }
}
