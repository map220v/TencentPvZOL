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
   
   public final class Dto_VowItemInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_VowItemInfo";
      
      public static const ITEMID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_VowItemInfo.itemId","itemId",3 << 3 | WireType.VARINT);
      
      public static const ITEMNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_VowItemInfo.itemNum","itemNum",4 << 3 | WireType.VARINT);
      
      public static const WEIGHT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_VowItemInfo.weight","weight",5 << 3 | WireType.VARINT);
       
      
      private var itemId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var itemNum$field:uint;
      
      private var weight$field:uint;
      
      public function Dto_VowItemInfo()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_VowItemInfo.$MessageID;
      }
      
      public function clearItemId() : void
      {
         this.hasField$0 &= 4294967294;
         this.itemId$field = new uint();
      }
      
      public function get hasItemId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set itemId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.itemId$field = param1;
      }
      
      public function get itemId() : uint
      {
         return this.itemId$field;
      }
      
      public function clearItemNum() : void
      {
         this.hasField$0 &= 4294967293;
         this.itemNum$field = new uint();
      }
      
      public function get hasItemNum() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set itemNum(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.itemNum$field = param1;
      }
      
      public function get itemNum() : uint
      {
         return this.itemNum$field;
      }
      
      public function clearWeight() : void
      {
         this.hasField$0 &= 4294967291;
         this.weight$field = new uint();
      }
      
      public function get hasWeight() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set weight(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.weight$field = param1;
      }
      
      public function get weight() : uint
      {
         return this.weight$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasItemId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.itemId$field);
         }
         if(this.hasItemNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.itemNum$field);
         }
         if(this.hasWeight)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.weight$field);
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
               case 3:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_VowItemInfo.itemId cannot be set twice.");
                  }
                  _loc3_++;
                  this.itemId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_VowItemInfo.itemNum cannot be set twice.");
                  }
                  _loc4_++;
                  this.itemNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_VowItemInfo.weight cannot be set twice.");
                  }
                  _loc5_++;
                  this.weight = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
