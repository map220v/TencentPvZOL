package PVZ.Protocol
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
   
   public final class Dto_CardAttributeEle extends Message
   {
      
      public static const $MessageID:String = "PVZ.Protocol.Dto_CardAttributeEle";
      
      public static const ELE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Protocol.Dto_CardAttributeEle.ele","ele",1 << 3 | WireType.VARINT);
      
      public static const POWER:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Protocol.Dto_CardAttributeEle.power","power",2 << 3 | WireType.VARINT);
      
      public static const SPEED:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Protocol.Dto_CardAttributeEle.speed","speed",3 << 3 | WireType.VARINT);
       
      
      private var ele$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var power$field:Int64;
      
      private var speed$field:Int64;
      
      public function Dto_CardAttributeEle()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_CardAttributeEle.$MessageID;
      }
      
      public function clearEle() : void
      {
         this.hasField$0 &= 4294967294;
         this.ele$field = new uint();
      }
      
      public function get hasEle() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set ele(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.ele$field = param1;
      }
      
      public function get ele() : uint
      {
         return this.ele$field;
      }
      
      public function clearPower() : void
      {
         this.power$field = null;
      }
      
      public function get hasPower() : Boolean
      {
         return this.power$field != null;
      }
      
      public function set power(param1:Int64) : void
      {
         this.power$field = param1;
      }
      
      public function get power() : Int64
      {
         return this.power$field;
      }
      
      public function clearSpeed() : void
      {
         this.speed$field = null;
      }
      
      public function get hasSpeed() : Boolean
      {
         return this.speed$field != null;
      }
      
      public function set speed(param1:Int64) : void
      {
         this.speed$field = param1;
      }
      
      public function get speed() : Int64
      {
         return this.speed$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasEle)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.ele$field);
         }
         if(this.hasPower)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_INT64(param1,this.power$field);
         }
         if(this.hasSpeed)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_INT64(param1,this.speed$field);
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
                     throw new IOError("Bad data format: Dto_CardAttributeEle.ele cannot be set twice.");
                  }
                  _loc3_++;
                  this.ele = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardAttributeEle.power cannot be set twice.");
                  }
                  _loc4_++;
                  this.power = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardAttributeEle.speed cannot be set twice.");
                  }
                  _loc5_++;
                  this.speed = ReadUtils.read$TYPE_INT64(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
