package asgui.managers
{
   import asgui.core.ByteLoader;
   import asgui.events.LoaderEvent;
   import flash.display.Loader;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   
   public final class LoaderManager extends EventDispatcher
   {
      
      public static var revisionTag:String = "r";
      
      private static var revisionUrls:Array = [];
      
      public static var urlChangeFunc:Function = defaultUrlChangeFunc;
      
      public static var urlCheckTimeoutableFunc:Function = defaultUrlCheckTimeoutableFunc;
      
      public static var urlToAssets:Array = [];
      
      private static var _impl:LoaderManager;
      
      public static var maxInLoading:int = 5;
      
      static var domainName:String;
       
      
      private var data:Array;
      
      private var queue:Array;
      
      private var queueInLoading:Array;
      
      private var status:LoaderManagerStatus;
      
      private var queueLoaderCollection:LoaderCollection;
      
      private var queueIndex:int = 0;
      
      private var completeCallback:Vector.<Function>;
      
      private var timer:Timer;
      
      private var addCallBackTime:int = 0;
      
      private var frameCounter:int;
      
      private var _isOpening:Boolean;
      
      private var closeTimeout:uint;
      
      public function LoaderManager()
      {
         this.queueInLoading = [];
         this.completeCallback = new Vector.<Function>();
         super();
         this.data = [];
         this.queue = [];
         this.timer = new Timer(500);
         this.timer.addEventListener(TimerEvent.TIMER,this.TimerHanlder);
         this.timer.start();
      }
      
      public static function SetRevisionXml(param1:XML) : void
      {
         var _loc3_:XML = null;
         var _loc4_:int = 0;
         var _loc6_:String = null;
         var _loc7_:String = null;
         var _loc2_:XMLList = param1["s"];
         var _loc5_:int = _loc2_.length();
         _loc4_ = 0;
         while(_loc4_ < _loc5_)
         {
            _loc3_ = _loc2_[_loc4_];
            _loc6_ = String(_loc3_.@rev);
            _loc7_ = String(_loc3_.@name);
            revisionUrls[_loc7_] = _loc7_ + "?" + revisionTag + "=" + _loc6_;
            _loc4_++;
         }
      }
      
      public static function GetRevisionUrl(param1:String) : String
      {
         param1 = urlChangeFunc(param1);
         if(revisionUrls[param1] != null)
         {
            if(param1.indexOf(revisionTag + "=") != -1)
            {
               return param1;
            }
            return revisionUrls[param1];
         }
         return param1;
      }
      
      private static function defaultUrlChangeFunc(param1:String) : String
      {
         return param1;
      }
      
      private static function defaultUrlCheckTimeoutableFunc(param1:String) : Boolean
      {
         return false;
      }
      
      public static function get impl() : LoaderManager
      {
         if(_impl == null)
         {
            _impl = new LoaderManager();
         }
         return _impl;
      }
      
      public static function GetLoaderCache(param1:String, param2:Boolean = false) : Loader
      {
         return GetLoaderCollection(param1,param2).GetLoader(true);
      }
      
      public static function GetLoader(param1:String, param2:int = 30000) : Loader
      {
         var _loc3_:Loader = GetLoaderCollection(param1,false,param2).GetLoader();
         impl.invalidateLoaderCollection(GetLoaderCollection(param1));
         return _loc3_;
      }
      
      public static function LoaderLoad(param1:String, param2:Loader) : void
      {
         GetLoaderCollection(param1).AddLoader(param2);
         impl.invalidateLoaderCollection(GetLoaderCollection(param1));
      }
      
      public static function GetByteLoader(param1:String) : ByteLoader
      {
         return GetLoaderCollection(param1).byteLoader;
      }
      
      public static function GetLoaderCollection(param1:String, param2:Boolean = false, param3:int = 5000) : LoaderCollection
      {
         return impl.GetLoaderCollection(GetRevisionUrl(param1),param2,param3);
      }
      
      public static function GetStatus() : LoaderManagerStatus
      {
         return impl.GetStatus();
      }
      
      public static function AddCompleteCallback(param1:Function) : void
      {
         impl.AddCompleteCallback(param1);
      }
      
      public function AddCompleteCallback(param1:Function) : void
      {
         this.addCallBackTime = getTimer();
         this.completeCallback.push(param1);
      }
      
      private function invalidateLoaderCollection(param1:LoaderCollection) : void
      {
         if(param1.hasStarted && param1.hasClosed)
         {
            param1.addEventListener(Event.CLOSE,this.LoaderCollectionCloseHandler);
            param1._hasClosed = false;
            this.queueInLoading.push(param1);
            this._isOpening = true;
         }
      }
      
      public function GetStatus() : LoaderManagerStatus
      {
         var _loc3_:LoaderCollection = null;
         var _loc4_:int = 0;
         var _loc5_:String = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(this.status == null)
         {
            this.status = new LoaderManagerStatus();
         }
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         for each(_loc3_ in this.data)
         {
            _loc5_ = _loc3_.url;
            _loc6_ = _loc3_.byteLoader.byteLoaded;
            _loc7_ = Math.max(_loc3_.byteLoader.byteTotal,_loc3_.getGuessSize());
            _loc1_ += _loc6_;
            _loc2_ += _loc7_;
         }
         _loc1_ = Math.min(_loc1_,_loc2_);
         _loc4_ = int(100 * (_loc1_ / _loc2_));
         this.status.LoadManager(this.queueIndex - this.queueInLoading.length,this.queueLoaderCollection,this.queue,_loc4_,this.queueInLoading.length);
         return impl.status;
      }
      
      private function GetLoaderCollection(param1:String, param2:Boolean = false, param3:int = 5000) : LoaderCollection
      {
         var _loc4_:LoaderCollection = null;
         if(impl.data[param1] == null)
         {
            _loc4_ = new LoaderCollection(param1,param2,param3);
            impl.data[param1] = _loc4_;
            this.queue.push(_loc4_);
            this.LoadNext();
         }
         else
         {
            _loc4_ = impl.data[param1] as LoaderCollection;
         }
         return _loc4_;
      }
      
      private function TimerHanlder(param1:TimerEvent) : void
      {
         this.LoadNext();
      }
      
      public function get isOpening() : Boolean
      {
         return this._isOpening;
      }
      
      public function LoadNext() : void
      {
         var _loc1_:int = 0;
         var _loc2_:LoaderCollection = null;
         ++this.frameCounter;
         if(!this.isOpening && this.addCallBackTime + 60 < getTimer())
         {
            while(this.completeCallback.length > 0)
            {
               this.completeCallback.shift().call();
            }
         }
         if(this.queueIndex >= this.queue.length)
         {
            if(this.queueInLoading.length == 0)
            {
               if(this._isOpening)
               {
                  this._isOpening = false;
                  this.dispatchEvent(new Event(Event.CLOSE));
               }
               return;
            }
            _loc1_ = 0;
            while(_loc1_ < Math.min(2,this.queueInLoading.length))
            {
               _loc2_ = this.queueInLoading[_loc1_];
               if(_loc2_.CheckLoaded())
               {
                  break;
               }
               _loc1_++;
            }
         }
         while(this.queueIndex < this.queue.length && this.queueInLoading.length < maxInLoading)
         {
            this.queueLoaderCollection = this.queue[this.queueIndex];
            if(this.queueLoaderCollection.hasStarted && !this.queueLoaderCollection.hasClosed)
            {
               ++this.queueIndex;
            }
            else if(!this.queueLoaderCollection.hasStarted)
            {
               this.queueLoaderCollection.addEventListener(Event.CLOSE,this.LoaderCollectionCloseHandler);
               this.queueLoaderCollection.Load();
               this.queueInLoading.push(this.queueLoaderCollection);
               this.dispatchEvent(new LoaderEvent(LoaderEvent.LOADER_START,this.queueLoaderCollection));
               if(!this._isOpening)
               {
                  this._isOpening = true;
                  this.dispatchEvent(new Event(Event.OPEN));
               }
            }
            else
            {
               ++this.queueIndex;
            }
         }
      }
      
      private function LoaderCollectionCloseHandler(param1:Event) : void
      {
         (param1.currentTarget as IEventDispatcher).removeEventListener(Event.CLOSE,this.LoaderCollectionCloseHandler);
         this.queueInLoading.splice(this.queueInLoading.indexOf(param1.currentTarget),1);
         this.LoadNext();
      }
      
      public function ClearCache() : int
      {
         var _loc1_:int = 0;
         var _loc2_:LoaderCollection = null;
         _loc1_ = 0;
         while(_loc1_ < this.queue.length)
         {
            _loc2_ = this.queue[_loc1_];
            if(!_loc2_.byteLoader.hasLoaded)
            {
               break;
            }
            _loc1_++;
         }
         this.queue.splice(0,_loc1_);
         this.queueIndex = 0;
         this.data = [];
         return _loc1_;
      }
      
      public function GetMemSize(param1:Boolean = false) : int
      {
         var _loc2_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:LoaderCollection = null;
         var _loc3_:int = 0;
         if(!param1)
         {
         }
         _loc2_ = 0;
         while(_loc2_ < this.queue.length)
         {
            if((_loc5_ = this.queue[_loc2_]) != null)
            {
               if(_loc5_.byteLoader.data == null)
               {
                  _loc4_ = 0;
               }
               else
               {
                  _loc4_ = _loc5_.byteLoader.data.length;
               }
               if(!param1)
               {
               }
               _loc3_ += _loc4_;
            }
            _loc2_++;
         }
         if(!param1)
         {
         }
         return _loc3_;
      }
   }
}
