package asgui.managers
{
   import asgui.core.ByteLoader;
   import asgui.core.IDisposable;
   import flash.display.Loader;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLRequest;
   import flash.system.ApplicationDomain;
   import flash.system.LoaderContext;
   import flash.utils.ByteArray;
   import flash.utils.clearTimeout;
   import flash.utils.getTimer;
   import flash.utils.setTimeout;
   
   public class LoaderCollection extends EventDispatcher implements IDisposable
   {
      
      public static const RES_lOADER_TIME_OUT:String = "RES_lOADER_TIME_OUT";
      
      public static const RES_LOADED_FAILTURE:String = "RES_LOADED_FAILTURE";
       
      
      public var byteLoader:ByteLoader;
      
      private var loadersHolder:Array;
      
      private var loaderInLoading:Array;
      
      private var _guessSize:int = 0;
      
      private var checkLoadedCount:int = 0;
      
      private var _hasDisposed:Boolean;
      
      private var _hasStarted:Boolean;
      
      var _hasClosed:Boolean;
      
      private var cacheLoader:Loader;
      
      private var loadOkTimeout:uint;
      
      private var _url:String;
      
      private var useCurrentDommain:Boolean;
      
      public function LoaderCollection(param1:String, param2:Boolean = false, param3:int = 30000)
      {
         this.loadersHolder = [];
         this.loaderInLoading = [];
         super();
         this.useCurrentDommain = param2;
         this._url = param1;
         this.byteLoader = new ByteLoader("",null,param3);
         this.byteLoader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.SecurityErrorHandler);
         this.byteLoader.addEventListener(IOErrorEvent.IO_ERROR,this.IoErrorHandler);
         this.byteLoader.addEventListener(ByteLoader.TIME_OUT,this.onTimeOut);
         this.byteLoader.addEventListener(Event.COMPLETE,this.ByteLoaderCompleteHandler);
      }
      
      public function getGuessSize() : int
      {
         return this._guessSize;
      }
      
      public function setGuessSize(param1:int) : void
      {
         this._guessSize = param1;
      }
      
      public function CheckLoaded() : Boolean
      {
         if(this.byteLoader && this.byteLoader.loadTimeout == 0)
         {
            return false;
         }
         var _loc1_:int = getTimer();
         if(this.checkLoadedCount++ < 3)
         {
            return false;
         }
         if(this.byteLoader.loadTimeout > 0 && this.byteLoader.startTime > 0 && _loc1_ - this.byteLoader.startTime > this.byteLoader.loadTimeout && LoaderManager.urlCheckTimeoutableFunc(this.url))
         {
            this.byteLoader.UpdateByteLoaded();
            if(this.byteLoader.byteLoaded == 0)
            {
               this.setClose();
               return true;
            }
         }
         if(this.byteLoader.hasLoaded)
         {
            this.checkLoadedCount = 0;
            return this.LoadOK();
         }
         this.byteLoader.CheckLoaded();
         return false;
      }
      
      public function Load() : void
      {
         var _loc2_:ByteArray = null;
         var _loc1_:String = this.url.split("?")[0];
         var _loc3_:Array = LoaderManager.urlToAssets;
         if(_loc3_[_loc1_] != null)
         {
            _loc2_ = ByteArray(new _loc3_[_loc1_]());
            this.byteLoader.LoadByteArray(_loc2_);
         }
         else
         {
            this.byteLoader.Load(this.url);
         }
         this._hasStarted = true;
      }
      
      public function Dispose() : void
      {
         this.byteLoader.removeEventListener(Event.COMPLETE,this.ByteLoaderCompleteHandler);
         this.byteLoader.removeEventListener(IOErrorEvent.IO_ERROR,this.IoErrorHandler);
         this.byteLoader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,this.SecurityErrorHandler);
         this.loadersHolder = null;
         this.byteLoader = null;
         this.cacheLoader = null;
         this._hasDisposed = true;
      }
      
      public function get hasDisposed() : Boolean
      {
         return this._hasDisposed;
      }
      
      public function get hasStarted() : Boolean
      {
         return this._hasStarted;
      }
      
      public function get hasClosed() : Boolean
      {
         return this._hasClosed;
      }
      
      public function GetLoader(param1:Boolean = false) : Loader
      {
         if(param1 && this.cacheLoader)
         {
            return this.cacheLoader;
         }
         var _loc2_:Loader = new Loader();
         if(param1)
         {
            this.cacheLoader = _loc2_;
         }
         this.AddLoader(_loc2_);
         return _loc2_;
      }
      
      public function AddLoader(param1:Loader) : void
      {
         this.loadersHolder.push(param1);
         if(this.byteLoader.hasLoaded)
         {
            this.loadOkTimeout = setTimeout(this.LoadOK,1);
         }
      }
      
      public function PopLoaders() : int
      {
         var _loc2_:Loader = null;
         var _loc3_:LoaderContext = null;
         var _loc1_:int = this.loadersHolder.length;
         while(this.loadersHolder.length > 0)
         {
            _loc2_ = this.loadersHolder.pop() as Loader;
            if(_loc2_.content == null)
            {
               if(this.byteLoader.data.length != 0)
               {
                  this.byteLoader.data.position = 0;
                  _loc3_ = new LoaderContext(false,!!this.useCurrentDommain ? ApplicationDomain.currentDomain : null);
                  if(_loc3_.hasOwnProperty("allowCodeImport"))
                  {
                     _loc3_["allowCodeImport"] = true;
                  }
                  _loc2_.contentLoaderInfo.addEventListener(Event.COMPLETE,this.loaderCompleteHandler);
                  _loc2_.loadBytes(this.byteLoader.data,_loc3_);
                  this.loaderInLoading.push(_loc2_);
               }
            }
         }
         return _loc1_;
      }
      
      protected function loaderCompleteHandler(param1:Event) : void
      {
         this.loaderInLoading.splice(this.loaderInLoading.indexOf(param1.currentTarget),1);
         (param1.currentTarget as IEventDispatcher).removeEventListener(Event.COMPLETE,this.loaderCompleteHandler);
         if(this.loaderInLoading.length == 0)
         {
            this.setClose();
         }
      }
      
      public function PopLoadersForNormalLoad() : void
      {
         var _loc1_:Loader = null;
         while(this.loadersHolder.length > 0)
         {
            _loc1_ = this.loadersHolder.pop() as Loader;
            _loc1_.load(new URLRequest(this.url));
         }
      }
      
      public function PopLoadersForIoError() : void
      {
         var _loc1_:Loader = null;
         while(this.loadersHolder.length > 0)
         {
            _loc1_ = this.loadersHolder.pop() as Loader;
            _loc1_.load(new URLRequest(this.url));
         }
      }
      
      public function get data() : ByteArray
      {
         return this.byteLoader.data;
      }
      
      public function get url() : String
      {
         return this._url;
      }
      
      private function setClose() : void
      {
         if(!this._hasClosed)
         {
            this._hasClosed = true;
            this.dispatchEvent(new Event(Event.CLOSE));
         }
      }
      
      private function ByteLoaderCompleteHandler(param1:Event) : void
      {
         this.LoadOK();
      }
      
      private function LoadOK() : Boolean
      {
         var i:int = 0;
         var loader:Loader = null;
         clearTimeout(this.loadOkTimeout);
         var length:int = this.PopLoaders();
         this.dispatchEvent(new Event(Event.COMPLETE));
         if(this.loaderInLoading.length == 0)
         {
            this.setClose();
            return true;
         }
         while(i < this.loaderInLoading.length)
         {
            loader = this.loaderInLoading[i];
            try
            {
               if(loader.content)
               {
                  this.loaderInLoading.splice(this.loaderInLoading.indexOf(loader),1);
                  loader.removeEventListener(Event.COMPLETE,this.loaderCompleteHandler);
                  i--;
               }
            }
            catch(err:Error)
            {
               break;
            }
            i++;
         }
         return false;
      }
      
      private function SecurityErrorHandler(param1:SecurityErrorEvent) : void
      {
         this.PopLoadersForNormalLoad();
         this.setClose();
      }
      
      private function onTimeOut(param1:Event) : void
      {
      }
      
      private function IoErrorHandler(param1:Event) : void
      {
         this.PopLoadersForIoError();
         this.setClose();
      }
   }
}
