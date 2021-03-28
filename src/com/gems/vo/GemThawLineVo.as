package com.gems.vo
{
   import com.gems.GemBase;
   
   public class GemThawLineVo
   {
       
      
      public var gemThawVec:Vector.<GemBase>;
      
      public function GemThawLineVo()
      {
         super();
         this.gemThawVec = new Vector.<GemBase>();
      }
      
      public function createByGemThawList(param1:Array) : void
      {
         var _loc2_:int = param1.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this.gemThawVec[_loc3_] = param1[_loc3_];
            _loc3_++;
         }
      }
      
      public function middleGem() : GemBase
      {
         return this.gemThawVec[1];
      }
      
      public function debug() : void
      {
         var _loc1_:String = "";
         var _loc2_:int = 0;
         while(_loc2_ < this.gemThawVec.length)
         {
            _loc1_ += "[" + (this.gemThawVec[_loc2_] as GemBase).idx + "," + (this.gemThawVec[_loc2_] as GemBase).idy + "] ";
            _loc2_++;
         }
      }
   }
}
