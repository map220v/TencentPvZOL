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
   
   public final class Dto_DailyPayExchangeInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_DailyPayExchangeInfo";
      
      public static const EXCHANGEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_DailyPayExchangeInfo.exchangeid","exchangeid",1 << 3 | WireType.VARINT);
      
      public static const ISEXCHANGED:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Dto_DailyPayExchangeInfo.isExchanged","isExchanged",2 << 3 | WireType.VARINT);
      
      public static const DAILYCOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_DailyPayExchangeInfo.dailyCount","dailyCount",3 << 3 | WireType.VARINT);
       
      
      private var exchangeid$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var isExchanged$field:Boolean;
      
      private var dailyCount$field:uint;
      
      public function Dto_DailyPayExchangeInfo()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_DailyPayExchangeInfo.$MessageID;
      }
      
      public function clearExchangeid() : void
      {
         this.hasField$0 &= 4294967294;
         this.exchangeid$field = new uint();
      }
      
      public function get hasExchangeid() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set exchangeid(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.exchangeid$field = param1;
      }
      
      public function get exchangeid() : uint
      {
         return this.exchangeid$field;
      }
      
      public function clearIsExchanged() : void
      {
         this.hasField$0 &= 4294967293;
         this.isExchanged$field = new Boolean();
      }
      
      public function get hasIsExchanged() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set isExchanged(param1:Boolean) : void
      {
         this.hasField$0 |= 2;
         this.isExchanged$field = param1;
      }
      
      public function get isExchanged() : Boolean
      {
         return this.isExchanged$field;
      }
      
      public function clearDailyCount() : void
      {
         this.hasField$0 &= 4294967291;
         this.dailyCount$field = new uint();
      }
      
      public function get hasDailyCount() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set dailyCount(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.dailyCount$field = param1;
      }
      
      public function get dailyCount() : uint
      {
         return this.dailyCount$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasExchangeid)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.exchangeid$field);
         }
         if(this.hasIsExchanged)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_BOOL(param1,this.isExchanged$field);
         }
         if(this.hasDailyCount)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.dailyCount$field);
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
                     throw new IOError("Bad data format: Dto_DailyPayExchangeInfo.exchangeid cannot be set twice.");
                  }
                  _loc3_++;
                  this.exchangeid = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_DailyPayExchangeInfo.isExchanged cannot be set twice.");
                  }
                  _loc4_++;
                  this.isExchanged = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_DailyPayExchangeInfo.dailyCount cannot be set twice.");
                  }
                  _loc5_++;
                  this.dailyCount = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
