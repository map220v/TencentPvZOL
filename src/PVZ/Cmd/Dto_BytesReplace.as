package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BYTES;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import flash.errors.IOError;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   
   public final class Dto_BytesReplace extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_BytesReplace";
      
      public static const NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_BytesReplace.name","name",1 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const TYPE:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_BytesReplace.type","type",2 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const VALUE:FieldDescriptor$TYPE_BYTES = new FieldDescriptor$TYPE_BYTES("PVZ.Cmd.Dto_BytesReplace.value","value",3 << 3 | WireType.LENGTH_DELIMITED);
       
      
      private var name$field:String;
      
      private var type$field:String;
      
      private var value$field:ByteArray;
      
      public function Dto_BytesReplace()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_BytesReplace.$MessageID;
      }
      
      public function clearName() : void
      {
         this.name$field = null;
      }
      
      public function get hasName() : Boolean
      {
         return this.name$field != null;
      }
      
      public function set name(param1:String) : void
      {
         this.name$field = param1;
      }
      
      public function get name() : String
      {
         return this.name$field;
      }
      
      public function clearType() : void
      {
         this.type$field = null;
      }
      
      public function get hasType() : Boolean
      {
         return this.type$field != null;
      }
      
      public function set type(param1:String) : void
      {
         this.type$field = param1;
      }
      
      public function get type() : String
      {
         return this.type$field;
      }
      
      public function clearValue() : void
      {
         this.value$field = null;
      }
      
      public function get hasValue() : Boolean
      {
         return this.value$field != null;
      }
      
      public function set value(param1:ByteArray) : void
      {
         this.value$field = param1;
      }
      
      public function get value() : ByteArray
      {
         return this.value$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasName)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_STRING(param1,this.name$field);
         }
         if(this.hasType)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_STRING(param1,this.type$field);
         }
         if(this.hasValue)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_BYTES(param1,this.value$field);
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
                     throw new IOError("Bad data format: Dto_BytesReplace.name cannot be set twice.");
                  }
                  _loc3_++;
                  this.name = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_BytesReplace.type cannot be set twice.");
                  }
                  _loc4_++;
                  this.type = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_BytesReplace.value cannot be set twice.");
                  }
                  _loc5_++;
                  this.value = ReadUtils.read$TYPE_BYTES(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
