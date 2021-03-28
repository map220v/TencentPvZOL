package com.qq.modules.chat.model
{
   import com.qq.modules.chat.model.vo.ChatSentenceVO;
   
   public class ChatData
   {
       
      
      private const MAX_RECORD_COUNT:int = 50;
      
      public var chatSentences:Vector.<ChatSentenceVO>;
      
      public var freeCount:int;
      
      public function ChatData()
      {
         super();
         this.chatSentences = new Vector.<ChatSentenceVO>();
      }
      
      public function reset() : void
      {
         this.chatSentences = new Vector.<ChatSentenceVO>();
      }
      
      public function pushChatVO(param1:ChatSentenceVO) : void
      {
         while(this.chatSentences.length >= this.MAX_RECORD_COUNT)
         {
            this.chatSentences.shift();
         }
         this.chatSentences.push(param1);
      }
      
      public function getLastChatVO() : ChatSentenceVO
      {
         if(this.chatSentences.length == 0)
         {
            return null;
         }
         return this.chatSentences[this.chatSentences.length - 1];
      }
      
      public function getFirstChatVO() : ChatSentenceVO
      {
         if(this.chatSentences.length == 0)
         {
            return null;
         }
         return this.chatSentences[0];
      }
      
      public function getChatOnChannel(param1:Array) : Vector.<ChatSentenceVO>
      {
         var _loc3_:ChatSentenceVO = null;
         var _loc2_:Vector.<ChatSentenceVO> = new Vector.<ChatSentenceVO>();
         if(param1 == null)
         {
            return _loc2_;
         }
         for each(_loc3_ in this.chatSentences)
         {
            if(param1.indexOf(_loc3_.channelType) != -1)
            {
               _loc2_.push(_loc3_);
            }
         }
         return _loc2_;
      }
   }
}
