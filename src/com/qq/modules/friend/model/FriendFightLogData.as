package com.qq.modules.friend.model
{
   import PVZ.Cmd.Cmd_Friend_GetFightList_SC;
   import PVZ.Cmd.Dto_FriendFightInfo;
   import com.qq.modules.friend.model.vo.FriendFightLogVo;
   
   public class FriendFightLogData
   {
       
      
      public var currentPage:int = 1;
      
      public var totalCount:uint;
      
      public var logs:Vector.<FriendFightLogVo>;
      
      public function FriendFightLogData()
      {
         super();
      }
      
      public function setData(param1:Cmd_Friend_GetFightList_SC) : void
      {
         var _loc2_:Dto_FriendFightInfo = null;
         this.currentPage = param1.page;
         this.totalCount = param1.totalCount;
         this.logs = new Vector.<FriendFightLogVo>();
         for each(_loc2_ in param1.fightInfos)
         {
            this.logs.push(new FriendFightLogVo(_loc2_));
         }
      }
   }
}
