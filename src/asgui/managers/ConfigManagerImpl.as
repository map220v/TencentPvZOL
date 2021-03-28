package asgui.managers
{
   import asgui.core.ByteLoader;
   import asgui.modules.ModuleLoaderManager;
   import asgui.resources.AssetManager;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.events.IOErrorEvent;
   
   class ConfigManagerImpl extends EventDispatcher
   {
       
      
      public var version:String = "0";
      
      private var _resourceUrlChangeFunc:Function;
      
      private var _loadingLabel:String = "";
      
      public var loadingUrl:String;
      
      public var loadingDisposeOrder:int;
      
      private var configAdd:Array;
      
      private var configXmlList:XMLList;
      
      private var xmlInfos:Array;
      
      public var configModuleXmlInfos:Vector.<ConfigModuleXmlInfo>;
      
      public var skinUrlsOrderOne:Array;
      
      public var cssUrlsOrderOne:Array;
      
      private var resourceUrlsOrderOne:Array;
      
      private var dictUrlsOrderOne:Array;
      
      function ConfigManagerImpl()
      {
         this._resourceUrlChangeFunc = function(param1:String):String
         {
            return param1;
         };
         this.configAdd = [];
         this.xmlInfos = [];
         this.configModuleXmlInfos = new Vector.<ConfigModuleXmlInfo>();
         this.skinUrlsOrderOne = [];
         this.cssUrlsOrderOne = [];
         this.resourceUrlsOrderOne = [];
         this.dictUrlsOrderOne = [];
         super();
      }
      
      public function set resourceUrlChangeFunc(param1:Function) : void
      {
         this._resourceUrlChangeFunc = param1;
      }
      
      public function get loadingLabel() : String
      {
         return this._loadingLabel;
      }
      
      public function GetConfig(param1:String) : String
      {
         return this.configAdd[param1];
      }
      
      public function GetConfigByType(param1:String) : Array
      {
         var list:XMLList = null;
         var arr:Array = null;
         var i:int = 0;
         var type1:String = param1;
         if(this.configXmlList != null)
         {
            list = this.configXmlList.(@type == type1);
            arr = [];
            i = 0;
            while(i < list.length())
            {
               arr.push(list[i]);
               i++;
            }
            return arr;
         }
         return [];
      }
      
      public function AddConfigXmlList(param1:XMLList) : void
      {
         var _loc3_:int = 0;
         var _loc4_:XML = null;
         this.configXmlList = param1;
         var _loc2_:int = param1.length();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1[_loc3_];
            this.configAdd[String(_loc4_.@name)] = String(_loc4_.@value);
            _loc3_++;
         }
      }
      
      public function AddXml(param1:String, param2:Object, param3:int = -1) : void
      {
         this.xmlInfos[param1] = new ConfigXmlInfo(param1,param2,param3);
      }
      
      public function GetXml(param1:String) : XML
      {
         return (this.xmlInfos[param1] as ConfigXmlInfo).xml;
      }
      
      function LoadConfig(param1:String) : void
      {
         var _loc2_:ByteLoader = new ByteLoader();
         _loc2_.addEventListener(Event.COMPLETE,this.ConfigCompleteHandler);
         _loc2_.addEventListener(IOErrorEvent.IO_ERROR,this.IoErrorHandler);
         _loc2_.Load(param1);
      }
      
      private function ConfigCompleteHandler(param1:Event) : void
      {
         (param1.currentTarget as IEventDispatcher).removeEventListener(Event.COMPLETE,this.ConfigCompleteHandler);
         (param1.currentTarget as IEventDispatcher).removeEventListener(IOErrorEvent.IO_ERROR,this.IoErrorHandler);
         var _loc2_:String = (param1.currentTarget as ByteLoader).data.toString();
         this.Parse(_loc2_);
         this.dispatchEvent(new Event(Event.COMPLETE));
      }
      
      private function IoErrorHandler(param1:IOErrorEvent) : void
      {
         this.dispatchEvent(param1.clone());
      }
      
      private function Parse(param1:String) : void
      {
         var _loc12_:int = 0;
         var _loc13_:XML = null;
         var _loc15_:String = null;
         var _loc16_:ConfigModuleXmlInfo = null;
         var _loc17_:XML = null;
         var _loc18_:XML = null;
         var _loc19_:XML = null;
         var _loc2_:XML = XML(param1);
         var _loc3_:XML = _loc2_[0]["System"][0]["applicationClassName"][0];
         var _loc4_:XML = _loc2_[0]["System"][0]["constructorClassName"][0];
         var _loc5_:XML = _loc2_[0]["System"][0]["loading"][0];
         var _loc6_:XMLList = _loc2_[0]["System"][0]["module"];
         var _loc7_:XMLList = _loc2_[0]["Resource"][0]["skin"];
         var _loc8_:XMLList = _loc2_[0]["Resource"][0]["css"];
         var _loc9_:XMLList = _loc2_[0]["Resource"][0]["resource"];
         var _loc10_:XMLList = _loc2_[0]["Resource"][0]["dict"];
         var _loc11_:XML = _loc2_[0]["System"][0]["shares"][0];
         SystemManager.applicationClassName = _loc3_.@value;
         if(_loc4_)
         {
            SystemManager.constructorClassName = _loc4_.@value;
         }
         _loc12_ = 0;
         while(_loc12_ < _loc7_.length())
         {
            _loc13_ = _loc7_[_loc12_];
            if(int(_loc13_.@order) == 0)
            {
               SystemManager.skinUrls.push(_loc13_.@value);
            }
            else
            {
               this.skinUrlsOrderOne.push(_loc13_.@value);
            }
            _loc12_++;
         }
         _loc12_ = 0;
         while(_loc12_ < _loc8_.length())
         {
            _loc13_ = _loc8_[_loc12_];
            if(int(_loc13_.@order) == 0)
            {
               SystemManager.cssUrls.push(_loc13_.@value);
            }
            else
            {
               this.cssUrlsOrderOne.push(_loc13_.@value);
            }
            _loc12_++;
         }
         _loc12_ = 0;
         while(_loc12_ < _loc9_.length())
         {
            _loc13_ = _loc9_[_loc12_];
            if(int(_loc13_.@order) == 0)
            {
               _loc15_ = this._resourceUrlChangeFunc(String(_loc13_.@value));
               SystemManager.resourceUrls.push(_loc15_);
            }
            else
            {
               AssetManager.instance.AddResourceModules(_loc13_.@value,int(_loc13_.@order));
            }
            _loc12_++;
         }
         _loc12_ = 0;
         while(_loc12_ < _loc10_.length())
         {
            _loc13_ = _loc10_[_loc12_];
            if(int(_loc13_.@order) == 0)
            {
               SystemManager.dictUrls.push(_loc13_.@value);
            }
            else
            {
               this.dictUrlsOrderOne.push(_loc13_.@value);
            }
            _loc12_++;
         }
         _loc12_ = 0;
         while(_loc12_ < _loc6_.length())
         {
            _loc13_ = _loc6_[_loc12_];
            _loc16_ = new ConfigModuleXmlInfo(_loc13_.@value,_loc13_);
            this.configModuleXmlInfos.push(_loc16_);
            if(_loc16_.order == 0)
            {
               ModuleLoaderManager.impl.moduleOrderZeroUrls.push(_loc16_.order);
            }
            _loc12_++;
         }
         if(_loc5_)
         {
            this._loadingLabel = _loc5_.@label;
            if(String(_loc5_.@url).length > 0)
            {
               this.loadingUrl = _loc5_.@url;
               this.loadingDisposeOrder = int(_loc5_.@disposeOrder);
            }
         }
         if(_loc11_ != null)
         {
            _loc17_ = _loc11_["paramShare"][0];
            _loc18_ = _loc11_["skinDataShare"][0];
            _loc19_ = _loc11_["blitDataShare"][0];
            if(_loc17_ != null)
            {
               ShareManager.impl.SetShareInit(_loc17_.@name);
            }
            if(_loc18_ != null)
            {
               ShareManager.impl.SetSkinDataShareInit(_loc18_.@name,_loc18_.@maxSize);
            }
            if(_loc19_ != null)
            {
               ShareManager.impl.SetBlitDataShareInit(_loc19_.@name,_loc19_.@maxSize);
            }
         }
         var _loc14_:XMLList = _loc2_[0]["ConfigSections"][0]["add"];
         this.AddConfigXmlList(_loc14_);
      }
   }
}
