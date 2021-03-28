package asgui.core
{
   import asgui.controls.scrolls.ScrollBar;
   import asgui.controls.scrolls.ScrollHandler;
   import asgui.events.AsguiEvent;
   import asgui.events.ScrollEvent;
   import flash.display.DisplayObject;
   import flash.display.InteractiveObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class Container extends UIComponent implements IListItemRenderer, IContainer
   {
      
      public static const STYLE:String = "Container";
       
      
      protected var contentPane:Sprite;
      
      public var scrollHandler:ScrollHandler;
      
      private var _firstChildIndex:int;
      
      protected var absoluteLayout:Boolean;
      
      private var hasMouseEnabledSet:Boolean = false;
      
      private var _label:String = "";
      
      private var scrollPropertiesChanged:Boolean = false;
      
      private var scrollPositionChanged:Boolean = true;
      
      public function Container()
      {
         super();
         this.cacheAsBitmap = false;
      }
      
      override protected function get $defaultStyleName() : String
      {
         return STYLE;
      }
      
      override public function Dispose() : void
      {
         disposing = true;
         if(hasDisposed)
         {
            return;
         }
         if(this.scrollHandler)
         {
            this.scrollHandler.removeEventListener(ScrollEvent.SCROLL_UPDATE,this.scrollUpdateHandler);
            this.scrollHandler.removeEventListener(ScrollEvent.SCROLL_BAR_DOWN,this.scrollUpdateHandler);
            this.scrollHandler.removeEventListener(ScrollEvent.SCROLL_BAR_UP,this.scrollUpdateHandler);
            this.scrollHandler.Dispose();
            this.scrollHandler = null;
         }
         this.contentPane.removeEventListener(Event.ADDED,this.contentPaneAddedHandler);
         this.contentPane.removeEventListener(Event.REMOVED,this.contentPaneRemovedHandler);
         while(this.contentPane.numChildren > 0)
         {
            if(this.contentPane.getChildAt(0) is IDisposable)
            {
               (this.contentPane.getChildAt(0) as IDisposable).Dispose();
            }
            this.contentPane.removeChildAt(0);
         }
         while(this.numChildren > 0)
         {
            if(this.getChildAt(0) is IDisposable)
            {
               (this.getChildAt(0) as IDisposable).Dispose();
            }
            this.removeChildAt(0);
         }
         super.Dispose();
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.contentPane = new Sprite();
         this.contentPane.name = "contentPane";
         this.contentPane.mouseEnabled = UIComponentGlobals.containerDefaultMouseEnabled;
         this.contentPane.addEventListener(Event.ADDED,this.contentPaneAddedHandler);
         this.contentPane.addEventListener(Event.REMOVED,this.contentPaneRemovedHandler);
         this.$addChild(this.contentPane);
         this.scrollHandler = new ScrollHandler(this.contentPane);
         this.scrollHandler.SetScrollStyleNames(this.styleDeclaration.verticalScrollBarStyleName,this.styleDeclaration.horizontalScrollBarStyleName);
         this.scrollHandler.addEventListener(ScrollEvent.SCROLL_UPDATE,this.scrollUpdateHandler);
         this.scrollHandler.addEventListener(ScrollEvent.SCROLL_BAR_DOWN,this.scrollUpdateHandler);
         this.scrollHandler.addEventListener(ScrollEvent.SCROLL_BAR_UP,this.scrollUpdateHandler);
      }
      
      override public function get displayX() : int
      {
         if(!this.absoluteLayout)
         {
            return styleDeclaration.paddingLeft;
         }
         return 0;
      }
      
      override public function get displayY() : int
      {
         if(!this.absoluteLayout)
         {
            return styleDeclaration.paddingTop;
         }
         return 0;
      }
      
      override protected function MeasureWidth(param1:int = 0) : void
      {
         super.MeasureWidth(param1);
         if(!isNaN(_width))
         {
            return;
         }
         var _loc2_:Point = this.scrollHandler.contentHolderChildrenSize;
         var _loc3_:Number = Math.max(0,_loc2_.x + styleDeclaration.paddingLeft + styleDeclaration.paddingRight);
         if(_loc3_ > 0 && $width != _loc3_)
         {
            $width = _loc3_;
            InvalidateSize();
            InvalidateSkin();
            InvalidateDisplayList(this);
            this.dispatchEvent(new AsguiEvent(AsguiEvent.WIDTH_CHANGED));
         }
      }
      
      override protected function $StyleChanged() : void
      {
         super.$StyleChanged();
         if(this.hasDisposed)
         {
            return;
         }
         if(!this.hasMouseEnabledSet)
         {
            super.mouseEnabled = styleDeclaration.backgroundAlpha > 0 || styleDeclaration.hasNormalSkin;
         }
         if(this.scrollHandler)
         {
            this.scrollHandler.SetScrollStyleNames(this.styleDeclaration.verticalScrollBarStyleName,this.styleDeclaration.horizontalScrollBarStyleName);
         }
      }
      
      override protected function MeasureHeight() : void
      {
         super.MeasureHeight();
         if(!isNaN(_height))
         {
            return;
         }
         var _loc1_:Point = this.scrollHandler.contentHolderChildrenSize;
         var _loc2_:Number = Math.max(0,_loc1_.y + styleDeclaration.paddingTop + styleDeclaration.paddingBottom + styleDeclaration.headerHeight);
         if(_loc2_ > 0 && $height != _loc2_)
         {
            $height = _loc2_;
            InvalidateSize();
            InvalidateSkin();
            InvalidateDisplayList(this);
            this.dispatchEvent(new AsguiEvent(AsguiEvent.HEIGHT_CHANGED));
         }
      }
      
      public function GetChildById(param1:String) : DisplayObject
      {
         var _loc2_:int = 0;
         var _loc4_:DisplayObject = null;
         var _loc3_:int = this.numChildren;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            if(this.getChildAt(_loc2_) is IUIComponent)
            {
               if((this.getChildAt(_loc2_) as IUIComponent).id == param1)
               {
                  return this.getChildAt(_loc2_);
               }
               if(this.getChildAt(_loc2_) is Container)
               {
                  if(_loc4_ = (this.getChildAt(_loc2_) as Container).GetChildById(param1))
                  {
                     return _loc4_;
                  }
               }
            }
            _loc2_++;
         }
         return null;
      }
      
      public function get getAbsoluteLayout() : Boolean
      {
         return this.absoluteLayout;
      }
      
      override public function set enabled(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(super.enabled != param1)
         {
            super.enabled = param1;
            _loc2_ = 0;
            while(_loc2_ < this.numChildren)
            {
               if(this.getChildAt(_loc2_) is UIComponent)
               {
                  (this.getChildAt(_loc2_) as UIComponent).enabledParent = param1;
               }
               _loc2_++;
            }
            _loc2_ = 0;
            while(_loc2_ < this.$numChildren)
            {
               if(this.$getChildAt(_loc2_) is UIComponent)
               {
                  (this.$getChildAt(_loc2_) as UIComponent).enabledParent = param1;
               }
               _loc2_++;
            }
         }
      }
      
      override public function set mouseEnabled(param1:Boolean) : void
      {
         this.hasMouseEnabledSet = true;
         super.mouseEnabled = param1;
      }
      
      public function set mouseBackground(param1:Boolean) : void
      {
         this.contentPane.mouseEnabled = param1;
      }
      
      public function get mouseBackground() : Boolean
      {
         return this.contentPane.mouseEnabled;
      }
      
      override public function set doubleClickEnabled(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:InteractiveObject = null;
         super.doubleClickEnabled = param1;
         if(this.contentPane)
         {
            this.contentPane.doubleClickEnabled = param1;
            _loc2_ = this.contentPane.numChildren;
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               if(_loc4_ = this.contentPane.getChildAt(_loc3_) as InteractiveObject)
               {
                  _loc4_.doubleClickEnabled = param1;
               }
               _loc3_++;
            }
         }
      }
      
      public function get contentWidth() : int
      {
         if(this.contentPane)
         {
            return this.contentPane.width;
         }
         return this.width;
      }
      
      public function get contentHeight() : int
      {
         if(this.contentPane)
         {
            return this.contentPane.height;
         }
         return this.height;
      }
      
      public function get label() : String
      {
         return this._label;
      }
      
      public function set label(param1:String) : void
      {
         this._label = param1;
      }
      
      override public function addChild(param1:DisplayObject) : DisplayObject
      {
         return this.addChildAt(param1,this.numChildren);
      }
      
      override public function addChildAt(param1:DisplayObject, param2:int) : DisplayObject
      {
         if(param1 is UIComponent)
         {
            (param1 as UIComponent).$SetInvisible();
         }
         if(this.doubleClickEnabled && param1 is InteractiveObject)
         {
            (param1 as InteractiveObject).doubleClickEnabled = this.doubleClickEnabled;
         }
         InvalidateDisplayList();
         if(this.contentPane != null)
         {
            this.contentPane.addChildAt(param1,param2);
            if(param1 is UIComponent)
            {
               (param1 as UIComponent).$internalParent = this;
               if(this.absoluteLayout)
               {
                  if(UIComponentGlobals.addChildToContainerValidateLayoutImmediately)
                  {
                     (param1 as UIComponent).ValidateLayout(displayWidth,displayHeight);
                  }
               }
               else if(UIComponentGlobals.addChildToContainerValidateLayoutImmediately)
               {
                  this.ValidateDisplayList();
               }
            }
            return param1;
         }
         return super.addChildAt(param1,param2);
      }
      
      override public function setChildIndex(param1:DisplayObject, param2:int) : void
      {
         InvalidateDisplayList();
         this.contentPane.setChildIndex(param1,param2);
      }
      
      override public function swapChildren(param1:DisplayObject, param2:DisplayObject) : void
      {
         InvalidateDisplayList();
         this.contentPane.swapChildren(param1,param2);
      }
      
      override public function swapChildrenAt(param1:int, param2:int) : void
      {
         InvalidateDisplayList();
         this.contentPane.swapChildrenAt(param1,param2);
      }
      
      override public function getChildAt(param1:int) : DisplayObject
      {
         if(this.contentPane != null)
         {
            return this.contentPane.getChildAt(param1);
         }
         return super.getChildAt(this._firstChildIndex + param1);
      }
      
      override public function getChildByName(param1:String) : DisplayObject
      {
         if(this.contentPane != null)
         {
            return this.contentPane.getChildByName(param1);
         }
         return super.getChildByName(param1);
      }
      
      override public function getChildIndex(param1:DisplayObject) : int
      {
         if(this.contentPane != null)
         {
            if(this.contentPane.contains(param1))
            {
               return this.contentPane.getChildIndex(param1);
            }
            return -1;
         }
         return super.getChildIndex(param1) - this._firstChildIndex;
      }
      
      override public function get numChildren() : int
      {
         if(this.contentPane != null)
         {
            return this.contentPane.numChildren;
         }
         return super.numChildren - this._firstChildIndex;
      }
      
      override public function contains(param1:DisplayObject) : Boolean
      {
         if(this.contentPane != null)
         {
            return this.contentPane.contains(param1);
         }
         return super.contains(param1);
      }
      
      override public function removeChildAt(param1:int) : DisplayObject
      {
         return this.removeChild(this.getChildAt(param1));
      }
      
      override public function removeChild(param1:DisplayObject) : DisplayObject
      {
         InvalidateDisplayList();
         if(this.contentPane != null)
         {
            if(param1 is UIComponent)
            {
               (param1 as UIComponent).$internalParent = null;
            }
            return this.contentPane.removeChild(param1);
         }
         return super.removeChild(param1);
      }
      
      public function $addChildAt(param1:DisplayObject, param2:int) : DisplayObject
      {
         return super.addChildAt(param1,param2);
      }
      
      public function $addChild(param1:DisplayObject) : DisplayObject
      {
         return super.addChildAt(param1,this.$numChildren);
      }
      
      public function $getChildAt(param1:int) : DisplayObject
      {
         return super.getChildAt(param1);
      }
      
      public function get $numChildren() : int
      {
         return super.numChildren;
      }
      
      public function $contains(param1:DisplayObject) : Boolean
      {
         if(param1 is UIComponent)
         {
            return (param1 as UIComponent).$parent == this;
         }
         return super.contains(param1);
      }
      
      public function $removeChild(param1:DisplayObject) : DisplayObject
      {
         return super.removeChild(param1);
      }
      
      public function $getChildIndex(param1:DisplayObject) : int
      {
         return super.getChildIndex(param1);
      }
      
      public function $setChildIndex(param1:DisplayObject, param2:int) : void
      {
         return super.setChildIndex(param1,param2);
      }
      
      public function $getChildByName(param1:String) : DisplayObject
      {
         return super.getChildByName(param1);
      }
      
      public function $swapChildren(param1:DisplayObject, param2:DisplayObject) : void
      {
         super.swapChildren(param1,param2);
      }
      
      public function $swapChildrenAt(param1:int, param2:int) : void
      {
         super.swapChildrenAt(param1,param2);
      }
      
      public function get verticalScrollPosition() : Number
      {
         return this.scrollHandler.verticalScrollPosition;
      }
      
      public function set verticalScrollPosition(param1:Number) : void
      {
         this.scrollHandler.verticalScrollPosition = param1;
      }
      
      public function get verticalScrollPolicy() : String
      {
         return this.scrollHandler.verticalScrollPolicy;
      }
      
      public function set verticalScrollPolicy(param1:String) : void
      {
         if(this.scrollHandler.verticalScrollPolicy != param1)
         {
            this.scrollHandler.verticalScrollPolicy = param1;
            InvalidateDisplayList();
         }
      }
      
      public function get horizontalScrollPosition() : Number
      {
         return this.scrollHandler.horizontalScrollPosition;
      }
      
      public function set horizontalScrollPosition(param1:Number) : void
      {
         this.scrollHandler.horizontalScrollPosition = param1;
      }
      
      public function get horizontalScrollPolicy() : String
      {
         return this.scrollHandler.horizontalScrollPolicy;
      }
      
      public function set horizontalScrollPolicy(param1:String) : void
      {
         if(this.scrollHandler.horizontalScrollPolicy != param1)
         {
            this.scrollHandler.horizontalScrollPolicy = param1;
            InvalidateDisplayList();
         }
      }
      
      public function get maxHorizontalScrollPosition() : Number
      {
         this.ValidateDisplayList();
         return this.scrollHandler.maxHorizontalScrollPosition;
      }
      
      public function get maxVerticalScrollPosition() : Number
      {
         this.ValidateDisplayList();
         return this.scrollHandler.maxVerticalScrollPosition;
      }
      
      public function get minHorizontalScrollPosition() : Number
      {
         this.ValidateDisplayList();
         return this.scrollHandler.minHorizontalScrollPosition;
      }
      
      public function get minVerticalScrollPosition() : Number
      {
         this.ValidateDisplayList();
         return this.scrollHandler.minVerticalScrollPosition;
      }
      
      public function get scrollRectEnabled() : Boolean
      {
         return this.scrollHandler.scrollRectEnabled;
      }
      
      public function set scrollRectEnabled(param1:Boolean) : void
      {
         this.scrollHandler.scrollRectEnabled = param1;
         InvalidateDisplayList();
      }
      
      override protected function $DrawNaked() : void
      {
         super.$DrawNaked();
      }
      
      protected function UpdateContentPanePosition() : void
      {
         if(this.contentPane != null)
         {
            this.contentPane.x = styleDeclaration.paddingLeft;
            this.contentPane.y = styleDeclaration.paddingTop + styleDeclaration.headerHeight;
         }
      }
      
      override public function ValidateSize() : void
      {
         var _loc1_:int = 0;
         this.UpdateContentPanePosition();
         super.ValidateSize();
      }
      
      override public function ValidateDisplayList() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:Sprite = null;
         var _loc4_:ScrollBar = null;
         var _loc5_:Point = null;
         if(invalidateDisplayListFlag)
         {
            _loc2_ = this.numChildren;
            _loc1_ = 0;
            while(_loc1_ < _loc2_)
            {
               if(this.getChildAt(_loc1_) is UIComponent)
               {
                  (this.getChildAt(_loc1_) as UIComponent).$SetVisibleNormal();
               }
               _loc1_++;
            }
            _loc3_ = this.contentPane;
            _loc3_.graphics.clear();
            this.scrollHandler.UpdateContentHolderChildrenSize();
            this.MeasureWidth();
            this.MeasureHeight();
            this.UpdateChildrenLayout();
            if(this.mouseBackground)
            {
               _loc5_ = this.scrollHandler.contentHolderChildrenSize;
               _loc3_.graphics.beginFill(16711680,0);
               _loc3_.graphics.drawRect(0,0,Math.max(_loc5_.x,displayWidth),Math.max(_loc5_.y,displayHeight));
               _loc3_.graphics.endFill();
            }
            this.scrollHandler.SetScrollSize(0,0,displayWidth,displayHeight);
            if(this.scrollHandler.hasVerticalScrollBar)
            {
               _loc4_ = this.scrollHandler.GetVerticalScrollBar();
               if(!this.scrollHandler.hasVerticalScrollBarAdded)
               {
                  this.$addChild(_loc4_);
               }
               _loc4_.x = _loc3_.x + displayWidth - _loc4_.width + styleDeclaration.scrollBarPaddingRight;
               _loc4_.y = _loc3_.y + this.displayY;
               if(styleDeclaration.scrollBarPaddingBottom != 0)
               {
                  this.scrollHandler.verticalPageScrollSize = displayHeight + styleDeclaration.scrollBarPaddingBottom;
               }
            }
            else
            {
               this.scrollHandler.RemoveVerticalScrollBar();
            }
            if(this.scrollHandler.hasHorizontalScrollBar)
            {
               _loc4_ = this.scrollHandler.GetHorizontalScrollBar();
               if(!this.scrollHandler.hasHorizontalScrollBarAdded)
               {
                  this.$addChild(_loc4_);
               }
               _loc4_.x = _loc3_.x + this.displayX;
               _loc4_.y = this.height - _loc4_.height;
            }
            else
            {
               this.scrollHandler.RemoveHorizontalScrollBar();
            }
            this.scrollHandler.UpdatePosition();
         }
         super.ValidateDisplayList();
      }
      
      override public function ValidateLayout(param1:int = 0, param2:int = 0) : Boolean
      {
         if(super.ValidateLayout(param1,param2))
         {
            this.UpdateChildrenLayout();
            return true;
         }
         return false;
      }
      
      private function UpdateChildrenLayout() : void
      {
         var _loc4_:int = 0;
         var _loc1_:int = this.displayWidth;
         var _loc2_:int = this.displayHeight;
         var _loc3_:int = this.numChildren;
         if(this.absoluteLayout)
         {
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               if(!(this.getChildAt(_loc4_) is IDisposable && (this.getChildAt(_loc4_) as IDisposable).hasDisposed))
               {
                  if(this.getChildAt(_loc4_) is ILayoutComponent)
                  {
                     (this.getChildAt(_loc4_) as ILayoutComponent).ValidateLayout(_loc1_,_loc2_);
                  }
               }
               _loc4_++;
            }
         }
      }
      
      private function contentPaneAddedHandler(param1:Event) : void
      {
      }
      
      private function contentPaneRemovedHandler(param1:Event) : void
      {
      }
      
      private function scrollUpdateHandler(param1:ScrollEvent) : void
      {
         this.dispatchEvent(param1.clone());
      }
   }
}
