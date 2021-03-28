package asgui.events
{
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class SystemWatcherEvent extends Event
   {
      
      public static const MOUSE_DISPLAY_OBJECT:String = "MOUSE_DISPLAY_OBJECT";
       
      
      public var displayObjectList:Array;
      
      public var mouseEvt:MouseEvent;
      
      public function SystemWatcherEvent(param1:String, param2:MouseEvent)
      {
         super(param1);
         this.mouseEvt = param2;
      }
   }
}
