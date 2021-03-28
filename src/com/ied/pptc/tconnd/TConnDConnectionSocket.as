package com.ied.pptc.tconnd
{
   import flash.events.ErrorEvent;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.Socket;
   import flash.utils.ByteArray;
   import org.as3commons.logging.api.getLogger;
   
   class TConnDConnectionSocket extends TConnDConnection
   {
       
      
      private var _sock:Socket;
      
      private var _onresp:Function;
      
      private var _onerror:Function;
      
      private var receiveBuf:ByteArray;
      
      private var msgBuf:ByteArray;
      
      private var msgLen:uint;
      
      private var reconnetPorts:Array;
      
      function TConnDConnectionSocket(param1:String, param2:uint, param3:Array)
      {
         this.msgBuf = new ByteArray();
         super(param1,param2);
         this.reconnetPorts = param3;
         this._sock = new Socket();
         this._sock.timeout = 3000;
         this.receiveBuf = new ByteArray();
         this._sock.addEventListener(ProgressEvent.SOCKET_DATA,this.on_event_data);
         this._sock.addEventListener(IOErrorEvent.IO_ERROR,this.on_event_error);
         this._sock.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.on_event_error);
         this._sock.addEventListener(Event.CLOSE,this.on_event_close);
      }
      
      private function on_event_data(param1:ProgressEvent) : void
      {
         var _loc3_:uint = 0;
         var _loc4_:ByteArray = null;
         if(this._sock.bytesAvailable <= 0)
         {
            return;
         }
         this._sock.readBytes(this.receiveBuf,this.receiveBuf.length);
         this.receiveBuf.position = 0;
         while(this.receiveBuf.bytesAvailable > 5)
         {
            this.receiveBuf.position += 1;
            this.msgLen = this.receiveBuf.readUnsignedInt();
            if(!(this.receiveBuf.bytesAvailable >= this.msgLen - 5 && this.msgLen > 0))
            {
               this.receiveBuf.position -= 5;
            }
            this.receiveBuf.position -= 5;
            this.msgBuf.length = 0;
            this.receiveBuf.readBytes(this.msgBuf,0,this.msgLen);
            if(null != this._onresp)
            {
               this._onresp(this.msgBuf);
            }
         }
         var _loc2_:int = this.receiveBuf.bytesAvailable;
         if(_loc2_ > 0)
         {
            _loc3_ = this.receiveBuf.position;
            (_loc4_ = new ByteArray()).position = 0;
            _loc4_.writeBytes(this.receiveBuf,_loc3_,_loc2_);
            this.receiveBuf = _loc4_;
         }
         this.receiveBuf.length = _loc2_;
      }
      
      private function on_event_error(param1:ErrorEvent) : void
      {
         if(null != this._onerror)
         {
            if(param1.type == IOErrorEvent.IO_ERROR)
            {
               this._onerror(TConnDError.ERR_IOERROR,"Flash与服务器通信时出现错误! " + param1.text);
            }
            else if(param1.type == SecurityErrorEvent.SECURITY_ERROR)
            {
               this._onerror(TConnDError.ERR_SECURITY,"安全错误：" + param1.text);
               if(this.reconnetPorts.length > 0)
               {
                  _port = this.reconnetPorts.shift();
                  this._sock.connect(_host,_port);
                  getLogger("socket").info("re-conneting  " + _host + ":" + _port);
               }
            }
            else
            {
               this._onerror(TConnDError.ERR_UNKNOWN,"错误：" + param1.text);
            }
         }
      }
      
      private function on_event_close(param1:Event) : void
      {
         if(this.reconnetPorts.length > 0)
         {
            _port = this.reconnetPorts.shift();
            this._sock.connect(_host,_port);
            getLogger("socket").info("re-conneting  " + _host + ":" + _port);
            return;
         }
         if(null != this._onerror)
         {
            this._onerror(TConnDError.ERR_CONNECT_CLOSE,"服务端已关闭连接。");
         }
         this.close_socket();
      }
      
      private function close_socket() : void
      {
         try
         {
            if(this._sock.connected)
            {
               this._sock.close();
            }
         }
         catch(error:Error)
         {
         }
      }
      
      override public function closeConnect() : void
      {
         this.close_socket();
      }
      
      override public function send(param1:ByteArray, param2:Function = null, param3:Function = null, param4:uint = 0) : void
      {
         var thisTimePort:int = 0;
         var onconnect:Function = null;
         var req_buf:ByteArray = param1;
         var on_resp:Function = param2;
         var on_error:Function = param3;
         var timeout:uint = param4;
         var showErr:Function = function(param1:int, param2:String, param3:int):Boolean
         {
            on_error(param1,param2 + "   port:" + param3);
            return true;
         };
         thisTimePort = this._port;
         if(on_error != this._onerror)
         {
            this._onerror = on_error;
         }
         if(on_resp != this._onresp)
         {
            this._onresp = on_resp;
         }
         if(!this._sock.connected)
         {
            onconnect = null;
            onconnect = function(param1:Event):void
            {
               var event:Event = param1;
               _sock.removeEventListener(Event.CONNECT,onconnect);
               try
               {
                  _sock.writeBytes(req_buf);
                  _sock.flush();
               }
               catch(error:Error)
               {
                  if(showErr(TConnDError.ERR_IOERROR,"Flash与服务器通信时出现错误！" + error.message,thisTimePort))
                  {
                     close_socket();
                  }
                  return;
               }
            };
            this._sock.addEventListener(Event.CONNECT,onconnect);
            this._sock.connect(_host,_port);
         }
         else
         {
            try
            {
               this._sock.writeBytes(req_buf);
               this._sock.flush();
            }
            catch(error:Error)
            {
               if(showErr(TConnDError.ERR_IOERROR,"Flash与服务器通信时出现错误！" + error.message,thisTimePort))
               {
                  close_socket();
               }
               return;
            }
         }
      }
   }
}
