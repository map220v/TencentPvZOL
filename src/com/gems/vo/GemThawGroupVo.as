package com.gems.vo
{
   import com.gems.GemBase;
   
   public class GemThawGroupVo
   {
       
      
      private var gemThawAllNum:int = 0;
      
      private var gemThawLineNum:int = 0;
      
      public var gemThawAllVec:Vector.<GemBase>;
      
      public var gemThawLineVec:Vector.<GemThawLineVo>;
      
      public function GemThawGroupVo()
      {
         super();
         this.gemThawAllVec = new Vector.<GemBase>();
         this.gemThawLineVec = new Vector.<GemThawLineVo>();
      }
      
      public function addGemThawLine(param1:GemThawLineVo) : void
      {
         this.gemThawLineVec.push(param1);
         ++this.gemThawLineNum;
         var _loc2_:int = param1.gemThawVec.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this.addGemThawAll(param1.gemThawVec[_loc3_]);
            _loc3_++;
         }
      }
      
      public function concat(param1:GemThawGroupVo) : GemThawGroupVo
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:GemThawGroupVo = new GemThawGroupVo();
         _loc3_ = this.gemThawLineVec.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_.addGemThawLine(this.gemThawLineVec[_loc4_]);
            _loc4_++;
         }
         _loc3_ = param1.gemThawLineVec.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_.addGemThawLine(param1.gemThawLineVec[_loc4_]);
            _loc4_++;
         }
         return _loc2_;
      }
      
      private function addGemThawAll(param1:GemBase) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.gemThawAllNum)
         {
            if(this.gemThawAllVec[_loc2_].isEqual(param1))
            {
               return;
            }
            _loc2_++;
         }
         this.gemThawAllVec.push(param1);
         ++this.gemThawAllNum;
      }
      
      public function get length() : int
      {
         return this.gemThawAllNum;
      }
      
      public function get lineLength() : int
      {
         return this.gemThawLineNum;
      }
      
      public function debug() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.gemThawLineVec.length)
         {
            this.gemThawLineVec[_loc1_].debug();
            _loc1_++;
         }
         var _loc2_:String = "";
         var _loc3_:int = 0;
         while(_loc3_ < this.gemThawAllVec.length)
         {
            _loc2_ += "[" + (this.gemThawAllVec[_loc3_] as GemBase).idx + "," + (this.gemThawAllVec[_loc3_] as GemBase).idy + "] ";
            _loc3_++;
         }
      }
   }
}
