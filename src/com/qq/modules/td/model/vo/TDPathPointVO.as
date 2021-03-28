package com.qq.modules.td.model.vo
{
   import flash.geom.Point;
   
   public class TDPathPointVO
   {
       
      
      private var _xValue:int;
      
      private var _yValue:int;
      
      private var _type:int;
      
      private var _speed:int;
      
      public function TDPathPointVO(param1:int, param2:int, param3:int = 0, param4:int = 0)
      {
         super();
         this._xValue = param1;
         this._yValue = param2;
         this._speed = param3;
         this._type = param4;
      }
      
      public static function getNewPathPointVO(param1:Array) : TDPathPointVO
      {
         var _loc2_:int = 0;
         if(param1.length > 2)
         {
            _loc2_ = param1[2];
         }
         return new TDPathPointVO(param1[0],param1[1],_loc2_);
      }
      
      public function get x() : int
      {
         return this._xValue;
      }
      
      public function get row() : int
      {
         return this._xValue;
      }
      
      public function get y() : int
      {
         return this._yValue;
      }
      
      public function get col() : int
      {
         return this._yValue;
      }
      
      public function get speed() : int
      {
         return this._speed;
      }
      
      public function getPoint() : Point
      {
         return new Point(this._xValue,this._yValue);
      }
      
      public function equals(param1:TDPathPointVO) : Boolean
      {
         return param1.row == this.row && param1.col == this.col;
      }
   }
}
