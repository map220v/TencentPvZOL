package com.ied.pptc.tconnd
{
   import flash.utils.ByteArray;
   
   public class TConnDClient
   {
      
      public static const PROTOCOL_MODE_HTTP:int = 0;
      
      public static const PROTOCOL_MODE_SOCKET:int = 1;
      
      public static const PROTOCOL_MODE_SOCKETPOOL:int = 2;
      
      public static const PROTOCOL_MODE_SOCKETHTTP:int = 3;
      
      public static const CONNECTION_CLOSE_AUTO:int = 1;
      
      public static const CONNECTION_CLOSE_AFTER_RESP:int = 0;
       
      
      private var _connection:TConnDConnection;
      
      public function TConnDClient(param1:String, param2:uint, param3:int, param4:Array)
      {
         super();
         if(PROTOCOL_MODE_HTTP == param3)
         {
            this._connection = new TConnDConnectionHttp(param1,param2);
         }
         else if(PROTOCOL_MODE_SOCKET == param3)
         {
            this._connection = new TConnDConnectionSocket(param1,param2,param4);
         }
         else if(PROTOCOL_MODE_SOCKETPOOL == param3)
         {
            this._connection = new TConnDConnectionSocketPool(param1,param2);
         }
         else
         {
            if(PROTOCOL_MODE_SOCKETHTTP != param3)
            {
               throw new Error("错误的protocol_mode参数");
            }
            this._connection = new TConnDConnectionSocketHttp(param1,param2);
         }
      }
      
      public function send(param1:ByteArray, param2:Function = null, param3:Function = null, param4:uint = 0) : void
      {
         this._connection.send(param1,param2,param3,param4);
      }
      
      public function setTimeout(param1:uint) : void
      {
         this._connection.setTimeout(param1);
      }
      
      public function setCloseMode(param1:uint) : void
      {
         this._connection.setCloseMode(param1);
      }
      
      public function closeConnect() : void
      {
         this._connection.closeConnect();
      }
   }
}
