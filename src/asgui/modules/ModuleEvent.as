package asgui.modules
{
   import flash.events.Event;
   import flash.events.ProgressEvent;
   
   public class ModuleEvent extends ProgressEvent
   {
      
      public static const ERROR:String = "error";
      
      public static const PROGRESS:String = "progress";
      
      public static const READY:String = "ready";
      
      public static const SETUP:String = "setup";
      
      public static const UNLOAD:String = "unload";
       
      
      public var errorText:String;
      
      public function ModuleEvent(param1:String, param2:Boolean = false, param3:Boolean = false, param4:uint = 0, param5:uint = 0, param6:String = null)
      {
         super(param1,param2,param3,param4,param5);
         this.errorText = param6;
      }
      
      override public function clone() : Event
      {
         return new ModuleEvent(type,bubbles,cancelable,bytesLoaded,bytesTotal,this.errorText);
      }
   }
}
