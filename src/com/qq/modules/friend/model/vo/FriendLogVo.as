package com.qq.modules.friend.model.vo
{
   import PVZ.Cmd.Dto_FriendApply;
   import com.tencent.protobuf.Int64;
   
   public class FriendLogVo
   {
       
      
      public var dto:Dto_FriendApply;
      
      public function FriendLogVo(param1:Dto_FriendApply)
      {
         super();
         this.load(param1);
      }
      
      public function load(param1:Dto_FriendApply) : void
      {
         this.dto = param1;
      }
      
      public function get roleID() : Int64
      {
         return this.dto.roleId;
      }
   }
}
