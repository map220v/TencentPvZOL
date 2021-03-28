package com.qq.modules.basic.modle.vo
{
   import PVZ.Cmd.Dto_FriendInfo;
   import PVZ.Cmd.Dto_OperationLeftTimes;
   import PVZ.Cmd.FriendOperationStatus;
   import com.qq.modules.main.model.PrivilegeDiamond;
   import com.qq.utils.IconUtil;
   import com.tencent.protobuf.Int64;
   
   public class FriendIDVO
   {
       
      
      private var m_privilegeDiamond:PrivilegeDiamond;
      
      public var type:int;
      
      public var status:uint;
      
      public var zoneId:uint;
      
      public var roleId:Int64;
      
      public var name:String;
      
      public var qqName:String;
      
      public var dto:Dto_FriendInfo;
      
      public var icon:String;
      
      public var level:uint;
      
      public var passTDNum:uint;
      
      public var dtoPVP:Dto_OperationLeftTimes;
      
      public function FriendIDVO(param1:Dto_FriendInfo = null)
      {
         super();
         if(param1)
         {
            this.load(param1);
         }
      }
      
      public function load(param1:Dto_FriendInfo, param2:Boolean = false) : void
      {
         this.status = param1.status;
         this.dtoPVP = param1.leftTimes.length > 0 ? param1.leftTimes[0] : null;
         if(param2)
         {
            this.dto.status = param1.status;
            this.status = param1.status;
         }
         else
         {
            this.dto = param1;
            this.zoneId = param1.zoneId;
            this.roleId = param1.roleId;
            this.name = param1.name;
            this.qqName = !!param1.qqName ? param1.qqName : "";
            this.icon = IconUtil.getFaceIcon(null,param1.faceId,param1.qqFaceURL);
            this.level = param1.roleLevel;
            this.type = param1.type;
            this.passTDNum = param1.passTDNum;
            this.m_privilegeDiamond = PrivilegeDiamond.createByInfo(param1.diamond);
         }
      }
      
      public final function get privilegeDiamond() : PrivilegeDiamond
      {
         return this.m_privilegeDiamond;
      }
      
      public function get isAvailable() : Boolean
      {
         if(this.status == 0)
         {
            return false;
         }
         return Boolean(this.status & FriendOperationStatus.FRIEND_OPERATION_STATUS_ENABLE);
      }
      
      public function get isStealable() : Boolean
      {
         if(this.status == 0)
         {
            return false;
         }
         return Boolean(this.status & FriendOperationStatus.FRIEND_OPERATION_STATUS_STEAL);
      }
      
      public function get isEnergySendable() : Boolean
      {
         if(this.status == 0)
         {
            return false;
         }
         return Boolean(this.status & FriendOperationStatus.FRIEND_OPERATION_STATUS_PRESENT_ENERGY);
      }
      
      public function setEnergySendable(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1)
         {
            this.status |= FriendOperationStatus.FRIEND_OPERATION_STATUS_PRESENT_ENERGY;
         }
         else
         {
            _loc2_ = int.MAX_VALUE - FriendOperationStatus.FRIEND_OPERATION_STATUS_PRESENT_ENERGY;
            this.status &= _loc2_;
         }
      }
      
      public function get isPVPAvailable() : Boolean
      {
         return Boolean(this.status & FriendOperationStatus.FRIEND_OPERATION_STATUS_FIGHT);
      }
      
      public function get isNotReceiveEnergy() : Boolean
      {
         return Boolean(this.status & FriendOperationStatus.FRIEND_OPERATION_STATUS_NOT_RECV_ENERGY);
      }
   }
}
