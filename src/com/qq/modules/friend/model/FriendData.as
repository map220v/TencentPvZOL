package com.qq.modules.friend.model
{
   import PVZ.Cmd.Cmd_Friend_GetList_SC;
   import PVZ.Cmd.Cmd_Friend_SyncOperationStatus_SC;
   import PVZ.Cmd.Dto_FriendInfo;
   import PVZ.Cmd.Dto_FriendStaus;
   import com.qq.modules.friend.model.vo.FriendRoleVo;
   import com.tencent.protobuf.Int64;
   
   public class FriendData
   {
       
      
      public var friends:Vector.<FriendRoleVo>;
      
      public var itemsPerPage:int = 6;
      
      public var currentPage:int = 1;
      
      public var totalPage:int = 1;
      
      public var totalCount:uint;
      
      public var fightNum:int;
      
      public var presentEnergyNum:int;
      
      public var stealFarmNum:int;
      
      public var canRecommend:Boolean;
      
      public var moduleType:int;
      
      public var friendType:int;
      
      public function FriendData()
      {
         super();
         this.friends = new Vector.<FriendRoleVo>();
      }
      
      public function loadCmd_Friend_GetList_SC(param1:Cmd_Friend_GetList_SC) : void
      {
         var _loc2_:Dto_FriendInfo = null;
         var _loc3_:FriendRoleVo = null;
         var _loc4_:int = 0;
         this.moduleType = param1.moduleType;
         this.friendType = param1.friendType;
         this.currentPage = param1.page;
         this.totalCount = param1.totalCount;
         this.totalPage = Math.max(1,Math.ceil(this.totalCount / this.itemsPerPage));
         this.friends.length = 0;
         _loc4_ = 0;
         while(_loc4_ < param1.friends.length)
         {
            _loc2_ = param1.friends[_loc4_];
            _loc3_ = new FriendRoleVo();
            _loc3_.load(_loc2_);
            this.friends.push(_loc3_);
            _loc4_++;
         }
      }
      
      public function getFriendVo(param1:Int64) : FriendRoleVo
      {
         var _loc2_:FriendRoleVo = null;
         var _loc3_:int = 0;
         _loc3_ = 0;
         while(_loc3_ < this.friends.length)
         {
            _loc2_ = this.friends[_loc3_];
            if(_loc2_.roleId.compare(param1))
            {
               return _loc2_;
            }
            _loc3_++;
         }
         return null;
      }
      
      public function updateFriendStaus(param1:Cmd_Friend_SyncOperationStatus_SC) : Vector.<FriendRoleVo>
      {
         var _loc3_:FriendRoleVo = null;
         var _loc4_:Dto_FriendStaus = null;
         var _loc2_:Vector.<FriendRoleVo> = new Vector.<FriendRoleVo>();
         for each(_loc4_ in param1.friends)
         {
            _loc3_ = this.getFriendVo(_loc4_.roleId);
            if(_loc3_)
            {
               _loc3_.dto.status = _loc3_.status = !!_loc4_.enable ? uint(_loc3_.status | _loc4_.status) : uint(_loc3_.status & ~_loc4_.status);
            }
            _loc2_.push(_loc3_);
         }
         return _loc2_;
      }
      
      public function reduceFriendPVPTimes(param1:Int64) : void
      {
         var _loc2_:FriendRoleVo = null;
         for each(_loc2_ in this.friends)
         {
            if(param1 == _loc2_.roleId)
            {
               if(_loc2_.dtoPVP != null)
               {
                  --_loc2_.dtoPVP.times;
               }
            }
         }
      }
   }
}
