package org.allencuilib.map.tiled
{
   public class TiledResource
   {
      
      public static var urlChangeFunc:Function = defaultUrlChangeFunc;
       
      
      public function TiledResource()
      {
         super();
      }
      
      private static function defaultUrlChangeFunc(param1:String) : String
      {
         return param1;
      }
   }
}
