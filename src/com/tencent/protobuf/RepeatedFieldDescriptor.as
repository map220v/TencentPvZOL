package com.tencent.protobuf
{
   import flash.errors.IOError;
   import flash.errors.IllegalOperationError;
   import flash.utils.IDataInput;
   
   public class RepeatedFieldDescriptor extends BaseFieldDescriptor
   {
       
      
      public function RepeatedFieldDescriptor()
      {
         super();
      }
      
      public function get elementType() : Class
      {
         throw new IllegalOperationError("Not Implemented!");
      }
      
      public final function readNonPacked(param1:IDataInput, param2:Message) : void
      {
         var _loc3_:Array = param2[name] || (param2[name] = []);
         _loc3_.push(readSingleField(param1));
      }
      
      public final function readPacked(param1:IDataInput, param2:Message) : void
      {
         var _loc3_:Array = param2[name] || (param2[name] = []);
         var _loc4_:uint = ReadUtils.read$TYPE_UINT32(param1);
         if(param1.bytesAvailable < _loc4_)
         {
            throw new IOError("Invalid message length: " + _loc4_);
         }
         var _loc5_:uint = param1.bytesAvailable - _loc4_;
         while(param1.bytesAvailable > _loc5_)
         {
            _loc3_.push(readSingleField(param1));
         }
         if(param1.bytesAvailable != _loc5_)
         {
            throw new IOError("Invalid packed destination data");
         }
      }
      
      public function get nonPackedWireType() : int
      {
         throw new IllegalOperationError("Not Implemented!");
      }
      
      override public final function write(param1:WritingBuffer, param2:Message) : void
      {
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc3_:Array = param2[name];
         if((tag & 7) == this.nonPackedWireType)
         {
            _loc4_ = 0;
            while(_loc4_ < _loc3_.length)
            {
               WriteUtils.write$TYPE_UINT32(param1,tag);
               writeSingleField(param1,_loc3_[_loc4_]);
               _loc4_++;
            }
         }
         else
         {
            WriteUtils.write$TYPE_UINT32(param1,tag);
            _loc5_ = param1.beginBlock();
            _loc6_ = 0;
            while(_loc6_ < _loc3_.length)
            {
               writeSingleField(param1,_loc3_[_loc6_]);
               _loc6_++;
            }
            param1.endBlock(_loc5_);
         }
      }
   }
}
