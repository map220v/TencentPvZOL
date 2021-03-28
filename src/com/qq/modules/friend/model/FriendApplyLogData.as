package com.qq.modules.friend.model
{
   import PVZ.Cmd.Cmd_Friend_GetApplyList_SC;
   import PVZ.Cmd.Dto_FriendApply;
   import com.qq.modules.friend.model.vo.FriendLogVo;
   
   public class FriendApplyLogData
   {
       
      
      public var currentPage:int = 1;
      
      public var totalCount:uint;
      
      public var logs:Vector.<FriendLogVo>;
      
      public var pushedLogs:Vector.<FriendLogVo>;
      
      public var pushedLogsGetCount:int;
      
      public var preDeleteCount:int;
      
      public function FriendApplyLogData()
      {
         this.logs = new Vector.<FriendLogVo>();
         this.pushedLogs = new Vector.<FriendLogVo>();
         super();
      }
      
      public function setData(param1:Cmd_Friend_GetApplyList_SC) : void
      {
         var _loc2_:Dto_FriendApply = null;
         this.currentPage = param1.page;
         this.totalCount = param1.totalNum;
         this.logs = new Vector.<FriendLogVo>();
         for each(_loc2_ in param1.friendList)
         {
            this.logs.push(new FriendLogVo(_loc2_));
         }
      }
   }
}
