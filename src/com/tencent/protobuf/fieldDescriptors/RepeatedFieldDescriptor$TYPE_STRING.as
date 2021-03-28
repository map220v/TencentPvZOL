package com.tencent.protobuf.fieldDescriptors
{
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.RepeatedFieldDescriptor;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import flash.utils.IDataInput;
   
   public final class RepeatedFieldDescriptor$TYPE_STRING extends RepeatedFieldDescriptor
   {
       
      
      public function RepeatedFieldDescriptor$TYPE_STRING(param1:String, param2:String, param3:uint)
      {
         super();
         this.fullName = param1;
         this._name = param2;
         this.tag = param3;
      }
      
      override public function get nonPackedWireType() : int
      {
         return WireType.LENGTH_DELIMITED;
      }
      
      override public function get type() : Class
      {
         return Array;
      }
      
      override public function get elementType() : Class
      {
         return String;
      }
      
      override public function readSingleField(param1:IDataInput) : *
      {
         return ReadUtils.read$TYPE_STRING(param1);
      }
      
      override public function writeSingleField(param1:WritingBuffer, param2:*) : void
      {
         WriteUtils.write$TYPE_STRING(param1,param2);
      }
   }
}
