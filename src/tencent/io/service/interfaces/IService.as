package tencent.io.service.interfaces
{
   import flash.events.IEventDispatcher;
   
   public interface IService
   {
       
      
      function send(param1:IProtocol) : void;
      
      function get encoder() : IProtoEncoder;
      
      function set encoder(param1:IProtoEncoder) : void;
      
      function get decoder() : IProtoDecoder;
      
      function set decoder(param1:IProtoDecoder) : void;
      
      function get eventDispatcher() : IEventDispatcher;
      
      function set eventDispatcher(param1:IEventDispatcher) : void;
   }
}
