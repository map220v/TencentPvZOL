package asgui.events
{
   import flash.events.Event;
   
   public class AsguiEvent extends Event
   {
      
      public static const DATA_CHANGE:String = "dataChange";
      
      public static const KEY_ENTER:String = "keyEnter";
      
      public static const WIDTH_CHANGED:String = "widthChanged";
      
      public static const HEIGHT_CHANGED:String = "heightChanged";
      
      public static const TEXT_CHANGED:String = "textChanged";
       
      
      public function AsguiEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      override public function clone() : Event
      {
         return new AsguiEvent(type,bubbles,cancelable);
      }
   }
}
