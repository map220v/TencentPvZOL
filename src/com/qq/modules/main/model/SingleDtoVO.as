package com.qq.modules.main.model
{
   import PVZ.Cmd.Cmd_Chat_GetObjInfo_SC;
   import PVZ.Cmd.ObjInfoType;
   
   public class SingleDtoVO
   {
       
      
      private var _msg:Cmd_Chat_GetObjInfo_SC;
      
      public function SingleDtoVO(param1:Cmd_Chat_GetObjInfo_SC)
      {
         super();
         this._msg = param1;
      }
      
      public function get type() : int
      {
         return this._msg.type;
      }
      
      public function get dto() : *
      {
         var _loc1_:* = null;
         switch(this._msg.type)
         {
            case ObjInfoType.E_ObjInfoType_CardFullInfo:
               _loc1_ = this._msg.card;
               break;
            case ObjInfoType.E_ObjInfoType_ItemInfo:
               _loc1_ = this._msg.item;
               break;
            case ObjInfoType.E_ObjInfoType_ChatRoleInfo:
               _loc1_ = this._msg.role;
         }
         return _loc1_;
      }
   }
}
