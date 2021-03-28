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
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Chat_GetObjInfo_CS extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Chat_GetObjInfo_CS";
      
      public static const TYPE:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("PVZ.Cmd.Cmd_Chat_GetObjInfo_CS.type","type",1 << 3 | WireType.VARINT,ObjInfoType);
      
      public static const UID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Cmd_Chat_GetObjInfo_CS.uid","uid",2 << 3 | WireType.VARINT);
      
      public static const ROLEID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Cmd_Chat_GetObjInfo_CS.roleid","roleid",3 << 3 | WireType.VARINT);
       
      
      private var type$field:int;
      
      private var hasField$0:uint = 0;
      
      private var uid$field:Int64;
      
      private var roleid$field:Int64;
      
      public function Cmd_Chat_GetObjInfo_CS()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Chat_GetObjInfo_CS.$MessageID;
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
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc6_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc6_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc6_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Chat_GetObjInfo_CS.type cannot be set twice.");
                  }
                  _loc3_++;
                  this.type = ReadUtils.read$TYPE_ENUM(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Chat_GetObjInfo_CS.uid cannot be set twice.");
                  }
                  _loc4_++;
                  this.uid = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Chat_GetObjInfo_CS.roleid cannot be set twice.");
                  }
                  _loc5_++;
                  this.roleid = ReadUtils.read$TYPE_INT64(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
