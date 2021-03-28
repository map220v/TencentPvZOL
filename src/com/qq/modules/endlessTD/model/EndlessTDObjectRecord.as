package com.qq.modules.endlessTD.model
{
   import flash.utils.ByteArray;
   
   public class EndlessTDObjectRecord
   {
       
      
      protected var m_vecValue:Vector.<uint>;
      
      public function EndlessTDObjectRecord()
      {
         super();
         this.m_vecValue = new Vector.<uint>(this.tagBounds);
      }
      
      protected final function setValue(param1:uint, param2:uint) : void
      {
         this.m_vecValue[param1] = param2;
      }
      
      protected final function getValue(param1:uint) : uint
      {
         return this.m_vecValue[param1];
      }
      
      protected function get tagBounds() : uint
      {
         return 0;
      }
      
      public function readFromBytes(param1:ByteArray) : void
      {
         var _loc2_:uint = param1.readByte();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this.setValue(_loc3_,param1.readUnsignedInt());
            _loc3_++;
         }
      }
      
      public function writeToBytes(param1:ByteArray) : void
      {
         var _loc2_:int = this.m_vecValue.length;
         param1.writeByte(_loc2_);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            param1.writeUnsignedInt(this.getValue(_loc3_));
            _loc3_++;
         }
      }
   }
}
