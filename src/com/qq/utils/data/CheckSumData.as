package com.qq.utils.data
{
   import com.qq.utils.DMath;
   
   public class CheckSumData
   {
      
      private static const Total:int = 4;
      
      private static const _str:String = "PVZGAMEChecksumData";
       
      
      private var _arr:Array;
      
      private var _confusionIndex:int;
      
      public function CheckSumData()
      {
         super();
         this._arr = new Array(Total);
         this._confusionIndex = Total * 0.5;
         this._arr[this._confusionIndex] = _str;
         var _loc1_:int = 0;
         while(_loc1_ < this._arr.length)
         {
            if(this._arr[_loc1_] != _str)
            {
               this._arr[_loc1_] = 0;
            }
            _loc1_++;
         }
      }
      
      public function putData(param1:Number) : void
      {
         var _loc2_:int = DMath.randNum(0,Total - 1);
         if(_loc2_ == this._confusionIndex)
         {
            _loc2_ = 0;
         }
         this._arr[_loc2_] += param1 - this.getTotal();
      }
      
      public function getTotal() : Number
      {
         var _loc1_:Number = 0;
         var _loc2_:int = 0;
         while(_loc2_ < this._arr.length)
         {
            if(_loc2_ != this._confusionIndex)
            {
               _loc1_ += this._arr[_loc2_];
            }
            _loc2_++;
         }
         return _loc1_;
      }
   }
}
