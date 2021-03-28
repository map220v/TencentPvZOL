package com.qq.net
{
   import tencent.io.service.interfaces.IProtocol;
   
   public class PvzProtocol implements IProtocol
   {
       
      
      private var _protoData;
      
      private var _protoId:int;
      
      public function PvzProtocol()
      {
         super();
      }
      
      public function get protoData() : *
      {
         return this._protoData;
      }
      
      public function set protoData(param1:*) : void
      {
         this._protoData = param1;
      }
      
      public function get protoId() : int
      {
         return this._protoId;
      }
      
      public function set protoId(param1:int) : void
      {
         this._protoId = param1;
      }
   }
}
