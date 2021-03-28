package org.allencuilib.map.tiled.graphics
{
   import flash.geom.Rectangle;
   
   public class LayedTiledPlotData
   {
       
      
      private var _hasData:Boolean;
      
      private var _visible:Boolean = true;
      
      private var _recForStage:Rectangle;
      
      private var _recSelf:Rectangle;
      
      private var _bmpdOffsetX:int;
      
      private var _bmpdOffsetY:int;
      
      private var _bmpdWidth:int;
      
      private var _bmpdHeight:int;
      
      private var _cellX:Number;
      
      private var _cellY:Number;
      
      private var _tileX:int;
      
      private var _tileY:int;
      
      private var _layer:int;
      
      public function LayedTiledPlotData(param1:Number, param2:Number, param3:int, param4:int, param5:int, param6:int = 0, param7:int = 0, param8:int = 0, param9:int = 0)
      {
         super();
         this._cellX = param1;
         this._cellY = param2;
         this._tileX = param3;
         this._tileY = param4;
         this._layer = param5;
         this._bmpdOffsetX = param6;
         this._bmpdOffsetY = param7;
         this._bmpdWidth = param8;
         this._bmpdHeight = param9;
         this._hasData = param8 > 0 && param9 > 0;
      }
      
      public function get hasData() : Boolean
      {
         return this._hasData && this._visible;
      }
      
      public function set visible(param1:Boolean) : void
      {
         this._visible = param1;
      }
      
      public function get recForStage() : Rectangle
      {
         if(this._recForStage == null)
         {
            this._recForStage = new Rectangle(this.cellX + this.bmpdOffsetX,this.cellY + this.bmpdOffsetY,this.bmpdWidth,this.bmpdHeight);
         }
         return this._recForStage;
      }
      
      public function get recSelf() : Rectangle
      {
         if(this._recSelf == null)
         {
            this._recSelf = new Rectangle(this.bmpdOffsetX,this.bmpdOffsetY,this.bmpdWidth,this.bmpdHeight);
         }
         return this._recSelf;
      }
      
      public function get bmpdOffsetX() : int
      {
         return this._bmpdOffsetX;
      }
      
      public function get bmpdOffsetY() : int
      {
         return this._bmpdOffsetY;
      }
      
      public function get bmpdWidth() : int
      {
         return this._bmpdWidth;
      }
      
      public function get bmpdHeight() : int
      {
         return this._bmpdHeight;
      }
      
      public function get cellX() : Number
      {
         return this._cellX;
      }
      
      public function get cellY() : Number
      {
         return this._cellY;
      }
      
      public function get destX() : int
      {
         return this.cellX + this.bmpdOffsetX;
      }
      
      public function get destY() : int
      {
         return this.cellY;
      }
      
      public function get tileX() : int
      {
         return this._tileX;
      }
      
      public function get tileY() : int
      {
         return this._tileY;
      }
      
      public function get layer() : int
      {
         return this._layer;
      }
   }
}
