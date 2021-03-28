package asgui.strings
{
   import asgui.core.ByteLoader;
   import asgui.core.ILoadingWatchable;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   
   public final class SS extends EventDispatcher implements ILoadingWatchable
   {
      
      private static var _instance:SS;
       
      
      public var currentPool:StringPool;
      
      private var _workingLoader:ByteLoader;
      
      private var urls:Array;
      
      public function SS()
      {
         this.urls = [];
         super();
      }
      
      public static function get instance() : SS
      {
         if(!_instance)
         {
            _instance = new SS();
         }
         return _instance;
      }
      
      public static function $(param1:String) : String
      {
         if(param1 == null)
         {
            return "";
         }
         if(instance.currentPool)
         {
            return instance.currentPool.$(param1);
         }
         return param1;
      }
      
      public static function T(param1:String) : String
      {
         if(instance.currentPool)
         {
            return instance.currentPool.T(int(param1.replace("@","")));
         }
         return param1;
      }
      
      public function get workingLoader() : *
      {
         return this._workingLoader;
      }
      
      public function get leftLoaders() : int
      {
         return this.urls.length;
      }
      
      public function SetDicts(param1:Array) : void
      {
         this.urls = param1;
      }
      
      public function CheckLoad() : void
      {
         var _loc1_:StringPool = null;
         if(this.urls.length > 0)
         {
            _loc1_ = new StringPool();
            this._workingLoader = _loc1_.byteLoader;
            _loc1_.addEventListener(Event.COMPLETE,this.StringPoolCompleteHandler);
            _loc1_.addEventListener(IOErrorEvent.IO_ERROR,this.IoErrorHandler);
            _loc1_.addEventListener(ProgressEvent.PROGRESS,this.ProgressHandler);
            _loc1_.LoadDictByUrl(this.urls.pop());
         }
         else
         {
            this.dispatchEvent(new Event(Event.COMPLETE));
         }
      }
      
      private function StringPoolCompleteHandler(param1:Event) : void
      {
         (param1.currentTarget as IEventDispatcher).removeEventListener(Event.COMPLETE,this.StringPoolCompleteHandler);
         (param1.currentTarget as IEventDispatcher).removeEventListener(IOErrorEvent.IO_ERROR,this.IoErrorHandler);
         (param1.currentTarget as IEventDispatcher).removeEventListener(ProgressEvent.PROGRESS,this.ProgressHandler);
         this.currentPool = param1.currentTarget as StringPool;
         this.CheckLoad();
      }
      
      private function ProgressHandler(param1:ProgressEvent) : void
      {
      }
      
      private function IoErrorHandler(param1:IOErrorEvent) : void
      {
         this.dispatchEvent(param1.clone());
      }
   }
}
