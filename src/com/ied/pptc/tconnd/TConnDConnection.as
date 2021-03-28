package com.ied.pptc.tconnd
{
   import flash.utils.ByteArray;
   
   class TConnDConnection implements TConnDInterface
   {
       
      
      protected var _host:String;
      
      protected var _port:uint;
      
      protected var _delay:uint = 1000;
      
      protected var _closemode:int;
      
      function TConnDConnection(param1:String, param2:uint)
      {
         this._closemode = TConnDClient.CONNECTION_CLOSE_AUTO;
         super();
         this._host = param1;
         if(param2 > 65535)
         {
            throw new Error("port > 0xFFFF!");
         }
         this._port = param2;
      }
      
      public function setTimeout(param1:uint) : void
      {
         if(0 == param1)
         {
            throw new Error("默认超时值不可设为0！");
         }
         this._delay = param1;
      }
      
      public function setCloseMode(param1:uint) : void
      {
         if(TConnDClient.CONNECTION_CLOSE_AUTO != param1 && TConnDClient.CONNECTION_CLOSE_AFTER_RESP != param1)
         {
            throw new Error("错误的closemode参数！");
         }
         this._closemode = param1;
      }
      
      public function send(param1:ByteArray, param2:Function = null, param3:Function = null, param4:uint = 0) : void
      {
         throw new Error("TConnDConnection不提供send方法的实现！");
      }
      
      public function closeConnect() : void
      {
         throw new Error("TConnDConnection不提供send方法的实现！");
      }
   }
}
