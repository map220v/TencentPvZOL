package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_SelectReward extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_SelectReward";
      
      public static const GROUPINDEX:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_SelectReward.groupIndex","groupIndex",1 << 3 | WireType.VARINT);
      
      public static const ITEMINDEX:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_SelectReward.itemIndex","itemIndex",2 << 3 | WireType.VARINT);
      
      public static const BREAKID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_SelectReward.breakId","breakId",3 << 3 | WireType.VARINT);
       
      
      private var groupIndex$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var itemIndex$field:uint;
      
      private var breakId$field:uint;
      
      public function Dto_SelectReward()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_SelectReward.$MessageID;
      }
      
      public function clearGroupIndex() : void
      {
         this.hasField$0 &= 4294967294;
         this.groupIndex$field = new uint();
      }
      
      public function get hasGroupIndex() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set groupIndex(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.groupIndex$field = param1;
      }
      
      public function get groupIndex() : uint
      {
         return this.groupIndex$field;
      }
      
      public function clearItemIndex() : void
      {
         this.hasField$0 &= 4294967293;
         this.itemIndex$field = new uint();
      }
      
      public function get hasItemIndex() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set itemIndex(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.itemIndex$field = param1;
      }
      
      public function get itemIndex() : uint
      {
         return this.itemIndex$field;
      }
      
      public function clearBreakId() : void
      {
         this.hasField$0 &= 4294967291;
         this.breakId$field = new uint();
      }
      
      public function get hasBreakId() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set breakId(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.breakId$field = param1;
      }
      
      public function get breakId() : uint
      {
         return this.breakId$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasGroupIndex)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.groupIndex$field);
         }
         if(this.hasItemIndex)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.itemIndex$field);
         }
         if(this.hasBreakId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.breakId$field);
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
                     throw new IOError("Bad data format: Dto_SelectReward.groupIndex cannot be set twice.");
                  }
                  _loc3_++;
                  this.groupIndex = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_SelectReward.itemIndex cannot be set twice.");
                  }
                  _loc4_++;
                  this.itemIndex = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_SelectReward.breakId cannot be set twice.");
                  }
                  _loc5_++;
                  this.breakId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
