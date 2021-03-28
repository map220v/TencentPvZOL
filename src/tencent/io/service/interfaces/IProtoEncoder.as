package tencent.io.service.interfaces
{
   public interface IProtoEncoder
   {
       
      
      function encode(param1:IProtocol) : *;
      
      function get encoderParam() : *;
   }
}
