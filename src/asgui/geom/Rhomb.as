package asgui.geom
{
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class Rhomb
   {
       
      
      private var _innerRect:Rectangle;
      
      private var _outerRect:Rectangle;
      
      private var _orthogonalLength:Number;
      
      private var _matrixRage:Number;
      
      private var _x:Number;
      
      private var _y:Number;
      
      private var _width:Number;
      
      private var _height:Number;
      
      private var _top:Point;
      
      private var _bottom:Point;
      
      private var _left:Point;
      
      private var _right:Point;
      
      public function Rhomb(param1:Number = 0, param2:Number = 0, param3:Number = 0, param4:Number = 0, param5:Number = NaN)
      {
         super();
         this._x = param1;
         this._y = param2;
         this._width = param3;
         this._height = param4;
         this.orthogonalLength = param5;
      }
      
      private function ResetPoints() : void
      {
         this._bottom = null;
         this._right = null;
         this._left = null;
         this._top = null;
         this._outerRect = null;
         this._innerRect = null;
         this._matrixRage = NaN;
      }
      
      public function Contains(param1:Number, param2:Number) : Boolean
      {
         if(!this.outerRect.contains(param1,param2))
         {
            return false;
         }
         if(this.innerRect.contains(param1,param2))
         {
            return true;
         }
         return false;
      }
      
      public function OffsetTileByIsometric(param1:Number, param2:Number) : Point
      {
         var _loc3_:Number = this.orthogonalLength;
         return new Point(param1 / _loc3_,param2 / _loc3_);
      }
      
      public function OffsetRhombByTile(param1:int, param2:int) : Rhomb
      {
         return new Rhomb(this.x + param1 * this.width / 2 - param2 * this.width / 2,this.y + param2 * this.height / 2 + param1 * this.height / 2,this.width,this.height);
      }
      
      public function CoordToIsometric(param1:Number, param2:Number) : Point
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         param1 -= this.x;
         param2 -= this.y;
         _loc3_ = this.height / this.width;
         _loc4_ = -param2 / (2 * _loc3_) + param1 / 2;
         var _loc5_:Number = param2 / 2 - _loc3_ * param1 / 2;
         var _loc6_:Number = param2 / (2 * _loc3_) + param1 / 2;
         var _loc7_:Number = (param2 + _loc3_ * param1) / 2;
         var _loc8_:Number = _loc4_ < 0 ? Number(1) : Number(-1);
         var _loc9_:Number;
         var _loc10_:Number = (_loc9_ = _loc6_ > 0 ? Number(1) : Number(-1)) * Math.sqrt(Math.pow(_loc6_,2) + Math.pow(_loc7_,2));
         var _loc11_:Number = _loc8_ * Math.sqrt(Math.pow(_loc4_,2) + Math.pow(_loc5_,2));
         var _loc12_:Number = this.matrixRage;
         var _loc13_:Number = Number(_loc12_ * _loc10_);
         var _loc14_:Number = Number(_loc12_ * _loc11_);
         return new Point(_loc13_,_loc14_);
      }
      
      public function get innerRect() : Rectangle
      {
         if(!this._innerRect)
         {
            this._innerRect = new Rectangle(this.x - this.width / 2,this.y,this.width,this.height);
         }
         return this._innerRect;
      }
      
      public function get outerRect() : Rectangle
      {
         if(!this._outerRect)
         {
            this._outerRect = new Rectangle(this.x - this.width / 2,this.y,this.width,this.height);
         }
         return this._outerRect;
      }
      
      public function get orthogonalLength() : Number
      {
         return this._orthogonalLength;
      }
      
      public function set orthogonalLength(param1:Number) : void
      {
         this._orthogonalLength = param1;
         this.ResetPoints();
      }
      
      public function get matrixRage() : Number
      {
         var _loc1_:Number = NaN;
         if(isNaN(this._matrixRage))
         {
            if(!isNaN(this.orthogonalLength))
            {
               _loc1_ = Math.sqrt(Math.pow(this.width / 2,2) + Math.pow(this.height / 2,2));
               this._matrixRage = this.orthogonalLength / _loc1_;
            }
            else
            {
               this._matrixRage = 1;
            }
         }
         return this._matrixRage;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function set x(param1:Number) : void
      {
         this._x = param1;
         this.ResetPoints();
      }
      
      public function get y() : Number
      {
         return this._y;
      }
      
      public function set y(param1:Number) : void
      {
         this._y = param1;
         this.ResetPoints();
      }
      
      public function get width() : Number
      {
         return this._width;
      }
      
      public function set width(param1:Number) : void
      {
         this._width = param1;
         this.ResetPoints();
      }
      
      public function get height() : Number
      {
         return this._height;
      }
      
      public function set height(param1:Number) : void
      {
         this._height = param1;
         this.ResetPoints();
      }
      
      public function get top() : Point
      {
         if(!this._top)
         {
            this._top = new Point(this.x,this.y);
         }
         return this._top;
      }
      
      public function get bottom() : Point
      {
         if(!this._bottom)
         {
            this._bottom = new Point(this.x,this.y + this.height);
         }
         return this._bottom;
      }
      
      public function get left() : Point
      {
         if(!this._left)
         {
            this._left = new Point(this.x - this.width / 2,this.y + this.height / 2);
         }
         return this._left;
      }
      
      public function get right() : Point
      {
         if(!this._right)
         {
            this._right = new Point(this.x + this.width / 2,this.y + this.height / 2);
         }
         return this._right;
      }
   }
}
