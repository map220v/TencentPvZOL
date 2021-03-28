package com.qq.utils
{
   public class PvzMathUtil
   {
       
      
      public function PvzMathUtil()
      {
         super();
      }
      
      public static function checkBitPosition(param1:int, param2:int) : Boolean
      {
         return (1 << param2 & param1) > 0;
      }
      
      public static function randomByChance(param1:Array) : int
      {
         var _loc2_:int = 0;
         var _loc5_:int = 0;
         var _loc3_:int = 0;
         _loc3_ = 0;
         while(_loc3_ < param1.length)
         {
            _loc2_ += int(param1[_loc3_]);
            _loc3_++;
         }
         var _loc4_:int = Math.random() * _loc2_;
         _loc3_ = 0;
         while(_loc3_ < param1.length)
         {
            _loc5_ += int(param1[_loc3_]);
            if(_loc4_ < _loc5_)
            {
               return _loc3_;
            }
            _loc3_++;
         }
         return 0;
      }
      
      public static function randomBoolenArr(param1:int, param2:int) : Array
      {
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         while(_loc4_ < param1 - param2)
         {
            _loc3_.push(false);
            _loc4_++;
         }
         var _loc5_:int = 0;
         while(_loc5_ < param2)
         {
            _loc3_.splice(int(Math.random() * _loc3_.length),0,true);
            _loc5_++;
         }
         return _loc3_;
      }
   }
}
