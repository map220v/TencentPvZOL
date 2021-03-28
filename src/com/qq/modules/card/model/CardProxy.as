package com.qq.modules.card.model
{
   import PVZ.Cmd.Cmd_Card_AutoRecycle_SC;
   import PVZ.Cmd.Cmd_Card_BuyAvatar_SC;
   import PVZ.Cmd.Cmd_Card_ForgeAvatar_SC;
   import PVZ.Cmd.Cmd_Card_Forge_SC;
   import PVZ.Cmd.Cmd_Card_GetAvatarInfo_SC;
   import PVZ.Cmd.Cmd_Card_RecycleAvatar_SC;
   import PVZ.Cmd.Cmd_Card_Recycle_SC;
   import PVZ.Cmd.Cmd_Card_SwapAttributeLost_SC;
   import PVZ.Cmd.Cmd_Card_SwapAttribute_SC;
   import PVZ.Cmd.Cmd_Card_SwapGeneItem_SC;
   import PVZ.Cmd.Cmd_Card_SyncFullInfo_SC;
   import PVZ.Cmd.Cmd_Card_UseAvatar_SC;
   import PVZ.Cmd.Cmd_Card_UseCardUpgrade_SC;
   import PVZ.Cmd.Dto_IdNum;
   import com.qq.GameGloble;
   import com.qq.modules.bag.ItemType;
   import com.qq.modules.bag.model.BagItemTemplate;
   import com.qq.modules.bag.model.ItemTemplateFactory;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.modle.BasicProxy;
   import com.qq.modules.card.CardGlobals;
   import com.qq.modules.card.model.vo.CardItemVO;
   import com.qq.modules.main.command.CommonCmd;
   import com.qq.utils.CommandDispatcher;
   import com.tencent.protobuf.Int64;
   import tencent.io.service.events.SocketServiceEvent;
   
   public class CardProxy extends BasicProxy
   {
       
      
      public var selectedCards:Vector.<CardItemVO>;
      
      public var currentCard:CardItemVO;
      
      public var selectEquipPosition:int;
      
      public var oldCard:CardItemVO;
      
      public var isSwapConfigLeft:Boolean;
      
      public var leftSwapCard:CardItemVO;
      
      public var rightSwapCard:CardItemVO;
      
      public var swapCardDNANeedItem:Dto_IdNum;
      
      public var swapCardDNARewardItem:Dto_IdNum;
      
      public var swapCardDNANeedResult:Boolean;
      
      public var lastSwitchScene:String;
      
      public var autoRecycleResult:Array;
      
      public function CardProxy()
      {
         super();
         GameGloble.cardProxy = this;
      }
      
      override public function init(param1:Array = null) : void
      {
         super.init();
      }
      
      override public function listMsgInterests() : Array
      {
         return [[Cmd_Card_UseCardUpgrade_SC.$MessageID,this.onCmd_Card_UseCardUpgrade_SC],[Cmd_Card_Recycle_SC.$MessageID,this.onCmd_Card_Recycle_SC],[Cmd_Card_AutoRecycle_SC.$MessageID,this.onCmd_Card_Auto_Recycle_SC],[Cmd_Card_Forge_SC.$MessageID,this.onCmd_Card_Forge_SC],[Cmd_Card_SyncFullInfo_SC.$MessageID,this.onCmd_Card_SyncFullInfo_SC],[Cmd_Card_GetAvatarInfo_SC.$MessageID,this.onCmd_Card_GetAvatarInfo_SC],[Cmd_Card_BuyAvatar_SC.$MessageID,this.onCmd_Card_BuyAvatar_SC],[Cmd_Card_ForgeAvatar_SC.$MessageID,this.onCmd_Card_ForgeAvatar_SC],[Cmd_Card_UseAvatar_SC.$MessageID,this.onCmd_Card_UseAvatar_SC],[Cmd_Card_SwapAttribute_SC.$MessageID,this.onCmd_Card_SwapAttribute_SC],[Cmd_Card_RecycleAvatar_SC.$MessageID,this.onCmd_Card_RecycleAvatar_SC],[Cmd_Card_SwapAttributeLost_SC.$MessageID,this.onCmd_Card_SwapAttributeLost_SC],[Cmd_Card_SwapGeneItem_SC.$MessageID,this.onCmd_Card_SwapGeneItem_SC]];
      }
      
      private function onCmd_Card_SwapGeneItem_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_Card_SwapGeneItem_SC = param1.socketData as Cmd_Card_SwapGeneItem_SC;
         if(_loc2_.cost != null && _loc2_.cost.length > 0)
         {
            this.swapCardDNANeedItem = _loc2_.cost[0];
         }
         else
         {
            this.swapCardDNANeedItem = null;
         }
         if(_loc2_.reward != null && _loc2_.reward.length > 0)
         {
            this.swapCardDNARewardItem = _loc2_.reward[0];
         }
         else
         {
            this.swapCardDNARewardItem = null;
         }
         this.swapCardDNANeedResult = _loc2_.result == 1;
         CommandDispatcher.send(CardGlobals.CARD_SWAP_GET_SWAP_CARDDNA_NEED_ITEM);
      }
      
      private function onCmd_Card_SwapAttributeLost_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_Card_SwapAttributeLost_SC = param1.socketData as Cmd_Card_SwapAttributeLost_SC;
         CommandDispatcher.send(CardGlobals.CARD_SWAP_ATTRIBUTE_LOST,_loc2_.refine);
      }
      
      private function onCmd_Card_RecycleAvatar_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_Card_RecycleAvatar_SC = param1.socketData as Cmd_Card_RecycleAvatar_SC;
         CommonCmd.itemFly(_loc2_.recycleResult);
      }
      
      private function onCmd_Card_UseAvatar_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_Card_UseAvatar_SC = param1.socketData as Cmd_Card_UseAvatar_SC;
         if(this.currentCard)
         {
            this.currentCard.updateAvatarList(_loc2_.changedAvatar);
         }
         CommandDispatcher.send(CardGlobals.CARD_AVATAR_INFO_UPDATE);
         CommandDispatcher.send(CardGlobals.HOME_CARD_SELECT_CARD_EVENT);
      }
      
      private function onCmd_Card_GetAvatarInfo_SC(param1:SocketServiceEvent) : void
      {
         var _loc3_:CommonEvent = null;
         var _loc2_:Cmd_Card_GetAvatarInfo_SC = param1.socketData as Cmd_Card_GetAvatarInfo_SC;
         if(this.currentCard)
         {
            this.currentCard.setAvatarAttr(_loc2_.avatarAllAttr);
            this.currentCard.updateAvatarList(_loc2_.avatarList);
            _loc3_ = new CommonEvent(CardGlobals.CARD_AVATAR_INFO_UPDATE);
            _loc3_.param = new Object();
            _loc3_.param.changeAvatar = 1;
            eventDispatcher.dispatchEvent(_loc3_);
         }
         CommandDispatcher.send(CardGlobals.CARD_AVATAR_GET_INFO,_loc2_.avatarList);
      }
      
      private function onCmd_Card_BuyAvatar_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_Card_BuyAvatar_SC = param1.socketData as Cmd_Card_BuyAvatar_SC;
         if(this.currentCard)
         {
            this.currentCard.setAvatarAttr(_loc2_.avatarAllAttr);
            this.currentCard.updateAvatarList([_loc2_.avatarInfo]);
         }
         CommandDispatcher.send(CardGlobals.CARD_AVATAR_INFO_UPDATE);
      }
      
      private function onCmd_Card_ForgeAvatar_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_Card_ForgeAvatar_SC = param1.socketData as Cmd_Card_ForgeAvatar_SC;
         if(this.currentCard)
         {
            this.currentCard.setAvatarAttr(_loc2_.avatarAllAttr);
            this.currentCard.updateAvatarList([_loc2_.avatarInfo]);
         }
         eventDispatcher.dispatchEvent(new CommonEvent(CardGlobals.CARD_AVATAR_INFO_UPDATE));
         eventDispatcher.dispatchEvent(new CommonEvent(CardGlobals.CARD_AVATAR_INFO_FOREST));
      }
      
      private function onCmd_Card_SyncFullInfo_SC(param1:SocketServiceEvent) : void
      {
         var _loc4_:int = 0;
         var _loc2_:Cmd_Card_SyncFullInfo_SC = param1.socketData as Cmd_Card_SyncFullInfo_SC;
         var _loc3_:Array = _loc2_.changeCardList;
         _loc4_ = 0;
         while(_loc4_ < _loc3_.length)
         {
            eventDispatcher.dispatchEvent(new CommonEvent(CardGlobals.CARD_PROP_UPDATED,new CardItemVO(_loc3_[_loc4_])));
            _loc4_++;
         }
         _loc4_ = 0;
         while(_loc4_ < _loc2_.addCardList.length)
         {
            eventDispatcher.dispatchEvent(new CommonEvent(CardGlobals.CARD_ADDED,new CardItemVO(_loc2_.addCardList[_loc4_])));
            _loc4_++;
         }
         _loc4_ = 0;
         while(_loc4_ < _loc2_.delCardList.length)
         {
            eventDispatcher.dispatchEvent(new CommonEvent(CardGlobals.CARD_DELETED,_loc2_.delCardList[_loc4_]));
            _loc4_++;
         }
      }
      
      private function onCmd_Card_UseCardUpgrade_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_Card_UseCardUpgrade_SC = param1.socketData as Cmd_Card_UseCardUpgrade_SC;
         this.currentCard = this.getCardByUID(_loc2_.newUId);
         dispatch(new CommonEvent(CardGlobals.CARD_UPGRADE_SUCCEED,{"newUID":_loc2_.newUId}));
      }
      
      private function onCmd_Card_Recycle_SC(param1:SocketServiceEvent) : void
      {
         var _loc6_:Dto_IdNum = null;
         var _loc7_:BagItemTemplate = null;
         var _loc2_:Cmd_Card_Recycle_SC = param1.socketData as Cmd_Card_Recycle_SC;
         var _loc3_:Array = new Array();
         var _loc4_:int = _loc2_.recycleResult.length;
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc6_ = _loc2_.recycleResult[_loc5_];
            if((_loc7_ = ItemTemplateFactory.instance.getBagItemTemplateById(_loc6_.id)) != null && _loc7_.type != ItemType.TYPE_PUZZLE)
            {
               _loc3_.push(_loc6_);
            }
            _loc5_++;
         }
         dispatch(new CommonEvent(CardGlobals.CARD_RECYCLE_SUCCEED,{
            "uid":_loc2_.cardUId,
            "items":_loc3_
         }));
      }
      
      private function onCmd_Card_Auto_Recycle_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_Card_AutoRecycle_SC = param1.socketData as Cmd_Card_AutoRecycle_SC;
         this.autoRecycleResult = _loc2_.recycleResult;
         if(this.autoRecycleResult.length > 0)
         {
            dispatch(new CommonEvent(CardGlobals.CARD_AUTO_RECYCLE_SUCCEED));
         }
         else
         {
            CommonCmd.txtFly("本次批量拆解没有获得任何道具");
         }
      }
      
      private function onCmd_Card_Forge_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_Card_Forge_SC = param1.socketData as Cmd_Card_Forge_SC;
         this.currentCard = this.getCardByUID(_loc2_.cardUId);
         dispatch(new CommonEvent(CardGlobals.CARD_FORGE_SUCCEED,{
            "isSuccess":_loc2_.isSuccess,
            "cardUId":_loc2_.cardUId
         }));
      }
      
      private function onCmd_Card_SwapAttribute_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_Card_SwapAttribute_SC = param1.socketData as Cmd_Card_SwapAttribute_SC;
         dispatch(new CommonEvent(CardGlobals.CARD_SWAP_ATTRIBUTE_EVENT));
      }
      
      public function getAllCard(param1:CardItemVO = null) : Vector.<CardItemVO>
      {
         var _loc4_:CardItemVO = null;
         var _loc2_:Vector.<CardItemVO> = new Vector.<CardItemVO>();
         var _loc3_:Vector.<CardItemVO> = GameGloble.actorModel.battleCardModel.battleCardList;
         if(param1)
         {
            for each(_loc4_ in _loc3_)
            {
               if(!_loc4_.uid.compare(param1.uid))
               {
                  _loc2_.push(_loc4_);
               }
            }
         }
         else
         {
            _loc2_ = _loc3_.concat();
         }
         return _loc2_.sort(this.allCardSortFunc);
      }
      
      private function allCardSortFunc(param1:CardItemVO, param2:CardItemVO) : Number
      {
         if(param1.power == param2.power)
         {
            if(param1.isEmbattle == param2.isEmbattle)
            {
               return param1.uid.toNumber() - param2.uid.toNumber();
            }
            if(param1.isEmbattle)
            {
               return -1;
            }
            return 1;
         }
         return param2.power - param1.power;
      }
      
      public function getSimilarCard(param1:CardItemVO) : Vector.<CardItemVO>
      {
         var _loc4_:CardItemVO = null;
         if(param1 == null)
         {
            return null;
         }
         var _loc2_:Vector.<CardItemVO> = new Vector.<CardItemVO>();
         var _loc3_:Vector.<CardItemVO> = GameGloble.actorModel.battleCardModel.battleCardList;
         for each(_loc4_ in _loc3_)
         {
            if(!_loc4_.uid.compare(param1.uid) && !_loc4_.isEmbattle && param1.pvpPlantTemplate.tdId == _loc4_.pvpPlantTemplate.tdId)
            {
               _loc2_.push(_loc4_);
            }
         }
         return _loc2_;
      }
      
      public function getCardForgeCost(param1:CardItemVO) : Vector.<CardItemVO>
      {
         var _loc4_:CardItemVO = null;
         var _loc2_:Vector.<CardItemVO> = new Vector.<CardItemVO>();
         if(param1 == null)
         {
            return _loc2_;
         }
         var _loc3_:Vector.<CardItemVO> = GameGloble.actorModel.battleCardModel.battleCardList;
         for each(_loc4_ in _loc3_)
         {
            if(!_loc4_.uid.compare(param1.uid) && !_loc4_.isEmbattle)
            {
               if(param1.isMaxForgeLv && param1.forgeTemplate == null)
               {
                  _loc2_.push(_loc4_);
               }
            }
         }
         return _loc2_.sort(this.forgeCostSortFunction);
      }
      
      private function forgeCostSortFunction(param1:CardItemVO, param2:CardItemVO) : Number
      {
         return this.allCardSortFunc(param1,param2);
      }
      
      public function getCardByUID(param1:Int64) : CardItemVO
      {
         var _loc3_:CardItemVO = null;
         var _loc2_:Vector.<CardItemVO> = GameGloble.actorModel.battleCardModel.battleCardList;
         for each(_loc3_ in _loc2_)
         {
            if(_loc3_.uid.compare(param1))
            {
               return _loc3_;
            }
         }
         return null;
      }
      
      public function allowScaleAtHome(param1:int) : Boolean
      {
         var _loc2_:int = 0;
         for each(_loc2_ in CardGlobals.CARD_HOME_NO_SCALE_IDS)
         {
            if(param1 >= _loc2_ + 1 && param1 <= _loc2_ + 5)
            {
               return false;
            }
         }
         return true;
      }
      
      public function getCardRecycleResule(param1:CardItemVO) : String
      {
         if(param1 == null)
         {
            return "";
         }
         return param1.pvpPlantTemplate.newItem.template.name + ":" + param1.pvpPlantTemplate.newItem.amount;
      }
   }
}
