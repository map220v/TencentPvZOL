package com.qq.modules.td.model.vo
{
   import PVZ.Cmd.Dto_FriendInfo;
   import PVZ.Cmd.Dto_FriendTalent;
   
   public class TDDataVO
   {
      
      public static const PageSize:int = 8;
       
      
      public var friendInfoList:Array;
      
      public var curPage:int;
      
      public var totalPage:int;
      
      public function TDDataVO()
      {
         super();
         this.friendInfoList = new Array();
         this.curPage = 0;
         this.totalPage = 0;
      }
      
      public function addCard(param1:Dto_FriendInfo) : void
      {
         this.friendInfoList.push(new TDFriendCardInfo(param1));
      }
      
      public function setCardTalent(param1:Dto_FriendTalent) : void
      {
      }
      
      public function clean() : void
      {
         this.friendInfoList = new Array();
      }
   }
}
