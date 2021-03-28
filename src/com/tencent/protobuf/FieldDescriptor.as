package com.tencent.protobuf
{
   import flash.utils.IDataInput;
   
   public class FieldDescriptor extends BaseFieldDescriptor
   {
       
      
      public function FieldDescriptor()
      {
         super();
      }
      
      public final function read(param1:IDataInput, param2:Message) : void
      {
         param2[name] = readSingleField(param1);
      }
      
      override public final function write(param1:WritingBuffer, param2:Message) : void
      {
         WriteUtils.write$TYPE_UINT32(param1,tag);
         writeSingleField(param1,param2[name]);
      }
   }
}
