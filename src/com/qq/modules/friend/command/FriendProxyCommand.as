package com.qq.modules.friend.command
{
   import PVZ.Cmd.BattleTargetType;
   import PVZ.Cmd.Cmd_Battle_Fight_CS;
   import PVZ.Cmd.Cmd_Battle_Fight_SC;
   import PVZ.Cmd.Cmd_Battle_QueryReport_CS;
   import PVZ.Cmd.Cmd_Battle_QueryReport_SC;
   import PVZ.Cmd.Cmd_Friend_ApplyAgree_CS;
   import PVZ.Cmd.Cmd_Friend_ApplyIgnore_CS;
   import PVZ.Cmd.Cmd_Friend_ApplyRecommend_CS;
   import PVZ.Cmd.Cmd_Friend_Apply_CS;
   import PVZ.Cmd.Cmd_Friend_DeleteEnergyInfo_CS;
   import PVZ.Cmd.Cmd_Friend_DeleteFightInfo_CS;
   import PVZ.Cmd.Cmd_Friend_Delete_CS;
   import PVZ.Cmd.Cmd_Friend_GetApplyList_CS;
   import PVZ.Cmd.Cmd_Friend_GetEnergyList_CS;
   import PVZ.Cmd.Cmd_Friend_GetFightList_CS;
   import PVZ.Cmd.Cmd_Friend_GetList_CS;
   import PVZ.Cmd.Cmd_Friend_GetRecommendList_CS;
   import PVZ.Cmd.Cmd_Friend_PresentEnergy_CS;
   import PVZ.Cmd.Cmd_Friend_ReturnEnergyInfo_CS;
   import PVZ.Cmd.Cmd_Friend_TakeEnergyInfo_CS;
   import PVZ.Cmd.Cmd_SetAvatarPlant_CS;
   import PVZ.Cmd.Dto_BattleTarget;
   import PVZ.Cmd.FriendModuleType;
   import asgui.controls.Alert;
   import asgui.events.CloseEvent;
   import asgui.utils.StringUtil;
   import com.qq.display.QAlert;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.modle.vo.FriendIDVO;
   import com.qq.modules.battle.command.BattleServiceCmd;
   import com.qq.modules.friend.FriendGlobals;
   import com.qq.modules.friend.model.FriendProxy;
   import com.qq.modules.main.command.CommonCmd;
   import com.qq.modules.main.server.PvzSocketService;
   import com.qq.templates.font.FontNormal;
   import com.tencent.protobuf.Int64;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   import tencent.io.service.events.SocketServiceEvent;
   
   public class FriendProxyCommand extends StrongRobotlegCommand
   {
       
      
      [Inject]
      public var server:PvzSocketService;
      
      [Inject]
      public var friendPxy:FriendProxy;
      
      public function FriendProxyCommand()
      {
         super();
      }
      
      public function requestList(param1:int, param2:int, param3:int, param4:String = null) : void
      {
         var _loc5_:Cmd_Friend_GetList_CS;
         (_loc5_ = new Cmd_Friend_GetList_CS()).page = param1 - 1;
         _loc5_.pageSize = param2;
         _loc5_.moduleType = FriendModuleType.FRIEND_MODULE_TYPE_CITY;
         _loc5_.friendType = param3;
         _loc5_.name = param4;
         this.server.sendMessage(_loc5_);
      }
      
      public function setAvatarPlan(param1:int) : void
      {
         var _loc2_:Cmd_SetAvatarPlant_CS = new Cmd_SetAvatarPlant_CS();
         _loc2_.plantId = param1;
         this.server.sendMessage(_loc2_);
      }
      
      public function applyInviteFriend(param1:Int64) : void
      {
         var _loc2_:Cmd_Friend_Apply_CS = new Cmd_Friend_Apply_CS();
         _loc2_.friendId = param1;
         this.server.sendMessage(_loc2_);
      }
      
      public function applyAgree(param1:Array) : void
      {
         var _loc2_:Cmd_Friend_ApplyAgree_CS = new Cmd_Friend_ApplyAgree_CS();
         _loc2_.friendList = param1;
         this.server.sendMessage(_loc2_);
      }
      
      public function applyIgnore(param1:Array) : void
      {
         var _loc2_:Cmd_Friend_ApplyIgnore_CS = new Cmd_Friend_ApplyIgnore_CS();
         _loc2_.friendList = param1;
         this.server.sendMessage(_loc2_);
      }
      
      public function getRecommendList() : void
      {
         var _loc1_:Cmd_Friend_GetRecommendList_CS = new Cmd_Friend_GetRecommendList_CS();
         this.server.sendMessage(_loc1_);
      }
      
      public function addRecommendFriends(param1:Array, param2:Boolean) : void
      {
         var _loc3_:Cmd_Friend_ApplyRecommend_CS = new Cmd_Friend_ApplyRecommend_CS();
         _loc3_.friendlist = param1;
         _loc3_.isBroadcast = param2;
         this.server.sendMessage(_loc3_);
      }
      
      public function getApplyLog(param1:int, param2:int) : void
      {
         var _loc3_:Cmd_Friend_GetApplyList_CS = new Cmd_Friend_GetApplyList_CS();
         _loc3_.page = param1 - 1;
         _loc3_.pageSize = param2;
         this.server.sendMessage(_loc3_);
      }
      
      public function getFightLog(param1:int, param2:int) : void
      {
         var _loc3_:Cmd_Friend_GetFightList_CS = new Cmd_Friend_GetFightList_CS();
         _loc3_.page = param1 - 1;
         _loc3_.pageSize = param2;
         this.server.sendMessage(_loc3_);
      }
      
      public function getGiftEnergyLog(param1:int, param2:int) : void
      {
         var _loc3_:Cmd_Friend_GetEnergyList_CS = new Cmd_Friend_GetEnergyList_CS();
         _loc3_.page = param1 - 1;
         _loc3_.pageSize = param2;
         this.server.sendMessage(_loc3_);
      }
      
      public function deleteEnergyLog(param1:Int64) : void
      {
         var _loc2_:Cmd_Friend_DeleteEnergyInfo_CS = new Cmd_Friend_DeleteEnergyInfo_CS();
         _loc2_.infoId = param1;
         this.server.sendMessage(_loc2_);
      }
      
      public function presentEnergy(param1:Object) : void
      {
         var _loc2_:FriendIDVO = param1 as FriendIDVO;
         var _loc3_:Cmd_Friend_PresentEnergy_CS = new Cmd_Friend_PresentEnergy_CS();
         _loc3_.zoneId = _loc2_.zoneId;
         _loc3_.roleId = _loc2_.roleId;
         this.server.sendMessage(_loc3_);
      }
      
      public function takeEnergy(param1:Int64) : void
      {
         var _loc2_:Cmd_Friend_TakeEnergyInfo_CS = new Cmd_Friend_TakeEnergyInfo_CS();
         _loc2_.infoId = param1;
         this.server.sendMessage(_loc2_);
      }
      
      public function returnEnergy(param1:Int64) : void
      {
         var _loc2_:Cmd_Friend_ReturnEnergyInfo_CS = new Cmd_Friend_ReturnEnergyInfo_CS();
         _loc2_.infoId = param1;
         this.server.sendMessage(_loc2_);
      }
      
      public function friendFight(param1:Int64, param2:uint) : void
      {
         this.friendPxy.requestFriendRoldId = param1;
         this.server.eventDispatcher.addEventListener(Cmd_Battle_Fight_SC.$MessageID,this.onBattleFightSC);
         var _loc3_:Dto_BattleTarget = new Dto_BattleTarget();
         _loc3_.type = BattleTargetType.BattleTargetType_Friend;
         _loc3_.friendRoleId = param1;
         _loc3_.friendZoneId = param2;
         var _loc4_:Cmd_Battle_Fight_CS;
         (_loc4_ = new Cmd_Battle_Fight_CS()).target = _loc3_;
         _loc4_.isTryAgain = false;
         this.server.sendMessage(_loc4_);
      }
      
      private function onBattleFightSC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_Battle_Fight_SC = param1.socketData as Cmd_Battle_Fight_SC;
         if(_loc2_.report.fightType == BattleTargetType.BattleTargetType_Friend)
         {
            this.friendPxy.data.reduceFriendPVPTimes(this.friendPxy.requestFriendRoldId);
            this.friendPxy.requestFriendRoldId = new Int64(0,0);
            if(this.friendPxy.data.fightNum > 0)
            {
               CommonCmd.txtFly(StringUtil.substitute(FontNormal.FRIEND_FIGHT_COUNT,this.friendPxy.data.fightNum));
            }
            else
            {
               CommonCmd.txtFly(FontNormal.FRIEND_FIGHT_LIMIT_TIP);
            }
            dispatch(new CommonEvent(FriendGlobals.FRIEND_LIST_UPDATED));
            this.server.eventDispatcher.removeEventListener(Cmd_Battle_Fight_SC.$MessageID,this.onBattleFightSC);
            BattleServiceCmd.setData(_loc2_.report);
         }
      }
      
      public function queryReport(param1:Int64) : void
      {
         this.server.eventDispatcher.addEventListener(Cmd_Battle_QueryReport_SC.$MessageID,this.onFriendQueryReport);
         var _loc2_:Cmd_Battle_QueryReport_CS = new Cmd_Battle_QueryReport_CS();
         _loc2_.reportId = param1;
         this.server.sendMessage(_loc2_);
      }
      
      private function onFriendQueryReport(param1:SocketServiceEvent) : void
      {
         dispatch(new CommonEvent(FriendGlobals.FRIEND_LOG_WINDOW_DISPOSE));
      }
      
      public function deleteFriend(param1:Int64) : void
      {
         var confirmCallBack:Function = null;
         var friendID:Int64 = param1;
         confirmCallBack = function(param1:CloseEvent):void
         {
            var _loc2_:Cmd_Friend_Delete_CS = null;
            if(param1.detail == Alert.YES)
            {
               _loc2_ = new Cmd_Friend_Delete_CS();
               _loc2_.friendId = friendID;
               server.sendMessage(_loc2_);
            }
         };
         QAlert.Show("确定删除该好友？","",Alert.YES | Alert.NO,null,confirmCallBack);
      }
      
      public function deleteFightLog(param1:Array) : void
      {
         var _loc2_:Cmd_Friend_DeleteFightInfo_CS = new Cmd_Friend_DeleteFightInfo_CS();
         _loc2_.infoIds = param1;
         this.server.sendMessage(_loc2_);
      }
   }
}
