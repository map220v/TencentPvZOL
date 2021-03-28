package asgui.managers
{
   import asgui.managers.drags.DragProxy;
   import asgui.managers.drags.IReceivable;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   
   public class DragManager
   {
      
      public static const COPY:String = "copy";
      
      public static const MOVE:String = "move";
      
      public static var _impl:IDragManagerImpl;
      
      public static var dragData:Object;
       
      
      public function DragManager()
      {
         super();
      }
      
      public static function get impl() : IDragManagerImpl
      {
         return _impl;
      }
      
      public static function get dragProxy() : DragProxy
      {
         return impl.dragProxy;
      }
      
      public static function DoDrag(param1:DisplayObject, param2:MouseEvent, param3:DisplayObject = null, param4:Number = 0, param5:Number = 0, param6:Number = 0.5, param7:String = "move") : void
      {
         impl.DoDrag(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public static function EndDrag() : void
      {
         impl.EndDrag();
      }
      
      public static function AddReceiver(param1:IReceivable) : void
      {
         impl.AddReceiver(param1);
      }
      
      public static function RemoveReceiver(param1:IReceivable) : void
      {
         impl.RemoveReceiver(param1);
         dragData = null;
      }
   }
}
