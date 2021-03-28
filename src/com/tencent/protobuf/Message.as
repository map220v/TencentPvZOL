package com.tencent.protobuf
{
   import flash.errors.IOError;
   import flash.errors.IllegalOperationError;
   import flash.utils.Endian;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   public class Message
   {
       
      
      public var dynamicProp:Object;
      
      public function Message()
      {
         super();
      }
      
      public static function getExtensionByName(param1:String) : IFieldDescriptor
      {
         return BaseFieldDescriptor.getExtensionByName(param1);
      }
      
      public function get $messageID() : String
      {
         return "";
      }
      
      public final function mergeFrom(param1:IDataInput) : void
      {
         param1.endian = Endian.LITTLE_ENDIAN;
         this.readFromSlice(param1,0);
      }
      
      public final function mergeDelimitedFrom(param1:IDataInput) : void
      {
         param1.endian = Endian.LITTLE_ENDIAN;
         ReadUtils.read$TYPE_MESSAGE(param1,this);
      }
      
      public final function writeTo(param1:IDataOutput) : void
      {
         var _loc2_:WritingBuffer = new WritingBuffer();
         this.writeToBuffer(_loc2_);
         _loc2_.toNormal(param1);
      }
      
      public final function writeDelimitedTo(param1:IDataOutput) : void
      {
         var _loc2_:WritingBuffer = new WritingBuffer();
         WriteUtils.write$TYPE_MESSAGE(_loc2_,this);
         _loc2_.toNormal(param1);
      }
      
      public function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         throw new IllegalOperationError("Not implemented!");
      }
      
      public function writeToBuffer(param1:WritingBuffer) : void
      {
         throw new IllegalOperationError("Not implemented!");
      }
      
      private function writeSingleUnknown(param1:WritingBuffer, param2:uint, param3:*) : void
      {
         WriteUtils.write$TYPE_UINT32(param1,param2);
         switch(param2 & 7)
         {
            case WireType.VARINT:
               WriteUtils.write$TYPE_UINT64(param1,param3);
               break;
            case WireType.FIXED_64_BIT:
               WriteUtils.write$TYPE_FIXED64(param1,param3);
               break;
            case WireType.LENGTH_DELIMITED:
               WriteUtils.write$TYPE_BYTES(param1,param3);
               break;
            case WireType.FIXED_32_BIT:
               WriteUtils.write$TYPE_FIXED32(param1,param3);
               break;
            default:
               throw new IOError("Invalid wire type: " + (param2 & 7));
         }
      }
      
      protected final function writeUnknown(param1:WritingBuffer, param2:String) : void
      {
         var _loc3_:uint = uint(param2);
         if(_loc3_ == 0)
         {
            throw new ArgumentError("Attemp to write an undefined string filed: " + param2);
         }
         WriteUtils.writeUnknownPair(param1,_loc3_,this[param2]);
      }
      
      protected final function writeExtensionOrUnknown(param1:WritingBuffer, param2:String) : void
      {
         var fieldDescriptor:BaseFieldDescriptor = null;
         var output:WritingBuffer = param1;
         var fieldName:String = param2;
         try
         {
            fieldDescriptor = BaseFieldDescriptor.getExtensionByName(fieldName);
         }
         catch(e:ReferenceError)
         {
            writeUnknown(output,fieldName);
            return;
         }
         fieldDescriptor.write(output,this);
      }
      
      protected final function readUnknown(param1:IDataInput, param2:uint) : void
      {
         var _loc3_:* = undefined;
         switch(param2 & 7)
         {
            case WireType.VARINT:
               _loc3_ = ReadUtils.read$TYPE_UINT64(param1);
               break;
            case WireType.FIXED_64_BIT:
               _loc3_ = ReadUtils.read$TYPE_FIXED64(param1);
               break;
            case WireType.LENGTH_DELIMITED:
               _loc3_ = ReadUtils.read$TYPE_BYTES(param1);
               break;
            case WireType.FIXED_32_BIT:
               _loc3_ = ReadUtils.read$TYPE_FIXED32(param1);
               break;
            default:
               throw new IOError("Invalid wire type: " + (param2 & 7));
         }
         if(!this.dynamicProp)
         {
            this.dynamicProp = new Object();
         }
         var _loc4_:*;
         if(!(_loc4_ = this.dynamicProp[param2]))
         {
            this.dynamicProp[param2] = _loc3_;
         }
         else if(_loc4_ is Array)
         {
            _loc4_.push(_loc3_);
         }
         else
         {
            this.dynamicProp[param2] = [_loc4_,_loc3_];
         }
      }
      
      protected final function readExtensionOrUnknown(param1:Array, param2:IDataInput, param3:uint) : void
      {
         var _loc4_:Function;
         if((_loc4_ = param1[param3]) != null)
         {
            _loc4_(param2,this);
         }
         else
         {
            this.readUnknown(param2,param3);
         }
      }
      
      public function toString() : String
      {
         return TextFormat.printToString(this);
      }
   }
}
