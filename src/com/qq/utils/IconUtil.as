package com.qq.utils
{
   import asgui.controls.Image;
   
   public final class IconUtil
   {
      
      public static var myFaceId:int;
       
      
      public function IconUtil()
      {
         super();
      }
      
      public static function getFaceUrl(param1:String, param2:int = 100) : String
      {
         var _loc3_:String = null;
         if(param1 != null && param1.length > 0)
         {
            if(param2 >= 140)
            {
               param2 = 140;
            }
            else if(param2 >= 100)
            {
               param2 = 100;
            }
            else if(param2 >= 40)
            {
               param2 = 40;
            }
            _loc3_ = param1.replace("{size}",param2);
         }
         else
         {
            _loc3_ = UrlManager.getInstance().getUrl(UrlManager.Url_HeadIcon,"unknow.png");
         }
         return _loc3_;
      }
      
      public static function getFaceIcon(param1:Image, param2:int, param3:String, param4:int = 100) : String
      {
         var _loc5_:String = null;
         if(param1)
         {
            param1.useLoaderManager = false;
         }
         if(param3)
         {
            if(param4 >= 140)
            {
               param4 = 140;
            }
            else if(param4 >= 100)
            {
               param4 = 100;
            }
            else if(param4 >= 40)
            {
               param4 = 40;
            }
            _loc5_ = param3.replace("{size}",param4);
         }
         else
         {
            _loc5_ = UrlManager.getInstance().getUrl(UrlManager.Url_HeadIcon,"unknow.png");
         }
         return _loc5_;
      }
      
      public static function getUnknowHead() : String
      {
         return UrlManager.getInstance().getUrl(UrlManager.Url_HeadIcon,"unknow1.png");
      }
      
      public static function getFaceIdByUrl(param1:Image, param2:String) : uint
      {
         if(param1)
         {
            param1.useLoaderManager = false;
         }
         var _loc3_:String = param2.substr("http://qlogo4.store.qq.com/qzone/".length);
         return uint(_loc3_.split("/")[0]);
      }
   }
}
