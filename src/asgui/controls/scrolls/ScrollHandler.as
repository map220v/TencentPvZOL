package asgui.controls.scrolls
{
   import asgui.core.Container;
   import asgui.core.ScrollPolicy;
   import asgui.events.ScrollEvent;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   
   public class ScrollHandler extends EventDispatcher
   {
       
      
      private var contentHolder:DisplayObject;
      
      private var verticalScrollBarStyleName:String;
      
      private var horizontalScrollBarStyleName:String;
      
      private var contentX:int;
      
      private var contentY:int;
      
      private var _contentHolderChildrenSize:Point;
      
      protected var wheelSpeed:Number = 4;
      
      private var _horizontalScrollBar:HScrollBar;
      
      private var _horizontalScrollPosition:Number = 0;
      
      private var _maxHorizontalScrollPosition:Number = 0;
      
      private var _minHorizontalScrollPosition:Number = 0;
      
      private var _horizontalScrollPolicy:String = "off";
      
      private var _horizontalLineScrollSize:Number = 15;
      
      private var _horizontalPageScrollSize:Number = 0;
      
      private var _verticalScrollBar:VScrollBar;
      
      private var _verticalScrollPosition:Number = 0;
      
      private var _maxVerticalScrollPosition:Number = 0;
      
      private var _minVerticalScrollPosition:Number = 0;
      
      private var _verticalScrollPolicy:String = "off";
      
      private var _verticalLineScrollSize:Number = 15;
      
      private var _verticalPageScrollSize:Number = 0;
      
      public var verticalPageScrollOffsetX:Number = 0;
      
      public var verticalPageScrollOffsetY:Number = 0;
      
      private var _scrollRectEnabled:Boolean = true;
      
      public function ScrollHandler(param1:DisplayObject)
      {
         super();
         this.contentHolder = param1;
      }
      
      public function Dispose() : void
      {
         if(this._verticalScrollBar != null)
         {
            this._verticalScrollBar.removeEventListener(Event.CHANGE,this.ScrollBarChangeHandler);
            this._verticalScrollBar.removeEventListener(ScrollEvent.SCROLL_BAR_DOWN,this.ScrollBarChangeHandler);
            this._verticalScrollBar.removeEventListener(ScrollEvent.SCROLL_BAR_UP,this.ScrollBarChangeHandler);
            this._verticalScrollBar.Dispose();
            this._verticalScrollBar = null;
         }
         if(this._horizontalScrollBar != null)
         {
            this._horizontalScrollBar.removeEventListener(Event.CHANGE,this.ScrollBarChangeHandler);
            this._horizontalScrollBar.removeEventListener(ScrollEvent.SCROLL_BAR_DOWN,this.ScrollBarChangeHandler);
            this._horizontalScrollBar.removeEventListener(ScrollEvent.SCROLL_BAR_UP,this.ScrollBarChangeHandler);
            this._horizontalScrollBar.Dispose();
            this._horizontalScrollBar = null;
         }
         this.contentHolder.removeEventListener(MouseEvent.MOUSE_WHEEL,this.MouseWheelHandler);
         this.contentHolder = null;
      }
      
      public function SetScrollSize(param1:int, param2:int, param3:int, param4:int) : void
      {
         var _loc7_:Point = null;
         if(this.contentHolder == null)
         {
            return;
         }
         this.contentX = param1;
         this.contentY = param2;
         var _loc5_:int = param3 + param1 * 2 + 1;
         var _loc6_:int = param4 + param2 * 2 + 1;
         this._contentHolderChildrenSize = null;
         if(!this.scrollRectEnabled)
         {
            this.contentHolder.scrollRect = null;
            return;
         }
         if(this.contentHolder.scrollRect == null)
         {
            this.contentHolder.cacheAsBitmap = true;
            this.contentHolder.scrollRect = new Rectangle(this.$horizontalScrollPosition,this.$verticalScrollPosition,_loc5_,_loc6_);
         }
         else if(this.contentHolder.scrollRect.width != _loc5_ || this.contentHolder.scrollRect.height != _loc6_)
         {
            this.contentHolder.scrollRect = new Rectangle(this.$horizontalScrollPosition,this.$verticalScrollPosition,_loc5_,_loc6_);
         }
         if(this.hasVerticalScrollBar || this.hasHorizontalScrollBar)
         {
            _loc7_ = this.contentHolderChildrenSize;
            this.maxVerticalScrollPosition = _loc7_.y - _loc6_;
            this.maxHorizontalScrollPosition = _loc7_.x - _loc5_;
         }
         if(this.hasVerticalScrollBar)
         {
            this.contentHolder.removeEventListener(MouseEvent.MOUSE_WHEEL,this.MouseWheelHandler);
            this.contentHolder.addEventListener(MouseEvent.MOUSE_WHEEL,this.MouseWheelHandler);
         }
         else
         {
            this.contentHolder.removeEventListener(MouseEvent.MOUSE_WHEEL,this.MouseWheelHandler);
         }
         this.UpdateScrollBar();
      }
      
      public function SetScrollStyleNames(param1:String, param2:String) : void
      {
         this.verticalScrollBarStyleName = param1;
         this.horizontalScrollBarStyleName = param2;
         if(param1 && this._verticalScrollBar)
         {
            this._verticalScrollBar.styleName = param1;
         }
         if(param2 && this._horizontalScrollBar)
         {
            this._horizontalScrollBar.styleName = param2;
         }
      }
      
      public function get contentHolderChildrenSize() : Point
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:DisplayObject = null;
         if(!this._contentHolderChildrenSize)
         {
            this._contentHolderChildrenSize = new Point();
            if(this.contentHolder != null)
            {
               if(this.contentHolder is DisplayObjectContainer)
               {
                  _loc2_ = (this.contentHolder as DisplayObjectContainer).numChildren;
                  _loc1_ = 0;
                  while(_loc1_ < _loc2_)
                  {
                     _loc3_ = (this.contentHolder as DisplayObjectContainer).getChildAt(_loc1_);
                     if(_loc3_.visible)
                     {
                        if(this._contentHolderChildrenSize.x < _loc3_.x + _loc3_.width)
                        {
                           this._contentHolderChildrenSize.x = _loc3_.x + _loc3_.width;
                        }
                        if(this._contentHolderChildrenSize.y < _loc3_.y + _loc3_.height)
                        {
                           this._contentHolderChildrenSize.y = _loc3_.y + _loc3_.height;
                        }
                     }
                     _loc1_++;
                  }
               }
               else if(this.contentHolder is TextField)
               {
                  this._contentHolderChildrenSize.x = this.contentHolder.x + Math.max((this.contentHolder as TextField).textWidth,this.contentHolder.width);
                  this._contentHolderChildrenSize.y = this.contentHolder.y + Math.max((this.contentHolder as TextField).textHeight,this.contentHolder.height);
               }
            }
         }
         return this._contentHolderChildrenSize;
      }
      
      public function UpdateContentHolderChildrenSize() : void
      {
         this._contentHolderChildrenSize = null;
      }
      
      public function get hasHorizontalScrollBar() : Boolean
      {
         if(this.contentHolder == null || this.contentHolder.scrollRect == null)
         {
            return false;
         }
         return this.horizontalScrollPolicy != ScrollPolicy.OFF && this.contentHolderChildrenSize.x > this.contentHolder.scrollRect.width || this.horizontalScrollPolicy == ScrollPolicy.ON;
      }
      
      public function get hasHorizontalScrollBarAdded() : Boolean
      {
         return this._horizontalScrollBar != null && this._horizontalScrollBar.parent != null;
      }
      
      public function get horizontalScrollBarHeight() : int
      {
         return ScrollBar.WIDTH;
      }
      
      public function GetHorizontalScrollBar() : HScrollBar
      {
         if(this._horizontalScrollBar == null && this.hasHorizontalScrollBar)
         {
            this._horizontalScrollBar = new HScrollBar();
            if(this.horizontalScrollBarStyleName)
            {
               this._horizontalScrollBar.styleName = this.horizontalScrollBarStyleName;
            }
            this._horizontalScrollBar.addEventListener(Event.CHANGE,this.ScrollBarChangeHandler);
            this._horizontalScrollBar.addEventListener(ScrollEvent.SCROLL_BAR_DOWN,this.ScrollBarChangeHandler);
            this._horizontalScrollBar.addEventListener(ScrollEvent.SCROLL_BAR_UP,this.ScrollBarChangeHandler);
            this.UpdateScrollBar();
         }
         return this._horizontalScrollBar;
      }
      
      public function RemoveHorizontalScrollBar() : void
      {
         if(this._horizontalScrollBar != null)
         {
            this._horizontalScrollBar.Dispose();
            this._horizontalScrollBar.removeEventListener(Event.CHANGE,this.ScrollBarChangeHandler);
            this._horizontalScrollBar.removeEventListener(ScrollEvent.SCROLL_BAR_DOWN,this.ScrollBarChangeHandler);
            this._horizontalScrollBar.removeEventListener(ScrollEvent.SCROLL_BAR_UP,this.ScrollBarChangeHandler);
            if(this._horizontalScrollBar.parent && this._horizontalScrollBar.parent.contains(this._horizontalScrollBar))
            {
               this._horizontalScrollBar.parent.removeChild(this._horizontalScrollBar);
            }
            else if(this._horizontalScrollBar.parent is Container)
            {
               (this._horizontalScrollBar.parent as Container).$removeChild(this._horizontalScrollBar);
            }
            this.horizontalScrollPosition = 0;
            this._horizontalScrollBar = null;
            this.UpdateScrollBar();
         }
      }
      
      public function get horizontalScrollPosition() : Number
      {
         return this._horizontalScrollPosition;
      }
      
      public function set horizontalScrollPosition(param1:Number) : void
      {
         if(this._horizontalScrollPosition == param1)
         {
            return;
         }
         if(param1 < this.minHorizontalScrollPosition)
         {
            this._horizontalScrollPosition = this.minHorizontalScrollPosition;
         }
         else if(this.maxHorizontalScrollPosition > 0 && param1 > this.maxHorizontalScrollPosition)
         {
            this._horizontalScrollPosition = this.maxHorizontalScrollPosition;
         }
         else
         {
            this._horizontalScrollPosition = param1;
         }
         this.UpdatePosition();
      }
      
      public function get maxHorizontalScrollPosition() : Number
      {
         return this._maxHorizontalScrollPosition;
      }
      
      public function set maxHorizontalScrollPosition(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         this._maxHorizontalScrollPosition = param1;
         if(this.horizontalScrollPosition > this._maxHorizontalScrollPosition)
         {
            this.horizontalScrollPosition > this._maxHorizontalScrollPosition;
         }
      }
      
      public function get minHorizontalScrollPosition() : Number
      {
         return this._minHorizontalScrollPosition;
      }
      
      public function set minHorizontalScrollPosition(param1:Number) : void
      {
         this._minHorizontalScrollPosition = param1;
         if(this.horizontalScrollPosition < this._minHorizontalScrollPosition)
         {
            this.horizontalScrollPosition = this._minHorizontalScrollPosition;
         }
      }
      
      public function get horizontalScrollPolicy() : String
      {
         return this._horizontalScrollPolicy;
      }
      
      public function set horizontalScrollPolicy(param1:String) : void
      {
         if(this._horizontalScrollPolicy != param1)
         {
            this._horizontalScrollPolicy = param1;
         }
      }
      
      public function get horizontalLineScrollSize() : Number
      {
         return this._horizontalLineScrollSize;
      }
      
      public function set horizontalLineScrollSize(param1:Number) : void
      {
         this._horizontalLineScrollSize = param1;
      }
      
      public function get horizontalPageScrollSize() : Number
      {
         return this._horizontalPageScrollSize;
      }
      
      public function set horizontalPageScrollSize(param1:Number) : void
      {
         this._horizontalPageScrollSize = param1;
      }
      
      public function get hasVerticalScrollBar() : Boolean
      {
         if(this.contentHolder == null || this.contentHolder.scrollRect == null)
         {
            return false;
         }
         return this.verticalScrollPolicy != ScrollPolicy.OFF && this.contentHolderChildrenSize.y > this.contentHolder.scrollRect.height || this.verticalScrollPolicy == ScrollPolicy.ON;
      }
      
      public function get hasVerticalScrollBarAdded() : Boolean
      {
         return this._verticalScrollBar != null && this._verticalScrollBar.parent != null;
      }
      
      public function GetVerticalScrollBar() : VScrollBar
      {
         if(this._verticalScrollBar == null)
         {
            this._verticalScrollBar = new VScrollBar();
            if(this.verticalScrollBarStyleName)
            {
               this._verticalScrollBar.styleName = this.verticalScrollBarStyleName;
            }
            this._verticalScrollBar.addEventListener(Event.CHANGE,this.ScrollBarChangeHandler);
            this._verticalScrollBar.addEventListener(ScrollEvent.SCROLL_BAR_DOWN,this.ScrollBarChangeHandler);
            this._verticalScrollBar.addEventListener(ScrollEvent.SCROLL_BAR_UP,this.ScrollBarChangeHandler);
            this.UpdateScrollBar();
         }
         return this._verticalScrollBar;
      }
      
      public function RemoveVerticalScrollBar() : void
      {
         if(this._verticalScrollBar != null)
         {
            this._verticalScrollBar.Dispose();
            this._verticalScrollBar.removeEventListener(Event.CHANGE,this.ScrollBarChangeHandler);
            this._verticalScrollBar.removeEventListener(ScrollEvent.SCROLL_BAR_DOWN,this.ScrollBarChangeHandler);
            this._verticalScrollBar.removeEventListener(ScrollEvent.SCROLL_BAR_UP,this.ScrollBarChangeHandler);
            if(this._verticalScrollBar.parent && this._verticalScrollBar.parent.contains(this._verticalScrollBar))
            {
               this._verticalScrollBar.parent.removeChild(this._verticalScrollBar);
            }
            else if(this._verticalScrollBar.parent is Container)
            {
               (this._verticalScrollBar.parent as Container).$removeChild(this._verticalScrollBar);
            }
            this._verticalScrollBar = null;
            this.verticalScrollPosition = 0;
            this.UpdateScrollBar();
         }
      }
      
      public function get verticalScrollBarWidth() : int
      {
         return ScrollBar.WIDTH;
      }
      
      public function get verticalScrollPosition() : Number
      {
         return this._verticalScrollPosition;
      }
      
      public function set verticalScrollPosition(param1:Number) : void
      {
         if(this._verticalScrollPosition == param1)
         {
            return;
         }
         if(param1 < this.minVerticalScrollPosition)
         {
            this._verticalScrollPosition = this.minVerticalScrollPosition;
         }
         else if(this.maxVerticalScrollPosition > 0 && param1 > this.maxVerticalScrollPosition)
         {
            this._verticalScrollPosition = this.maxVerticalScrollPosition;
         }
         else
         {
            this._verticalScrollPosition = param1;
         }
         this.UpdatePosition();
      }
      
      private function get $verticalScrollPosition() : Number
      {
         return this._verticalScrollPosition - this.contentY;
      }
      
      private function get $horizontalScrollPosition() : Number
      {
         return this._horizontalScrollPosition - this.contentX;
      }
      
      public function get maxVerticalScrollPosition() : Number
      {
         return this._maxVerticalScrollPosition;
      }
      
      public function set maxVerticalScrollPosition(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         this._maxVerticalScrollPosition = param1;
         if(this.verticalScrollPosition > this._maxVerticalScrollPosition)
         {
            this.verticalScrollPosition > this._maxVerticalScrollPosition;
         }
      }
      
      public function get minVerticalScrollPosition() : Number
      {
         return this._minVerticalScrollPosition;
      }
      
      public function set minVerticalScrollPosition(param1:Number) : void
      {
         this._minVerticalScrollPosition = param1;
         if(this.horizontalScrollPosition < this._minHorizontalScrollPosition)
         {
            this.horizontalScrollPosition = this._minHorizontalScrollPosition;
         }
      }
      
      public function get verticalScrollPolicy() : String
      {
         return this._verticalScrollPolicy;
      }
      
      public function set verticalScrollPolicy(param1:String) : void
      {
         if(this._verticalScrollPolicy != param1)
         {
            this._verticalScrollPolicy = param1;
         }
      }
      
      public function get verticalLineScrollSize() : Number
      {
         return this._verticalLineScrollSize;
      }
      
      public function set verticalLineScrollSize(param1:Number) : void
      {
         this._verticalLineScrollSize = param1;
      }
      
      public function get verticalPageScrollSize() : Number
      {
         return this._verticalPageScrollSize;
      }
      
      public function set verticalPageScrollSize(param1:Number) : void
      {
         this._verticalPageScrollSize = param1;
      }
      
      public function get scrollRectEnabled() : Boolean
      {
         return this._scrollRectEnabled;
      }
      
      public function set scrollRectEnabled(param1:Boolean) : void
      {
         this._scrollRectEnabled = param1;
      }
      
      private function MouseWheelHandler(param1:MouseEvent) : void
      {
         this.verticalScrollPosition -= param1.delta * this.wheelSpeed;
         param1.stopImmediatePropagation();
      }
      
      private function ScrollBarChangeHandler(param1:Event) : void
      {
         var _loc2_:ScrollEvent = null;
         switch(param1.type)
         {
            case Event.CHANGE:
               if(this._verticalScrollBar != null)
               {
                  this._verticalScrollPosition = this._verticalScrollBar.scrollPosition;
               }
               if(this._horizontalScrollBar != null)
               {
                  this._horizontalScrollPosition = this._horizontalScrollBar.scrollPosition;
               }
               this.UpdatePosition();
               _loc2_ = new ScrollEvent(ScrollEvent.SCROLL_UPDATE);
               this.dispatchEvent(_loc2_);
               param1.stopImmediatePropagation();
               break;
            case ScrollEvent.SCROLL_BAR_DOWN:
            case ScrollEvent.SCROLL_BAR_UP:
               this.dispatchEvent(param1.clone());
         }
      }
      
      public function UpdateScrollBar() : void
      {
         if(this.contentHolder == null || this.contentHolder.scrollRect == null)
         {
            return;
         }
         if(this._verticalScrollBar != null)
         {
            this._verticalScrollBar.scrollRecRatio = this.contentHolder.scrollRect.height / this.contentHolderChildrenSize.y;
            this._verticalScrollBar.scrollPosition = this.verticalScrollPosition;
            this._verticalScrollBar.maxScrollPosition = this.maxVerticalScrollPosition;
            this._verticalScrollBar.minScrollPosition = this.minVerticalScrollPosition;
            this._verticalScrollBar.height = (this.verticalPageScrollSize > 0 ? this.verticalPageScrollSize : this.contentHolder.scrollRect.height) - this.contentY;
            this._verticalScrollBar.width = this._verticalScrollBar.styleDeclaration.scrollBarWidth;
            this._verticalScrollBar.visible = this.verticalScrollPolicy != ScrollPolicy.AUTO_INVISIBLE;
         }
         if(this._horizontalScrollBar != null)
         {
            this._horizontalScrollBar.scrollRecRatio = this.contentHolder.scrollRect.width / this.contentHolderChildrenSize.x;
            this._horizontalScrollBar.scrollPosition = this.horizontalScrollPosition;
            this._horizontalScrollBar.maxScrollPosition = this.maxHorizontalScrollPosition;
            this._horizontalScrollBar.minScrollPosition = this.minHorizontalScrollPosition;
            this._horizontalScrollBar.width = (this.horizontalPageScrollSize > 0 ? this.horizontalPageScrollSize : this.contentHolder.scrollRect.width) - this.contentX;
            this._horizontalScrollBar.height = this._horizontalScrollBar.styleDeclaration.scrollBarWidth;
            this._horizontalScrollBar.visible = this.horizontalScrollPolicy != ScrollPolicy.AUTO_INVISIBLE;
         }
      }
      
      public function UpdatePosition() : void
      {
         if(this.contentHolder == null || this.contentHolder.scrollRect == null)
         {
            return;
         }
         var _loc1_:Number = this.$horizontalScrollPosition;
         var _loc2_:Number = this.$verticalScrollPosition;
         if(this.contentHolder.scrollRect.x != this.horizontalScrollPosition || this.contentHolder.scrollRect.y != this.verticalScrollPosition)
         {
            this.contentHolder.scrollRect = new Rectangle(_loc1_,_loc2_,this.contentHolder.scrollRect.width,this.contentHolder.scrollRect.height);
         }
         if(this.hasVerticalScrollBarAdded && this._verticalScrollBar.scrollPosition != this.verticalScrollPosition)
         {
            this._verticalScrollBar.scrollPosition = this.verticalScrollPosition;
         }
         if(this.hasHorizontalScrollBarAdded && this._horizontalScrollBar.scrollPosition != this.horizontalScrollPosition)
         {
            this._horizontalScrollBar.scrollPosition = this.horizontalScrollPosition;
         }
      }
   }
}
