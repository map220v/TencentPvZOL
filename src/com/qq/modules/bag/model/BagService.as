package com.qq.modules.bag.model
{
   import PVZ.Cmd.Cmd_Equip_SellAllClone_SC;
   import PVZ.Cmd.Cmd_Item_Exchange_SC;
   import PVZ.Cmd.Cmd_Item_GetBagInfo_CS;
   import PVZ.Cmd.Cmd_Item_GetBagInfo_SC;
   import PVZ.Cmd.Cmd_Item_MergeChlorophyll_CS;
   import PVZ.Cmd.Cmd_Item_MergeChlorophyll_SC;
   import PVZ.Cmd.Cmd_Item_OpenChest_SC;
   import PVZ.Cmd.Cmd_Item_OpenGiftChestBatch_SC;
   import PVZ.Cmd.Cmd_Item_OpenGift_SC;
   import PVZ.Cmd.Cmd_Item_RecycleDebris_SC;
   import PVZ.Cmd.Cmd_Item_SellItems_SC;
   import PVZ.Cmd.Cmd_Item_Update_SC;
   import PVZ.Cmd.Cmd_Item_Use_CS;
   import PVZ.Cmd.Cmd_Item_Use_SC;
   import PVZ.Cmd.Dto_IdNum;
   import PVZ.Cmd.Dto_ItemInfo;
   import com.qq.GameGloble;
   import com.qq.modules.bag.BagGlobals;
   import com.qq.modules.bag.ItemType;
   import com.qq.modules.bag.command.BagViewCmd;
   import com.qq.modules.bag.model.vo.BagProxy;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.modle.BasicProxy;
   import com.qq.modules.main.command.CommonCmd;
   import com.qq.modules.main.logic.initData.InitDataManager;
   import com.qq.modules.main.server.PvzSocketService;
   import com.qq.utils.CommandDispatcher;
   import tencent.io.service.events.SocketServiceEvent;
   
   public class BagService extends BasicProxy
   {
       
      
      [Inject]
      public var bagInfo:BagProxy;
      
      [Inject]
      public var myServer:PvzSocketService;
      
      private var m_cacheItems:Array;
      
      public function BagService()
      {
         this.m_cacheItems = [];
         super();
      }
      
      override public function listMsgInterests() : Array
      {
         return [[Cmd_Item_GetBagInfo_SC.$MessageID,this.onInitBagInfo],[Cmd_Item_Update_SC.$MessageID,this.onUpdateBagInfo],[Cmd_Item_OpenChest_SC.$MessageID,this.openChestHandler],[Cmd_Item_OpenGift_SC.$MessageID,this.openGiftHandler],[Cmd_Item_Use_SC.$MessageID,this.useItemHandler],[Cmd_Item_OpenGiftChestBatch_SC.$MessageID,this.onOpenChestBatch],[Cmd_Item_SellItems_SC.$MessageID,this.onItemSellHandler],[Cmd_Equip_SellAllClone_SC.$MessageID,this.onCmd_Equip_SellAllClone_SC],[Cmd_Item_MergeChlorophyll_SC.$MessageID,this.onCmd_Item_MergeChlorophyll_SC],[Cmd_Item_RecycleDebris_SC.$MessageID,this.onCmd_Item_RecycleDebris_SC],[Cmd_Item_Exchange_SC.$MessageID,this.onCmd_Item_Exchange_SC]];
      }
      
      private function onCmd_Item_Exchange_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_Item_Exchange_SC = param1.socketData as Cmd_Item_Exchange_SC;
         var _loc3_:Dto_IdNum = new Dto_IdNum();
         _loc3_.id = _loc2_.exchangeItemId;
         _loc3_.num = _loc2_.exchangeItemNum;
         CommonCmd.itemFly([_loc3_]);
      }
      
      private function onCmd_Equip_SellAllClone_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_Equip_SellAllClone_SC = param1.socketData as Cmd_Equip_SellAllClone_SC;
         if(this.bagInfo.clearAllCloneEquipment())
         {
            this.dispatch(new CommonEvent(BagGlobals.BAG_ITEM_CHANGED));
         }
      }
      
      private function onItemSellHandler(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_Item_SellItems_SC = param1.socketData as Cmd_Item_SellItems_SC;
         this.dispatch(new CommonEvent(BagGlobals.BAG_ITEM_SELL));
      }
      
      private function useItemHandler(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_Item_Use_SC = param1.socketData as Cmd_Item_Use_SC;
         var _loc3_:BagItemTemplate = ItemTemplateFactory.instance.getBagItemTemplateById(_loc2_.itemId);
         if(_loc3_.subType == ItemType.SUB_TYPE_GOLD_LIQUID)
         {
            CommonCmd.txtFly("使用成功！您营养室中的黄金原液数已增加！");
         }
         CommandDispatcher.send(BagGlobals.BAG_ITEM_USE);
      }
      
      private function onCmd_Item_MergeChlorophyll_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_Item_MergeChlorophyll_SC = param1.socketData as Cmd_Item_MergeChlorophyll_SC;
         this.dispatch(new CommonEvent(BagGlobals.BAG_ITEM_COMPOSE));
      }
      
      private function openGiftHandler(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_Item_OpenGift_SC = param1.socketData as Cmd_Item_OpenGift_SC;
         BagViewCmd.playBagItemOpenEffect(_loc2_.usedItemId,_loc2_.openedItems);
      }
      
      private function openChestHandler(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_Item_OpenChest_SC = param1.socketData as Cmd_Item_OpenChest_SC;
         BagViewCmd.openChest(_loc2_.usedItemId,_loc2_.allItems,_loc2_.openedItems);
      }
      
      private function onOpenChestBatch(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_Item_OpenGiftChestBatch_SC = param1.socketData as Cmd_Item_OpenGiftChestBatch_SC;
         BagViewCmd.showBatchUseResultWd(_loc2_.itemId,_loc2_.itemNum,_loc2_.openedItems);
      }
      
      private function onInitBagInfo(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_Item_GetBagInfo_SC = param1.socketData as Cmd_Item_GetBagInfo_SC;
         this.m_cacheItems = this.m_cacheItems.concat(_loc2_.all);
         if(_loc2_.bNext == false)
         {
            this.bagInfo.initItems(this.m_cacheItems);
            this.bagInfo.newItemsArr = _loc2_.newItemList;
            this.dispatch(new CommonEvent(BagGlobals.BAG_ITEM_CHANGED));
            InitDataManager.getInstance().finishTask(InitDataManager.Init_BagItemInfo);
         }
         GameGloble.bagProxy = this.bagInfo;
      }
      
      private function onUpdateBagInfo(param1:SocketServiceEvent) : void
      {
         var _loc5_:Dto_ItemInfo = null;
         var _loc2_:Cmd_Item_Update_SC = param1.socketData as Cmd_Item_Update_SC;
         var _loc3_:int = _loc2_.changeItems.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = _loc2_.changeItems[_loc4_] as Dto_ItemInfo;
            this.bagInfo.updateItem(_loc5_);
            _loc4_++;
         }
         this.dispatch(new CommonEvent(BagGlobals.BAG_ITEM_CHANGED));
      }
      
      private function onCmd_Item_RecycleDebris_SC(param1:SocketServiceEvent) : void
      {
         this.dispatch(new CommonEvent(BagGlobals.BAG_DEBRIS_RECYCLE));
      }
      
      public function getBagItemInfo() : void
      {
         this.myServer.sendMessage(new Cmd_Item_GetBagInfo_CS());
      }
      
      public function useItem(param1:int, param2:int = 1) : void
      {
         var _loc3_:Cmd_Item_Use_CS = new Cmd_Item_Use_CS();
         _loc3_.itemId = param1;
         _loc3_.iNum = param2;
         this.myServer.sendMessage(_loc3_);
      }
      
      public function compoundChl(param1:int, param2:Boolean) : void
      {
         var _loc3_:Cmd_Item_MergeChlorophyll_CS = new Cmd_Item_MergeChlorophyll_CS();
         _loc3_.itemBaseId = param1;
         _loc3_.isAll = param2;
         this.myServer.sendMessage(_loc3_);
      }
   }
}
