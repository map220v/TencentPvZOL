package asgui.events
{
   import asgui.managers.LoaderCollection;
   import flash.events.Event;
   
   public class LoaderEvent extends Event
   {
      
      public static const LOADER_START:String = "loaderStart";
       
      
      public var loaderCollection:LoaderCollection;
      
      public function LoaderEvent(param1:String, param2:LoaderCollection)
      {
         super(param1);
         this.loaderCollection = param2;
      }
   }
}
