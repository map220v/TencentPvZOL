package asgui.events
{
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   
   public class PopUpEvent extends Event
   {
      
      public static const ADDED:String = "added";
      
      public static const REMOVED:String = "removed";
       
      
      public var window:DisplayObject;
      
      public var parent:DisplayObjectContainer;
      
      public var modal:Boolean;
      
      public function PopUpEvent(param1:String, param2:DisplayObject, param3:DisplayObjectContainer = null, param4:Boolean = false)
      {
         super(param1);
         this.window = param2;
         this.parent = param3;
         this.modal = param4;
      }
   }
}
