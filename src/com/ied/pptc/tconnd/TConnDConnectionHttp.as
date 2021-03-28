package com.ied.pptc.tconnd
{
   import flash.events.Event;
   import flash.events.HTTPStatusEvent;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.events.TimerEvent;
   import flash.net.URLLoader;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   import flash.net.URLRequestHeader;
   import flash.net.URLRequestMethod;
   import flash.utils.ByteArray;
   import flash.utils.Timer;
   
   class TConnDConnectionHttp extends TConnDConnection
   {
       
      
      function TConnDConnectionHttp(param1:String, param2:uint)
      {
         super(param1,param2);
      }
      
      override public function send(param1:ByteArray, param2:Function = null, param3:Function = null, param4:uint = 0) : void
      {
         var loader:URLLoader = null;
         var timer:Timer = null;
         var req_buf:ByteArray = param1;
         var on_resp:Function = param2;
         var on_error:Function = param3;
         var timeout:uint = param4;
         var url:String = "http://" + _host;
         if(80 != _port)
         {
            url += ":" + _port;
         }
         url += "/data/webpkg";
         var request:URLRequest = new URLRequest(url);
         request.method = URLRequestMethod.POST;
         request.contentType = "application/octet-stream";
         request.data = req_buf;
         if(_closemode == TConnDClient.CONNECTION_CLOSE_AFTER_RESP)
         {
            request.requestHeaders = new Array(new URLRequestHeader("XConnection","Close"));
         }
         loader = new URLLoader();
         loader.dataFormat = URLLoaderDataFormat.BINARY;
         if(timeout == 0)
         {
            timeout = _delay;
         }
         timer = new Timer(timeout,1);
         timer.addEventListener(TimerEvent.TIMER,function():void
         {
            if(null != on_error)
            {
               on_error(TConnDError.ERR_TIMEOUT,"服务器无响应，请求超时!");
            }
            loader.close();
         });
         loader.addEventListener(Event.COMPLETE,function():void
         {
            timer.stop();
            if(null != on_resp)
            {
               on_resp(loader.data);
            }
            loader.close();
         });
         loader.addEventListener(IOErrorEvent.IO_ERROR,function(param1:IOErrorEvent):void
         {
            timer.stop();
            if(null != on_error)
            {
               on_error(TConnDError.ERR_IOERROR,"Flash与服务器通信时出现错误! " + param1.text);
            }
            loader.close();
         });
         loader.addEventListener(HTTPStatusEvent.HTTP_STATUS,function(param1:HTTPStatusEvent):void
         {
            if(0 == param1.status)
            {
               timer.stop();
               if(null != on_error)
               {
                  on_error(TConnDError.ERR_CONNECT_FAIL,"Flash无法从服务器获取状态代码或无法与服务器进行通信!");
               }
               loader.close();
            }
            else if(200 != param1.status)
            {
               timer.stop();
               if(null != on_error)
               {
                  on_error(TConnDError.ERR_INVALIED_STATUS,"错误的HTTP状态码:" + param1.status + "！");
               }
               loader.close();
            }
         });
         loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,function(param1:SecurityErrorEvent):void
         {
            timer.stop();
            if(null != on_error)
            {
               on_error(TConnDError.ERR_SECURITY,"安全错误：" + param1.text);
            }
            loader.close();
         });
         timer.start();
         try
         {
            loader.load(request);
         }
         catch(error:Error)
         {
            timer.stop();
            if(null != on_error)
            {
               on_error(TConnDError.ERR_LOAD_REQ,"请求加载失败：" + error.message);
            }
            try
            {
               loader.close();
            }
            catch(err:Error)
            {
            }
         }
      }
   }
}
