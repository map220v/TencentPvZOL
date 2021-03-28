package com.qq.modules.chat.model
{
   import PVZ.Cmd.ChannelType;
   import PVZ.Cmd.Cmd_Chat_GetHistory_SC;
   import PVZ.Cmd.Cmd_Chat_SC;
   import PVZ.Cmd.Cmd_Friend_GetBlackList_SC;
   import PVZ.Cmd.Cmd_VipBuy_SC;
   import PVZ.Cmd.Dto_Chat;
   import asgui.controls.Image;
   import asgui.utils.StringUtil;
   import com.qq.GameGloble;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.modle.BasicProxy;
   import com.qq.modules.chat.ChatGlobals;
   import com.qq.modules.chat.model.vo.ChatSentenceVO;
   import com.qq.modules.main.command.CommonCmd;
   import com.qq.modules.main.logic.initData.InitDataManager;
   import com.qq.utils.CommandDispatcher;
   import com.tencent.protobuf.Int64;
   import tencent.io.service.events.SocketServiceEvent;
   
   public class ChatProxy extends BasicProxy
   {
       
      
      public var data:ChatData;
      
      public var btnChat:Image;
      
      public var isOpen:Boolean = false;
      
      public var currentChannelType:int;
      
      public var currentChannelPara:Object;
      
      public var showItemType:int;
      
      public var showItemUid:Int64;
      
      public var showItemId:int;
      
      public function ChatProxy()
      {
         this.data = new ChatData();
         super();
      }
      
      override public function init(param1:Array = null) : void
      {
         super.init();
      }
      
      override public function listMsgInterests() : Array
      {
         return [[Cmd_Chat_SC.$MessageID,this.onCmd_Chat_SC],[Cmd_Chat_GetHistory_SC.$MessageID,this.onCmd_Chat_GetChatData_SC],[Cmd_VipBuy_SC.$MessageID,this.onCmd_VipBuy_SC],[Cmd_Friend_GetBlackList_SC.$MessageID,this.onCmd_Friend_GetBlackList_SC]];
      }
      
      public function resetChat() : void
      {
         this.currentChannelPara = null;
         this.showItemType = 0;
         this.showItemId = 0;
         this.showItemUid = null;
      }
      
      private function onCmd_Friend_GetBlackList_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_Friend_GetBlackList_SC = param1.socketData as Cmd_Friend_GetBlackList_SC;
         ChatGlobals.setBlackList(_loc2_.blackListInfo);
         CommandDispatcher.send(ChatGlobals.CHAT_UPDATE_BLACK_LIST);
      }
      
      private function onCmd_Chat_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_Chat_SC = param1.socketData as Cmd_Chat_SC;
         var _loc3_:ChatSentenceVO = new ChatSentenceVO();
         _loc3_.loadDto(_loc2_.chatData,!!_loc2_.chatData.roleId ? Boolean(_loc2_.chatData.roleId.compare(GameGloble.actorModel.roleId)) : false);
         if(_loc3_.isMyMsg)
         {
            if(_loc3_.channelType == ChannelType.ChannelType_World)
            {
               if(this.data.freeCount > 0)
               {
                  --this.data.freeCount;
                  CommonCmd.txtFly(StringUtil.substitute("当日剩余免费发言次数：{0}次",this.data.freeCount));
               }
            }
            else if(_loc3_.channelType == ChannelType.ChannelType_Horn)
            {
               CommonCmd.txtFly("消耗喇叭1个");
            }
         }
         if(!ChatGlobals.hasContainBlackList(_loc3_.srcRoleId))
         {
            this.data.pushChatVO(_loc3_);
            dispatch(new CommonEvent(ChatGlobals.CHAT_SENTENCE_ADDED,_loc3_));
         }
      }
      
      private function onCmd_Chat_GetChatData_SC(param1:SocketServiceEvent) : void
      {
         var _loc3_:ChatSentenceVO = null;
         var _loc4_:Dto_Chat = null;
         var _loc2_:Cmd_Chat_GetHistory_SC = param1.socketData as Cmd_Chat_GetHistory_SC;
         this.data.freeCount = _loc2_.freeCount;
         var _loc5_:int = _loc2_.recorders.length - 1;
         while(_loc5_ >= 0)
         {
            _loc4_ = _loc2_.recorders[_loc5_] as Dto_Chat;
            _loc3_ = new ChatSentenceVO();
            _loc3_.loadDto(_loc4_,!!_loc4_.roleId ? Boolean(_loc4_.roleId.compare(GameGloble.actorModel.roleId)) : false);
            if(!ChatGlobals.hasContainBlackList(_loc3_.srcRoleId))
            {
               this.data.pushChatVO(_loc3_);
            }
            _loc5_--;
         }
         InitDataManager.getInstance().finishTask(InitDataManager.Init_ChatInfo);
      }
      
      private function onCmd_VipBuy_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_VipBuy_SC = param1.socketData as Cmd_VipBuy_SC;
         this.data.freeCount = _loc2_.freeCount;
         dispatch(new CommonEvent(ChatGlobals.CHAT_SENTENCE_ADDED,null));
      }
   }
}
