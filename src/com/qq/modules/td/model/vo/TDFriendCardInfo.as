package com.qq.modules.td.model.vo
{
   import PVZ.Cmd.Dto_FriendInfo;
   
   public class TDFriendCardInfo
   {
       
      
      public var friendInfo:Dto_FriendInfo;
      
      public var talentInfo:Array;
      
      public function TDFriendCardInfo(param1:Dto_FriendInfo)
      {
         super();
         this.friendInfo = param1;
      }
   }
}
