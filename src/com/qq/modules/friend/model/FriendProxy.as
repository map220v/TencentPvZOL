package com.qq.modules.friend.model
{
   import PVZ.Cmd.Cmd_Friend_ApplyAgree_SC;
   import PVZ.Cmd.Cmd_Friend_ApplyIgnore_SC;
   import PVZ.Cmd.Cmd_Friend_ApplyRecommend_SC;
   import PVZ.Cmd.Cmd_Friend_Apply_SC;
   import PVZ.Cmd.Cmd_Friend_DeleteEnergyInfo_SC;
   import PVZ.Cmd.Cmd_Friend_DeleteFightInfo_SC;
   import PVZ.Cmd.Cmd_Friend_Delete_SC;
   import PVZ.Cmd.Cmd_Friend_GetApplyList_SC;
   import PVZ.Cmd.Cmd_Friend_GetEnergyList_SC;
   import PVZ.Cmd.Cmd_Friend_GetFightList_SC;
   import PVZ.Cmd.Cmd_Friend_GetList_SC;
   import PVZ.Cmd.Cmd_Friend_GetRecommendList_SC;
   import PVZ.Cmd.Cmd_Friend_NewApply_SC;
   import PVZ.Cmd.Cmd_Friend_PresentEnergy_SC;
   import PVZ.Cmd.Cmd_Friend_ReturnEnergyInfo_SC;
   import PVZ.Cmd.Cmd_Friend_SyncOperationStatus_SC;
   import PVZ.Cmd.Cmd_Friend_SyncOperation_SC;
   import PVZ.Cmd.Cmd_Friend_TakeEnergyInfo_SC;
   import PVZ.Cmd.Cmd_SetAvatarPlant_SC;
   import PVZ.Cmd.Dto_FriendApply;
   import PVZ.Cmd.Dto_FriendInfo;
   import PVZ.Cmd.FriendModuleType;
   import asgui.utils.StringUtil;
   import com.qq.GameGloble;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.modle.BasicProxy;
   import com.qq.modules.friend.FriendGlobals;
   import com.qq.modules.friend.model.vo.FriendLogVo;
   import com.qq.modules.friend.model.vo.FriendRoleVo;
   import com.qq.modules.main.command.CommonCmd;
   import com.qq.templates.font.FontNormal;
   import com.tencent.protobuf.Int64;
   import tencent.io.service.events.SocketServiceEvent;
   
   public class FriendProxy extends BasicProxy
   {
       
      
      public var requestFriendRoldId:Int64;
      
      public var data:FriendData;
      
      public var recommendFriends:Vector.<FriendLogVo>;
      
      public var applyLogs:FriendApplyLogData;
      
      public var fightLogs:FriendFightLogData;
      
      public var giftEnergyLogs:FriendGiftEnergyLogData;
      
      public function FriendProxy()
      {
         this.data = new FriendData();
         this.applyLogs = new FriendApplyLogData();
         this.fightLogs = new FriendFightLogData();
         this.giftEnergyLogs = new FriendGiftEnergyLogData();
         super();
      }
      
      override public function init(param1:Array = null) : void
      {
         super.init();
      }
      
      override public function listMsgInterests() : Array
      {
         return [[Cmd_Friend_GetList_SC.$MessageID,this.onCmd_Friend_GetList_SC],[Cmd_SetAvatarPlant_SC.$MessageID,this.onCmd_SetAvatarPlant_SC],[Cmd_Friend_SyncOperation_SC.$MessageID,this.onCmd_Friend_SyncOperation_SC],[Cmd_Friend_SyncOperationStatus_SC.$MessageID,this.onCmd_Friend_SyncOperationStatus_SC],[Cmd_Friend_Delete_SC.$MessageID,this.onCmd_Friend_Delete_SC],[Cmd_Friend_GetApplyList_SC.$MessageID,this.onCmd_Friend_GetApplyList_SC],[Cmd_Friend_Apply_SC.$MessageID,this.onCmd_Friend_Apply_SC],[Cmd_Friend_ApplyAgree_SC.$MessageID,this.onCmd_Friend_ApplyAgree_SC],[Cmd_Friend_ApplyIgnore_SC.$MessageID,this.onCmd_Friend_ApplyIgnore_SC],[Cmd_Friend_GetRecommendList_SC.$MessageID,this.onCmd_Friend_GetRecommendList_SC],[Cmd_Friend_ApplyRecommend_SC.$MessageID,this.onCmd_Friend_ApplyRecommend_SC],[Cmd_Friend_NewApply_SC.$MessageID,this.onCmd_Friend_NewApply_SC],[Cmd_Friend_PresentEnergy_SC.$MessageID,this.onCmd_Friend_PresentEnergy_SC],[Cmd_Friend_GetFightList_SC.$MessageID,this.onCmd_Friend_GetFightList_SC],[Cmd_Friend_DeleteFightInfo_SC.$MessageID,this.onCmd_Friend_DeleteFightInfo_SC],[Cmd_Friend_GetEnergyList_SC.$MessageID,this.onCmd_Friend_GetEnergyList_SC],[Cmd_Friend_DeleteEnergyInfo_SC.$MessageID,this.onCmd_Friend_DeleteEnergyInfo_SC],[Cmd_Friend_TakeEnergyInfo_SC.$MessageID,this.onCmd_Friend_TakeEnergyInfo_SC],[Cmd_Friend_ReturnEnergyInfo_SC.$MessageID,this.onCmd_Friend_ReturnEnergyInfo_SC]];
      }
      
      private function onCmd_Friend_GetList_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_Friend_GetList_SC = param1.socketData as Cmd_Friend_GetList_SC;
         this.data.fightNum = _loc2_.fightNum;
         this.data.presentEnergyNum = _loc2_.presentEnergyNum;
         this.data.stealFarmNum = _loc2_.stealFarmNum;
         this.data.canRecommend = _loc2_.canRecommend;
         if(_loc2_.moduleType == FriendModuleType.FRIEND_MODULE_TYPE_CITY)
         {
            this.data.loadCmd_Friend_GetList_SC(_loc2_);
            dispatch(new CommonEvent(FriendGlobals.FRIEND_LIST_UPDATED,this.data));
         }
      }
      
      private function onCmd_Friend_SyncOperation_SC(param1:SocketServiceEvent) : void
      {
         var _loc3_:Dto_FriendInfo = null;
         var _loc4_:FriendRoleVo = null;
         var _loc5_:int = 0;
         var _loc2_:Cmd_Friend_SyncOperation_SC = param1.socketData as Cmd_Friend_SyncOperation_SC;
         var _loc6_:int = _loc2_.friends.length;
         _loc5_ = 0;
         while(_loc5_ < _loc6_)
         {
            _loc3_ = _loc2_.friends[_loc5_];
            if(_loc4_ = this.data.getFriendVo(_loc3_.roleId))
            {
               _loc4_.load(_loc3_,true);
            }
            else
            {
               (_loc4_ = new FriendRoleVo()).load(_loc3_);
               this.data.friends.push(_loc4_);
            }
            _loc5_++;
         }
         dispatch(new CommonEvent(FriendGlobals.FRIEND_LIST_UPDATED,this.data));
      }
      
      private function onCmd_Friend_SyncOperationStatus_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_Friend_SyncOperationStatus_SC = param1.socketData as Cmd_Friend_SyncOperationStatus_SC;
         if(_loc2_.hasFightNum)
         {
            this.data.fightNum = _loc2_.fightNum;
         }
         if(_loc2_.hasPresentEnergyNum)
         {
            this.data.presentEnergyNum = _loc2_.presentEnergyNum;
         }
         if(_loc2_.hasStealFarmNum)
         {
            this.data.stealFarmNum = _loc2_.stealFarmNum;
         }
         if(this.data.updateFriendStaus(_loc2_).length > 0)
         {
            dispatch(new CommonEvent(FriendGlobals.FRIEND_LIST_UPDATED,this.data));
         }
      }
      
      private function onCmd_Friend_PresentEnergy_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_Friend_PresentEnergy_SC = param1.socketData as Cmd_Friend_PresentEnergy_SC;
         var _loc3_:FriendRoleVo = this.data.getFriendVo(_loc2_.roleId);
         if(_loc3_)
         {
            _loc3_.setEnergySendable(false);
            dispatch(new CommonEvent(FriendGlobals.FRIEND_GIFT_ENERGY,this.data));
         }
      }
      
      public function getNextPushedLog() : FriendLogVo
      {
         if(this.applyLogs.pushedLogs.length > this.applyLogs.pushedLogsGetCount && this.applyLogs.pushedLogs[this.applyLogs.pushedLogsGetCount] != null)
         {
            return this.applyLogs.pushedLogs[this.applyLogs.pushedLogsGetCount++];
         }
         return null;
      }
      
      private function onCmd_SetAvatarPlant_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_SetAvatarPlant_SC = param1.socketData as Cmd_SetAvatarPlant_SC;
         GameGloble.actorModel.avatarPlantInfo = _loc2_.plantInfo;
         dispatch(new CommonEvent(FriendGlobals.FRIEND_AVATAR_PLANT_UPDATED,this.data));
      }
      
      private function onCmd_Friend_Delete_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_Friend_Delete_SC = param1.socketData as Cmd_Friend_Delete_SC;
         dispatch(new CommonEvent(FriendGlobals.FRIEND_DELETED));
      }
      
      private function onCmd_Friend_GetApplyList_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_Friend_GetApplyList_SC = param1.socketData as Cmd_Friend_GetApplyList_SC;
         this.applyLogs.setData(_loc2_);
         dispatch(new CommonEvent(FriendGlobals.FRIEND_LOG_UPDATED,this.data));
      }
      
      private function onCmd_Friend_Apply_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_Friend_Apply_SC = param1.socketData as Cmd_Friend_Apply_SC;
         dispatch(new CommonEvent(FriendGlobals.FRIEND_INVITE_SUCCEED,_loc2_.friendId));
      }
      
      private function onCmd_Friend_ApplyAgree_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_Friend_ApplyAgree_SC = param1.socketData as Cmd_Friend_ApplyAgree_SC;
         dispatch(new CommonEvent(FriendGlobals.FRIEND_APPLY_AGREE,this.data));
      }
      
      private function onCmd_Friend_ApplyIgnore_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_Friend_ApplyIgnore_SC = param1.socketData as Cmd_Friend_ApplyIgnore_SC;
         dispatch(new CommonEvent(FriendGlobals.FRIEND_APPLY_IGNORE,this.data));
      }
      
      private function onCmd_Friend_GetRecommendList_SC(param1:SocketServiceEvent) : void
      {
         var _loc3_:Dto_FriendApply = null;
         var _loc2_:Cmd_Friend_GetRecommendList_SC = param1.socketData as Cmd_Friend_GetRecommendList_SC;
         this.recommendFriends = new Vector.<FriendLogVo>();
         for each(_loc3_ in _loc2_.friendList)
         {
            this.recommendFriends.push(new FriendLogVo(_loc3_));
         }
         dispatch(new CommonEvent(FriendGlobals.FRIEND_GET_RECOMMEND,this.data));
      }
      
      private function onCmd_Friend_ApplyRecommend_SC(param1:SocketServiceEvent) : void
      {
         this.data.canRecommend = false;
         dispatch(new CommonEvent(FriendGlobals.FRIEND_ADD_RECOMMEND,this.data));
      }
      
      private function onCmd_Friend_NewApply_SC(param1:SocketServiceEvent) : void
      {
         dispatch(new CommonEvent(FriendGlobals.FRIEND_APPLY_NEW_PUSH));
      }
      
      private function onCmd_Friend_GetFightList_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_Friend_GetFightList_SC = param1.socketData as Cmd_Friend_GetFightList_SC;
         this.fightLogs.setData(_loc2_);
         this.dispatch(new CommonEvent(FriendGlobals.FRIEND_FIGHT_LOG_UPDATED));
      }
      
      private function onCmd_Friend_DeleteFightInfo_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_Friend_DeleteFightInfo_SC = param1.socketData as Cmd_Friend_DeleteFightInfo_SC;
         this.dispatch(new CommonEvent(FriendGlobals.FRIEND_FIGHT_LOG_DELETED));
      }
      
      private function onCmd_Friend_GetEnergyList_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_Friend_GetEnergyList_SC = param1.socketData as Cmd_Friend_GetEnergyList_SC;
         this.giftEnergyLogs.setData(_loc2_);
         this.dispatch(new CommonEvent(FriendGlobals.FRIEND_GIFT_ENERGY_LOG_UPDATED));
      }
      
      private function onCmd_Friend_DeleteEnergyInfo_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_Friend_DeleteEnergyInfo_SC = param1.socketData as Cmd_Friend_DeleteEnergyInfo_SC;
         this.dispatch(new CommonEvent(FriendGlobals.FRIEND_GIFT_ENERGY_LOG_DELETED));
      }
      
      private function onCmd_Friend_TakeEnergyInfo_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_Friend_TakeEnergyInfo_SC = param1.socketData as Cmd_Friend_TakeEnergyInfo_SC;
         this.giftEnergyLogs.updateLogStatus(_loc2_.infoId,_loc2_.status);
         if(_loc2_.status == 0)
         {
            this.dispatch(new CommonEvent(FriendGlobals.FRIEND_GIFT_ENERGY_LOG_DELETED));
         }
         else
         {
            this.dispatch(new CommonEvent(FriendGlobals.FRIEND_GIFT_ENERGY_LOG_UPDATED));
         }
         CommonCmd.txtFly(StringUtil.substitute(FontNormal.FRIEND_TAKE_ENERGY_COUNT,_loc2_.takeEnergyNum));
      }
      
      private function onCmd_Friend_ReturnEnergyInfo_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_Friend_ReturnEnergyInfo_SC = param1.socketData as Cmd_Friend_ReturnEnergyInfo_SC;
         CommonCmd.txtFly(StringUtil.substitute(FontNormal.FRIEND_GIFT_ENERGY_COUNT,this.data.presentEnergyNum));
         this.dispatch(new CommonEvent(FriendGlobals.FRIEND_RETURN_ENERGY));
      }
   }
}
