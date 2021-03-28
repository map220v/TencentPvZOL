package com.qq.modules.chat.model.vo
{
   import PVZ.Cmd.Dto_Chat;
   import com.qq.modules.chat.ChatGlobals;
   import com.qq.modules.main.model.PrivilegeDiamond;
   import com.qq.utils.PrivilegeUtils;
   import com.tencent.protobuf.Int64;
   
   public class ChatSentenceVO
   {
       
      
      public var displayType:int = 3;
      
      public var timestamp:int;
      
      public var isMyMsg:Boolean;
      
      private var dto:Dto_Chat;
      
      private var m_privilegeDiamond:PrivilegeDiamond;
      
      public function ChatSentenceVO()
      {
         super();
      }
      
      public function get content() : String
      {
         return this.dto.content;
      }
      
      public function set content(param1:String) : void
      {
         this.dto.content = param1;
      }
      
      public function get srcRoleNick() : String
      {
         return this.dto.roleNick;
      }
      
      public function get srcRoleId() : Int64
      {
         return this.dto.roleId;
      }
      
      public function get channelType() : int
      {
         return this.dto.channel;
      }
      
      public function get targetName() : String
      {
         return this.dto.targetNick;
      }
      
      public function get targetId() : String
      {
         return this.dto.targetId.toString();
      }
      
      public function get isBlueDiamond() : Boolean
      {
         if(this.dto.diamond)
         {
            return PrivilegeUtils.hasBlueDiamond(this.dto.diamond.flag);
         }
         return false;
      }
      
      public function get isYearBlueDiamond() : Boolean
      {
         if(this.dto.diamond)
         {
            return PrivilegeUtils.isBlueDiamondYear(this.dto.diamond.flag);
         }
         return false;
      }
      
      public function get vipType() : uint
      {
         return this.dto.vip;
      }
      
      public function get privilegeDiamond() : PrivilegeDiamond
      {
         return this.m_privilegeDiamond;
      }
      
      public function loadDto(param1:Dto_Chat, param2:Boolean) : void
      {
         this.isMyMsg = param2;
         this.dto = param1;
         this.m_privilegeDiamond = PrivilegeDiamond.createByInfo(param1.diamond);
      }
      
      public function get growLevel() : int
      {
         return this.dto.i3366GrowLevel;
      }
      
      public function setMsg(param1:int, param2:String) : void
      {
         this.dto = new Dto_Chat();
         this.dto.channel = param1;
         this.dto.content = param2;
         if(param1 == 1001)
         {
            this.displayType = ChatGlobals.CHAT_DISPLAY_TYPE_INPUT;
         }
      }
   }
}
