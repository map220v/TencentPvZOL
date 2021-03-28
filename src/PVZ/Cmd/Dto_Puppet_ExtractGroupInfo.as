package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_Puppet_ExtractGroupInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_Puppet_ExtractGroupInfo";
      
      public static const GROUPID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Puppet_ExtractGroupInfo.groupId","groupId",1 << 3 | WireType.VARINT);
      
      public static const HASFREE:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Dto_Puppet_ExtractGroupInfo.hasFree","hasFree",2 << 3 | WireType.VARINT);
      
      public static const FREECD:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Puppet_ExtractGroupInfo.freeCd","freeCd",3 << 3 | WireType.VARINT);
      
      public static const EXTRACTCOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Puppet_ExtractGroupInfo.extractCount","extractCount",4 << 3 | WireType.VARINT);
       
      
      private var groupId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var hasFree$field:Boolean;
      
      private var freeCd$field:uint;
      
      private var extractCount$field:uint;
      
      public function Dto_Puppet_ExtractGroupInfo()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_Puppet_ExtractGroupInfo.$MessageID;
      }
      
      public function clearGroupId() : void
      {
         this.hasField$0 &= 4294967294;
         this.groupId$field = new uint();
      }
      
      public function get hasGroupId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set groupId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.groupId$field = param1;
      }
      
      public function get groupId() : uint
      {
         return this.groupId$field;
      }
      
      public function clearHasFree() : void
      {
         this.hasField$0 &= 4294967293;
         this.hasFree$field = new Boolean();
      }
      
      public function get hasHasFree() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set hasFree(param1:Boolean) : void
      {
         this.hasField$0 |= 2;
         this.hasFree$field = param1;
      }
      
      public function get hasFree() : Boolean
      {
         return this.hasFree$field;
      }
      
      public function clearFreeCd() : void
      {
         this.hasField$0 &= 4294967291;
         this.freeCd$field = new uint();
      }
      
      public function get hasFreeCd() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set freeCd(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.freeCd$field = param1;
      }
      
      public function get freeCd() : uint
      {
         return this.freeCd$field;
      }
      
      public function clearExtractCount() : void
      {
         this.hasField$0 &= 4294967287;
         this.extractCount$field = new uint();
      }
      
      public function get hasExtractCount() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set extractCount(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.extractCount$field = param1;
      }
      
      public function get extractCount() : uint
      {
         return this.extractCount$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasGroupId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.groupId$field);
         }
         if(this.hasHasFree)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_BOOL(param1,this.hasFree$field);
         }
         if(this.hasFreeCd)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.freeCd$field);
         }
         if(this.hasExtractCount)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.extractCount$field);
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
                     throw new IOError("Bad data format: Dto_Puppet_ExtractGroupInfo.groupId cannot be set twice.");
                  }
                  _loc3_++;
                  this.groupId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Puppet_ExtractGroupInfo.hasFree cannot be set twice.");
                  }
                  _loc4_++;
                  this.hasFree = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Puppet_ExtractGroupInfo.freeCd cannot be set twice.");
                  }
                  _loc5_++;
                  this.freeCd = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Puppet_ExtractGroupInfo.extractCount cannot be set twice.");
                  }
                  _loc6_++;
                  this.extractCount = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc7_);
                  break;
            }
         }
      }
   }
}
