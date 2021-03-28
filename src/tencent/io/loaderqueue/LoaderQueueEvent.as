package tencent.io.loaderqueue
{
   import flash.events.Event;
   
   public class LoaderQueueEvent extends Event
   {
      
      public static const TASK_ADDED:String = "taskAdded";
      
      public static const TASK_REMOVED:String = "taskRemoved";
      
      public static const TASK_COMPLETED:String = "taskCompleted";
      
      public static const TASK_ERROR:String = "taskError";
      
      public static const TASK_PROGRESS:String = "taskProgress";
      
      public static const TASK_START:String = "taskStart";
      
      public static const TASK_STOP:String = "taskStop";
      
      public static const TASK_DISPOSE:String = "taskDispose";
      
      public static const TASK_QUEUE_COMPLETED:String = "taskQueueCompleted";
       
      
      public var customData;
      
      public var bytesLoaded:Number;
      
      public var bytesTotal:Number;
      
      public var errorMsg:String;
      
      public function LoaderQueueEvent(param1:String, param2:* = null)
      {
         this.customData = param2;
         super(param1);
      }
      
      override public function clone() : Event
      {
         var _loc1_:LoaderQueueEvent = new LoaderQueueEvent(type);
         _loc1_.customData = this.customData;
         _loc1_.bytesLoaded = this.bytesLoaded;
         _loc1_.bytesTotal = this.bytesTotal;
         _loc1_.errorMsg = this.errorMsg;
         return _loc1_;
      }
   }
}
