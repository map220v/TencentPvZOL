package tencent.io.service.interfaces
{
   public interface IProtoDecoder
   {
       
      
      function socketParser(param1:*) : Array;
      
      function parser(param1:IProtocol, param2:*) : Vector.<IDecodeData>;
      
      function get resultHandler() : Function;
      
      function set resultHandler(param1:Function) : void;
   }
}
