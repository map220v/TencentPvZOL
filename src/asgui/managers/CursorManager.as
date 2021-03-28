package asgui.managers
{
   public class CursorManager
   {
      
      public static const NO_CURSOR:int = 0;
      
      public static const ARROW:int = 1;
      
      public static const BUTTON:int = 2;
      
      public static const HAND:int = 3;
      
      public static const IBEAM:int = 4;
      
      public static var _impl:ICursorManagerImpl;
       
      
      public function CursorManager()
      {
         super();
      }
      
      private static function get impl() : ICursorManagerImpl
      {
         return _impl;
      }
      
      public static function get currentCursorID() : int
      {
         return impl.currentCursorID;
      }
      
      public static function set currentCursorID(param1:int) : void
      {
         if(impl.currentCursorID != param1)
         {
            impl.currentCursorID = param1;
         }
      }
      
      public static function ShowCursor() : void
      {
         impl.ShowCursor();
      }
      
      public static function HideCursor() : void
      {
         impl.HideCursor();
      }
      
      public static function SetCursor(param1:Class, param2:int = 2, param3:Number = 0, param4:Number = 0) : int
      {
         return impl.SetCursor(param1,param2,param3,param4);
      }
      
      public static function RemoveCursor(param1:int) : void
      {
         impl.RemoveCursor(param1);
      }
      
      public static function RemoveAllCursors() : void
      {
         impl.RemoveAllCursors();
      }
      
      public static function SetBusyCursor() : void
      {
         impl.SetBusyCursor();
      }
      
      public static function RemoveBusyCursor() : void
      {
         impl.RemoveBusyCursor();
      }
   }
}
