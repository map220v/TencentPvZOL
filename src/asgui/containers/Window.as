package asgui.containers
{
   import asgui.controls.Button;
   import asgui.core.Application;
   import asgui.core.IUIComponent;
   import asgui.managers.IPopupDragableUI;
   import asgui.managers.PopUpManager;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class Window extends Panel implements IPopupDragableUI
   {
      
      public static const STYLE:String = "Window";
       
      
      public var btnClose:Button;
      
      private var titleRightChild:Array;
      
      private var titleRightChildChanged:Boolean;
      
      private var _dragable:Boolean;
      
      private var dragableChanged:Boolean;
      
      private var _closeButtonVisible:Boolean = true;
      
      private var closeButtonVisibleChanged:Boolean = true;
      
      private var _closeButtonTooltip:String;
      
      private var closeButtonTooltipChanged:Boolean = false;
      
      private var downOnThis:Boolean;
      
      private var lastMouseX:Number;
      
      private var lastMouseY:Number;
      
      private var isPositionChanged:Boolean;
      
      public function Window()
      {
         this.titleRightChild = [];
         super();
      }
      
      override public function Dispose() : void
      {
         if(hasDisposed)
         {
            return;
         }
         this.RemoveDrag();
         while(this.titleRightChild.length > 0)
         {
            this.RemoveTitleRightChildAt(0);
         }
         this.RemoveCloseBtn();
         if(this.btnClose != null)
         {
            this.btnClose.Dispose();
            this.btnClose.removeEventListener(MouseEvent.CLICK,this.ClickEventHandler);
            this.btnClose = null;
         }
         super.Dispose();
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.AddCloseBtn();
      }
      
      override protected function get $defaultStyleName() : String
      {
         return STYLE;
      }
      
      public function AddPopUp(param1:DisplayObjectContainer = null, param2:Boolean = false) : void
      {
         PopUpManager.AddPopUp(this,param1,param2);
      }
      
      public function Close() : void
      {
         this.Dispose();
         PopUpManager.RemovePopUp(this);
         this.dispatchEvent(new Event(Event.CLOSE));
      }
      
      public function AddTitleRightChild(param1:DisplayObject) : DisplayObject
      {
         this.titleRightChild.push(param1);
         this.titleRightChildChanged = true;
         InvalidateProperties();
         return param1;
      }
      
      public function RemoveTitleRightChildAt(param1:int) : DisplayObject
      {
         var _loc2_:DisplayObject = this.titleRightChild.splice(param1,1)[0] as DisplayObject;
         if(_loc2_ is IUIComponent)
         {
            (_loc2_ as IUIComponent).Dispose();
         }
         return _loc2_;
      }
      
      public function GetTitleRightChildAt(param1:int) : DisplayObject
      {
         return this.titleRightChild[param1];
      }
      
      public function get dragable() : Boolean
      {
         return this._dragable;
      }
      
      public function set dragable(param1:Boolean) : void
      {
         if(this._dragable != param1)
         {
            this._dragable = param1;
            this.dragableChanged = true;
            InvalidateProperties();
         }
      }
      
      public function get closeButtonVisible() : Boolean
      {
         return this._closeButtonVisible;
      }
      
      public function set closeButtonVisible(param1:Boolean) : void
      {
         if(this._closeButtonVisible != param1)
         {
            this._closeButtonVisible = param1;
            this.closeButtonVisibleChanged = true;
            InvalidateProperties();
         }
      }
      
      public function get closeButtonTooltip() : String
      {
         return this._closeButtonTooltip;
      }
      
      public function set closeButtonTooltip(param1:String) : void
      {
         if(this._closeButtonTooltip != param1)
         {
            this._closeButtonTooltip = param1;
            this.closeButtonTooltipChanged = true;
            InvalidateProperties();
         }
      }
      
      public function CheckCenterPopUpWhenOutScreen(param1:int, param2:int) : Point
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(param2 < 0)
         {
            param2 = 0;
         }
         return new Point(param1,param2);
      }
      
      private function AddDrag() : void
      {
         this.RemoveDrag();
         this.addEventListener(MouseEvent.MOUSE_DOWN,this.DragMouseHandler);
         Application.application.systemManager.addEventListener(MouseEvent.MOUSE_UP,this.DragMouseHandler);
         Application.application.systemManager.addEventListener(MouseEvent.MOUSE_MOVE,this.DragMouseHandler);
      }
      
      private function RemoveDrag() : void
      {
         this.removeEventListener(MouseEvent.MOUSE_DOWN,this.DragMouseHandler);
         Application.application.systemManager.removeEventListener(MouseEvent.MOUSE_UP,this.DragMouseHandler);
         Application.application.systemManager.removeEventListener(MouseEvent.MOUSE_MOVE,this.DragMouseHandler);
      }
      
      private function DragMouseHandler(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         var _loc3_:DisplayObject = null;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_DOWN:
               if(new Rectangle(0,0,this.width,styleDeclaration.headerHeight).contains(this.mouseX,this.mouseY))
               {
                  if(this.btnClose != null && new Rectangle(this.btnClose.x,this.btnClose.y,this.btnClose.width,this.btnClose.height).contains(this.mouseX,this.mouseY))
                  {
                     break;
                  }
                  _loc2_ = 0;
                  while(_loc2_ < this.titleRightChild.length)
                  {
                     _loc3_ = this.titleRightChild[_loc2_] as DisplayObject;
                     if(new Rectangle(_loc3_.x,_loc3_.y,_loc3_.width,_loc3_.height).contains(this.mouseX,this.mouseY))
                     {
                        break;
                     }
                     _loc2_++;
                  }
                  this.lastMouseX = this.mouseX;
                  this.lastMouseY = this.mouseY;
                  this.downOnThis = true;
               }
               break;
            case MouseEvent.MOUSE_UP:
               this.downOnThis = false;
               break;
            case MouseEvent.MOUSE_MOVE:
               if(this.downOnThis)
               {
                  x += this.mouseX - this.lastMouseX;
                  y += this.mouseY - this.lastMouseY;
                  this.lastMouseX = this.mouseX;
                  this.lastMouseY = this.mouseY;
                  this.isPositionChanged = true;
                  InvalidateProperties();
               }
         }
      }
      
      protected function AddCloseBtn() : void
      {
         this.RemoveCloseBtn();
         if(this.btnClose == null)
         {
            this.btnClose = new Button();
         }
         this.btnClose.toolTip = this.closeButtonTooltip;
         this.btnClose.styleName = styleDeclaration.closeStyleName;
         this.btnClose.addEventListener(MouseEvent.CLICK,this.ClickEventHandler);
         this.$addChild(this.btnClose);
      }
      
      protected function RemoveCloseBtn() : void
      {
         if(this.btnClose != null && this.$contains(this.btnClose))
         {
            this.$removeChild(this.btnClose);
         }
      }
      
      protected function ClickEventHandler(param1:MouseEvent) : void
      {
         switch(param1.currentTarget)
         {
            case this.btnClose:
               this.Close();
         }
      }
      
      override public function ValidateSize() : void
      {
         var _loc1_:int = 0;
         var _loc2_:DisplayObject = null;
         super.ValidateSize();
         if(this.btnClose != null)
         {
            this.btnClose.x = this.width - this.btnClose.width - styleDeclaration.headerPaddingRight;
            this.btnClose.y = styleDeclaration.headerPaddingTop;
         }
         _loc1_ = 0;
         while(_loc1_ < this.titleRightChild.length)
         {
            _loc2_ = this.titleRightChild[_loc1_] as DisplayObject;
            _loc2_.x = (this.btnClose != null ? this.btnClose.x : 0) - (_loc1_ + 1) * (_loc2_.width + styleDeclaration.headerHorizontalGap);
            _loc2_.y = styleDeclaration.headerPaddingTop;
            _loc1_++;
         }
      }
      
      override public function ValidateProperties() : void
      {
         var _loc1_:int = 0;
         var _loc2_:DisplayObject = null;
         super.ValidateProperties();
         if(this.dragableChanged)
         {
            if(this.dragable)
            {
               this.AddDrag();
            }
            else
            {
               this.RemoveDrag();
            }
            this.dragableChanged = false;
         }
         if(this.closeButtonVisibleChanged)
         {
            if(this.closeButtonVisible)
            {
               this.AddCloseBtn();
            }
            else
            {
               this.RemoveCloseBtn();
            }
            this.closeButtonVisibleChanged = false;
         }
         if(this.titleRightChildChanged)
         {
            _loc1_ = 0;
            while(_loc1_ < this.titleRightChild.length)
            {
               _loc2_ = this.titleRightChild[_loc1_] as DisplayObject;
               if(_loc2_.parent == null)
               {
                  this.$addChild(_loc2_);
               }
               _loc1_++;
            }
            this.titleRightChildChanged = false;
         }
         if(this.closeButtonTooltipChanged)
         {
            if(this.btnClose != null)
            {
               this.btnClose.toolTip = this.closeButtonTooltip;
            }
            this.closeButtonTooltipChanged = false;
         }
      }
   }
}
