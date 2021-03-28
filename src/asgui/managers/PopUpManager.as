package asgui.managers
{
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.geom.Point;
   
   public class PopUpManager
   {
      
      public static var _impl:IPopUpManagerImpl;
       
      
      public function PopUpManager()
      {
         super();
      }
      
      public static function get impl() : IPopUpManagerImpl
      {
         return _impl;
      }
      
      public static function CreatePopUp(param1:Class, param2:DisplayObjectContainer, param3:Boolean = false, param4:Boolean = true) : DisplayObject
      {
         return impl.CreatePopUp(param1,param2,param3,param4);
      }
      
      public static function AddPopUp(param1:DisplayObject, param2:DisplayObjectContainer = null, param3:Boolean = false, param4:Boolean = true, param5:Point = null) : void
      {
         impl.AddPopUp(param1,param2,param3,param4,param5);
      }
      
      public static function CenterPopUp(param1:DisplayObject) : void
      {
         impl.CenterPopUp(param1);
      }
      
      public static function RemovePopUp(param1:DisplayObject, param2:Boolean = true) : void
      {
         impl.RemovePopUp(param1,param2);
      }
      
      public static function BringToFront(param1:DisplayObject) : void
      {
         impl.BringToFront(param1);
      }
      
      public static function BringToBottom(param1:DisplayObject) : void
      {
         impl.BringToBottom(param1);
      }
   }
}
