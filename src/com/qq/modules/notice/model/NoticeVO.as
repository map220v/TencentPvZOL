package com.qq.modules.notice.model
{
   import PVZ.Cmd.Cmd_Notice_GetRollList_SC;
   import PVZ.Cmd.Cmd_Notice_GetSysList_SC;
   import PVZ.Cmd.Dto_RollNotice;
   import PVZ.Cmd.Dto_SysNotice;
   import com.qq.modules.notice.constant.NoticeConst;
   
   public class NoticeVO
   {
       
      
      public var rollNoticeList:Vector.<RollNoticeInfo>;
      
      public var sysNoticeList:Vector.<SysNoticeInfo>;
      
      public var showRollNoticeList:Vector.<ShowRollNoticeInfo>;
      
      public var hasUnread:Boolean;
      
      public var noticeUrl:String;
      
      public var bShowPic:Boolean;
      
      public function NoticeVO()
      {
         super();
         this.sysNoticeList = new Vector.<SysNoticeInfo>();
      }
      
      public function loadRollNoticeCmd(param1:Cmd_Notice_GetRollList_SC) : void
      {
         var _loc3_:Dto_RollNotice = null;
         var _loc4_:RollNoticeInfo = null;
         this.rollNoticeList = new Vector.<RollNoticeInfo>();
         this.showRollNoticeList = new Vector.<ShowRollNoticeInfo>();
         var _loc2_:Array = param1.rollNotice;
         for each(_loc3_ in _loc2_)
         {
            (_loc4_ = new RollNoticeInfo()).load(_loc3_);
            this.rollNoticeList.push(_loc4_);
         }
      }
      
      public function loadSysNoticeCmd(param1:Cmd_Notice_GetSysList_SC) : void
      {
         var _loc3_:Dto_SysNotice = null;
         var _loc4_:SysNoticeInfo = null;
         this.hasUnread = param1.hasUnread;
         this.noticeUrl = param1.sPic;
         this.bShowPic = param1.bShowPic;
         var _loc2_:Array = param1.sysNotice;
         this.sysNoticeList.length = 0;
         for each(_loc3_ in _loc2_)
         {
            (_loc4_ = new SysNoticeInfo()).load(_loc3_);
            this.sysNoticeList.push(_loc4_);
         }
         this.sysNoticeList.length = Math.min(NoticeConst.NOTICE_MAX,this.sysNoticeList.length);
         this.sysNoticeList = this.sysNoticeList.sort(this.sortOn);
      }
      
      private function sortOn(param1:SysNoticeInfo, param2:SysNoticeInfo) : int
      {
         if(!param1.isImportant || !param2.isImportant)
         {
            if(param1.isImportant)
            {
               return -1;
            }
            if(param2.isImportant)
            {
               return 1;
            }
         }
         if(param1.time < param2.time)
         {
            return 1;
         }
         if(param1.time > param2.time)
         {
            return -1;
         }
         return 0;
      }
      
      public function removeRollNoticeInfo(param1:RollNoticeInfo) : void
      {
         var _loc3_:uint = 0;
         var _loc4_:RollNoticeInfo = null;
         var _loc2_:uint = this.rollNoticeList.length;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            if((_loc4_ = this.rollNoticeList[_loc3_]) == param1)
            {
               break;
            }
            _loc3_++;
         }
         this.rollNoticeList.splice(_loc3_,1);
      }
   }
}
