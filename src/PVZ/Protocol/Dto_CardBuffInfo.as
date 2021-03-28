package PVZ.Protocol
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_CardBuffInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Protocol.Dto_CardBuffInfo";
      
      public static const ID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Protocol.Dto_CardBuffInfo.id","id",1 << 3 | WireType.VARINT);
      
      public static const PARAM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Protocol.Dto_CardBuffInfo.param","param",2 << 3 | WireType.VARINT);
      
      public static const CLEARTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Protocol.Dto_CardBuffInfo.clearTime","clearTime",3 << 3 | WireType.VARINT);
      
      public static const EFFECTTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Protocol.Dto_CardBuffInfo.effectTime","effectTime",4 << 3 | WireType.VARINT);
       
      
      private var id$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var param$field:uint;
      
      private var clearTime$field:uint;
      
      private var effectTime$field:uint;
      
      public function Dto_CardBuffInfo()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_CardBuffInfo.$MessageID;
      }
      
      public function clearId() : void
      {
         this.hasField$0 &= 4294967294;
         this.id$field = new uint();
      }
      
      public function get hasId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set id(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.id$field = param1;
      }
      
      public function get id() : uint
      {
         return this.id$field;
      }
      
      public function clearParam() : void
      {
         this.hasField$0 &= 4294967293;
         this.param$field = new uint();
      }
      
      public function get hasParam() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set param(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.param$field = param1;
      }
      
      public function get param() : uint
      {
         return this.param$field;
      }
      
      public function clearClearTime() : void
      {
         this.hasField$0 &= 4294967291;
         this.clearTime$field = new uint();
      }
      
      public function get hasClearTime() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set clearTime(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.clearTime$field = param1;
      }
      
      public function get clearTime() : uint
      {
         return this.clearTime$field;
      }
      
      public function clearEffectTime() : void
      {
         this.hasField$0 &= 4294967287;
         this.effectTime$field = new uint();
      }
      
      public function get hasEffectTime() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set effectTime(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.effectTime$field = param1;
      }
      
      public function get effectTime() : uint
      {
         return this.effectTime$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.id$field);
         }
         if(this.hasParam)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.param$field);
         }
         if(this.hasClearTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.clearTime$field);
         }
         if(this.hasEffectTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.effectTime$field);
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
                     throw new IOError("Bad data format: Dto_CardBuffInfo.id cannot be set twice.");
                  }
                  _loc3_++;
                  this.id = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardBuffInfo.param cannot be set twice.");
                  }
                  _loc4_++;
                  this.param = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardBuffInfo.clearTime cannot be set twice.");
                  }
                  _loc5_++;
                  this.clearTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardBuffInfo.effectTime cannot be set twice.");
                  }
                  _loc6_++;
                  this.effectTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc7_);
                  break;
            }
         }
      }
   }
}
