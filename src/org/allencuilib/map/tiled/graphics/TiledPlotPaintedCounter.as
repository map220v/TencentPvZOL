package org.allencuilib.map.tiled.graphics
{
   public class TiledPlotPaintedCounter
   {
       
      
      public var total:int = -1;
      
      public var amount:int;
      
      public var copyPixelsObjects:Array;
      
      private var column:int;
      
      private var row:int;
      
      public function TiledPlotPaintedCounter(param1:int, param2:int)
      {
         super();
         this.row = param1;
         this.column = param2;
      }
      
      public function Reset() : void
      {
         this.amount = 0;
      }
      
      public function SetMeeted() : void
      {
         this.amount = this.total;
      }
      
      public function get meeted() : Boolean
      {
         return this.amount == this.total;
      }
   }
}
