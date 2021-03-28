package PVZ.Cmd
{
   import com.tencent.protobuf.Int64;
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_ENUM;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT64;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Chat_GetObjInfo_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Chat_GetObjInfo_SC";
      
      public static const TYPE:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("PVZ.Cmd.Cmd_Chat_GetObjInfo_SC.type","type",1 << 3 | WireType.VARINT,ObjInfoType);
      
      public static const UID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Cmd_Chat_GetObjInfo_SC.uid","uid",2 << 3 | WireType.VARINT);
      
      public static const ROLEID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Cmd_Chat_GetObjInfo_SC.roleid","roleid",3 << 3 | WireType.VARINT);
      
      public static const CARD:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Chat_GetObjInfo_SC.card","card",4 << 3 | WireType.LENGTH_DELIMITED,Dto_CardFullInfo);
      
      public static const ITEM:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Chat_GetObjInfo_SC.item","item",5 << 3 | WireType.LENGTH_DELIMITED,Dto_ItemInfo);
      
      public static const ROLE:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Chat_GetObjInfo_SC.role","role",6 << 3 | WireType.LENGTH_DELIMITED,Dto_ChatRoleInfo);
       
      
      private var type$field:int;
      
      private var hasField$0:uint = 0;
      
      private var uid$field:Int64;
      
      private var roleid$field:Int64;
      
      private var card$field:Dto_CardFullInfo;
      
      private var item$field:Dto_ItemInfo;
      
      private var role$field:Dto_ChatRoleInfo;
      
      public function Cmd_Chat_GetObjInfo_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Chat_GetObjInfo_SC.$MessageID;
      }
      
      public function clearType() : void
      {
         this.hasField$0 &= 4294967294;
         this.type$field = new int();
      }
      
      public function get hasType() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set type(param1:int) : void
      {
         this.hasField$0 |= 1;
         this.type$field = param1;
      }
      
      public function get type() : int
      {
         return this.type$field;
      }
      
      public function clearUid() : void
      {
         this.uid$field = null;
      }
      
      public function get hasUid() : Boolean
      {
         return this.uid$field != null;
      }
      
      public function set uid(param1:Int64) : void
      {
         this.uid$field = param1;
      }
      
      public function get uid() : Int64
      {
         return this.uid$field;
      }
      
      public function clearRoleid() : void
      {
         this.roleid$field = null;
      }
      
      public function get hasRoleid() : Boolean
      {
         return this.roleid$field != null;
      }
      
      public function set roleid(param1:Int64) : void
      {
         this.roleid$field = param1;
      }
      
      public function get roleid() : Int64
      {
         return this.roleid$field;
      }
      
      public function clearCard() : void
      {
         this.card$field = null;
      }
      
      public function get hasCard() : Boolean
      {
         return this.card$field != null;
      }
      
      public function set card(param1:Dto_CardFullInfo) : void
      {
         this.card$field = param1;
      }
      
      public function get card() : Dto_CardFullInfo
      {
         return this.card$field;
      }
      
      public function clearItem() : void
      {
         this.item$field = null;
      }
      
      public function get hasItem() : Boolean
      {
         return this.item$field != null;
      }
      
      public function set item(param1:Dto_ItemInfo) : void
      {
         this.item$field = param1;
      }
      
      public function get item() : Dto_ItemInfo
      {
         return this.item$field;
      }
      
      public function clearRole() : void
      {
         this.role$field = null;
      }
      
      public function get hasRole() : Boolean
      {
         return this.role$field != null;
      }
      
      public function set role(param1:Dto_ChatRoleInfo) : void
      {
         this.role$field = param1;
      }
      
      public function get role() : Dto_ChatRoleInfo
      {
         return this.role$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasType)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_ENUM(param1,this.type$field);
         }
         if(this.hasUid)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_INT64(param1,this.uid$field);
         }
         if(this.hasRoleid)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_INT64(param1,this.roleid$field);
         }
         if(this.hasCard)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write$TYPE_MESSAGE(param1,this.card$field);
         }
         if(this.hasItem)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,5);
            WriteUtils.write$TYPE_MESSAGE(param1,this.item$field);
         }
         if(this.hasRole)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,6);
            WriteUtils.write$TYPE_MESSAGE(param1,this.role$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc9_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc9_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc9_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Chat_GetObjInfo_SC.type cannot be set twice.");
                  }
                  _loc3_++;
                  this.type = ReadUtils.read$TYPE_ENUM(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Chat_GetObjInfo_SC.uid cannot be set twice.");
                  }
                  _loc4_++;
                  this.uid = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Chat_GetObjInfo_SC.roleid cannot be set twice.");
                  }
                  _loc5_++;
                  this.roleid = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Chat_GetObjInfo_SC.card cannot be set twice.");
                  }
                  _loc6_++;
                  this.card = new Dto_CardFullInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.card);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Chat_GetObjInfo_SC.item cannot be set twice.");
                  }
                  _loc7_++;
                  this.item = new Dto_ItemInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.item);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Chat_GetObjInfo_SC.role cannot be set twice.");
                  }
                  _loc8_++;
                  this.role = new Dto_ChatRoleInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.role);
                  break;
               default:
                  super.readUnknown(param1,_loc9_);
                  break;
            }
         }
      }
   }
}
