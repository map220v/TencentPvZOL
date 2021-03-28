package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_FlexibleCrossGameActivityReward extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_FlexibleCrossGameActivityReward";
      
      public static const GIFTID:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_FlexibleCrossGameActivityReward.giftid","giftid",1 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const GIFTCOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FlexibleCrossGameActivityReward.giftcount","giftcount",2 << 3 | WireType.VARINT);
       
      
      private var giftid$field:String;
      
      private var giftcount$field:uint;
      
      private var hasField$0:uint = 0;
      
      public function Dto_FlexibleCrossGameActivityReward()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_FlexibleCrossGameActivityReward.$MessageID;
      }
      
      public function clearGiftid() : void
      {
         this.giftid$field = null;
      }
      
      public function get hasGiftid() : Boolean
      {
         return this.giftid$field != null;
      }
      
      public function set giftid(param1:String) : void
      {
         this.giftid$field = param1;
      }
      
      public function get giftid() : String
      {
         return this.giftid$field;
      }
      
      public function clearGiftcount() : void
      {
         this.hasField$0 &= 4294967294;
         this.giftcount$field = new uint();
      }
      
      public function get hasGiftcount() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set giftcount(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.giftcount$field = param1;
      }
      
      public function get giftcount() : uint
      {
         return this.giftcount$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasGiftid)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_STRING(param1,this.giftid$field);
         }
         if(this.hasGiftcount)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.giftcount$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
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
                     throw new IOError("Bad data format: Dto_FlexibleCrossGameActivityReward.giftid cannot be set twice.");
                  }
                  _loc3_++;
                  this.giftid = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleCrossGameActivityReward.giftcount cannot be set twice.");
                  }
                  _loc4_++;
                  this.giftcount = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
