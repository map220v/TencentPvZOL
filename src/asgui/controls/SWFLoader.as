package asgui.controls
{
   import asgui.core.IListItemRenderer;
   import asgui.core.UIComponent;
   import asgui.logger.AsguiLogger;
   import asgui.managers.LoaderManager;
   import asgui.styles.StyleManager;
   import asgui.styles.StyleSkin;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.InteractiveObject;
   import flash.display.Loader;
   import flash.display.LoaderInfo;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   import flash.net.URLRequest;
   import flash.system.ApplicationDomain;
   import flash.system.LoaderContext;
   import flash.utils.ByteArray;
   
   public class SWFLoader extends UIComponent implements IListItemRenderer
   {
       
      
      public var mcHolder:DisplayObject;
      
      protected var $SkinBroken:StyleSkin;
      
      protected var bmpdHolder:BitmapData;
      
      public var loader:Loader;
      
      public var url:String;
      
      private var isContentLoaded:Boolean;
      
      private var isLoadFailed:Boolean;
      
      protected var sourceWidth:int;
      
      protected var sourceHeight:int;
      
      private var _source:Object;
      
      private var contentChanged:Boolean;
      
      public var ifRemovePreChildWhenChangeSource:Boolean = false;
      
      private var _loadTimeout:int = 0;
      
      private var _useLoaderManager:Boolean = true;
      
      private var _scaleContent:Boolean = false;
      
      private var scaleContentChanged:Boolean;
      
      private var _maintainAspectRatio:Boolean = true;
      
      protected var aspectRatio:Number;
      
      private var _scrollRectEnabled:Boolean = true;
      
      private var outterCallClassOrString:Object;
      
      public function SWFLoader()
      {
         super();
      }
      
      override public function Dispose() : void
      {
         if(this.loader)
         {
            this.loader.contentLoaderInfo.removeEventListener(Event.COMPLETE,this.LoaderComletedHandler);
            this.loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,this.LoaderIoErrorHandler);
            this.loader = null;
         }
         this.mcHolder = null;
         this.$SkinBroken = null;
         this.bmpdHolder = null;
         this.outterCallClassOrString = null;
         while(this.numChildren > 0)
         {
            this.removeChildAt(0);
         }
         super.Dispose();
      }
      
      override public function set doubleClickEnabled(param1:Boolean) : void
      {
         super.doubleClickEnabled = param1;
         if(this.mcHolder is InteractiveObject)
         {
            (this.mcHolder as InteractiveObject).doubleClickEnabled = this.doubleClickEnabled;
         }
      }
      
      public function get source() : Object
      {
         return this._source;
      }
      
      public function set source(param1:Object) : void
      {
         if(this._source != param1)
         {
            this._source = param1;
            this.contentChanged = true;
            if(this.ifRemovePreChildWhenChangeSource)
            {
               if(this.mcHolder)
               {
                  if(this.mcHolder.parent != null)
                  {
                     this.removeChild(this.mcHolder);
                  }
                  this.mcHolder = null;
               }
               this.outterCallClassOrString = null;
            }
            InvalidateProperties();
            if(param1 is Class)
            {
               this.ValidateProperties();
            }
         }
      }
      
      public function get loadTimeout() : int
      {
         return this._loadTimeout;
      }
      
      public function set loadTimeout(param1:int) : void
      {
         if(this._loadTimeout != param1)
         {
            this._loadTimeout = param1;
         }
      }
      
      public function get useLoaderManager() : Boolean
      {
         return this._useLoaderManager;
      }
      
      public function set useLoaderManager(param1:Boolean) : void
      {
         this._useLoaderManager = param1;
      }
      
      public function get scaleContent() : Boolean
      {
         return this._scaleContent;
      }
      
      public function set scaleContent(param1:Boolean) : void
      {
         if(this._scaleContent != param1)
         {
            this._scaleContent = param1;
            this.scaleContentChanged = true;
            InvalidateSkin();
         }
      }
      
      public function get maintainAspectRatio() : Boolean
      {
         return this._maintainAspectRatio;
      }
      
      public function set maintainAspectRatio(param1:Boolean) : void
      {
         this._maintainAspectRatio = param1;
      }
      
      override public function set data(param1:Object) : void
      {
         super.data = param1;
         if(param1 is String)
         {
            this.source = param1 as String;
         }
         else if(data.hasOwnProperty(this.dataField))
         {
            this.source = data[dataField];
         }
      }
      
      override public function get dataEditable() : Boolean
      {
         return false;
      }
      
      public function get contentWidth() : int
      {
         var _loc2_:int = 0;
         var _loc1_:int = width - styleDeclaration.paddingLeft - styleDeclaration.paddingRight;
         if(this.maintainAspectRatio)
         {
            _loc2_ = height - styleDeclaration.paddingTop - styleDeclaration.paddingBottom;
            if(_loc2_ * this.aspectRatio < _loc1_)
            {
               return _loc2_ * this.aspectRatio;
            }
         }
         return _loc1_;
      }
      
      public function get contentHeight() : int
      {
         var _loc2_:int = 0;
         var _loc1_:int = height - styleDeclaration.paddingTop - styleDeclaration.paddingBottom;
         if(this.maintainAspectRatio)
         {
            _loc2_ = width - styleDeclaration.paddingLeft - styleDeclaration.paddingRight;
            if(_loc1_ * this.aspectRatio > _loc2_)
            {
               return _loc2_ / this.aspectRatio;
            }
         }
         return _loc1_;
      }
      
      public function get contentX() : int
      {
         return styleDeclaration.paddingLeft;
      }
      
      public function get contentY() : int
      {
         return styleDeclaration.paddingTop;
      }
      
      public function GetBitmapData() : BitmapData
      {
         var _loc1_:BitmapData = null;
         if(this.isLoadFailed && this.$SkinBroken != null)
         {
            _loc1_ = this.$SkinBroken.GetFirstBitmapData();
         }
         else if(this.bmpdHolder != null)
         {
            _loc1_ = this.bmpdHolder;
         }
         else if(this.mcHolder != null)
         {
            this.bmpdHolder = new BitmapData(this.mcHolder.width,this.mcHolder.height,true);
            this.bmpdHolder.draw(this.mcHolder);
            _loc1_ = this.bmpdHolder;
         }
         return _loc1_;
      }
      
      public function get scrollRectEnabled() : Boolean
      {
         return this._scrollRectEnabled;
      }
      
      public function set scrollRectEnabled(param1:Boolean) : void
      {
         this._scrollRectEnabled = param1;
         InvalidateSize();
      }
      
      override public function ValidateProperties() : void
      {
         if(this.contentChanged)
         {
            this.LoadContent(this.source,this.useLoaderManager,true);
            this.contentChanged = false;
         }
         super.ValidateProperties();
      }
      
      override public function ValidateSize() : void
      {
         if(invalidateSizeFlag)
         {
            if(this.scrollRectEnabled)
            {
               this.scrollRect = new Rectangle(0,0,width,height);
            }
            else
            {
               this.scrollRect = null;
            }
         }
         super.ValidateSize();
      }
      
      override public function ValidateSkin() : void
      {
         if(invalidateSkinFlag)
         {
            if(styleDeclaration.hasBrokenSkin && this.$SkinBroken == null)
            {
               this.$SkinBroken = StyleManager.GetStyleSkin(styleDeclaration.brokenSkin);
            }
            invalidateSkinFlag = false;
            this.$Render();
         }
      }
      
      override protected function $Render() : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:BitmapData = null;
         var _loc5_:Matrix = null;
         if(!isNaN(width) && !isNaN(height))
         {
            this.graphics.clear();
            this.graphics.beginFill(styleDeclaration.backgroundColor,styleDeclaration.backgroundAlpha);
            this.graphics.drawRect(0,0,width,height);
            this.graphics.endFill();
         }
         var _loc1_:Number = 1;
         if(this.mcHolder != null)
         {
            if(this.mcHolder.parent != this)
            {
               this.addChild(this.mcHolder);
            }
            if(this.scaleContent)
            {
               if(this.maintainAspectRatio)
               {
                  _loc1_ = Math.max(this.contentWidth / this.sourceWidth,this.contentHeight / this.sourceHeight);
                  _loc2_ = _loc1_ * this.sourceWidth;
                  _loc3_ = _loc1_ * this.sourceHeight;
               }
               else
               {
                  _loc2_ = this.contentWidth;
                  _loc3_ = this.contentHeight;
               }
               if(this.mcHolder.width != _loc2_)
               {
                  this.mcHolder.width = _loc2_;
               }
               if(this.mcHolder.height != _loc3_)
               {
                  this.mcHolder.height = _loc3_;
               }
            }
            else
            {
               _loc2_ = this.sourceWidth;
               _loc3_ = this.sourceHeight;
            }
         }
         else if((_loc4_ = this.GetBitmapData()) != null)
         {
            _loc5_ = new Matrix();
            if(this.scaleContent)
            {
               if(this.maintainAspectRatio)
               {
                  _loc1_ = Math.min(width / _loc4_.width,height / _loc4_.height);
                  _loc5_.a = _loc1_;
                  _loc5_.d = _loc1_;
               }
               else
               {
                  _loc5_.a = width / _loc4_.width;
                  _loc5_.d = height / _loc4_.height;
               }
            }
            this.graphics.beginBitmapFill(_loc4_,_loc5_,false,false);
            this.graphics.drawRect(this.contentX,this.contentY,this.contentWidth,this.contentHeight);
            this.graphics.endFill();
         }
      }
      
      public function LoadContent(param1:Object, param2:Boolean = true, param3:Boolean = true) : void
      {
         var _loc4_:DisplayObject = null;
         var _loc5_:Class = null;
         var _loc6_:String = null;
         var _loc7_:ByteArray = null;
         var _loc8_:LoaderContext = null;
         var _loc9_:LoaderContext = null;
         if(param3)
         {
            if(this.outterCallClassOrString == param1)
            {
               return;
            }
            this.outterCallClassOrString = param1;
         }
         this.mcHolder = null;
         this.bmpdHolder = null;
         if(param1 == null)
         {
            this.bmpdHolder = null;
            InvalidateSkin();
         }
         else if(param1 is Class)
         {
            this.LoadContent(new param1(),param2,false);
         }
         else if(param1 is String)
         {
            _loc6_ = String(param1);
            this.url = _loc6_;
            if(_loc6_.length == 0)
            {
               this.LoadContent(null,param2,false);
               return;
            }
            if(this.loader)
            {
               this.loader.contentLoaderInfo.removeEventListener(Event.COMPLETE,this.LoaderComletedHandler);
               this.loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,this.LoaderIoErrorHandler);
            }
            if(param2)
            {
               this.loader = LoaderManager.GetLoader(_loc6_,this.loadTimeout);
            }
            else
            {
               this.loader = new Loader();
               _loc8_ = new LoaderContext(true);
               this.loader.load(new URLRequest(_loc6_),_loc8_);
            }
            this.loader.contentLoaderInfo.addEventListener(Event.COMPLETE,this.LoaderComletedHandler);
            this.loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.LoaderIoErrorHandler);
         }
         else if(param1 is ByteArray)
         {
            if(this.loader)
            {
               this.loader.contentLoaderInfo.removeEventListener(Event.COMPLETE,this.LoaderComletedHandler);
               this.loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,this.LoaderIoErrorHandler);
            }
            _loc7_ = ByteArray(param1);
            this.loader = new Loader();
            this.loader.contentLoaderInfo.addEventListener(Event.COMPLETE,this.LoaderComletedHandler);
            if((_loc9_ = new LoaderContext(false,ApplicationDomain.currentDomain)).hasOwnProperty("allowCodeImport"))
            {
               _loc9_["allowCodeImport"] = true;
            }
            this.loader.loadBytes(_loc7_,_loc9_);
         }
         else if(param1 is BitmapData)
         {
            this.LoadContent(new Bitmap(param1 as BitmapData),param2,false);
         }
         else if(param1 is Bitmap)
         {
            this.isContentLoaded = true;
            this.mcHolder = param1 as Bitmap;
            this.LoadOK();
         }
         else if(!(param1 is Vector.<BitmapData>))
         {
            if(param1 is DisplayObject)
            {
               this.mcHolder = param1 as DisplayObject;
               this.LoadOK();
            }
            else
            {
               this.LoadContent(param1.toString(),param2,false);
            }
         }
      }
      
      private function LoadOK() : void
      {
         var _loc1_:DisplayObject = null;
         while(this.numChildren > 0)
         {
            this.removeChildAt(0);
         }
         if(this.mcHolder)
         {
            _loc1_ = this.mcHolder;
            this.addChild(_loc1_);
         }
         else
         {
            _loc1_ = new Bitmap(this.bmpdHolder);
         }
         this.aspectRatio = this.mcHolder.width / this.mcHolder.height;
         if(this.doubleClickEnabled && _loc1_ is InteractiveObject)
         {
            (_loc1_ as InteractiveObject).doubleClickEnabled = this.doubleClickEnabled;
         }
         this.sourceWidth = _loc1_.width;
         this.sourceHeight = _loc1_.height;
         if(isNaN(_width))
         {
            width = _loc1_.width;
         }
         if(isNaN(_height))
         {
            height = _loc1_.height;
         }
         InvalidateSkin();
         this.dispatchEvent(new Event(Event.COMPLETE));
      }
      
      private function LoaderComletedHandler(param1:Event) : void
      {
         var info:LoaderInfo = null;
         var e:Event = param1;
         (e.currentTarget as IEventDispatcher).removeEventListener(Event.COMPLETE,this.LoaderComletedHandler);
         (e.currentTarget as IEventDispatcher).removeEventListener(IOErrorEvent.IO_ERROR,this.LoaderIoErrorHandler);
         this.isLoadFailed = false;
         if(e.currentTarget is LoaderInfo)
         {
            info = e.currentTarget as LoaderInfo;
            try
            {
               if(info.content is Bitmap)
               {
                  this.LoadContent(new Bitmap((info.content as Bitmap).bitmapData),this.useLoaderManager,false);
               }
               else
               {
                  this.LoadContent(info.loader,this.useLoaderManager,false);
               }
            }
            catch(err:Error)
            {
               LoadContent(info.loader,useLoaderManager,false);
            }
         }
      }
      
      private function LoaderIoErrorHandler(param1:IOErrorEvent) : void
      {
         (param1.currentTarget as IEventDispatcher).removeEventListener(Event.COMPLETE,this.LoaderComletedHandler);
         (param1.currentTarget as IEventDispatcher).removeEventListener(IOErrorEvent.IO_ERROR,this.LoaderIoErrorHandler);
         this.isLoadFailed = true;
         InvalidateSkin();
         AsguiLogger.Warn(this,param1.text);
      }
   }
}
