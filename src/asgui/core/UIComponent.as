package asgui.core
{
   import asgui.events.AsguiEvent;
   import asgui.managers.ToolTipManager;
   import asgui.styles.StyleDeclaration;
   import asgui.styles.StyleManager;
   import asgui.styles.StyleSkin;
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class UIComponent extends LayoutUIComponent implements IUIComponent, IDisposable
   {
      
      public static const STYLE:String = "UIComponent";
      
      public static var cidCounter:uint = 0;
       
      
      private var _styleDeclaration:StyleDeclaration;
      
      protected var styleCustomed:Boolean = false;
      
      private var _cid:uint;
      
      private var _enabled:Boolean = true;
      
      private var _enabledParent:Boolean = true;
      
      private var _toolTip:Object;
      
      private var _toolTipClass:Class = null;
      
      private var _styleName:String;
      
      private var _alpha:Number = 1;
      
      protected var _dataEditable:Boolean;
      
      protected var _dataField:String;
      
      private var _data:Object;
      
      var $internalParent:UIComponent;
      
      protected var $listenMouseOver:Boolean = false;
      
      protected var $listenMouseDown:Boolean = false;
      
      protected var $SkinNormal:StyleSkin;
      
      protected var $SkinDisabled:StyleSkin;
      
      protected var $SkinDown:StyleSkin;
      
      protected var $SkinOver:StyleSkin;
      
      public var $SkinCurrent:StyleSkin;
      
      protected var _mouseDown:Boolean;
      
      protected var _mouseOver:Boolean;
      
      protected var invalidateStyleFlag:Boolean = false;
      
      public var drawDrawScale9GridInPixelMode:Boolean = false;
      
      public function UIComponent()
      {
         super();
         this.cacheAsBitmap = true;
         this._cid = cidCounter++;
         this.styleName = this.$defaultStyleName;
         this.InitializeComponent();
         this.$StyleChanged();
      }
      
      public function InitializeComponent() : void
      {
         super.addEventListener(Event.ADDED_TO_STAGE,this.AddedHandler,false,0,true);
         super.addEventListener(Event.REMOVED_FROM_STAGE,this.RemovedHandler,false,0,true);
      }
      
      public function OnAddedToStage() : void
      {
         if(hasDisposed)
         {
            return;
         }
         initialized = true;
         invalidateDisplayListFlag = false;
         invalidatePropertiesFlag = false;
         invalidateSizeFlag = false;
         invalidateSkinFlag = false;
         InvalidateDisplayList();
         InvalidateSize();
         InvalidateSkin();
         InvalidateProperties();
         InvalidateLayout();
      }
      
      protected function OnRemovedFromStage() : void
      {
      }
      
      protected function get $defaultStyleName() : String
      {
         return STYLE;
      }
      
      override public function Dispose() : void
      {
         if(hasDisposed)
         {
            return;
         }
         super.removeEventListener(Event.ADDED_TO_STAGE,this.AddedHandler);
         super.removeEventListener(Event.REMOVED_FROM_STAGE,this.RemovedHandler);
         this.RemoveListener();
         if(this.$SkinCurrent)
         {
            this.$SkinCurrent.removeEventListener(Event.COMPLETE,this.SkinCurrentCompleteHandler);
         }
         this.$SkinCurrent = null;
         if(this.$SkinDisabled != null)
         {
            this.$SkinDisabled.Dispose();
            this.$SkinDisabled = null;
         }
         if(this.$SkinDown != null)
         {
            this.$SkinDown.Dispose();
            this.$SkinDown = null;
         }
         if(this.$SkinNormal != null)
         {
            this.$SkinNormal.Dispose();
            this.$SkinNormal = null;
         }
         if(this.$SkinOver != null)
         {
            this.$SkinOver.Dispose();
            this.$SkinOver = null;
         }
         this.$internalParent = null;
         this._styleDeclaration = null;
         this._toolTipClass = null;
         if(this._toolTip)
         {
            ToolTipManager.RegisterToolTip(this,null);
         }
         initialized = false;
         this.styleCustomed = false;
         disposing = true;
         _disposed = true;
      }
      
      public function SetStyle(param1:String, param2:String) : void
      {
         var _loc3_:StyleDeclaration = null;
         if(!this.styleCustomed)
         {
            _loc3_ = new StyleDeclaration();
            _loc3_.SetInheritForInstance(this.styleDeclaration);
            this.styleDeclaration = _loc3_;
            this.styleCustomed = true;
         }
         this.styleDeclaration.SetStyleForInstance(param1,param2);
         this.$StyleChanged();
      }
      
      protected function MeasureWidth(param1:int = 0) : void
      {
         if(!isNaN(_width))
         {
            return;
         }
         var _loc2_:Number = $width;
         if(this.$SkinNormal == null && this.styleDeclaration.normalSkin != null)
         {
            this.$SkinNormal = StyleManager.GetStyleSkin(this.styleDeclaration.normalSkin);
         }
         if(this.$SkinNormal != null)
         {
            _loc2_ = this.$SkinNormal.width;
         }
         if(isNaN(_loc2_))
         {
            _loc2_ = 10;
         }
         _loc2_ += param1;
         if($width != _loc2_)
         {
            $width = _loc2_;
            InvalidateSize();
            InvalidateSkin();
            InvalidateDisplayList(this);
            this.dispatchEvent(new AsguiEvent(AsguiEvent.WIDTH_CHANGED));
         }
      }
      
      protected function MeasureHeight() : void
      {
         if(!isNaN(_height))
         {
            return;
         }
         var _loc1_:Number = $height;
         if(this.$SkinNormal == null && this.styleDeclaration.normalSkin != null)
         {
            this.$SkinNormal = StyleManager.GetStyleSkin(this.styleDeclaration.normalSkin);
         }
         if(this.$SkinNormal != null)
         {
            _loc1_ = this.$SkinNormal.height;
         }
         if(isNaN(_loc1_))
         {
            _loc1_ = 10;
         }
         if($height != _loc1_)
         {
            $height = _loc1_;
            InvalidateSize();
            InvalidateSkin();
            InvalidateDisplayList(this);
            this.dispatchEvent(new AsguiEvent(AsguiEvent.HEIGHT_CHANGED));
         }
      }
      
      public function get cid() : uint
      {
         return this._cid;
      }
      
      public function get styleDeclaration() : StyleDeclaration
      {
         return this._styleDeclaration;
      }
      
      public function set styleDeclaration(param1:StyleDeclaration) : void
      {
         this._styleDeclaration = param1;
      }
      
      public function get enabled() : Boolean
      {
         return this._enabled;
      }
      
      public function set enabled(param1:Boolean) : void
      {
         if(this._enabled != param1)
         {
            this._enabled = param1;
            this.$Render();
         }
      }
      
      public function set enabledParent(param1:Boolean) : void
      {
         this._enabledParent = param1;
      }
      
      protected function get $enabledFunc() : Boolean
      {
         if(!this._enabledParent)
         {
            return false;
         }
         if(UIComponentGlobals.alwaysEnabled)
         {
            return true;
         }
         return this.enabled;
      }
      
      protected function get $enabledView() : Boolean
      {
         if(!this._enabledParent)
         {
            return false;
         }
         return this.enabled;
      }
      
      public function get toolTip() : Object
      {
         return this._toolTip;
      }
      
      public function set toolTip(param1:Object) : void
      {
         if(this._toolTip != param1)
         {
            this._toolTip = param1;
            ToolTipManager.RegisterToolTip(this,this._toolTip,this.toolTipClass);
         }
      }
      
      public function get toolTipClass() : Class
      {
         return this._toolTipClass;
      }
      
      public function set toolTipClass(param1:Class) : void
      {
         if(this._toolTipClass != param1)
         {
            this._toolTipClass = param1;
            ToolTipManager.RegisterToolTip(this,this._toolTip,this.toolTipClass);
         }
      }
      
      public function get styleName() : String
      {
         return this._styleName;
      }
      
      public function set styleName(param1:String) : void
      {
         if(this._styleName != param1)
         {
            this._styleName = param1;
            this.styleDeclaration = StyleManager.GetStyleDeclaration(this._styleName,this);
            this.styleCustomed = false;
            this.$StyleChanged();
         }
      }
      
      override public function set alpha(param1:Number) : void
      {
         this._alpha = param1;
         super.alpha = param1;
      }
      
      public function $SetInvisible() : void
      {
      }
      
      function $SetVisibleNormal() : void
      {
      }
      
      public function get dataEditable() : Boolean
      {
         return this._dataEditable;
      }
      
      public function set dataEditable(param1:Boolean) : void
      {
         if(this._dataEditable == param1)
         {
            return;
         }
         this._dataEditable = param1;
      }
      
      public function get dataField() : String
      {
         return this._dataField;
      }
      
      public function set dataField(param1:String) : void
      {
         if(this._dataField == param1)
         {
            return;
         }
         this._dataField = param1;
      }
      
      public function get data() : Object
      {
         return this._data;
      }
      
      public function set data(param1:Object) : void
      {
         this._data = param1;
      }
      
      function get internalParent() : UIComponent
      {
         if(this.$internalParent)
         {
            return this.$internalParent;
         }
         if(this.parent is UIComponent)
         {
            return this.parent as UIComponent;
         }
         return null;
      }
      
      override public function get parent() : DisplayObjectContainer
      {
         if(this.$internalParent)
         {
            return this.$internalParent;
         }
         return super.parent;
      }
      
      public function get $parent() : DisplayObjectContainer
      {
         return super.parent;
      }
      
      override public function set visible(param1:Boolean) : void
      {
         if(super.visible != param1)
         {
            super.visible = param1;
            if(param1)
            {
               InvalidateDisplayList();
            }
         }
      }
      
      override public function get width() : Number
      {
         if(!isNaN(_width))
         {
            return _width;
         }
         if(isNaN($width) || $width == 0)
         {
            this.MeasureWidth();
         }
         return $width;
      }
      
      override public function get height() : Number
      {
         if(!isNaN(_height))
         {
            return _height;
         }
         if(isNaN($height) || $height == 0)
         {
            this.MeasureHeight();
         }
         return $height;
      }
      
      public function get displayWidth() : int
      {
         return int(this.width - this.styleDeclaration.paddingLeft - this.styleDeclaration.paddingRight);
      }
      
      public function get displayHeight() : int
      {
         return int(this.height - this.styleDeclaration.paddingTop - this.styleDeclaration.paddingBottom - this.styleDeclaration.headerHeight - this.styleDeclaration.footerHeight);
      }
      
      public function get displayX() : int
      {
         return this.styleDeclaration.paddingLeft;
      }
      
      public function get displayY() : int
      {
         return this.styleDeclaration.paddingTop + this.styleDeclaration.headerHeight;
      }
      
      private function AddListener() : void
      {
         if(this.hasDisposed || this.styleDeclaration == null)
         {
            return;
         }
         this.RemoveListener();
         if(this.styleDeclaration.hasOverSkin || this.$listenMouseOver)
         {
            super.addEventListener(MouseEvent.ROLL_OVER,this.MouseOverEventHandler);
            super.addEventListener(MouseEvent.ROLL_OUT,this.MouseOutEventHandler);
         }
         if(this.styleDeclaration.hasDownSkin || this.$listenMouseDown)
         {
            super.addEventListener(MouseEvent.MOUSE_DOWN,this.MouseDownEventHandler);
            super.addEventListener(MouseEvent.MOUSE_UP,this.MouseUpEventHandler);
         }
      }
      
      private function RemoveListener() : void
      {
         this.removeEventListener(MouseEvent.ROLL_OVER,this.MouseOverEventHandler);
         this.removeEventListener(MouseEvent.ROLL_OUT,this.MouseOutEventHandler);
         this.removeEventListener(MouseEvent.MOUSE_DOWN,this.MouseDownEventHandler);
         this.removeEventListener(MouseEvent.MOUSE_UP,this.MouseUpEventHandler);
      }
      
      private function MouseOverEventHandler(param1:MouseEvent) : void
      {
         this.$SetOver(param1);
      }
      
      private function MouseOutEventHandler(param1:MouseEvent) : void
      {
         this.$SetOut(param1);
      }
      
      private function MouseDownEventHandler(param1:MouseEvent) : void
      {
         this.$SetDown(param1);
      }
      
      private function MouseUpEventHandler(param1:MouseEvent) : void
      {
         this.$SetUp(param1);
      }
      
      private function AddedHandler(param1:Event) : void
      {
         super.removeEventListener(Event.ADDED_TO_STAGE,this.AddedHandler);
         _parents = -1;
         if(!initialized)
         {
            this.OnAddedToStage();
         }
      }
      
      private function RemovedHandler(param1:Event) : void
      {
         super.removeEventListener(Event.REMOVED_FROM_STAGE,this.RemovedHandler);
         if(initialized)
         {
            this.OnRemovedFromStage();
         }
      }
      
      protected function $SetNormal(param1:MouseEvent) : void
      {
         this._mouseDown = false;
         this._mouseOver = false;
         this.$Render();
      }
      
      protected function $SetOver(param1:MouseEvent) : void
      {
         this._mouseOver = true;
         this.$Render();
      }
      
      protected function $SetOut(param1:MouseEvent) : void
      {
         this._mouseOver = false;
         this._mouseDown = false;
         this.$Render();
      }
      
      protected function $SetDown(param1:MouseEvent) : void
      {
         this._mouseDown = true;
         this.$Render();
      }
      
      protected function $SetUp(param1:MouseEvent) : void
      {
         this._mouseDown = false;
         this.$Render();
      }
      
      protected function $StyleChanged() : void
      {
         if(hasDisposed)
         {
            return;
         }
         InvalidateProperties();
         InvalidateSkin();
         InvalidateSize();
         InvalidateDisplayList(this);
         this.AddListener();
         this.invalidateStyleFlag = true;
      }
      
      protected function $Render() : void
      {
         var _loc1_:Boolean = false;
         if(this.$SkinCurrent)
         {
            this.$SkinCurrent.removeEventListener(Event.COMPLETE,this.SkinCurrentCompleteHandler);
            this.$SkinCurrent.Stop();
         }
         if(!this._enabled)
         {
            this.$DrawDisabled();
            if(this.$SkinCurrent != this.$SkinDisabled)
            {
               this.$SkinCurrent = this.$SkinDisabled;
               _loc1_ = true;
            }
         }
         else if(this._mouseDown)
         {
            this.$DrawDown();
            if(this.$SkinCurrent != this.$SkinDown)
            {
               this.$SkinCurrent = this.$SkinDown;
               _loc1_ = true;
            }
         }
         else if(this._mouseOver)
         {
            this.$DrawOver();
            if(this.$SkinCurrent != this.$SkinOver)
            {
               this.$SkinCurrent = this.$SkinOver;
               _loc1_ = true;
            }
         }
         else
         {
            this.$DrawNormal();
            if(this.$SkinCurrent != this.$SkinNormal)
            {
               this.$SkinCurrent = this.$SkinNormal;
               _loc1_ = true;
            }
         }
         if(this.$SkinCurrent)
         {
            if(this.$SkinCurrent.hasInit)
            {
               this.$DrawSkin(_loc1_);
            }
            else
            {
               this.$SkinCurrent.addEventListener(Event.COMPLETE,this.SkinCurrentCompleteHandler,false,0,true);
            }
         }
         else
         {
            this.$DrawNaked();
         }
      }
      
      private function SkinCurrentCompleteHandler(param1:Event) : void
      {
         if(this.$SkinCurrent)
         {
            this.$SkinCurrent.removeEventListener(Event.COMPLETE,this.SkinCurrentCompleteHandler);
            this.$SkinCurrent = null;
            this.$Render();
         }
      }
      
      protected function $DrawDisabled() : void
      {
      }
      
      protected function $DrawDown() : void
      {
      }
      
      protected function $DrawOver() : void
      {
      }
      
      protected function $DrawNormal() : void
      {
      }
      
      protected function $DrawSkin(param1:Boolean = false) : void
      {
         this.$SkinCurrent.Draw(graphics,this.width,this.height,false,0,0,param1,this.drawDrawScale9GridInPixelMode);
      }
      
      protected function $DrawNaked() : void
      {
         if(isNaN(this.width) || isNaN(this.height))
         {
            return;
         }
         graphics.clear();
         graphics.beginFill(this.styleDeclaration.backgroundColor,this.styleDeclaration.backgroundAlpha);
         if(this.styleDeclaration.borderThickness > 0)
         {
            graphics.lineStyle(this.styleDeclaration.borderThickness,this.styleDeclaration.borderColor,this.styleDeclaration.borderAlpha);
         }
         graphics.drawRect(0,0,this.width,this.height);
      }
      
      override public function ValidateSkin() : void
      {
         if(invalidateSkinFlag)
         {
            this.$SkinDisabled = StyleManager.GetStyleSkin(this.styleDeclaration.disabledSkin);
            this.$SkinDown = StyleManager.GetStyleSkin(this.styleDeclaration.downSkin);
            this.$SkinNormal = StyleManager.GetStyleSkin(this.styleDeclaration.normalSkin);
            this.$SkinOver = StyleManager.GetStyleSkin(this.styleDeclaration.overSkin);
            this.invalidateStyleFlag = false;
            invalidateSkinFlag = false;
         }
         this.$Render();
      }
      
      override public function ValidateDisplayList() : void
      {
         if(invalidateDisplayListFlag)
         {
            this.$SetVisibleNormal();
         }
         super.ValidateDisplayList();
      }
   }
}
