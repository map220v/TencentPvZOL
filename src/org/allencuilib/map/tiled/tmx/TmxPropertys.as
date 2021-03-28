package org.allencuilib.map.tiled.tmx
{
   public class TmxPropertys
   {
       
      
      private var list:XMLList;
      
      private var data:Array;
      
      public function TmxPropertys(param1:XML)
      {
         super();
         var _loc2_:XMLList = param1["properties"];
         this.list = _loc2_;
      }
      
      public function Get(param1:String) : String
      {
         this.BuildData();
         return this.data[param1];
      }
      
      public function Has(param1:String) : Boolean
      {
         this.BuildData();
         return this.data[param1] != null;
      }
      
      private function BuildData() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:String = null;
         var _loc4_:String = null;
         if(this.data == null)
         {
            this.data = [];
            _loc2_ = this.list.length();
            if(_loc2_ > 0)
            {
               this.list = this.list[0]["property"];
               _loc2_ = this.list.length();
               _loc1_ = 0;
               while(_loc1_ < _loc2_)
               {
                  _loc3_ = this.list[_loc1_].@name;
                  _loc4_ = this.list[_loc1_].@value;
                  this.data[_loc3_] = _loc4_;
                  _loc1_++;
               }
            }
         }
      }
   }
}
