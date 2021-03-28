package com.qq.modules.friend.model
{
   import PVZ.Cmd.Cmd_Friend_GetEnergyList_SC;
   import PVZ.Cmd.Dto_FriendEnergyInfo;
   import com.qq.modules.friend.model.vo.FriendGiftEnergyLogVo;
   import com.tencent.protobuf.Int64;
   
   public class FriendGiftEnergyLogData
   {
       
      
      public var currentPage:int = 1;
      
      public var totalCount:uint;
      
      public var logs:Vector.<FriendGiftEnergyLogVo>;
      
      public function FriendGiftEnergyLogData()
      {
         super();
      }
      
      public function setData(param1:Cmd_Friend_GetEnergyList_SC) : void
      {
         var _loc2_:Dto_FriendEnergyInfo = null;
         this.currentPage = param1.page;
         this.totalCount = param1.totalCount;
         this.logs = new Vector.<FriendGiftEnergyLogVo>();
         for each(_loc2_ in param1.energyInfos)
         {
            this.logs.push(new FriendGiftEnergyLogVo(_loc2_));
         }
      }
      
      public function updateLogStatus(param1:Int64, param2:int) : FriendGiftEnergyLogVo
      {
         var _loc3_:FriendGiftEnergyLogVo = null;
         for each(_loc3_ in this.logs)
         {
            if(_loc3_.infoID.compare(param1))
            {
               _loc3_.dto.status = param2;
               return _loc3_;
            }
         }
         return null;
      }
   }
}
