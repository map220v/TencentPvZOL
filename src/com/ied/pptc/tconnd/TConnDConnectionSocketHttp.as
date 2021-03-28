package com.ied.pptc.tconnd
{
   import flash.events.ErrorEvent;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.events.TimerEvent;
   import flash.net.Socket;
   import flash.utils.ByteArray;
   import flash.utils.Timer;
   
   public class TConnDConnectionSocketHttp extends TConnDConnection
   {
      
      private static const CRLF:String = "\r\n";
      
      private static const POST_URL:String = "/data/webpkg";
      
      private static const HTTP_HEAD_POST:String = "POST " + POST_URL + " HTTP/1.1";
      
      private static const HTTP_HEAD_TYPE:String = "Content-Type:application/octet-stream";
      
      private static const HTTP_HEAD_LENGTH:String = "Content-Length:";
      
      private static const HTTP_HEAD_HOST:String = "Host:";
      
      private static const CONTENT_LENGTH_PLACEHOLDER:String = "        ";
      
      private static const CONTENT_LENGTH_PLACEHOLDER_LENGTH:uint = CONTENT_LENGTH_PLACEHOLDER.length;
      
      private static var HTTP_HEAD_BA:ByteArray = new ByteArray();
      
      private static var HTTP_HEAD_LENGTH_START:uint = 0;
       
      
      private var _sock:Socket;
      
      private var _onresp:Function;
      
      private var _onerror:Function;
      
      private var receiveBuf:ByteArray;
      
      private var msgBuf:ByteArray;
      
      private var msgLen:uint;
      
      private var connecting:Boolean = false;
      
      private var connectiogBufs:Vector.<ByteArray>;
      
      public function TConnDConnectionSocketHttp(param1:String, param2:uint)
      {
         this.msgBuf = new ByteArray();
         this.connectiogBufs = new Vector.<ByteArray>();
         super(param1,param2);
         this.initHttpHeadBA();
         this._sock = new Socket();
         this.receiveBuf = new ByteArray();
         this._sock.addEventListener(ProgressEvent.SOCKET_DATA,this.on_event_data);
         this._sock.addEventListener(IOErrorEvent.IO_ERROR,this.on_event_error);
         this._sock.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.on_event_error);
         this._sock.addEventListener(Event.CLOSE,this.on_event_close);
      }
      
      private function initHttpHeadBA() : void
      {
         var _loc1_:String = HTTP_HEAD_POST + CRLF + HTTP_HEAD_TYPE + CRLF + HTTP_HEAD_HOST + _host + CRLF + HTTP_HEAD_LENGTH;
         var _loc2_:String = CONTENT_LENGTH_PLACEHOLDER + CRLF + CRLF;
         HTTP_HEAD_BA.writeUTFBytes(_loc1_);
         HTTP_HEAD_LENGTH_START = HTTP_HEAD_BA.length;
         HTTP_HEAD_BA.writeUTFBytes(_loc2_);
      }
      
      private function on_event_data(param1:ProgressEvent) : void
      {
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:String = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:String = null;
         var _loc10_:uint = 0;
         var _loc11_:uint = 0;
         var _loc12_:ByteArray = null;
         if(this._sock.bytesAvailable <= 0)
         {
            return;
         }
         this._sock.readBytes(this.receiveBuf,this.receiveBuf.length);
         this.receiveBuf.position = 0;
         while(this.receiveBuf.bytesAvailable > 34)
         {
            _loc3_ = this.receiveBuf.position;
            _loc4_ = this.receiveBuf.bytesAvailable;
            if((_loc6_ = (_loc5_ = this.receiveBuf.readUTFBytes(this.receiveBuf.bytesAvailable)).indexOf(HTTP_HEAD_LENGTH)) > 0)
            {
               _loc7_ = _loc5_.indexOf(CRLF,_loc6_);
               _loc8_ = _loc5_.indexOf(CRLF + CRLF,_loc6_);
               if(_loc7_ > 0 && _loc8_ > 0)
               {
                  _loc9_ = _loc5_.substring(_loc6_ + HTTP_HEAD_LENGTH.length,_loc7_);
                  if((_loc10_ = uint(_loc9_)) >= 0)
                  {
                     if(_loc4_ < _loc8_ + 4 + _loc10_)
                     {
                        this.receiveBuf.position = _loc3_;
                     }
                     continue;
                     this.receiveBuf.position = _loc3_ + _loc8_ + 4;
                     this.msgBuf.length = 0;
                     this.receiveBuf.readBytes(this.msgBuf,0,_loc10_);
                     if(null != this._onresp)
                     {
                        this._onresp(this.msgBuf);
                     }
                     break;
                  }
                  this.receiveBuf.position = _loc3_;
                  break;
               }
               this.receiveBuf.position = _loc3_;
               break;
            }
            this.receiveBuf.position = _loc3_;
            break;
         }
         var _loc2_:int = this.receiveBuf.bytesAvailable;
         if(_loc2_ > 0)
         {
            _loc11_ = this.receiveBuf.position;
            (_loc12_ = new ByteArray()).position = 0;
            _loc12_.writeBytes(this.receiveBuf,_loc11_,_loc2_);
            this.receiveBuf = _loc12_;
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
            }
            else
            {
               this._onerror(TConnDError.ERR_UNKNOWN,"错误：" + param1.text);
            }
         }
      }
      
      private function on_event_close(param1:Event) : void
      {
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
      
      private function wapperHttpHead(param1:ByteArray) : ByteArray
      {
         var _loc2_:uint = param1.length;
         HTTP_HEAD_BA.position = HTTP_HEAD_LENGTH_START;
         HTTP_HEAD_BA.writeUTFBytes(String(_loc2_ + CONTENT_LENGTH_PLACEHOLDER).substr(0,CONTENT_LENGTH_PLACEHOLDER_LENGTH));
         var _loc3_:ByteArray = new ByteArray();
         _loc3_.writeBytes(HTTP_HEAD_BA);
         _loc3_.writeBytes(param1);
         return _loc3_;
      }
      
      override public function send(param1:ByteArray, param2:Function = null, param3:Function = null, param4:uint = 0) : void
      {
         var timer:Timer = null;
         var reset:Function = null;
         var ontimer:Function = null;
         var onconnect:Function = null;
         var req_buf:ByteArray = param1;
         var on_resp:Function = param2;
         var on_error:Function = param3;
         var timeout:uint = param4;
         req_buf = this.wapperHttpHead(req_buf);
         if(on_error != this._onerror)
         {
            this._onerror = on_error;
         }
         if(on_resp != this._onresp)
         {
            this._onresp = on_resp;
         }
         if(this._sock.connected)
         {
            this.writeBytesAndFlush(req_buf);
         }
         else if(this.connecting)
         {
            this.connectiogBufs.push(req_buf);
         }
         else
         {
            this.connecting = true;
            this.connectiogBufs.push(req_buf);
            if(timeout == 0)
            {
               timeout = _delay;
            }
            timer = new Timer(timeout,1);
            reset = function():void
            {
               timer.stop();
               _sock.removeEventListener(TimerEvent.TIMER,ontimer);
               _sock.removeEventListener(Event.CONNECT,onconnect);
            };
            ontimer = function():void
            {
               reset();
               if(null != _onerror)
               {
                  _onerror(TConnDError.ERR_TIMEOUT,"服务器无响应，连接超时!");
               }
            };
            onconnect = function(param1:Event):void
            {
               reset();
               while(connectiogBufs.length > 0)
               {
                  writeBytesAndFlush(connectiogBufs.pop());
               }
            };
            this._sock.addEventListener(Event.CONNECT,onconnect);
            timer.addEventListener(TimerEvent.TIMER,ontimer);
            timer.start();
            try
            {
               this._sock.connect(_host,_port);
            }
            catch(error:SecurityError)
            {
               if(null != on_error)
               {
                  on_error(TConnDError.ERR_SECURITY,"安全错误：" + error.message);
               }
               reset();
               close_socket();
               return;
            }
            catch(error:Error)
            {
               if(null != on_error)
               {
                  on_error(TConnDError.ERR_CONNECT_FAIL,"连接服务器时出错！" + error.message);
               }
               reset();
               close_socket();
               return;
            }
         }
      }
      
      private function writeBytesAndFlush(param1:ByteArray) : void
      {
         var buf:ByteArray = param1;
         try
         {
            this._sock.writeBytes(buf);
            this._sock.flush();
         }
         catch(error:Error)
         {
            if(null != _onerror)
            {
               _onerror(TConnDError.ERR_IOERROR,"Flash与服务器通信时出现错误！" + error.message);
            }
            close_socket();
            return;
         }
      }
   }
}
