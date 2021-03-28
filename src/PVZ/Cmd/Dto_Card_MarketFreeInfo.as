package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT32;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_Card_MarketFreeInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_Card_MarketFreeInfo";
      
      public static const GROUPID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Card_MarketFreeInfo.groupId","groupId",1 << 3 | WireType.VARINT);
      
      public static const FREETIMES:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("PVZ.Cmd.Dto_Card_MarketFreeInfo.freeTimes","freeTimes",2 << 3 | WireType.VARINT);
      
      public static const FREECD:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Card_MarketFreeInfo.freeCD","freeCD",3 << 3 | WireType.VARINT);
       
      
      private var groupId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var freeTimes$field:int;
      
      private var freeCD$field:uint;
      
      public function Dto_Card_MarketFreeInfo()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_Card_MarketFreeInfo.$MessageID;
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
      
      public function clearFreeTimes() : void
      {
         this.hasField$0 &= 4294967293;
         this.freeTimes$field = new int();
      }
      
      public function get hasFreeTimes() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set freeTimes(param1:int) : void
      {
         this.hasField$0 |= 2;
         this.freeTimes$field = param1;
      }
      
      public function get freeTimes() : int
      {
         return this.freeTimes$field;
      }
      
      public function clearFreeCD() : void
      {
         this.hasField$0 &= 4294967291;
         this.freeCD$field = new uint();
      }
      
      public function get hasFreeCD() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set freeCD(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.freeCD$field = param1;
      }
      
      public function get freeCD() : uint
      {
         return this.freeCD$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasGroupId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.groupId$field);
         }
         if(this.hasFreeTimes)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_INT32(param1,this.freeTimes$field);
         }
         if(this.hasFreeCD)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.freeCD$field);
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
                     throw new IOError("Bad data format: Dto_Card_MarketFreeInfo.groupId cannot be set twice.");
                  }
                  _loc3_++;
                  this.groupId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Card_MarketFreeInfo.freeTimes cannot be set twice.");
                  }
                  _loc4_++;
                  this.freeTimes = ReadUtils.read$TYPE_INT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Card_MarketFreeInfo.freeCD cannot be set twice.");
                  }
                  _loc5_++;
                  this.freeCD = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
