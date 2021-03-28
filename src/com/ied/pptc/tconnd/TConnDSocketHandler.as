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
   import flash.utils.getTimer;
   
   class TConnDSocketHandler
   {
      
      private static const DEFAULT_IDLE_SECONDS:uint = 500 * 1000;
       
      
      private var _host:String;
      
      private var _port:uint;
      
      private var _using:Boolean;
      
      private var _sock:Socket;
      
      private var _resp:ByteArray;
      
      private var _lastSendTime:int;
      
      function TConnDSocketHandler(param1:String, param2:uint)
      {
         super();
         this._host = param1;
         this._port = param2;
         this._using = false;
         this._sock = new Socket();
         this._resp = new ByteArray();
         this._lastSendTime = getTimer();
      }
      
      public function isUsing() : Boolean
      {
         return this._using;
      }
      
      public function checkClose() : void
      {
         if(this._using)
         {
            return;
         }
         if(!this._sock.connected)
         {
            return;
         }
         var _loc1_:int = getTimer() - this._lastSendTime;
         if(_loc1_ >= DEFAULT_IDLE_SECONDS)
         {
            this._sock.close();
         }
      }
      
      public function send(param1:ByteArray, param2:Function, param3:Function, param4:uint, param5:uint) : void
      {
         var onconnect:Function = null;
         var onprogress:Function = null;
         var onerror:Function = null;
         var onclose:Function = null;
         var ontimer:Function = null;
         var timer:Timer = null;
         var req_buf:ByteArray = param1;
         var on_resp:Function = param2;
         var on_error:Function = param3;
         var timeout:uint = param4;
         var closemode:uint = param5;
         this._using = true;
         this._resp.clear();
         timer = new Timer(timeout,1);
         var recycle:Function = function(param1:Boolean):void
         {
            var needclose:Boolean = param1;
            _sock.removeEventListener(Event.CONNECT,onconnect);
            _sock.removeEventListener(ProgressEvent.SOCKET_DATA,onprogress);
            _sock.removeEventListener(IOErrorEvent.IO_ERROR,onerror);
            _sock.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,onerror);
            _sock.removeEventListener(Event.CLOSE,onclose);
            timer.removeEventListener(TimerEvent.TIMER,ontimer);
            timer.stop();
            _using = false;
            if(TConnDClient.CONNECTION_CLOSE_AFTER_RESP == closemode || needclose)
            {
               try
               {
                  _sock.close();
               }
               catch(error:Error)
               {
               }
            }
         };
         ontimer = function():void
         {
            if(null != on_error)
            {
               on_error(TConnDError.ERR_TIMEOUT,"服务器无响应，请求超时!");
            }
            recycle(true);
         };
         onprogress = function(param1:ProgressEvent):void
         {
            var _loc2_:uint = 0;
            _sock.readBytes(_resp);
            if(_resp.length > 5)
            {
               _resp.position = 1;
               _loc2_ = _resp.readUnsignedInt();
               _resp.position = 0;
               if(_resp.length >= _loc2_)
               {
                  if(null != on_resp)
                  {
                     on_resp(_resp);
                  }
                  recycle(false);
               }
            }
         };
         onerror = function(param1:ErrorEvent):void
         {
            if(null != on_error)
            {
               if(param1.type == IOErrorEvent.IO_ERROR)
               {
                  on_error(TConnDError.ERR_IOERROR,"Flash与服务器通信时出现错误! " + param1.text);
               }
               else if(param1.type == SecurityErrorEvent.SECURITY_ERROR)
               {
                  on_error(TConnDError.ERR_SECURITY,"安全错误：" + param1.text);
               }
               else
               {
                  on_error(TConnDError.ERR_UNKNOWN,"错误：" + param1.text);
               }
            }
            recycle(true);
         };
         onclose = function(param1:Event):void
         {
            if(null != on_error)
            {
               on_error(TConnDError.ERR_CONNECT_CLOSE,"服务端已关闭连接。");
            }
            recycle(true);
         };
         onconnect = function(param1:Event):void
         {
            var event:Event = param1;
            try
            {
               _sock.writeBytes(req_buf);
               _sock.flush();
               _lastSendTime = getTimer();
            }
            catch(error:Error)
            {
               if(null != on_error)
               {
                  on_error(TConnDError.ERR_IOERROR,"Flash与服务器通信时出现错误！" + error.message);
               }
               recycle(true);
               return;
            }
         };
         this._sock.addEventListener(Event.CONNECT,onconnect);
         this._sock.addEventListener(ProgressEvent.SOCKET_DATA,onprogress);
         this._sock.addEventListener(IOErrorEvent.IO_ERROR,onerror);
         this._sock.addEventListener(SecurityErrorEvent.SECURITY_ERROR,onerror);
         this._sock.addEventListener(Event.CLOSE,onclose);
         timer.addEventListener(TimerEvent.TIMER,ontimer);
         timer.start();
         if(!this._sock.connected)
         {
            try
            {
               this._sock.connect(this._host,this._port);
            }
            catch(error:SecurityError)
            {
               if(null != on_error)
               {
                  on_error(TConnDError.ERR_SECURITY,"安全错误：" + error.message);
               }
               recycle(true);
               return;
            }
            catch(error:Error)
            {
               if(null != on_error)
               {
                  on_error(TConnDError.ERR_CONNECT_FAIL,"连接服务器时出错！" + error.message);
               }
               recycle(true);
               return;
            }
         }
         else
         {
            onconnect(null);
         }
      }
   }
}
