package com.tencent.protobuf.fieldDescriptors
{
   import com.tencent.protobuf.FieldDescriptor;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import flash.utils.IDataInput;
   
   public final class FieldDescriptor$TYPE_INT32 extends FieldDescriptor
   {
       
      
      public function FieldDescriptor$TYPE_INT32(param1:String, param2:String, param3:uint)
      {
         super();
         this.fullName = param1;
         this._name = param2;
         this.tag = param3;
      }
      
      override public function get type() : Class
      {
         return int;
      }
      
      override public function readSingleField(param1:IDataInput) : *
      {
         return ReadUtils.read$TYPE_INT32(param1);
      }
      
      override public function writeSingleField(param1:WritingBuffer, param2:*) : void
      {
         WriteUtils.write$TYPE_INT32(param1,param2);
      }
   }
}
