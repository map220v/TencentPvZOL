package PVZ.Cmd
{
   import com.tencent.protobuf.Int64;
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_ENUM;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT64;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_CardPower extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_CardPower";
      
      public static const ELE:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("PVZ.Cmd.Dto_CardPower.ele","ele",1 << 3 | WireType.VARINT,E_PowerEle);
      
      public static const VALUE:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_CardPower.value","value",2 << 3 | WireType.VARINT);
      
      public static const SPEED:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_CardPower.speed","speed",3 << 3 | WireType.VARINT);
       
      
      private var ele$field:int;
      
      private var hasField$0:uint = 0;
      
      private var value$field:Int64;
      
      private var speed$field:Int64;
      
      public function Dto_CardPower()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_CardPower.$MessageID;
      }
      
      public function clearEle() : void
      {
         this.hasField$0 &= 4294967294;
         this.ele$field = new int();
      }
      
      public function get hasEle() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set ele(param1:int) : void
      {
         this.hasField$0 |= 1;
         this.ele$field = param1;
      }
      
      public function get ele() : int
      {
         return this.ele$field;
      }
      
      public function clearValue() : void
      {
         this.value$field = null;
      }
      
      public function get hasValue() : Boolean
      {
         return this.value$field != null;
      }
      
      public function set value(param1:Int64) : void
      {
         this.value$field = param1;
      }
      
      public function get value() : Int64
      {
         return this.value$field;
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
            WriteUtils.write$TYPE_ENUM(param1,this.ele$field);
         }
         if(this.hasValue)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_INT64(param1,this.value$field);
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
                     throw new IOError("Bad data format: Dto_CardPower.ele cannot be set twice.");
                  }
                  _loc3_++;
                  this.ele = ReadUtils.read$TYPE_ENUM(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardPower.value cannot be set twice.");
                  }
                  _loc4_++;
                  this.value = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardPower.speed cannot be set twice.");
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
