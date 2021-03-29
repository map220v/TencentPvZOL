package asgui.modules
{
   import asgui.core.ByteLoader;
   import asgui.logger.AsguiLogger;
   import asgui.managers.LoaderManager;
   import asgui.resources.AssetManager;
   import flash.display.DisplayObject;
   import flash.display.Loader;
   import flash.display.LoaderInfo;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.system.ApplicationDomain;
   import flash.system.LoaderContext;
   import flash.utils.ByteArray;
   
   public class ModuleLoader extends EventDispatcher
   {
      
      public static var decoder:IModuleSwfDecoder = new ModuleSwfRpDecoder();
       
      
      public var dataModule:Object;
      
      public var byteLoader:ByteLoader;
      
      private var inLoading:Boolean = false;
      
      public var module:IModule;
      
      private var loadRequested:Boolean = false;
      
      private var onlyLoad:Boolean;
      
      private var _url:String = null;
      
      private var _layer:Sprite;
      
      private var loaderSqueue:Array;
      
      private var firstDecoded:Boolean = false;
      
      private var assetsManagerCheckLoads:Vector.<int>;
      
      private var loader:Loader;
      
      public function ModuleLoader()
      {
         this.loaderSqueue = [];
         super();
      }
      
      public function get layer() : Sprite
      {
         return this._layer;
      }
      
      public function set layer(param1:Sprite) : void
      {
         this._layer = param1;
      }
      
      public function Dispose() : void
      {
         if(this.byteLoader)
         {
            this.byteLoader.removeEventListener(Event.COMPLETE,this.LoadCompletedHander);
            this.byteLoader.removeEventListener(IOErrorEvent.IO_ERROR,this.IoErrorHandler);
         }
      }
      
      public function get url() : String
      {
         return this._url;
      }
      
      public function set url(param1:String) : void
      {
         if(param1 == this._url)
         {
            return;
         }
         this._url = param1;
         this.loadRequested = false;
      }
      
      public function SetupModule(param1:Vector.<int> = null, param2:Sprite = null, param3:Object = null, param4:Boolean = false) : void
      {
         var _loc5_:LoaderContext = null;
         var _loc6_:ByteArray = null;
         this.assetsManagerCheckLoads = param1;
         this.dataModule = param3;
         this.onlyLoad = param4;
         if(param2)
         {
            this.layer = param2;
         }
         if(this.module)
         {
            this.module.data = param3;
            AsguiLogger.Warn(this,"module already setuped");
            return;
         }
         if(!this.loadRequested)
         {
            this.byteLoader = LoaderManager.GetByteLoader(this.url);
            this.byteLoader.addEventListener(Event.COMPLETE,this.LoadCompletedHander);
            this.byteLoader.addEventListener(IOErrorEvent.IO_ERROR,this.IoErrorHandler);
            this.loaderSqueue.push(this.byteLoader);
            if(this.assetsManagerCheckLoads != null && AssetManager.instance.HasUrlsNeedToLoad(this.assetsManagerCheckLoads))
            {
               AssetManager.instance.CheckLoad(this.assetsManagerCheckLoads);
               AssetManager.instance.addEventListener(Event.COMPLETE,this.LoadCompletedHander);
               this.loaderSqueue.push(AssetManager.instance);
            }
         }
         else if(!param4)
         {
            if(this.byteLoader.byteLoaded == 0)
            {
               return;
            }
            this.loader = new Loader();
            if((_loc5_ = new LoaderContext(false,ApplicationDomain.currentDomain)).hasOwnProperty("allowCodeImport"))
            {
               _loc5_["allowCodeImport"] = true;
            }
            _loc6_ = this.byteLoader.data;
            if(!this.firstDecoded)
            {
               if(decoder != null)
               {
                  this.byteLoader.data = decoder.Decode(_loc6_);
               }
            }
            this.loader.loadBytes(this.byteLoader.data,/*this.firstDecoded ? null :*/ _loc5_);//TODO:is it was correct?
            this.loader.contentLoaderInfo.addEventListener(Event.COMPLETE,this.DecodeCompletedHandler,false,0,true);
            this.firstDecoded = true;
         }
         this.inLoading = true;
      }
      
      public function DoSetupModule(param1:IModule) : void
      {
         this.module = param1;
         if(this.layer)
         {
            this.layer.addChild(param1 as DisplayObject);
         }
         if(param1)
         {
            param1.Setup(this.layer);
            param1.data = this.dataModule;
         }
         else
         {
            AsguiLogger.Warn(this,this.url + " is not IModule");
         }
         this.inLoading = false;
         this.dispatchEvent(new ModuleEvent(ModuleEvent.SETUP));
      }
      
      public function UnloadModule() : void
      {
         this.dataModule = null;
         if(!this.module)
         {
            return;
         }
         this.module.Unload();
         this.module.Dispose();
         if(this.layer)
         {
            this.layer.removeChild(this.module as DisplayObject);
            this.layer = null;
         }
         if(this.loader)
         {
            this.loader.unload();
            this.loader = null;
         }
         this.module = null;
         this.dispatchEvent(new ModuleEvent(ModuleEvent.UNLOAD));
      }
      
      private function DecodeCompletedHandler(param1:Event) : void
      {
         (param1.currentTarget as IEventDispatcher).removeEventListener(Event.COMPLETE,this.DecodeCompletedHandler);
         this.DoSetupModule((param1.currentTarget as LoaderInfo).content as IModule);
      }
      
      private function LoadCompletedHander(param1:Event) : void
      {
         (param1.currentTarget as IEventDispatcher).removeEventListener(Event.COMPLETE,this.LoadCompletedHander);
         var _loc2_:* = param1.currentTarget;
         if(this.loaderSqueue.indexOf(_loc2_) != -1)
         {
            this.loaderSqueue.splice(this.loaderSqueue.indexOf(_loc2_),1);
         }
         if(this.loaderSqueue.length == 0)
         {
            this.loadRequested = true;
            this.dispatchEvent(new ModuleEvent(ModuleEvent.READY));
            this.SetupModule(this.assetsManagerCheckLoads,this.layer,this.dataModule,this.onlyLoad);
         }
      }
      
      private function IoErrorHandler(param1:IOErrorEvent) : void
      {
         AsguiLogger.Warn(this,"IOError : " + this.url);
         this.dispatchEvent(new ModuleEvent(ModuleEvent.ERROR));
      }
   }
}
