package asgui.core
{
   public final class UIComponentGlobals
   {
      
      private static var _layoutManager:UILayoutManager;
      
      public static var alwaysEnabled:Boolean = false;
      
      public static var containerDefaultMouseEnabled:Boolean = false;
      
      public static var addChildToContainerValidateLayoutImmediately:Boolean = false;
      
      public static var drawDrawScale9GridInPixelMode:Boolean = false;
      
      public static var buttonUseButtonMode:Boolean = true;
      
      public static var buttonClickCallBack:Function = null;
      
      public static var labelAlwaysCheckTruncation:Boolean = false;
      
      public static var labelCheckTruncationOnlyTip:Boolean = false;
       
      
      public function UIComponentGlobals()
      {
         super();
      }
      
      public static function get layoutManager() : UILayoutManager
      {
         if(_layoutManager == null)
         {
            _layoutManager = new UILayoutManager();
         }
         return _layoutManager;
      }
   }
}
