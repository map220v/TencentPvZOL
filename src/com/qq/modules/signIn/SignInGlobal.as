package com.qq.modules.signIn
{
   import com.qq.utils.UrlManager;
   
   public class SignInGlobal
   {
      
      public static const EVENT_SIGNIN_INIT:String = "EVENT_SIGNIN_INIT";
      
      public static const EVENT_SIGNIN_UPDATE:String = "EVENT_SIGNIN_UPDATE";
      
      public static const EVENT_SIGNIN_BUY_ITEM:String = "EVENT_SIGIN_BUY_ITEM";
      
      public static const EVENT_SIGNIN_CLOSE_WINDOW:String = "EVENT_SIGNIN_CLOSE_WINDOW";
       
      
      public function SignInGlobal()
      {
         super();
      }
      
      public static function getVipFlag(param1:int) : String
      {
         if(param1 > 0)
         {
            return UrlManager.getUrl(UrlManager.Url_SignIn_Image,"SIGNIN_VIP_" + param1 + ".png");
         }
         return null;
      }
   }
}
