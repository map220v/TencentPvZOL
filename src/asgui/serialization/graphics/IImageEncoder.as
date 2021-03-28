package asgui.serialization.graphics
{
   import flash.display.BitmapData;
   import flash.utils.ByteArray;
   
   public interface IImageEncoder
   {
       
      
      function get contentType() : String;
      
      function encode(param1:BitmapData) : ByteArray;
      
      function encodeByteArray(param1:ByteArray, param2:int, param3:int, param4:Boolean = true) : ByteArray;
   }
}
