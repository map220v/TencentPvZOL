package tencent.io.service.interfaces
{
   public interface IDecodeData
   {
       
      
      function get eventType() : String;
      
      function get result() : int;
      
      function get data() : *;
   }
}
