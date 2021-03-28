package asgui.resources
{
   import asgui.logger.AsguiLogger;
   import asgui.managers.ConfigManager;
   import asgui.managers.LoaderCollection;
   import asgui.managers.LoaderManager;
   import asgui.managers.SystemManager;
   import asgui.utils.StringUtil;
   import flash.display.DisplayObjectContainer;
   import flash.display.Loader;
   import flash.display.LoaderInfo;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.utils.getTimer;
   
   public class AssetManagerImpl extends EventDispatcher implements IAssetManager
   {
       
      
      private var resourceModules:Array;
      
      private var initializedForNonFrameworkApp:Boolean = false;
      
      public var _urlChangeFunction:Function;
      
      private var _workingLoader;
      
      private var urls:Array;
      
      private var orderUrls:Array;
      
      private var checkLoadingList:Vector.<Array>;
      
      private var _resourceBundle:IAssetBundle;
      
      public function AssetManagerImpl()
      {
         this.resourceModules = [];
         this._urlChangeFunction = this.defaultUrlChangeFunction;
         this.urls = [];
         this.orderUrls = [];
         this.checkLoadingList = new Vector.<Array>();
         super();
      }
      
      public function set urlChangeFunction(param1:Function) : void
      {
         this._urlChangeFunction = param1;
      }
      
      private function defaultUrlChangeFunction(param1:String) : String
      {
         return param1 + "?v=" + ConfigManager.impl.version;
      }
      
      public function get workingLoader() : *
      {
         return this._workingLoader;
      }
      
      public function get leftLoaders() : int
      {
         return this.urls.length;
      }
      
      public function SetResourceModules(param1:Array, param2:Boolean = true) : void
      {
         this.urls = this.urls.concat(param1);
      }
      
      public function AddResourceModules(param1:String, param2:int) : void
      {
         if(this.orderUrls[param2] == null)
         {
            this.orderUrls[param2] = [];
         }
         (this.orderUrls[param2] as Array).push(param1);
      }
      
      public function HasUrlsNeedToLoad(param1:Vector.<int>) : Boolean
      {
         var _loc2_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < param1.length)
         {
            if(this.orderUrls[param1[_loc2_]] != null)
            {
               return true;
            }
            _loc2_++;
         }
         return false;
      }
      
      public function CheckLoad(param1:Vector.<int> = null) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Array = null;
         var _loc4_:String = null;
         var _loc5_:Class = null;
         var _loc6_:Loader = null;
         var _loc7_:DisplayObjectContainer = null;
         var _loc8_:LoaderCollection = null;
         if(param1 != null)
         {
            _loc3_ = [];
            _loc2_ = 0;
            while(_loc2_ < param1.length)
            {
               if(this.orderUrls[param1[_loc2_]] != null)
               {
                  _loc3_ = _loc3_.concat(this.orderUrls[param1[_loc2_]]);
               }
               _loc2_++;
            }
            if(_loc3_.length <= 0)
            {
               return;
            }
            this.SetResourceModules(_loc3_);
         }
         while(this.urls.length > 0)
         {
            _loc4_ = this.urls.shift();
            if(SystemManager.instance.hasOwnProperty(_loc4_))
            {
               _loc5_ = SystemManager.instance[_loc4_];
            }
            else
            {
               _loc5_ = AssetManager.GetClass(_loc4_);
            }
            if(_loc5_ != null)
            {
               _loc6_ = (_loc7_ = new _loc5_()).getChildAt(0) as Loader;
               this._workingLoader = Loader;
            }
            else
            {
               _loc6_ = (_loc8_ = LoaderManager.GetLoaderCollection(this._urlChangeFunction(_loc4_),true)).GetLoader();
               this._workingLoader = _loc8_.byteLoader;
               AsguiLogger.Log(this,"CheckLoad :: " + _loc4_ + " :: " + getTimer());
            }
            _loc6_.contentLoaderInfo.addEventListener(Event.COMPLETE,this.ModuleComletedHandler);
            _loc6_.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.IoErrorHandler);
            _loc6_.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS,this.ProgressHandler);
            this.checkLoadingList.push([_loc4_,_loc6_]);
         }
         this.CheckLoadComplete();
      }
      
      public function CheckUnload(param1:Vector.<int> = null) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Array = null;
         if(param1 != null)
         {
            _loc3_ = [];
            _loc2_ = 0;
            while(_loc2_ < param1.length)
            {
               if(this.orderUrls[param1[_loc2_]] != null)
               {
                  _loc3_ = _loc3_.concat(this.orderUrls[param1[_loc2_]]);
               }
               _loc2_++;
            }
            while(_loc3_.length > 0)
            {
               this.resourceBundle.RemoveContent(_loc3_.pop());
            }
         }
      }
      
      public function CheckLoadComplete() : void
      {
         if(this.checkLoadingList.length == 0)
         {
            this._workingLoader = null;
            this.dispatchEvent(new Event(Event.COMPLETE));
         }
      }
      
      private function ModuleComletedHandler(param1:Event) : void
      {
         var _loc3_:String = null;
         var _loc4_:int = 0;
         (param1.currentTarget as IEventDispatcher).removeEventListener(Event.COMPLETE,this.ModuleComletedHandler);
         (param1.currentTarget as IEventDispatcher).removeEventListener(IOErrorEvent.IO_ERROR,this.IoErrorHandler);
         (param1.currentTarget as IEventDispatcher).removeEventListener(ProgressEvent.PROGRESS,this.ProgressHandler);
         var _loc2_:LoaderInfo = param1.currentTarget as LoaderInfo;
         _loc4_ = 0;
         while(_loc4_ < this.checkLoadingList.length)
         {
            if(this.checkLoadingList[_loc4_][1] == _loc2_.loader)
            {
               _loc3_ = this.checkLoadingList[_loc4_][0];
               AsguiLogger.Log(this,"[ResourceModule] " + _loc3_ + " loaded");
               this.checkLoadingList.splice(_loc4_,1);
               break;
            }
            _loc4_++;
         }
         this.resourceBundle.AddContent(_loc2_,_loc3_);
         this.CheckLoadComplete();
      }
      
      private function IoErrorHandler(param1:IOErrorEvent) : void
      {
         this.dispatchEvent(param1.clone());
      }
      
      private function ProgressHandler(param1:ProgressEvent) : void
      {
      }
      
      public function GetObject(param1:String) : *
      {
         if(!this.resourceBundle)
         {
            return undefined;
         }
         return this.resourceBundle.GetContent(param1);
      }
      
      public function GetString(param1:String, param2:Array = null) : String
      {
         if(!this.resourceBundle)
         {
            return null;
         }
         var _loc3_:String = String(this.resourceBundle.GetContent(param1));
         if(param2)
         {
            _loc3_ = StringUtil.substitute(_loc3_,param2);
         }
         return _loc3_;
      }
      
      public function GetStringArray(param1:String) : Array
      {
         if(!this.resourceBundle)
         {
            return null;
         }
         var _loc2_:* = this.resourceBundle.GetContent(param1);
         var _loc3_:Array = String(_loc2_).split(",");
         var _loc4_:int = _loc3_.length;
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_[_loc5_] = StringUtil.trim(_loc3_[_loc5_]);
            _loc5_++;
         }
         return _loc3_;
      }
      
      public function GetNumber(param1:String) : Number
      {
         if(!this.resourceBundle)
         {
            return NaN;
         }
         var _loc2_:* = this.resourceBundle.GetContent(param1);
         return Number(_loc2_);
      }
      
      public function GetInt(param1:String) : int
      {
         if(!this.resourceBundle)
         {
            return 0;
         }
         var _loc2_:* = this.resourceBundle.GetContent(param1);
         return int(_loc2_);
      }
      
      public function GetUint(param1:String) : uint
      {
         if(!this.resourceBundle)
         {
            return 0;
         }
         var _loc2_:* = this.resourceBundle.GetContent(param1);
         return uint(_loc2_);
      }
      
      public function GetBoolean(param1:String) : Boolean
      {
         if(!this.resourceBundle)
         {
            return false;
         }
         var _loc2_:* = this.resourceBundle.GetContent(param1);
         return String(_loc2_).toLowerCase() == "true";
      }
      
      public function GetClass(param1:String) : Class
      {
         if(!this.resourceBundle)
         {
            return null;
         }
         var _loc2_:* = this.resourceBundle.GetContent(param1);
         return _loc2_ as Class;
      }
      
      public function GetNewClass(param1:String) : Object
      {
         var _loc2_:Class = this.GetClass(param1);
         if(_loc2_ == null)
         {
            return null;
         }
         return new _loc2_();
      }
      
      private function get resourceBundle() : IAssetBundle
      {
         if(this._resourceBundle == null)
         {
            this._resourceBundle = new AssetBundle();
         }
         return this._resourceBundle;
      }
      
      public function AddResource(param1:String, param2:Class) : void
      {
         this.resourceBundle.AddResource(param1,param2);
      }
      
      public function AddContent(param1:LoaderInfo, param2:String) : void
      {
         this.resourceBundle.AddContent(param1,param2);
      }
   }
}
