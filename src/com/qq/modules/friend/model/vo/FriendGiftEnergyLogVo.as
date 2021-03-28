package com.qq.modules.friend.model.vo
{
   import PVZ.Cmd.Dto_FriendEnergyInfo;
   import PVZ.Cmd.FriendOperationStatus;
   import com.qq.modules.friend.model.templates.FriendLogTemplate;
   import com.qq.modules.friend.model.templates.FriendLogTemplateFactory;
   import com.tencent.protobuf.Int64;
   
   public class FriendGiftEnergyLogVo
   {
       
      
      public var dto:Dto_FriendEnergyInfo;
      
      private var _tempalte:FriendLogTemplate;
      
      public function FriendGiftEnergyLogVo(param1:Dto_FriendEnergyInfo)
      {
         super();
         this.dto = param1;
      }
      
      public function get tempalte() : FriendLogTemplate
      {
         if(this._tempalte == null)
         {
            this._tempalte = FriendLogTemplateFactory.instance.getFriendLogTemplate(this.dto.type);
         }
         return this._tempalte;
      }
      
      public function getDesc() : String
      {
         var _loc1_:String = this.tempalte.desc;
         _loc1_ = _loc1_.replace("{role_name}",this.dto.name).replace("{energy}",this.dto.energy).replace("{friend_point}",this.dto.friendPoint);
         while(_loc1_.indexOf("[") != -1)
         {
            _loc1_ = _loc1_.replace("[","<");
         }
         return _loc1_.replace(/]/g,">");
      }
      
      public function get infoID() : Int64
      {
         return this.dto.id;
      }
      
      public function get isCanTake() : Boolean
      {
         return (this.dto.status & FriendOperationStatus.FRIEND_OPERATION_STATUS_TAKE_ENERGY) > 0;
      }
      
      public function get isCanPayBack() : Boolean
      {
         return (this.dto.status & FriendOperationStatus.FRIEND_OPERATION_STATUS_RETURN_ENERGY) > 0;
      }
   }
}
