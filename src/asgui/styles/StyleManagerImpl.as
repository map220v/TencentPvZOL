package asgui.styles
{
   import asgui.core.ByteLoader;
   import asgui.core.UIComponent;
   import asgui.logger.AsguiLogger;
   import asgui.managers.ConfigManager;
   import asgui.managers.LoaderCollection;
   import asgui.managers.LoaderManager;
   import asgui.managers.ShareManager;
   import asgui.managers.SystemManager;
   import asgui.resources.AssetManager;
   import asgui.serialization.css.CssDeserializer;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Loader;
   import flash.display.LoaderInfo;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.system.ApplicationDomain;
   import flash.utils.ByteArray;
   import flash.utils.getDefinitionByName;
   import flash.utils.getQualifiedClassName;
   import flash.utils.getQualifiedSuperclassName;
   
   public class StyleManagerImpl extends EventDispatcher implements IStyleManagerImpl
   {
       
      
      private var applicationDomains:Array;
      
      private var styleDatas:Array;
      
      private var styleSkinInfos:Array;
      
      public var styleCsses:Array;
      
      private var styleDeclaration:Array;
      
      private var upperExtendClassStyleDeclarations:Array;
      
      private var swfUrls:Array;
      
      private var cssUrls:Array;
      
      private var lastSwfUrl:String;
      
      private var _workingLoader;
      
      public function StyleManagerImpl()
      {
         this.applicationDomains = [];
         this.styleDatas = [];
         this.styleSkinInfos = [];
         this.styleCsses = [];
         this.styleDeclaration = [];
         this.upperExtendClassStyleDeclarations = [];
         this.swfUrls = [];
         this.cssUrls = [];
         super();
      }
      
      private static function GetExtendsSuperClass(param1:String) : String
      {
         switch(param1)
         {
            case "Window":
               return "asgui.containers::Panel";
            case "Canvas":
            case "Panel":
               return "asgui.core::Container";
            default:
               return "asgui.core::UIComponent";
         }
      }
      
      public function GetStyleNamesByUITypeName(param1:String) : Array
      {
         var _loc3_:Array = null;
         var _loc2_:Array = [param1];
         for each(_loc3_ in this.styleCsses)
         {
            if(_loc3_[0] == param1)
            {
               _loc2_.push(_loc3_[2]);
            }
         }
         return _loc2_;
      }
      
      public function GetStyleSkin(param1:StyleSkinInfo) : StyleSkin
      {
         if(param1 == null)
         {
            return null;
         }
         return new StyleSkin(param1);
      }
      
      public function GetSkinInfo(param1:String) : StyleSkinInfo
      {
         if(param1 == null || param1.length <= 4)
         {
            return null;
         }
         if(this.styleSkinInfos[param1] == null)
         {
            this.styleSkinInfos[param1] = new StyleSkinInfo(param1);
         }
         return this.styleSkinInfos[param1] as StyleSkinInfo;
      }
      
      public function GetStyleData(param1:SkinDataInfo) : SkinData
      {
         var _loc2_:Class = null;
         var _loc3_:DisplayObject = null;
         var _loc4_:SkinData = null;
         var _loc5_:ApplicationDomain = null;
         if(this.styleDatas[param1.sourceName] == null)
         {
            this.styleDatas[param1.sourceName] = [];
         }
         if(this.styleDatas[param1.sourceName][param1.symbolName] != null)
         {
            return this.styleDatas[param1.sourceName][param1.symbolName] as SkinData;
         }
         var _loc6_:* = SystemManager.instance.loaderInfo.applicationDomain;
         if(SystemManager.instance.loaderInfo.applicationDomain.hasDefinition(param1.symbolName))
         {
            _loc5_ = SystemManager.instance.loaderInfo.applicationDomain;
         }
         else
         {
            _loc5_ = this.applicationDomains[param1.sourceName] as ApplicationDomain;
         }
         if(_loc5_ && _loc5_.hasDefinition(param1.symbolName))
         {
            _loc2_ = _loc5_.getDefinition(param1.symbolName) as Class;
            _loc3_ = new _loc2_() as DisplayObject;
            _loc4_ = new SkinData(param1,_loc3_);
            this.styleDatas[param1.sourceName][param1.symbolName] = _loc4_;
            return _loc4_;
         }
         _loc3_ = AssetManager.GetNewClass(param1.symbolName) as DisplayObject;
         _loc4_ = new SkinData(param1,_loc3_);
         this.styleDatas[param1.sourceName][param1.symbolName] = _loc4_;
         return _loc4_;
      }
      
      public function GetStyleDeclaration(param1:String, param2:Object = null) : StyleDeclaration
      {
         var _loc3_:StyleDeclaration = null;
         var _loc4_:String = null;
         var _loc5_:Class = null;
         var _loc6_:String = null;
         if(param1 == null || param2 == null)
         {
            return this.styleDeclaration["UIComponent"];
         }
         if(this.styleDeclaration[param1] == null)
         {
            this.styleDeclaration[param1] = new StyleDeclaration(param1,this.styleCsses[param1]);
            _loc3_ = this.styleDeclaration[param1];
            if(_loc3_.extendsName != null)
            {
               _loc3_.inherited = this.GetStyleDeclaration(_loc3_.extendsName,GetExtendsSuperClass(_loc3_.extendsName));
            }
            else
            {
               if(param2 is Class)
               {
                  _loc5_ = param2 as Class;
               }
               else
               {
                  _loc6_ = param2 is String ? param2 as String : getQualifiedClassName(param2);
                  _loc5_ = getDefinitionByName(_loc6_) as Class;
               }
               if(_loc5_["STYLE"] != param1 && _loc5_["STYLE"] != null && param1.indexOf(".") != -1)
               {
                  (this.styleDeclaration[param1] as StyleDeclaration).inherited = this.GetStyleDeclaration(_loc5_["STYLE"],_loc5_);
               }
               else if(param1 != "UIComponent")
               {
                  _loc5_ = null;
                  while(!((_loc4_ = getQualifiedSuperclassName(_loc5_ != null ? _loc5_ : param2)) == null || _loc4_ == "asgui.core::UIComponent"))
                  {
                     if(_loc4_.split("::")[1] == param1)
                     {
                        _loc5_ = getDefinitionByName(_loc4_) as Class;
                        _loc4_ = getQualifiedSuperclassName(_loc5_);
                     }
                     if(!((_loc5_ = getDefinitionByName(_loc4_) as Class)["STYLE"] == null && _loc5_ != UIComponent))
                     {
                        break;
                     }
                  }
                  if(_loc5_ == null)
                  {
                     _loc5_ = UIComponent;
                  }
                  (this.styleDeclaration[param1] as StyleDeclaration).inherited = this.GetStyleDeclaration(_loc5_["STYLE"],_loc5_);
               }
            }
         }
         return this.styleDeclaration[param1] as StyleDeclaration;
      }
      
      public function GetUpperExtendClassStyleDeclarations(param1:String, param2:Object) : Array
      {
         var _loc3_:StyleDeclaration = null;
         var _loc4_:Array = null;
         var _loc5_:Array = null;
         if(this.upperExtendClassStyleDeclarations[param1] == null)
         {
            _loc4_ = [];
            for each(_loc5_ in this.styleCsses)
            {
               if(_loc5_[0] == param1)
               {
                  _loc4_.push(this.GetStyleDeclaration(_loc5_[2],param2));
               }
               else if(_loc5_[2] == param1)
               {
                  _loc4_.push(this.GetStyleDeclaration(param1,param2));
                  _loc3_ = this.GetStyleDeclaration(param1,param2);
               }
            }
            if(_loc3_ && _loc3_.inherited)
            {
               _loc4_.concat(this.GetUpperExtendClassStyleDeclarations(_loc3_.inherited.name,param2));
            }
            this.upperExtendClassStyleDeclarations[param1] = _loc4_;
         }
         return this.upperExtendClassStyleDeclarations[param1];
      }
      
      public function GetTotalSkinDataMemSize(param1:Boolean = false) : int
      {
         var _loc2_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Array = null;
         var _loc6_:SkinData = null;
         var _loc3_:int = 0;
         if(!param1)
         {
         }
         for each(_loc5_ in this.styleDatas)
         {
            for each(_loc6_ in _loc5_)
            {
               _loc4_ = _loc6_.GetTotalPixelSize() * 4;
               if(!param1)
               {
               }
               _loc3_ += _loc4_;
            }
         }
         if(!param1)
         {
         }
         return _loc3_;
      }
      
      function CleanDeclaration() : void
      {
         this.styleDeclaration = [];
      }
      
      function CleanSkins() : void
      {
         this.styleDatas = [];
      }
      
      public function SetSwfAndCss(param1:Array, param2:Array) : void
      {
         this.swfUrls = param1;
         this.cssUrls = param2;
      }
      
      public function AddCss(param1:String) : void
      {
         this.cssUrls.push(param1);
      }
      
      public function AddSwf(param1:String) : void
      {
         this.swfUrls.push(param1);
      }
      
      public function CheckLoad() : void
      {
         var _loc1_:Class = null;
         var _loc2_:DisplayObjectContainer = null;
         var _loc3_:String = null;
         var _loc4_:Loader = null;
         var _loc5_:LoaderCollection = null;
         var _loc6_:ByteLoader = null;
         var _loc7_:String = null;
         var _loc8_:ByteArray = null;
         if(this.swfUrls.length > 0)
         {
            _loc3_ = this.swfUrls.shift();
            this.lastSwfUrl = _loc3_;
            if(!(ShareManager.impl.skinDataShare && ShareManager.impl.skinDataShare.Has(_loc3_)))
            {
               if(SystemManager.instance.hasOwnProperty(_loc3_))
               {
                  _loc1_ = SystemManager.instance[_loc3_];
               }
               else
               {
                  _loc1_ = AssetManager.GetClass(_loc3_);
               }
               if(_loc1_ != null)
               {
                  _loc2_ = new _loc1_();
                  _loc4_ = _loc2_.getChildAt(0) as Loader;
                  this._workingLoader = _loc4_;
               }
               else
               {
                  _loc4_ = (_loc5_ = LoaderManager.GetLoaderCollection(_loc3_)).GetLoader();
                  this._workingLoader = _loc5_.byteLoader;
               }
               _loc4_.contentLoaderInfo.addEventListener(Event.COMPLETE,this.SwfCompletedHandler);
               _loc4_.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.IoErrorHandler);
               _loc4_.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS,this.ProgressHandler);
            }
         }
         else if(this.cssUrls.length > 0)
         {
            _loc7_ = this.cssUrls.shift();
            if(SystemManager.instance.hasOwnProperty(_loc7_))
            {
               _loc1_ = SystemManager.instance[_loc7_];
            }
            else
            {
               _loc1_ = AssetManager.GetClass(_loc7_);
            }
            if(_loc1_ != null)
            {
               _loc8_ = new _loc1_() as ByteArray;
               (_loc6_ = new ByteLoader()).LoadByteArray(_loc8_);
            }
            else
            {
               _loc6_ = LoaderManager.GetByteLoader(_loc7_ + "?v=" + ConfigManager.impl.version);
            }
            this._workingLoader = _loc6_;
            _loc6_.addEventListener(Event.COMPLETE,this.CssComletedHandler);
            _loc6_.addEventListener(IOErrorEvent.IO_ERROR,this.IoErrorHandler);
            _loc6_.addEventListener(ProgressEvent.PROGRESS,this.ProgressHandler);
         }
         else
         {
            this._workingLoader = null;
            this.dispatchEvent(new Event(Event.COMPLETE));
         }
      }
      
      private function IoErrorHandler(param1:IOErrorEvent) : void
      {
         this.dispatchEvent(param1.clone());
      }
      
      private function SwfCompletedHandler(param1:Event) : void
      {
         (param1.currentTarget as IEventDispatcher).removeEventListener(Event.COMPLETE,this.SwfCompletedHandler);
         (param1.currentTarget as IEventDispatcher).removeEventListener(IOErrorEvent.IO_ERROR,this.IoErrorHandler);
         (param1.currentTarget as IEventDispatcher).removeEventListener(ProgressEvent.PROGRESS,this.ProgressHandler);
         var _loc2_:LoaderInfo = param1.currentTarget as LoaderInfo;
         var _loc3_:String = this.lastSwfUrl.split("?")[0];
         var _loc4_:String = _loc3_.indexOf("\\") != -1 ? "\\" : "/";
         var _loc5_:Array = _loc3_.split(_loc4_);
         var _loc6_:String = _loc5_[_loc5_.length - 1];
         this.applicationDomains[_loc6_] = _loc2_.applicationDomain;
         var _loc7_:DisplayObjectContainer;
         if((_loc7_ = _loc2_.content as DisplayObjectContainer) && _loc7_.numChildren > 0)
         {
            while(_loc7_.numChildren > 0)
            {
               _loc7_.removeChildAt(0);
            }
         }
         AsguiLogger.Log(this,"[Skin] " + _loc6_ + " loaded");
         this.CheckLoad();
      }
      
      private function ProgressHandler(param1:ProgressEvent) : void
      {
      }
      
      private function CssComletedHandler(param1:Event) : void
      {
         var _loc6_:int = 0;
         var _loc7_:String = null;
         var _loc8_:String = null;
         var _loc9_:String = null;
         var _loc10_:Array = null;
         (param1.currentTarget as IEventDispatcher).removeEventListener(Event.COMPLETE,this.CssComletedHandler);
         (param1.currentTarget as IEventDispatcher).removeEventListener(IOErrorEvent.IO_ERROR,this.IoErrorHandler);
         (param1.currentTarget as IEventDispatcher).removeEventListener(ProgressEvent.PROGRESS,this.ProgressHandler);
         var _loc2_:ByteLoader = param1.currentTarget as ByteLoader;
         AsguiLogger.Log(this,"[CSS] " + " loaded");
         var _loc3_:String = CssDeserializer.GetCleanCode(_loc2_.data.toString());
         var _loc4_:RegExp = /\r\n/g;
         _loc3_ = _loc3_.replace(_loc4_,"");
         _loc4_ = /\n/g;
         _loc3_ = _loc3_.replace(_loc4_,"");
         _loc4_ = / /g;
         _loc3_ = _loc3_.replace(_loc4_,"");
         this.CleanDeclaration();
         this.CleanSkins();
         var _loc5_:Array = CssDeserializer.SeparateIntoTags(_loc3_);
         _loc6_ = 0;
         while(_loc6_ < _loc5_.length)
         {
            _loc7_ = (_loc10_ = _loc5_[_loc6_].toString().split(":"))[0];
            _loc8_ = _loc10_.length > 1 ? _loc10_[1] : null;
            _loc9_ = _loc5_[_loc6_ + 1];
            this.styleCsses[_loc7_] = [_loc8_,_loc9_,_loc7_];
            _loc6_ += 2;
         }
         this.CheckLoad();
      }
      
      public function get workingLoader() : *
      {
         return this._workingLoader;
      }
      
      public function get leftLoaders() : int
      {
         return this.cssUrls.length + this.swfUrls.length;
      }
   }
}
