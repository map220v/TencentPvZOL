package com.qq.modules.notice.model
{
   import PVZ.Cmd.Dto_RollNotice;
   import com.qq.modules.chat.view.helpers.ChatUtils;
   
   public class RollNoticeInfo
   {
      
      private static const DELAYTIME:uint = 0;
       
      
      public var id:uint;
      
      public var beginTime:uint;
      
      public var endTime:uint;
      
      public var showInterval:uint;
      
      public var showTimes:uint;
      
      public var content:String;
      
      public var curTimes:uint;
      
      public var curInterval:uint;
      
      public function RollNoticeInfo()
      {
         super();
      }
      
      public function load(param1:Dto_RollNotice) : void
      {
         this.id = param1.id;
         this.beginTime = param1.beginTime;
         this.endTime = param1.endTime;
         this.showInterval = param1.showInterval;
         this.showTimes = param1.showTimes;
         this.content = param1.content;
         this.content = ChatUtils.filterHornChannelStr(this.content);
         this.curTimes = 0;
         this.curInterval = this.showInterval + DELAYTIME;
      }
   }
}
