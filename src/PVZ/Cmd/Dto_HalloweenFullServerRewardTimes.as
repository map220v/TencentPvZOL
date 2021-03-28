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
   
   public final class Dto_HalloweenFullServerRewardTimes extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_HalloweenFullServerRewardTimes";
      
      public static const PUMPKINNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_HalloweenFullServerRewardTimes.pumpkinNum","pumpkinNum",1 << 3 | WireType.VARINT);
      
      public static const TIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_HalloweenFullServerRewardTimes.times","times",2 << 3 | WireType.VARINT);
       
      
      private var pumpkinNum$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var times$field:uint;
      
      public function Dto_HalloweenFullServerRewardTimes()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_HalloweenFullServerRewardTimes.$MessageID;
      }
      
      public function clearPumpkinNum() : void
      {
         this.hasField$0 &= 4294967294;
         this.pumpkinNum$field = new uint();
      }
      
      public function get hasPumpkinNum() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set pumpkinNum(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.pumpkinNum$field = param1;
      }
      
      public function get pumpkinNum() : uint
      {
         return this.pumpkinNum$field;
      }
      
      public function clearTimes() : void
      {
         this.hasField$0 &= 4294967293;
         this.times$field = new uint();
      }
      
      public function get hasTimes() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set times(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.times$field = param1;
      }
      
      public function get times() : uint
      {
         return this.times$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasPumpkinNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.pumpkinNum$field);
         }
         if(this.hasTimes)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.times$field);
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
                     throw new IOError("Bad data format: Dto_HalloweenFullServerRewardTimes.pumpkinNum cannot be set twice.");
                  }
                  _loc3_++;
                  this.pumpkinNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_HalloweenFullServerRewardTimes.times cannot be set twice.");
                  }
                  _loc4_++;
                  this.times = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
