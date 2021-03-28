package asgui.events
{
   import flash.events.Event;
   
   public class DataProviderEvent extends Event
   {
      
      public static const DATA_CHANGE:String = "dataChange";
      
      public static const CURRENT_PAGE_CHANGE:String = "currentPageChange";
       
      
      public function DataProviderEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
   }
}
