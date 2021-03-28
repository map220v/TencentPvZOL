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
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_FriendTalent extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_FriendTalent";
      
      public static const ZONEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FriendTalent.zoneId","zoneId",1 << 3 | WireType.VARINT);
      
      public static const ROLEID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_FriendTalent.roleId","roleId",2 << 3 | WireType.VARINT);
      
      public static const TALENTID:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FriendTalent.talentId","talentId",3 << 3 | WireType.VARINT);
       
      
      private var zoneId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var roleId$field:Int64;
      
      public var talentId:Array;
      
      public function Dto_FriendTalent()
      {
         this.talentId = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_FriendTalent.$MessageID;
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
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
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
         var _loc2_:uint = 0;
         while(_loc2_ < this.talentId.length)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.talentId[_loc2_]);
            _loc2_++;
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc5_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc5_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FriendTalent.zoneId cannot be set twice.");
                  }
                  _loc3_++;
                  this.zoneId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FriendTalent.roleId cannot be set twice.");
                  }
                  _loc4_++;
                  this.roleId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 3:
                  if((_loc5_ & 7) == WireType.LENGTH_DELIMITED)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.talentId);
                  }
                  else
                  {
                     this.talentId.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
