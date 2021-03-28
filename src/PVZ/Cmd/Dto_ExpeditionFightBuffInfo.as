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
   
   public final class Dto_ExpeditionFightBuffInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_ExpeditionFightBuffInfo";
      
      public static const ID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ExpeditionFightBuffInfo.id","id",1 << 3 | WireType.VARINT);
      
      public static const TYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ExpeditionFightBuffInfo.type","type",2 << 3 | WireType.VARINT);
      
      public static const VALUE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ExpeditionFightBuffInfo.value","value",3 << 3 | WireType.VARINT);
      
      public static const ENDTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ExpeditionFightBuffInfo.endTime","endTime",4 << 3 | WireType.VARINT);
       
      
      private var id$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var type$field:uint;
      
      private var value$field:uint;
      
      private var endTime$field:uint;
      
      public function Dto_ExpeditionFightBuffInfo()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_ExpeditionFightBuffInfo.$MessageID;
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
      
      public function clearType() : void
      {
         this.hasField$0 &= 4294967293;
         this.type$field = new uint();
      }
      
      public function get hasType() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set type(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.type$field = param1;
      }
      
      public function get type() : uint
      {
         return this.type$field;
      }
      
      public function clearValue() : void
      {
         this.hasField$0 &= 4294967291;
         this.value$field = new uint();
      }
      
      public function get hasValue() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set value(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.value$field = param1;
      }
      
      public function get value() : uint
      {
         return this.value$field;
      }
      
      public function clearEndTime() : void
      {
         this.hasField$0 &= 4294967287;
         this.endTime$field = new uint();
      }
      
      public function get hasEndTime() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set endTime(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.endTime$field = param1;
      }
      
      public function get endTime() : uint
      {
         return this.endTime$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.id$field);
         }
         if(this.hasType)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.type$field);
         }
         if(this.hasValue)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.value$field);
         }
         if(this.hasEndTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.endTime$field);
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
                     throw new IOError("Bad data format: Dto_ExpeditionFightBuffInfo.id cannot be set twice.");
                  }
                  _loc3_++;
                  this.id = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ExpeditionFightBuffInfo.type cannot be set twice.");
                  }
                  _loc4_++;
                  this.type = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ExpeditionFightBuffInfo.value cannot be set twice.");
                  }
                  _loc5_++;
                  this.value = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ExpeditionFightBuffInfo.endTime cannot be set twice.");
                  }
                  _loc6_++;
                  this.endTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc7_);
                  break;
            }
         }
      }
   }
}
