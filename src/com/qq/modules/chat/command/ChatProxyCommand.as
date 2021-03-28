package com.qq.modules.chat.command
{
   import PVZ.Cmd.ChannelType;
   import PVZ.Cmd.Cmd_Chat_CS;
   import PVZ.Cmd.Cmd_Chat_GetHistory_CS;
   import PVZ.Cmd.Cmd_Friend_AddBlackList_CS;
   import PVZ.Cmd.Cmd_Friend_DelBlackList_CS;
   import PVZ.Cmd.Cmd_Friend_GetBlackList_CS;
   import PVZ.Cmd.Dto_Chat;
   import com.qq.GameGloble;
   import com.qq.constant.ItemID;
   import com.qq.modules.bag.model.vo.BagProxy;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.model.templates.ServerConfigTemplateFactory;
   import com.qq.modules.chat.ChatGlobals;
   import com.qq.modules.chat.model.ChatProxy;
   import com.qq.modules.chat.model.vo.ChatSentenceVO;
   import com.qq.modules.main.command.CmdStoreProxyCmd;
   import com.qq.modules.main.server.PvzSocketService;
   import com.tencent.protobuf.Int64;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   
   public class ChatProxyCommand extends StrongRobotlegCommand
   {
       
      
      [Inject]
      public var server:PvzSocketService;
      
      [Inject]
      public var chatProxy:ChatProxy;
      
      [Inject]
      public var bagProxy:BagProxy;
      
      public function ChatProxyCommand()
      {
         super();
      }
      
      public function sendMsg(param1:int, param2:String, param3:Int64 = null, param4:int = 0, param5:Int64 = null) : void
      {
         var _loc6_:Array = null;
         var _loc7_:String = null;
         if(param1 == ChannelType.ChannelType_World)
         {
            if(this.chatProxy.data.freeCount > 0)
            {
               this.doSendMsg(param1,param2,param3,param4,param5);
            }
            else
            {
               this.sendHornMsg(param2,param3,param4,param5);
            }
         }
         else if(param1 == ChannelType.ChannelType_System)
         {
            this.sendHornMsg(param2,param3,param4,param5);
         }
         else
         {
            this.doSendMsg(param1,param2,param3,param4,param5);
         }
         if(param1 == ChannelType.ChannelType_Whisper)
         {
            _loc6_ = ServerConfigTemplateFactory.instance.sChatSecureStr;
            for each(_loc7_ in _loc6_)
            {
               if(param2.indexOf(_loc7_) >= 0)
               {
                  this.outputErrorText("腾讯公司不会以任何形式向您索要密码，请注意账号安全，请不要将密码提供给任何人");
                  break;
               }
            }
         }
      }
      
      private function sendHornMsg(param1:String, param2:Int64 = null, param3:int = 0, param4:Int64 = null) : void
      {
         if(this.bagProxy.getItemNumByItemID(ItemID.HORN) > 0)
         {
            this.doSendMsg(ChannelType.ChannelType_Horn,param1,param2,param3,param4);
         }
         else
         {
            CmdStoreProxyCmd.buyByItemID(ItemID.HORN,1,"购买一个喇叭",10,this.sendMsg,[ChannelType.ChannelType_Horn,param1,param2,param3,param4],8);
         }
      }
      
      private function doSendMsg(param1:int, param2:String, param3:Int64 = null, param4:int = 0, param5:Int64 = null) : void
      {
         var _loc6_:Cmd_Chat_CS;
         (_loc6_ = new Cmd_Chat_CS()).chatData = new Dto_Chat();
         _loc6_.chatData.channel = param1;
         _loc6_.chatData.targetId = param3;
         _loc6_.chatData.content = param2;
         _loc6_.chatData.roleId = GameGloble.actorModel.roleId;
         _loc6_.chatData.roleNick = GameGloble.actorModel.actorName;
         _loc6_.objType = param4;
         _loc6_.objUid = param5;
         this.server.sendMessage(_loc6_);
      }
      
      public function getChatData() : void
      {
         var _loc1_:Cmd_Chat_GetHistory_CS = new Cmd_Chat_GetHistory_CS();
         this.server.sendMessage(_loc1_);
      }
      
      public function outputErrorText(param1:String) : void
      {
         var _loc2_:ChatSentenceVO = new ChatSentenceVO();
         _loc2_.setMsg(1001,param1);
         dispatch(new CommonEvent(ChatGlobals.CHAT_SENTENCE_ADDED,_loc2_));
      }
      
      public function showItem(param1:Object) : void
      {
         this.chatProxy.showItemUid = param1["uid"];
         this.chatProxy.showItemType = param1["type"];
         this.chatProxy.showItemId = param1["itemId"];
         dispatch(new CommonEvent(ChatGlobals.CHAT_SHOW_ITEM_EVENT,param1));
      }
      
      public function addBlackList(param1:Int64) : void
      {
         var _loc2_:Cmd_Friend_AddBlackList_CS = new Cmd_Friend_AddBlackList_CS();
         _loc2_.roleid = param1;
         this.server.sendMessage(_loc2_);
      }
      
      public function removeBlackList(param1:Int64) : void
      {
         var _loc2_:Cmd_Friend_DelBlackList_CS = new Cmd_Friend_DelBlackList_CS();
         _loc2_.roleid = param1;
         this.server.sendMessage(_loc2_);
      }
      
      public function getBlackList() : void
      {
         var _loc1_:Cmd_Friend_GetBlackList_CS = new Cmd_Friend_GetBlackList_CS();
         this.server.sendMessage(_loc1_);
      }
   }
}
