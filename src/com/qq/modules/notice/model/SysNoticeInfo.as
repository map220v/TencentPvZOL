package com.qq.modules.notice.model
{
   import PVZ.Cmd.Dto_SysNotice;
   
   public class SysNoticeInfo
   {
       
      
      public var id:uint;
      
      public var title:String;
      
      public var time:uint;
      
      public var content:String;
      
      public var isImportant:Boolean;
      
      public var sPlat:String;
      
      public var expireTime:uint;
      
      public var subtitle1:String;
      
      public var subtitle2:String;
      
      public function SysNoticeInfo()
      {
         super();
      }
      
      public function load(param1:Dto_SysNotice) : void
      {
         this.id = param1.id;
         this.title = param1.title;
         this.time = param1.time;
         this.content = param1.content;
         this.isImportant = param1.isImportant;
         this.sPlat = param1.sPlat;
         this.expireTime = param1.expireTime;
         this.subtitle1 = param1.subtitle1 == "" ? param1.title : param1.subtitle1;
         this.subtitle2 = param1.subtitle2;
      }
   }
}
