package asgui.serialization.graphics
{
   import flash.display.BitmapData;
   import flash.utils.ByteArray;
   import flash.utils.getDefinitionByName;
   
   public final class EncoderUtil
   {
       
      
      public function EncoderUtil()
      {
         super();
      }
      
      public static function EncoderJPEG(param1:BitmapData, param2:int = 80) : ByteArray
      {
         var _loc3_:ByteArray = null;
         var _loc5_:* = undefined;
         var _loc6_:JPEGEncoder = null;
         var _loc4_:Class;
         if((_loc4_ = getDefinitionByName("flash.display::JPEGEncoderOptions") as Class) != null)
         {
            _loc5_ = new _loc4_();
            _loc3_ = param1["encode"](param1.rect,_loc5_);
         }
         else
         {
            _loc3_ = (_loc6_ = new JPEGEncoder(param2)).encode(param1);
         }
         return _loc3_;
      }
   }
}
