package asgui.styles
{
   import asgui.core.UIComponent;
   import flash.events.EventDispatcher;
   
   public class StyleManager extends EventDispatcher
   {
      
      public static var urlChangeFunc:Function = defaultUrlChangeFunc;
      
      public static var _impl:IStyleManagerImpl;
       
      
      public function StyleManager()
      {
         super();
      }
      
      public static function GetStyleSkin(param1:StyleSkinInfo) : StyleSkin
      {
         return impl.GetStyleSkin(param1);
      }
      
      public static function GetStyleDeclaration(param1:String, param2:Object = null) : StyleDeclaration
      {
         if(param2 == null)
         {
            param2 = UIComponent;
         }
         return impl.GetStyleDeclaration(param1,param2);
      }
      
      public static function GetTotalSkinDataMemSize() : int
      {
         return impl.GetTotalSkinDataMemSize();
      }
      
      public static function GetStyleNamesByUITypeName(param1:String) : Array
      {
         return impl.GetStyleNamesByUITypeName(param1);
      }
      
      private static function defaultUrlChangeFunc(param1:String) : String
      {
         return param1;
      }
      
      public static function get impl() : IStyleManagerImpl
      {
         return _impl;
      }
   }
}
