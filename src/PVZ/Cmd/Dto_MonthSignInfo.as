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
   
   public final class Dto_MonthSignInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_MonthSignInfo";
      
      public static const MONTH:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_MonthSignInfo.month","month",1 << 3 | WireType.VARINT);
      
      public static const SIGNINFO:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_MonthSignInfo.signInfo","signInfo",2 << 3 | WireType.VARINT);
       
      
      private var month$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var signInfo$field:uint;
      
      public function Dto_MonthSignInfo()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_MonthSignInfo.$MessageID;
      }
      
      public function clearMonth() : void
      {
         this.hasField$0 &= 4294967294;
         this.month$field = new uint();
      }
      
      public function get hasMonth() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set month(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.month$field = param1;
      }
      
      public function get month() : uint
      {
         return this.month$field;
      }
      
      public function clearSignInfo() : void
      {
         this.hasField$0 &= 4294967293;
         this.signInfo$field = new uint();
      }
      
      public function get hasSignInfo() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set signInfo(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.signInfo$field = param1;
      }
      
      public function get signInfo() : uint
      {
         return this.signInfo$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasMonth)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.month$field);
         }
         if(this.hasSignInfo)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.signInfo$field);
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
                     throw new IOError("Bad data format: Dto_MonthSignInfo.month cannot be set twice.");
                  }
                  _loc3_++;
                  this.month = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_MonthSignInfo.signInfo cannot be set twice.");
                  }
                  _loc4_++;
                  this.signInfo = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
