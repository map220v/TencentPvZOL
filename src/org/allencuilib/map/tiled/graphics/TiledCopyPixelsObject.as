package org.allencuilib.map.tiled.graphics
{
   class TiledCopyPixelsObject
   {
       
      
      private var x:int;
      
      private var y:int;
      
      private var layedTiledPlotData:LayedTiledPlotData;
      
      function TiledCopyPixelsObject(param1:LayedTiledPlotData, param2:int = 0, param3:int = 0)
      {
         super();
         this.layedTiledPlotData = param1;
         this.x = param2;
         this.y = param3;
      }
      
      public function get destX() : Number
      {
         return this.layedTiledPlotData.destX - this.x;
      }
      
      public function get destY() : Number
      {
         return this.layedTiledPlotData.destY - this.y;
      }
      
      public function get tileX() : int
      {
         return this.layedTiledPlotData.tileX;
      }
      
      public function get tileY() : int
      {
         return this.layedTiledPlotData.tileY;
      }
      
      public function get layer() : int
      {
         return this.layedTiledPlotData.layer;
      }
      
      public function toString() : String
      {
         return "[TiledCopyPixelsObject destX:" + this.destX + ", destY:" + this.destY + ", tileX:" + this.tileX + ", tileY:" + this.tileY + ", layer:" + this.layer + "]";
      }
   }
}
