package asgui.core
{
   import asgui.events.AsguiEvent;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.utils.getQualifiedClassName;
   
   class LayoutUIComponent extends Sprite implements IAsguiDisplayObject, IValidatableComponent, ILayoutComponent
   {
       
      
      public var customerData:Object;
      
      protected var initialized:Boolean = false;
      
      protected var disposing:Boolean = false;
      
      protected var _disposed:Boolean;
      
      private var _id:String;
      
      protected var _width:Number;
      
      protected var $width:Number;
      
      protected var _height:Number;
      
      protected var $height:Number = 0;
      
      private var _left:Number;
      
      private var _right:Number;
      
      private var _hcenter:Number;
      
      private var _top:Number;
      
      private var _bottom:Number;
      
      private var _vcenter:Number;
      
      public var invalidateLayoutFlag:Boolean;
      
      private var lastDisplayWidth:int = 0;
      
      private var lastDisplayHeight:int = 0;
      
      private var lastWidth:int = 0;
      
      private var lastHeight:int = 0;
      
      protected var invalidateSkinFlag:Boolean;
      
      protected var invalidateSizeFlag:Boolean;
      
      protected var invalidateDisplayListFlag:Boolean;
      
      protected var invalidatePropertiesFlag:Boolean;
      
      protected var _parents:int = -1;
      
      function LayoutUIComponent()
      {
         super();
      }
      
      public function get hasDisposed() : Boolean
      {
         return this._disposed;
      }
      
      public function Dispose() : void
      {
         this.customerData = null;
         this._disposed = true;
      }
      
      public function get id() : String
      {
         return this._id;
      }
      
      public function set id(param1:String) : void
      {
         this._id = param1;
      }
      
      override public function set width(param1:Number) : void
      {
         if(!isNaN(param1))
         {
            param1 = int(param1);
         }
         if(this._width != param1 || isNaN(param1))
         {
            this._width = param1;
            this.InvalidateDisplayList(this);
            this.InvalidateSize();
            this.InvalidateSkin();
            this.InvalidateLayout();
            this.dispatchEvent(new AsguiEvent(AsguiEvent.WIDTH_CHANGED));
         }
      }
      
      override public function get width() : Number
      {
         if(!isNaN(this._width))
         {
            return this._width;
         }
         return this.$width;
      }
      
      override public function set height(param1:Number) : void
      {
         if(!isNaN(param1))
         {
            param1 = int(param1);
         }
         if(this._height != param1 || isNaN(param1))
         {
            this._height = param1;
            this.InvalidateDisplayList(this);
            this.InvalidateSize();
            this.InvalidateSkin();
            this.InvalidateLayout();
            this.dispatchEvent(new AsguiEvent(AsguiEvent.HEIGHT_CHANGED));
         }
      }
      
      override public function get height() : Number
      {
         if(!isNaN(this._height))
         {
            return this._height;
         }
         return this.$height;
      }
      
      public function get left() : Number
      {
         return this._left;
      }
      
      public function set left(param1:Number) : void
      {
         if(!isNaN(param1))
         {
            param1 = int(param1);
         }
         if(this._left == param1)
         {
            return;
         }
         this._left = param1;
         if(!isNaN(param1))
         {
            this.hcenter = NaN;
         }
         this.InvalidateLayout();
      }
      
      public function get right() : Number
      {
         return this._right;
      }
      
      public function set right(param1:Number) : void
      {
         if(!isNaN(param1))
         {
            param1 = int(param1);
         }
         if(this._right == param1)
         {
            return;
         }
         this._right = param1;
         if(!isNaN(param1))
         {
            this.hcenter = NaN;
         }
         this.InvalidateLayout();
      }
      
      public function get hcenter() : Number
      {
         return this._hcenter;
      }
      
      public function set hcenter(param1:Number) : void
      {
         if(!isNaN(param1))
         {
            param1 = int(param1);
         }
         if(this._hcenter == param1)
         {
            return;
         }
         this._hcenter = param1;
         if(!isNaN(param1))
         {
            this.left = NaN;
            this.right = NaN;
         }
         this.InvalidateLayout();
      }
      
      public function get top() : Number
      {
         return this._top;
      }
      
      public function set top(param1:Number) : void
      {
         if(!isNaN(param1))
         {
            param1 = int(param1);
         }
         if(this._top == param1)
         {
            return;
         }
         this._top = param1;
         if(!isNaN(param1))
         {
            this.vcenter = NaN;
         }
         this.InvalidateLayout();
      }
      
      public function get bottom() : Number
      {
         return this._bottom;
      }
      
      public function set bottom(param1:Number) : void
      {
         if(!isNaN(param1))
         {
            param1 = int(param1);
         }
         if(this._bottom == param1)
         {
            return;
         }
         this._bottom = param1;
         if(!isNaN(param1))
         {
            this.vcenter = NaN;
         }
         this.InvalidateLayout();
      }
      
      public function get vcenter() : Number
      {
         return this._vcenter;
      }
      
      public function set vcenter(param1:Number) : void
      {
         if(!isNaN(param1))
         {
            param1 = int(param1);
         }
         if(this._vcenter == param1)
         {
            return;
         }
         this._vcenter = param1;
         if(!isNaN(param1))
         {
            this.top = NaN;
            this.bottom = NaN;
         }
         this.InvalidateLayout();
      }
      
      private function get isOnDisplayList() : Boolean
      {
         return this.root != null;
      }
      
      public function InvalidateLayout() : void
      {
         if(!this.invalidateLayoutFlag && this.initialized && !this.disposing)
         {
            if(isNaN(this.right) && isNaN(this.hcenter) && isNaN(this.bottom) && isNaN(this.vcenter))
            {
               return;
            }
            if(this.parent is IContainer)
            {
               this.invalidateLayoutFlag = true;
               (this.parent as IContainer).InvalidateDisplayList(this);
            }
         }
      }
      
      public function ValidateLayout(param1:int = 0, param2:int = 0) : Boolean
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         if(this.invalidateLayoutFlag || this.lastDisplayWidth != param1 || this.lastDisplayHeight != param2 || this.lastWidth != this.width || this.lastHeight != this.height)
         {
            this.lastDisplayWidth = param1;
            this.lastDisplayHeight = param2;
            this.lastWidth = this.width;
            this.lastHeight = this.height;
            _loc3_ = this.x;
            _loc4_ = this.y;
            _loc5_ = this.width;
            _loc6_ = this.height;
            if(!isNaN(this.left))
            {
               _loc3_ = this.left;
               if(!isNaN(this.right))
               {
                  if(this.parent && param1 > 0)
                  {
                     _loc5_ = param1 - this.right - this.left;
                  }
               }
            }
            else if(!isNaN(this.right))
            {
               _loc3_ = param1 - this.right - this.width;
            }
            else if(!isNaN(this.hcenter))
            {
               _loc3_ = int((param1 - this.width) / 2 + this.hcenter);
            }
            if(!isNaN(this.top))
            {
               _loc4_ = this.top;
               if(!isNaN(this.bottom))
               {
                  if(this.parent && param2 > 0)
                  {
                     _loc6_ = param2 - this.top - this.bottom;
                  }
               }
            }
            else if(!isNaN(this.bottom))
            {
               _loc4_ = param2 - this.bottom - this.height;
            }
            else if(!isNaN(this.vcenter))
            {
               _loc4_ = int((param2 - this.height) / 2 + this.vcenter);
            }
            if(_loc3_ != this.x)
            {
               this.x = _loc3_;
            }
            if(_loc4_ != this.y)
            {
               this.y = _loc4_;
            }
            if(_loc5_ != this.width)
            {
               this.width = _loc5_;
            }
            if(_loc6_ != this.height)
            {
               this.height = _loc6_;
            }
            this.invalidateLayoutFlag = false;
            return true;
         }
         return false;
      }
      
      public function InvalidateSkin() : void
      {
         if(!this.invalidateSkinFlag && this.initialized && !this.disposing)
         {
            this.invalidateSkinFlag = true;
            UIComponentGlobals.layoutManager.InvalidateSkin(this);
         }
      }
      
      public function ValidateSkin() : void
      {
         if(this.invalidateSkinFlag)
         {
            this.invalidateSkinFlag = false;
         }
      }
      
      public function InvalidateSize() : void
      {
         if(!this.invalidateSizeFlag && this.initialized && !this.disposing)
         {
            this.invalidateSizeFlag = true;
            UIComponentGlobals.layoutManager.InvalidateSize(this);
         }
      }
      
      public function ValidateSize() : void
      {
         this.invalidateSizeFlag = false;
      }
      
      public function InvalidateDisplayList(param1:Object = null) : void
      {
         if(!this.invalidateDisplayListFlag && this.initialized && !this.disposing)
         {
            this.InvalidateLayout();
            if(this is IContainer)
            {
               this.invalidateDisplayListFlag = true;
               UIComponentGlobals.layoutManager.InvalidateDisplayList(this);
            }
            if(this.parent is IContainer)
            {
               (this.parent as IContainer).InvalidateDisplayList(param1);
            }
         }
      }
      
      public function ValidateDisplayList() : void
      {
         if(this.invalidateDisplayListFlag)
         {
            this.invalidateDisplayListFlag = false;
         }
      }
      
      public function InvalidateProperties() : void
      {
         if(!this.invalidatePropertiesFlag && this.initialized && !this.disposing)
         {
            this.invalidatePropertiesFlag = true;
            UIComponentGlobals.layoutManager.InvalidateProperties(this);
         }
      }
      
      public function ValidateProperties() : void
      {
         this.invalidatePropertiesFlag = false;
      }
      
      public function get parents() : int
      {
         var _loc1_:DisplayObjectContainer = null;
         if(this._parents == -1)
         {
            if(this is ITopContainer)
            {
               return 0;
            }
            _loc1_ = this;
            this._parents = 0;
            while(_loc1_.parent != null && _loc1_.parent != Application.application)
            {
               _loc1_ = _loc1_.parent;
               ++this._parents;
            }
         }
         return this._parents;
      }
      
      override public function toString() : String
      {
         var _loc1_:String = getQualifiedClassName(this).split("::")[1];
         var _loc2_:int = -1;
         if(this.parent != null)
         {
            _loc2_ = this.parent.getChildIndex(this);
         }
         if(_loc2_ == -1)
         {
            return "[" + _loc1_ + " id=\"" + this.id + "\", name=\"" + name + "\"]";
         }
         return "[" + _loc1_ + " id=\"" + this.id + "\", name=\"" + name + "\", childIndex=\"" + _loc2_ + "\"]";
      }
   }
}
