package asgui.containers
{
   import asgui.containers.tiles.TileDirection;
   import asgui.core.Container;
   import flash.display.DisplayObject;
   
   public class Tile extends Container
   {
      
      public static const STYLE:String = "Tile";
       
      
      private var _direction:String;
      
      private var _tileHeight:int;
      
      protected var $tileHeight:int;
      
      private var _tileWidth:int;
      
      protected var $tileWidth:int;
      
      private var _rowCount:int;
      
      protected var $rowCount:int;
      
      private var _columnCount:int;
      
      protected var $columnCount:int;
      
      public function Tile()
      {
         this._direction = TileDirection.HORIZONTAL;
         super();
         absoluteLayout = false;
      }
      
      override protected function get $defaultStyleName() : String
      {
         return STYLE;
      }
      
      public function get direction() : String
      {
         return this._direction;
      }
      
      public function set direction(param1:String) : void
      {
         this._direction = param1;
         InvalidateSize();
         InvalidateDisplayList();
      }
      
      public function get tileHeight() : int
      {
         return this._tileHeight;
      }
      
      public function set tileHeight(param1:int) : void
      {
         if(this._tileHeight == param1)
         {
            return;
         }
         this._tileHeight = param1;
         InvalidateSize();
         InvalidateDisplayList();
      }
      
      public function get tileWidth() : int
      {
         return this._tileWidth;
      }
      
      public function set tileWidth(param1:int) : void
      {
         if(this._tileWidth == param1)
         {
            return;
         }
         this._tileWidth = param1;
         InvalidateSize();
         InvalidateDisplayList();
      }
      
      public function get rowCount() : int
      {
         return this._rowCount;
      }
      
      public function set rowCount(param1:int) : void
      {
         if(this._rowCount == param1)
         {
            return;
         }
         this._rowCount = param1;
         InvalidateSize();
         InvalidateDisplayList();
      }
      
      public function get columnCount() : int
      {
         return this._columnCount;
      }
      
      public function set columnCount(param1:int) : void
      {
         if(this._columnCount == param1)
         {
            return;
         }
         this._columnCount = param1;
         InvalidateSize();
         InvalidateDisplayList();
      }
      
      override public function setChildIndex(param1:DisplayObject, param2:int) : void
      {
         InvalidateDisplayList();
         super.setChildIndex(param1,param2);
      }
      
      override public function swapChildren(param1:DisplayObject, param2:DisplayObject) : void
      {
         InvalidateDisplayList();
         super.swapChildren(param1,param2);
      }
      
      override public function swapChildrenAt(param1:int, param2:int) : void
      {
         InvalidateDisplayList();
         super.swapChildrenAt(param1,param2);
      }
      
      override public function ValidateSize() : void
      {
         if(!invalidateSizeFlag)
         {
         }
         super.ValidateSize();
      }
      
      override public function ValidateDisplayList() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:DisplayObject = null;
         var _loc11_:* = false;
         var _loc12_:* = false;
         var _loc13_:* = false;
         var _loc14_:* = false;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         if(invalidateDisplayListFlag)
         {
            _loc3_ = this.numChildren;
            _loc4_ = this.styleDeclaration.verticalGap;
            _loc5_ = this.styleDeclaration.horizontalGap;
            _loc6_ = this.styleDeclaration.verticalAlign;
            _loc7_ = this.styleDeclaration.horizontalAlign;
            _loc8_ = styleDeclaration.paddingTop;
            _loc9_ = styleDeclaration.paddingLeft;
            _loc11_ = this.tileWidth > 0;
            _loc12_ = this.tileHeight > 0;
            if(_loc11_)
            {
               this.$tileWidth = this.tileWidth;
            }
            if(_loc12_)
            {
               this.$tileHeight = this.tileHeight;
            }
            if(!_loc11_ || !_loc12_)
            {
               _loc1_ = 0;
               while(_loc1_ < _loc3_)
               {
                  _loc10_ = this.getChildAt(_loc1_);
                  if(!_loc11_ && _loc10_.width > this.$tileWidth)
                  {
                     this.$tileWidth = _loc10_.width;
                  }
                  if(!_loc12_ && _loc10_.height > this.$tileHeight)
                  {
                     this.$tileHeight = _loc10_.height;
                  }
                  _loc1_++;
               }
            }
            _loc13_ = this.rowCount > 0;
            if(_loc14_ = this.columnCount > 0)
            {
               this.$columnCount = this.columnCount;
            }
            else
            {
               _loc15_ = int((this.displayWidth + _loc4_) / (this.$tileWidth + _loc4_));
               this.$columnCount = _loc15_ > 1 ? int(_loc15_) : 1;
            }
            if(_loc13_)
            {
               this.$rowCount = this.rowCount;
            }
            else
            {
               _loc16_ = int((this.displayHeight + _loc5_) / (this.$tileHeight + _loc5_));
               this.$rowCount = _loc16_ > 1 ? int(_loc16_) : 1;
            }
            if(this.direction == TileDirection.HORIZONTAL)
            {
               _loc1_ = 0;
               _loc2_ = 0;
               while(_loc1_ * this.$columnCount + _loc2_ < _loc3_)
               {
                  (_loc10_ = getChildAt(_loc1_ * this.$columnCount + _loc2_)).x = _loc9_ + _loc2_ * (this.$tileWidth + _loc5_);
                  _loc10_.y = _loc8_ + _loc1_ * (this.$tileHeight + _loc4_);
                  _loc2_++;
                  if(_loc2_ == this.$columnCount)
                  {
                     _loc2_ = 0;
                     _loc1_++;
                  }
               }
            }
            else
            {
               _loc1_ = 0;
               _loc2_ = 0;
               while(_loc2_ * this.$rowCount + _loc1_ < _loc3_)
               {
                  (_loc10_ = getChildAt(_loc2_ * this.$rowCount + _loc1_)).x = _loc9_ + _loc2_ * (this.$tileWidth + _loc5_);
                  _loc10_.y = _loc8_ + _loc1_ * (this.$tileHeight + _loc4_);
                  _loc1_++;
                  if(_loc1_ == this.$rowCount)
                  {
                     _loc1_ = 0;
                     _loc2_++;
                  }
               }
            }
         }
         super.ValidateDisplayList();
      }
   }
}
