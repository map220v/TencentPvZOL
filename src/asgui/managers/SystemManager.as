package asgui.managers
{
   import asgui.controls.Alert;
   import asgui.core.Application;
   import asgui.core.IAsguiDisplayObject;
   import asgui.core.ILoadingWatchable;
   import asgui.core.UIComponent;
   import asgui.logger.AsguiLogger;
   import asgui.modules.ModuleLoaderManager;
   import asgui.modules.SystemLoadingBar;
   import asgui.resources.AssetManager;
   import asgui.resources.AssetManagerImpl;
   import asgui.strings.SS;
   import asgui.styles.StyleManager;
   import asgui.styles.StyleManagerImpl;

import com.qq.MyApplication;

import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.MovieClip;
   import flash.display.StageAlign;
   import flash.display.StageScaleMode;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.geom.Point;
   import flash.utils.getDefinitionByName;
   
   public class SystemManager extends MovieClip implements IAsguiDisplayObject, ISystemManager, ILoadingWatchable
   {
      
      private static var CONFIG_URL:String = "asgui.cfg";
      
      static var applicationClassName:String;
      
      static var constructorClassName:String;
      
      static var skinUrls:Array = [];
      
      static var cssUrls:Array = [];
      
      static var resourceUrls:Array = [];
      
      static var dictUrls:Array = [];
      
      private static var _instance:SystemManager;
       
      
      public var data:Object;
      
      private var applicationClass:Class;
      
      private var styleLoaded:Boolean;
      
      var _root:DisplayObjectContainer;
      
      public var loadingProg:SystemLoadingBar;
      
      public var watcher:SystemWatcher;
      
      private var asguiCfgUrl:String;
      
      public var m_aryRootLayer:Array;
      
      public var ErrorCodeLayer:SystemContainer;
      
      public var popUpLayer:SystemContainer;
      
      public var toolTipLayer:SystemContainer;
      
      public var maskLayer:SystemContainer;
      
      public var dropDownLayer:SystemContainer;
      
      public var dragLayer:SystemContainer;
      
      public var cursorLayer:SystemContainer;
      
      private var _application:Application;
      
      private var cfgLoaded:Boolean;
      
      public function SystemManager(param1:String = null)
      {
         this.m_aryRootLayer = [];
         super();
         this.asguiCfgUrl = param1;
         if(this.stage != null)
         {
            this.Init();
         }
      }
      
      public static function get instance() : SystemManager
      {
         return _instance;
      }
      
      public function Init() : void
      {
         var url:String = null;
         this.addEventListener(Event.ENTER_FRAME,this.EnterFrameHandler);
         if(this.loaderInfo.url.indexOf("file") != 0)
         {
            url = this.loaderInfo.url.replace("http://").split("/")[0];
            LoaderManager.domainName = url;
         }
         var parameters:Object = this.loaderInfo.parameters;
         var cfg:String = parameters["asgui"];
         if(cfg != null)
         {
            CONFIG_URL = cfg;
         }
         else if(this.asguiCfgUrl)
         {
            CONFIG_URL = this.asguiCfgUrl;
         }
         var version:String = parameters["version"];
         if(version != null)
         {
            ConfigManager.impl.version = version;
         }
         _instance = this;
         this._root = this;
         AsguiLogger.Log(this,"Start at bytesLoaded / bytesTotal   =  " + loaderInfo.bytesLoaded + " / " + loaderInfo.bytesTotal);
         try
         {
            root.stage.scaleMode = StageScaleMode.NO_SCALE;
            root.stage.align = StageAlign.TOP_LEFT;
         }
         catch(e:Error)
         {
         }
         AssetManager.instance = new AssetManagerImpl();
         StyleManager._impl = new StyleManagerImpl();
         this.loadingProg = new SystemLoadingBar(this);
         this.loadingProg.AddLoader(this);
         this.loadingProg.AddLoader(StyleManager._impl);
         this.loadingProg.AddLoader(AssetManager.instance);
         this.loadingProg.AddLoader(SS.instance);
         this.loadingProg.AddLoader(ModuleLoaderManager.impl);
         AsguiLogger.Log(this,"Show loadingProgress at bytesLoaded / bytesTotal   =  " + loaderInfo.bytesLoaded + " / " + loaderInfo.bytesTotal);
         this.loadingProg.LoadNext();
         this.watcher = new SystemWatcher(this);
         this.watcher.SetAssetManagerImpl(AssetManager.instance);
         this.watcher.SetStyleManagerImpl(StyleManager._impl);
         PopUpManager._impl = new PopUpManagerImpl();
         this.InitPreload();
      }
      
      public function AddDropDown(param1:DisplayObject, param2:DisplayObject) : void
      {
         if(param1 is UIComponent)
         {
            (param1 as UIComponent).$SetInvisible();
         }
         var _loc3_:Point = param2.localToGlobal(new Point(0,0));
         param1.x = _loc3_.x;
         if(this.application.stage.stageHeight - _loc3_.y - param2.height < param1.height)
         {
            param1.y = _loc3_.y - param1.height;
         }
         else
         {
            param1.y = _loc3_.y + param2.height;
         }
         this.dropDownLayer.addChild(param1);
      }
      
      public function RemoveDropDown(param1:DisplayObject) : void
      {
         if(this.dropDownLayer.contains(param1))
         {
            this.dropDownLayer.removeChild(param1);
         }
      }
      
      public function get application() : Application
      {
         return this._application;
      }
      
      private function EnterFrameHandler(param1:Event) : void
      {
         this.CheckInitialize();
      }
      
      private function InitPreload() : void
      {
         this.LoadConfig();
      }
      
      private function LoadConfig() : void
      {
         ConfigManager.impl.addEventListener(Event.COMPLETE,this.ConfigCompleteHandler);
         ConfigManager.impl.addEventListener(IOErrorEvent.IO_ERROR,this.IoErrorHandler);
         ConfigManager.impl.LoadConfig(CONFIG_URL + (!!ConfigManager.impl.version ? "?v=" + ConfigManager.impl.version : ""));
      }
      
      private function ConfigCompleteHandler(param1:Event) : void
      {
         (param1.currentTarget as IEventDispatcher).removeEventListener(Event.COMPLETE,this.ConfigCompleteHandler);
         (param1.currentTarget as IEventDispatcher).removeEventListener(IOErrorEvent.IO_ERROR,this.IoErrorHandler);
         AsguiLogger.Log(this,"[Config] Loaded");
         this.cfgLoaded = true;
         if(ConfigManager.impl.loadingUrl)
         {
            this.loadingProg.LoadProgressModule(ConfigManager.impl.loadingUrl);
         }
      }
      
      private function InitManagers() : void
      {
         var _loc1_:Class = null;
         if(constructorClassName != null)
         {
            _loc1_ = Class(getDefinitionByName(constructorClassName));
            new _loc1_(this);
         }
         StyleManager.impl.SetSwfAndCss(skinUrls,cssUrls);
         AssetManager.getInstance().SetResourceModules(resourceUrls);
         SS.instance.SetDicts(dictUrls);
      }
      
      private function IoErrorHandler(param1:IOErrorEvent) : void
      {
         Alert.Show(param1.text,"",4,SystemManager.instance);
      }
      
      private function LoadStyle() : void
      {
         StyleManager.impl.addEventListener(Event.COMPLETE,this.StyleCompletedHandler);
         StyleManager.impl.addEventListener(IOErrorEvent.IO_ERROR,this.IoErrorHandler);
         StyleManager.impl.CheckLoad();
      }
      
      private function StyleCompletedHandler(param1:Event) : void
      {
         (param1.currentTarget as IEventDispatcher).removeEventListener(Event.COMPLETE,this.StyleCompletedHandler);
         (param1.currentTarget as IEventDispatcher).removeEventListener(IOErrorEvent.IO_ERROR,this.IoErrorHandler);
         this.styleLoaded = true;
         AsguiLogger.Log(this,"[Styles] Loaded");
         this.LoadDict();
      }
      
      private function LoadResource() : void
      {
         AssetManager.getInstance().addEventListener(Event.COMPLETE,this.ResourceModuleLoadedHandler);
         AssetManager.getInstance().addEventListener(IOErrorEvent.IO_ERROR,this.IoErrorHandler);
         AssetManager.getInstance().CheckLoad();
      }
      
      private function ResourceModuleLoadedHandler(param1:Event) : void
      {
         (param1.currentTarget as IEventDispatcher).removeEventListener(Event.COMPLETE,this.ResourceModuleLoadedHandler);
         (param1.currentTarget as IEventDispatcher).removeEventListener(IOErrorEvent.IO_ERROR,this.IoErrorHandler);
         AsguiLogger.Log(this,"[AssetManager] Loaded");
         this.LoadStyle();
      }
      
      private function LoadDict() : void
      {
         SS.instance.addEventListener(Event.COMPLETE,this.LoadDictCompleteHandler);
         SS.instance.addEventListener(IOErrorEvent.IO_ERROR,this.IoErrorHandler);
         SS.instance.CheckLoad();
      }
      
      private function LoadDictCompleteHandler(param1:Event) : void
      {
         (param1.currentTarget as IEventDispatcher).removeEventListener(Event.COMPLETE,this.LoadDictCompleteHandler);
         (param1.currentTarget as IEventDispatcher).removeEventListener(IOErrorEvent.IO_ERROR,this.IoErrorHandler);
         AsguiLogger.Log(this,"[Dict] Loaded");
         this.LoadModules();
      }
      
      private function LoadModules() : void
      {
         ModuleLoaderManager.impl.addEventListener(Event.COMPLETE,this.LoadModulesCompleteHandler);
         ModuleLoaderManager.impl.addEventListener(IOErrorEvent.IO_ERROR,this.IoErrorHandler);
         ModuleLoaderManager.impl.LoadOrderZeros();
      }
      
      private function LoadModulesCompleteHandler(param1:Event) : void
      {
         (param1.currentTarget as IEventDispatcher).removeEventListener(Event.COMPLETE,this.LoadModulesCompleteHandler);
         (param1.currentTarget as IEventDispatcher).removeEventListener(IOErrorEvent.IO_ERROR,this.IoErrorHandler);
         AsguiLogger.Log(this,"[ModuleLoaderManager] Loaded");
         this.Initialize();
      }
      
      private function CheckInitialize() : void
      {
         if((this.currentFrame > 1 || this.totalFrames == 1) && this.cfgLoaded)
         {
            this.removeEventListener(Event.ENTER_FRAME,this.EnterFrameHandler);
            this.InitManagers();
            this.dispatchEvent(new Event(Event.COMPLETE));
            this.LoadResource();
         }
      }
      
      private function Initialize() : void
      {
         this.applicationClass = Class(com.qq.MyApplication);//Class(getDefinitionByName(applicationClassName));
         this.popUpLayer = new SystemContainer();
         this.popUpLayer.name = "popUpLayer";
         this.popUpLayer.mouseEnabled = false;
         this.m_aryRootLayer.push(this.popUpLayer);
         this.ErrorCodeLayer = new SystemContainer();
         this.ErrorCodeLayer.name = "AlertLayer";
         this.ErrorCodeLayer.mouseEnabled = false;
         this.m_aryRootLayer.push(this.ErrorCodeLayer);
         this.toolTipLayer = new SystemContainer();
         this.toolTipLayer.name = "toolTipLayer";
         this.toolTipLayer.mouseEnabled = false;
         this.toolTipLayer.mouseChildren = false;
         this.m_aryRootLayer.push(this.toolTipLayer);
         this.maskLayer = new SystemContainer();
         this.maskLayer.name = "maskLayer";
         this.maskLayer.mouseEnabled = false;
         this.m_aryRootLayer.push(this.maskLayer);
         this.dropDownLayer = new SystemContainer();
         this.dropDownLayer.name = "dropDownLayer";
         this.dropDownLayer.mouseEnabled = false;
         this.m_aryRootLayer.push(this.dropDownLayer);
         this.dragLayer = new SystemContainer();
         this.dragLayer.name = "dragLayer";
         this.dragLayer.mouseChildren = false;
         this.dragLayer.mouseEnabled = false;
         this.m_aryRootLayer.push(this.dragLayer);
         this.cursorLayer = new SystemContainer();
         this.cursorLayer.name = "cursorLayer";
         this.cursorLayer.mouseChildren = false;
         this.cursorLayer.mouseEnabled = false;
         this.m_aryRootLayer.push(this.cursorLayer);
         CursorManager._impl = new CursorManagerImpl();
         DragManager._impl = new DragManagerImpl();
         ToolTipManager._impl = new ToolTipManagerImpl();
         this._application = new this.applicationClass(this) as Application;
         this._application.name = "application";
         this._root.addChild(this._application);
         this._root.addChild(this.popUpLayer);
         this._root.addChild(this.maskLayer);
         this._root.addChild(this.dropDownLayer);
         this._root.addChild(this.toolTipLayer);
         this._root.addChild(this.dragLayer);
         this._root.addChild(this.cursorLayer);
         this._root.addChild(this.ErrorCodeLayer);
         if(ConfigManager.impl.loadingDisposeOrder == 0)
         {
            this.loadingProg.Dispose();
            this.loadingProg = null;
         }
         else
         {
            this.setChildIndex(this.loadingProg,this.numChildren - 1);
         }
      }
      
      public function get workingLoader() : *
      {
         return this;
      }
      
      public function get leftLoaders() : int
      {
         return 1;
      }
   }
}
