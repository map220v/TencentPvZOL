package tencent.io.service
{
   import com.ied.pptc.tconnd.TConnDClient;
   import com.qq.utils.conn.QClientSocket;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.utils.ByteArray;
   import org.as3commons.logging.api.getLogger;
   import tencent.io.service.interfaces.IProtoDecoder;
   import tencent.io.service.interfaces.IProtoEncoder;
   import tencent.io.service.interfaces.IProtocol;
   import tencent.io.service.interfaces.IService;
   
   public class TConnDSocketService implements IService
   {
       
      
      private var client:QClientSocket;
      
      public var host:String;
      
      public var port:uint;
      
      private var protocolmode:int;
      
      private var closemode:int;
      
      private var timeoutNum:Number;
      
      private var onErrorHandler:Function;
      
      private var onReceiveHandler:Function;
      
      private var _encoder:IProtoEncoder;
      
      private var _decoder:IProtoDecoder;
      
      private var _eventDispatcher:EventDispatcher;
      
      private var reconnetPorts:Array;
      
      public function TConnDSocketService()
      {
         super();
      }
      
      public function init(param1:String, param2:int, param3:uint, param4:Function, param5:Function, param6:Array) : void
      {
         this.reconnetPorts = param6;
         var _loc7_:Array = param1.split(":");
         this.host = _loc7_[0];
         this.port = _loc7_[1];
         this.protocolmode = param2;
         this.timeoutNum = param3;
         this.onReceiveHandler = param4;
         this.onErrorHandler = param5;
         if(param2 == TConnDClient.PROTOCOL_MODE_SOCKET)
         {
            this.closemode = TConnDClient.CONNECTION_CLOSE_AUTO;
         }
         this.createClient();
      }
      
      public function createClient() : Boolean
      {
         if(this.client)
         {
            this.client.close();
            this.client = null;
         }
         this.client = new QClientSocket(this.host,this.port,this.onReceived,this.onErrord,this.timeoutNum,this.reconnetPorts);
         getLogger("socket").info("socket [" + this.host + "][" + this.port + "]  connecting ...");
         return true;
      }
      
      public function connect() : void
      {
         this.client.connect();
      }
      
      public function send(param1:IProtocol) : void
      {
         var _loc2_:ByteArray = this.encoder.encode(param1);
         if(_loc2_ == null)
         {
            return;
         }
         this.sendByte(_loc2_);
      }
      
      public function sendByte(param1:ByteArray) : void
      {
         this.client.send(param1);
      }
      
      protected function onReceived(param1:ByteArray) : void
      {
         param1.position = 0;
         var _loc2_:Array = this.decoder.socketParser(param1);
         if(_loc2_ == null || _loc2_.length == 0)
         {
            getLogger("msg").info("未找到类型，SC消息忽略");
            return;
         }
         this.onReceiveHandler.call(null,_loc2_);
      }
      
      protected function onErrord(param1:int, param2:String) : void
      {
         this.onErrorHandler.call(null,param1);
         getLogger("socket").error("socket error: " + param2);
      }
      
      public function get encoder() : IProtoEncoder
      {
         return this._encoder;
      }
      
      public function set encoder(param1:IProtoEncoder) : void
      {
         this._encoder = param1;
      }
      
      public function get decoder() : IProtoDecoder
      {
         return this._decoder;
      }
      
      public function set decoder(param1:IProtoDecoder) : void
      {
         this._decoder = param1;
      }
      
      public function get eventDispatcher() : IEventDispatcher
      {
         return null;
      }
      
      public function set eventDispatcher(param1:IEventDispatcher) : void
      {
      }
      
      public function closeConnect() : void
      {
         this.client.close();
      }
   }
}
