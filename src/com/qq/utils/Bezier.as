package com.qq.utils
{
   import flash.geom.Point;
   
   public class Bezier
   {
      
      private static var ax:int;
      
      private static var ay:int;
      
      private static var bx:int;
      
      private static var by:int;
      
      private static var A:Number;
      
      private static var B:Number;
      
      private static var C:Number;
      
      private static var total_length:Number;
      
      protected static const PRECISION:Number = 1e-10;
       
      
      private var p0:Point;
      
      private var p1:Point;
      
      private var p2:Point;
      
      private var step:uint;
      
      public function Bezier()
      {
         super();
      }
      
      private static function s(param1:Number) : Number
      {
         return Math.sqrt(A * param1 * param1 + B * param1 + C);
      }
      
      private function InvertL(param1:Number, param2:Number) : Number
      {
         var _loc4_:Number = NaN;
         var _loc3_:Number = param1;
         while(true)
         {
            _loc4_ = _loc3_ - (this.getSegmentLength(_loc3_) - param2) / s(_loc3_);
            if(Math.abs(_loc3_ - _loc4_) < 0.000001)
            {
               break;
            }
            _loc3_ = _loc4_;
         }
         return _loc4_;
      }
      
      public function init(param1:Point, param2:Point, param3:Point, param4:Number) : uint
      {
         this.p0 = param1;
         this.p1 = param2;
         this.p2 = param3;
         ax = this.p0.x - 2 * this.p1.x + this.p2.x;
         ay = this.p0.y - 2 * this.p1.y + this.p2.y;
         bx = 2 * this.p1.x - 2 * this.p0.x;
         by = 2 * this.p1.y - 2 * this.p0.y;
         A = 4 * (ax * ax + ay * ay);
         B = 4 * (ax * bx + ay * by);
         C = bx * bx + by * by;
         total_length = this.getSegmentLength(1);
         this.step = Math.floor(total_length / param4);
         if(total_length % param4 > param4 / 2)
         {
            ++this.step;
         }
         return this.step;
      }
      
      public function getSegmentLength(param1:Number) : Number
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         _loc2_ = this.p1.x - this.p0.x;
         _loc3_ = this.p1.y - this.p0.y;
         _loc4_ = this.p2.x - this.p1.x - _loc2_;
         _loc5_ = this.p2.y - this.p1.y - _loc3_;
         var _loc6_:Number = 4 * (_loc2_ * _loc2_ + _loc3_ * _loc3_);
         var _loc7_:Number = 8 * (_loc2_ * _loc4_ + _loc3_ * _loc5_);
         var _loc8_:Number;
         if((_loc8_ = 4 * (_loc4_ * _loc4_ + _loc5_ * _loc5_)) == 0)
         {
            if(_loc7_ == 0)
            {
               return Number(Math.sqrt(_loc6_) * param1);
            }
            _loc9_ = 2 / 3 * (_loc7_ * param1 + _loc6_) * Math.sqrt(_loc7_ * param1 + _loc6_) / _loc7_;
            _loc10_ = 2 / 3 * _loc6_ * Math.sqrt(_loc6_) / _loc7_;
            return _loc9_ - _loc10_;
         }
         _loc11_ = Math.sqrt(_loc8_ * param1 * param1 + _loc7_ * param1 + _loc6_);
         _loc12_ = Math.sqrt(_loc6_);
         _loc13_ = Math.sqrt(_loc8_);
         _loc9_ = 0.25 * (2 * _loc8_ * param1 + _loc7_) * _loc11_ / _loc8_;
         if((0.5 * _loc7_ + _loc8_ * param1) / _loc13_ + _loc11_ >= PRECISION)
         {
            _loc9_ += 0.5 * Math.log((0.5 * _loc7_ + _loc8_ * param1) / _loc13_ + _loc11_) / _loc13_ * (_loc6_ - 0.25 * _loc7_ * _loc7_ / _loc8_);
         }
         _loc10_ = 0.25 * _loc7_ * _loc12_ / _loc8_;
         if(0.5 * _loc7_ / _loc13_ + _loc12_ >= PRECISION)
         {
            _loc10_ += 0.5 * Math.log(0.5 * _loc7_ / _loc13_ + _loc12_) / _loc13_ * (_loc6_ - 0.25 * _loc7_ * _loc7_ / _loc8_);
         }
         return _loc9_ - _loc10_;
      }
      
      public function getPoint(param1:Number) : Point
      {
         var _loc2_:Point = new Point();
         var _loc3_:Number = 1 - param1;
         _loc2_.x = this.p0.x * _loc3_ * _loc3_ + this.p1.x * 2 * param1 * _loc3_ + this.p2.x * param1 * param1;
         _loc2_.y = this.p0.y * _loc3_ * _loc3_ + this.p1.y * 2 * param1 * _loc3_ + this.p2.y * param1 * param1;
         return _loc2_;
      }
      
      public function getTangentAngle(param1:Number = 0) : Number
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         _loc2_ = this.p0.x + (this.p1.x - this.p0.x) * param1;
         _loc3_ = this.p0.y + (this.p1.y - this.p0.y) * param1;
         _loc4_ = this.p1.x + (this.p2.x - this.p1.x) * param1;
         _loc5_ = this.p1.y + (this.p2.y - this.p1.y) * param1;
         var _loc6_:Number = _loc4_ - _loc2_;
         var _loc7_:Number = _loc5_ - _loc3_;
         return Math.atan2(_loc7_,_loc6_);
      }
      
      public function getAnchorPoint(param1:Number) : Array
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Point = null;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         if(param1 >= 0 && param1 <= this.step)
         {
            _loc2_ = param1 / this.step;
            _loc3_ = _loc2_ * total_length;
            _loc4_ = this.getPoint(_loc2_);
            _loc6_ = (_loc5_ = this.getTangentAngle(_loc2_)) * 180 / Math.PI;
            return new Array(_loc4_.x,_loc4_.y,_loc6_);
         }
         return [];
      }
   }
}
