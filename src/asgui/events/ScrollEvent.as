package asgui.events
{
   import flash.events.Event;
   
   public class ScrollEvent extends Event
   {
      
      public static const SCROLL_UPDATE:String = "scrollUpdate";
      
      public static const SCROLL_BAR_DOWN:String = "scrollBarDown";
      
      public static const SCROLL_BAR_UP:String = "scrollBarUp";
       
      
      public function ScrollEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      override public function clone() : Event
      {
         return new ScrollEvent(type,bubbles,cancelable);
      }
   }
}
