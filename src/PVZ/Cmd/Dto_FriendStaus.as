package PVZ.Cmd
{
   import com.tencent.protobuf.Int64;
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT64;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_FriendStaus extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_FriendStaus";
      
      public static const ZONEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FriendStaus.zoneId","zoneId",1 << 3 | WireType.VARINT);
      
      public static const ROLEID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_FriendStaus.roleId","roleId",2 << 3 | WireType.VARINT);
      
      public static const STATUS:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FriendStaus.status","status",3 << 3 | WireType.VARINT);
      
      public static const ENABLE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FriendStaus.enable","enable",4 << 3 | WireType.VARINT);
       
      
      private var zoneId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var roleId$field:Int64;
      
      private var status$field:uint;
      
      private var enable$field:uint;
      
      public function Dto_FriendStaus()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_FriendStaus.$MessageID;
      }
      
      public function clearZoneId() : void
      {
         this.hasField$0 &= 4294967294;
         this.zoneId$field = new uint();
      }
      
      public function get hasZoneId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set zoneId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.zoneId$field = param1;
      }
      
      public function get zoneId() : uint
      {
         return this.zoneId$field;
      }
      
      public function clearRoleId() : void
      {
         this.roleId$field = null;
      }
      
      public function get hasRoleId() : Boolean
      {
         return this.roleId$field != null;
      }
      
      public function set roleId(param1:Int64) : void
      {
         this.roleId$field = param1;
      }
      
      public function get roleId() : Int64
      {
         return this.roleId$field;
      }
      
      public function clearStatus() : void
      {
         this.hasField$0 &= 4294967293;
         this.status$field = new uint();
      }
      
      public function get hasStatus() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set status(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.status$field = param1;
      }
      
      public function get status() : uint
      {
         return this.status$field;
      }
      
      public function clearEnable() : void
      {
         this.hasField$0 &= 4294967291;
         this.enable$field = new uint();
      }
      
      public function get hasEnable() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set enable(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.enable$field = param1;
      }
      
      public function get enable() : uint
      {
         return this.enable$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasZoneId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.zoneId$field);
         }
         if(this.hasRoleId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_INT64(param1,this.roleId$field);
         }
         if(this.hasStatus)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.status$field);
         }
         if(this.hasEnable)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.enable$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc7_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc7_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc7_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FriendStaus.zoneId cannot be set twice.");
                  }
                  _loc3_++;
                  this.zoneId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FriendStaus.roleId cannot be set twice.");
                  }
                  _loc4_++;
                  this.roleId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FriendStaus.status cannot be set twice.");
                  }
                  _loc5_++;
                  this.status = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FriendStaus.enable cannot be set twice.");
                  }
                  _loc6_++;
                  this.enable = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc7_);
                  break;
            }
         }
      }
   }
}
