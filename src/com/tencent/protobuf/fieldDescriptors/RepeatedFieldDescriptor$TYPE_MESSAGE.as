package com.tencent.protobuf.fieldDescriptors
{
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.RepeatedFieldDescriptor;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import flash.utils.IDataInput;
   
   public final class RepeatedFieldDescriptor$TYPE_MESSAGE extends RepeatedFieldDescriptor
   {
       
      
      public var messageType:Class;
      
      public function RepeatedFieldDescriptor$TYPE_MESSAGE(param1:String, param2:String, param3:uint, param4:Class)
      {
         super();
         this.fullName = param1;
         this._name = param2;
         this.tag = param3;
         this.messageType = param4;
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
         return this.messageType;
      }
      
      override public function readSingleField(param1:IDataInput) : *
      {
         return ReadUtils.read$TYPE_MESSAGE(param1,new this.messageType());
      }
      
      override public function writeSingleField(param1:WritingBuffer, param2:*) : void
      {
         WriteUtils.write$TYPE_MESSAGE(param1,param2);
      }
   }
}
