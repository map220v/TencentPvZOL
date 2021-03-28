package com.qq.utils.conn
{
   import asgui.controls.Alert;
   import asgui.managers.ConfigManager;
   import com.qq.display.QAlert;
   import com.qq.modules.chat.command.ChatProxyCmd;
   import com.qq.modules.login.command.LoginServerCmd;
   import com.qq.templates.font.FontNormal;
   import com.qq.utils.UtilsManager;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.utils.ByteArray;
   import flash.utils.Endian;
   import flash.utils.clearTimeout;
   import flash.utils.getTimer;
   import flash.utils.setTimeout;
   import org.as3commons.logging.api.getLogger;
   
   public class QClientSocket
   {
      
      private static const MAX_RECONNECT_COUNT:int = 9;
       
      
      private var socket:QSocket;
      
      private var host:String;
      
      private var port:int;
      
      private var onReceived:Function;
      
      private var onError:Function;
      
      private var timeoutNum:int;
      
      private var reconnetPorts:Array;
      
      private var receiveBuf:ByteArray;
      
      private var msgBuf:ByteArray;
      
      private var msgLen:uint;
      
      private var needReconnect:Boolean = true;
      
      private var reconnectCount:int = 0;
      
      private var reconnectWaitTime:int = 3;
      
      private var msgArray:Array;
      
      private var _checkInitCSFuncId:uint;
      
      private var _delayMsgFuncId:uint;
      
      private var _reconnectFuncId:int;
      
      private var _isReconnectFailed:Boolean = false;
      
      private var _lastReconnetTime:Number = -1;
      
      private var hasFirstReceived:Boolean;
      
      public function QClientSocket(param1:String, param2:int, param3:Function, param4:Function, param5:int, param6:Array)
      {
         this.receiveBuf = new ByteArray();
         this.msgBuf = new ByteArray();
         this.msgArray = [];
         super();
         this.reconnetPorts = param6;
         this.timeoutNum = param5;
         this.onError = param4;
         this.onReceived = param3;
         this.port = param2;
         this.host = param1;
         this.socket = new QSocket();
      }
      
      public function connect() : void
      {
         if(!this.needReconnect)
         {
            return;
         }
         getLogger("conn").info("conneting  " + this.host + ":" + this.port);
         this.socket.addEventListener(Event.CONNECT,this.connetHandler);
         this.socket.addEventListener(IOErrorEvent.IO_ERROR,this.errorHandler);
         this.socket.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.errorHandler);
         this.socket.connect(this.host,this.port);
         this.socket.timeout = this.timeoutNum;
         this.msgArray = new Array();
      }
      
      protected function connetHandler(param1:Event) : void
      {
         getLogger("conn").info("连接成功。  " + this.host + ":" + this.port);
         this.socket.removeEventListener(Event.CONNECT,this.connetHandler);
         this.socket.removeEventListener(IOErrorEvent.IO_ERROR,this.errorHandler);
         this.socket.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,this.errorHandler);
         this.socket.addEventListener(Event.CLOSE,this.closeHandler);
         this.socket.addEventListener(ProgressEvent.SOCKET_DATA,this.dataReceivedHandler);
         this.reconnectClean();
         if(this.hasFirstReceived)
         {
            this.sendTGWHttpHead();
            this.reconnectCount = 0;
         }
         else
         {
            this.sendTGWHttpHead();
            this._delayMsgFuncId = setTimeout(LoginServerCmd.sendFirstMessage,1000);
            this._checkInitCSFuncId = setTimeout(this.checkInitCS,this.timeoutNum > 10000 ? Number(this.timeoutNum) : Number(10000));
         }
         while(this.msgArray.length)
         {
            this.send(this.msgArray.shift());
         }
      }
      
      protected function errorHandler(param1:Event) : void
      {
         if(param1.type == IOErrorEvent.IO_ERROR)
         {
            getLogger("conn").info("IO错误。");
         }
         else if(param1.type == SecurityErrorEvent.SECURITY_ERROR)
         {
            getLogger("conn").info("安全错误。");
         }
         this.tryReconnet();
      }
      
      public function tryReconnet() : Boolean
      {
         var homesiteUrl:String = null;
         var now:Number = Number(getTimer() * 0.001);
         if(now - this._lastReconnetTime < this.reconnectWaitTime)
         {
            return false;
         }
         if(this.reconnectCount < MAX_RECONNECT_COUNT && this.reconnetPorts.length > 0)
         {
            this.clearAllDelayFunc();
            this.socket.timeout = int.MAX_VALUE;
            this.port = this.reconnetPorts[this.reconnectCount % this.reconnetPorts.length];
            getLogger("conn").info(this.reconnectWaitTime + "秒后尝试重连。目前尝试次数：" + (this.reconnectCount + 1) + "   IP:" + this.host + "  Port:" + this.port);
            this._reconnectFuncId = setTimeout(this.connect,this.reconnectWaitTime * 1000);
            ++this.reconnectCount;
            this._lastReconnetTime = now;
            return true;
         }
         if(!this._isReconnectFailed)
         {
            this._isReconnectFailed = true;
            getLogger("conn").info("重连次数到达上限，不再re-connet");
            ChatProxyCmd.outputErrorText("网络连接不稳定，请检查你的网络状况");
            homesiteUrl = ConfigManager.GetConfig("homesite");
            QAlert.Show(FontNormal.Main_Reconnect_Error,"",Alert.OK,null,function():void
            {
               UtilsManager.gotoUrl(homesiteUrl,"_self");
            });
            return false;
         }
         return false;
      }
      
      private function checkInitCS() : void
      {
         if(!this.hasFirstReceived)
         {
            getLogger("conn").info("超时而没收到InitCS，尝试重连");
            ChatProxyCmd.outputErrorText("网络数据延迟较大，请检查你的网络状况");
            if(this.socket.connected)
            {
               this.socket.close();
            }
            this.tryReconnet();
         }
      }
      
      protected function dataReceivedHandler(param1:ProgressEvent) : void
      {
         var _loc3_:uint = 0;
         var _loc4_:ByteArray = null;
         if(this.socket.bytesAvailable <= 0)
         {
            return;
         }
         if(!this.hasFirstReceived)
         {
            getLogger("conn").info("第一次收到服务器返回。长度： " + this.socket.bytesAvailable);
            this.hasFirstReceived = true;
            this.reset();
         }
         this.socket.readBytes(this.receiveBuf,this.receiveBuf.length);
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
            if(null != this.onReceived)
            {
               this.onReceived(this.msgBuf);
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
      
      private function reset() : void
      {
         this.reconnectCount = 0;
         this.reconnectWaitTime = 3;
         this._isReconnectFailed = false;
         this.reconnectClean();
      }
      
      private function reconnectClean() : void
      {
         this.clearAllDelayFunc();
      }
      
      private function clearAllDelayFunc() : void
      {
         clearTimeout(this._delayMsgFuncId);
         clearTimeout(this._checkInitCSFuncId);
         clearTimeout(this._reconnectFuncId);
      }
      
      protected function closeHandler(param1:Event) : void
      {
         getLogger("conn").info("服务端已关闭连接。");
         this.tryReconnet();
      }
      
      public function close() : void
      {
         this.needReconnect = false;
         if(this.socket.connected)
         {
            this.socket.close();
         }
      }
      
      public function send(param1:ByteArray) : void
      {
         if(this.socket.connected)
         {
            this.socket.writeBytes(param1);
            this.socket.flush();
         }
         else
         {
            this.msgArray.push(param1);
         }
      }
      
      private function sendTGWHttpHead() : void
      {
         if(ExternalVars.SOCKET_PATH.length == 0)
         {
            return;
         }
         var _loc1_:Array = ExternalVars.SOCKET_PATH.split(":");
         var _loc2_:String = _loc1_[0];
         var _loc3_:* = "tgw_l7_forward\r\nHost: " + _loc2_ + ":" + this.port + "\r\n\r\n";
         var _loc4_:ByteArray;
         (_loc4_ = new ByteArray()).endian = Endian.BIG_ENDIAN;
         _loc4_.writeMultiByte(_loc3_,"iso-8859-1");
         this.send(_loc4_);
      }
   }
}
