package asgui.controls.scrolls
{
   import asgui.controls.Button;
   import asgui.core.Application;
   import asgui.core.UIComponent;
   import asgui.events.ScrollEvent;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class ScrollBar extends UIComponent
   {
      
      public static const WIDTH:int = 15;
      
      public static const STYLE:String = "ScrollBar";
       
      
      private var upArrow:Button;
      
      private var downArrow:Button;
      
      private var scrollThumb:Button;
      
      private var isScrolling:Boolean;
      
      private var trackScrollRepeatDirection:int;
      
      private var _direction:String;
      
      private var _maxScrollPosition:Number = 0;
      
      private var _minScrollPosition:Number = 0;
      
      private var _scrollPosition:Number = 0;
      
      private var scrollPositionChanged:Boolean;
      
      private var _scrollRecRatio:Number = 1;
      
      private var scrollThumbMinSize:int = 12;
      
      private var downOnThis:Boolean;
      
      private var lastMouse:Number;
      
      public function ScrollBar(param1:String = null)
      {
         if(param1 == null)
         {
            param1 = ScrollBarDirection.VERTICAL;
         }
         this._direction = param1;
         super();
      }
      
      override public function Dispose() : void
      {
         this.RemoveDrag();
         if(this.upArrow != null)
         {
            this.upArrow.removeEventListener(MouseEvent.CLICK,this.MouseClickHandler);
            this.upArrow.Dispose();
            this.upArrow = null;
         }
         if(this.downArrow != null)
         {
            this.downArrow.removeEventListener(MouseEvent.CLICK,this.MouseClickHandler);
            this.downArrow.Dispose();
            this.downArrow = null;
         }
         if(this.scrollThumb != null)
         {
            this.scrollThumb.removeEventListener(MouseEvent.MOUSE_DOWN,this.DragMouseHandler);
            this.scrollThumb.Dispose();
            this.scrollThumb = null;
         }
         super.Dispose();
      }
      
      override protected function get $defaultStyleName() : String
      {
         return STYLE;
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.scrollThumb = new Button();
         this.addChild(this.scrollThumb);
         this.scrollThumb.addEventListener(MouseEvent.MOUSE_DOWN,this.DragMouseHandler);
         this.upArrow = new Button();
         this.upArrow.addEventListener(MouseEvent.CLICK,this.MouseClickHandler);
         this.addChild(this.upArrow);
         this.downArrow = new Button();
         this.downArrow.addEventListener(MouseEvent.CLICK,this.MouseClickHandler);
         this.addChild(this.downArrow);
      }
      
      override protected function $StyleChanged() : void
      {
         super.$StyleChanged();
         if(this.upArrow)
         {
            this.upArrow.styleName = styleDeclaration.scrollBarDownArrowStyleName;
            if(styleDeclaration.scrollBarArrowWidth > 0)
            {
               this.upArrow.width = styleDeclaration.scrollBarArrowWidth;
            }
            if(styleDeclaration.scrollBarArrowHeight > 0)
            {
               this.upArrow.height = styleDeclaration.scrollBarArrowHeight;
            }
         }
         if(this.downArrow)
         {
            this.downArrow.styleName = styleDeclaration.scrollBarUpArrowStyleName;
            if(styleDeclaration.scrollBarArrowWidth > 0)
            {
               this.downArrow.width = styleDeclaration.scrollBarArrowWidth;
            }
            if(styleDeclaration.scrollBarArrowHeight > 0)
            {
               this.downArrow.height = styleDeclaration.scrollBarArrowHeight;
            }
         }
         if(this.scrollThumb)
         {
            this.scrollThumb.styleName = styleDeclaration.scrollBarThumbStyleName;
            this.scrollThumb.x = styleDeclaration.scrollBarThumbX;
            this.scrollThumb.y = styleDeclaration.scrollBarThumbY;
         }
      }
      
      override public function set doubleClickEnabled(param1:Boolean) : void
      {
      }
      
      override public function set enabled(param1:Boolean) : void
      {
         if(super.enabled == param1)
         {
            return;
         }
         super.enabled = param1;
         InvalidateDisplayList();
      }
      
      public function get direction() : String
      {
         return this._direction;
      }
      
      public function get maxScrollPosition() : Number
      {
         return this._maxScrollPosition;
      }
      
      public function set maxScrollPosition(param1:Number) : void
      {
         this._maxScrollPosition = param1;
         InvalidateSize();
      }
      
      public function get minScrollPosition() : Number
      {
         return this._minScrollPosition;
      }
      
      public function set minScrollPosition(param1:Number) : void
      {
         this._minScrollPosition = param1;
         InvalidateSize();
      }
      
      public function get scrollPosition() : Number
      {
         if(this._scrollPosition < this.minScrollPosition)
         {
            this._scrollPosition = this.minScrollPosition;
         }
         else if(this._scrollPosition > this.maxScrollPosition)
         {
            this._scrollPosition = this.maxScrollPosition;
         }
         return this._scrollPosition;
      }
      
      public function set scrollPosition(param1:Number) : void
      {
         if(this._scrollPosition == param1)
         {
            return;
         }
         if(param1 < this.minScrollPosition)
         {
            this._scrollPosition = this.minScrollPosition;
         }
         else if(param1 > this.maxScrollPosition)
         {
            this._scrollPosition = this.maxScrollPosition;
         }
         else
         {
            this._scrollPosition = param1;
         }
         if(!isNaN(this.scrollThumbPositionByScrollPosition) && this.scrollThumbPosition != this.scrollThumbPositionByScrollPosition)
         {
            this.scrollThumbPosition = this.scrollThumbPositionByScrollPosition;
         }
         this.scrollPositionChanged = true;
         InvalidateProperties();
         InvalidateSkin();
      }
      
      public function get scrollRecRatio() : Number
      {
         return this._scrollRecRatio;
      }
      
      public function set scrollRecRatio(param1:Number) : void
      {
         this._scrollRecRatio = param1;
         InvalidateSize();
      }
      
      private function get scrollThumbWidth() : int
      {
         if(this.direction == ScrollBarDirection.VERTICAL)
         {
            return this.styleDeclaration.scrollBarThumbWidth;
         }
         var _loc1_:int = this.width - this.downArrow.width - this.upArrow.width;
         _loc1_ *= Math.min(1,this.scrollRecRatio);
         return _loc1_ < this.scrollThumbMinSize ? int(this.scrollThumbMinSize) : int(_loc1_);
      }
      
      private function get scrollThumbHeight() : int
      {
         var _loc1_:int = 0;
         if(this.direction == ScrollBarDirection.VERTICAL)
         {
            _loc1_ = height - this.downArrow.height - this.upArrow.height;
            _loc1_ *= Math.min(1,this.scrollRecRatio);
            return _loc1_ < this.scrollThumbMinSize ? int(this.scrollThumbMinSize) : int(_loc1_);
         }
         return this.styleDeclaration.scrollBarThumbWidth;
      }
      
      private function get scrollThumbMinPosition() : int
      {
         if(this.direction == ScrollBarDirection.VERTICAL)
         {
            return this.upArrow.y + this.upArrow.height;
         }
         return this.upArrow.x + this.upArrow.width;
      }
      
      private function get scrollThumbMaxPosition() : int
      {
         if(this.direction == ScrollBarDirection.VERTICAL)
         {
            return this.downArrow.y - this.scrollThumb.height;
         }
         return this.downArrow.x - this.scrollThumb.width;
      }
      
      private function get scrollThumbPositionByScrollPosition() : Number
      {
         if(this.direction == ScrollBarDirection.VERTICAL)
         {
            return this.upArrow.y + this.upArrow.height + this.scrollPosition * this.scrollThumbPositionScale;
         }
         return this.upArrow.x + this.upArrow.width + this.scrollPosition * this.scrollThumbPositionScale;
      }
      
      private function get scrollPositionByScrollPositionScrollThumbPosition() : Number
      {
         if(this.direction == ScrollBarDirection.VERTICAL)
         {
            return (this.scrollThumb.y - this.upArrow.y - this.upArrow.height) / this.scrollThumbPositionScale;
         }
         return (this.scrollThumb.x - this.upArrow.x - this.upArrow.width) / this.scrollThumbPositionScale;
      }
      
      private function get scrollThumbPositionScale() : Number
      {
         if(this.maxScrollPosition - this.minScrollPosition == 0)
         {
            return 1;
         }
         if(this.direction == ScrollBarDirection.VERTICAL)
         {
            return (this.downArrow.y - this.scrollThumb.height - this.upArrow.y - this.upArrow.height) / (this.maxScrollPosition - this.minScrollPosition);
         }
         return (this.downArrow.x - this.scrollThumb.width - this.upArrow.x - this.upArrow.width) / (this.maxScrollPosition - this.minScrollPosition);
      }
      
      private function get scrollThumbPosition() : Number
      {
         if(this.direction == ScrollBarDirection.VERTICAL)
         {
            return this.scrollThumb.y;
         }
         return this.scrollThumb.x;
      }
      
      private function set scrollThumbPosition(param1:Number) : void
      {
         if(this.direction == ScrollBarDirection.VERTICAL)
         {
            this.scrollThumb.y = param1;
         }
         else
         {
            this.scrollThumb.x = param1;
         }
      }
      
      private function AddDrag() : void
      {
         this.RemoveDrag();
         Application.application.stage.addEventListener(MouseEvent.MOUSE_UP,this.DragMouseHandler);
         Application.application.stage.addEventListener(MouseEvent.MOUSE_MOVE,this.DragMouseHandler);
      }
      
      private function RemoveDrag() : void
      {
         Application.application.stage.removeEventListener(MouseEvent.MOUSE_UP,this.DragMouseHandler);
         Application.application.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.DragMouseHandler);
      }
      
      private function DragMouseHandler(param1:MouseEvent) : void
      {
         var _loc2_:Number = this.direction == ScrollBarDirection.VERTICAL ? Number(this.mouseY) : Number(this.mouseX);
         switch(param1.type)
         {
            case MouseEvent.MOUSE_DOWN:
               this.lastMouse = _loc2_;
               this.downOnThis = true;
               this.AddDrag();
               this.dispatchEvent(new ScrollEvent(ScrollEvent.SCROLL_BAR_DOWN));
               break;
            case MouseEvent.MOUSE_UP:
               this.downOnThis = false;
               this.RemoveDrag();
               this.dispatchEvent(new ScrollEvent(ScrollEvent.SCROLL_BAR_UP));
               break;
            case MouseEvent.MOUSE_MOVE:
               if(this.downOnThis)
               {
                  this.scrollThumbPosition += _loc2_ - this.lastMouse;
                  this.scrollPosition = this.scrollPositionByScrollPositionScrollThumbPosition;
                  if(this.scrollThumbPosition < this.scrollThumbMinPosition)
                  {
                     this.scrollThumbPosition = this.scrollThumbMinPosition;
                     this.scrollPosition = this.scrollPositionByScrollPositionScrollThumbPosition;
                     break;
                  }
                  if(this.scrollThumbPosition > this.scrollThumbMaxPosition)
                  {
                     this.scrollThumbPosition = this.scrollThumbMaxPosition;
                     this.scrollPosition = this.scrollPositionByScrollPositionScrollThumbPosition;
                     break;
                  }
                  this.lastMouse = _loc2_;
               }
         }
      }
      
      private function MouseClickHandler(param1:MouseEvent) : void
      {
         switch(param1.currentTarget)
         {
            case this.upArrow:
               this.scrollPosition -= 30;
               break;
            case this.downArrow:
               this.scrollPosition += 30;
         }
      }
      
      override public function ValidateProperties() : void
      {
         if(this.scrollPositionChanged)
         {
            this.scrollPositionChanged = false;
            this.dispatchEvent(new Event(Event.CHANGE));
         }
         super.ValidateProperties();
      }
      
      override public function ValidateSize() : void
      {
         if(disposing)
         {
            return;
         }
         if(invalidateSizeFlag)
         {
            if(this.direction == ScrollBarDirection.VERTICAL)
            {
               this.upArrow.x = (this.width - this.upArrow.width) / 2;
               this.upArrow.y = 0;
               this.downArrow.x = (this.width - this.upArrow.width) / 2;
               this.downArrow.y = this.height - this.downArrow.height;
            }
            else if(this.direction == ScrollBarDirection.HORIZONTAL)
            {
               this.upArrow.x = 0;
               this.upArrow.y = (this.height - this.upArrow.height) / 2;
               this.downArrow.x = this.width - this.downArrow.width;
               this.downArrow.y = (this.height - this.upArrow.height) / 2;
            }
            this.scrollThumb.width = Math.max(this.scrollThumbWidth,!!this.scrollThumb.$SkinCurrent ? Number(this.scrollThumb.$SkinCurrent.widthBorder) : Number(0));
            this.scrollThumb.height = Math.max(this.scrollThumbHeight,!!this.scrollThumb.$SkinCurrent ? Number(this.scrollThumb.$SkinCurrent.heightBorder) : Number(0));
            this.scrollThumbPosition = this.scrollThumbPositionByScrollPosition;
         }
         super.ValidateSize();
      }
   }
}
