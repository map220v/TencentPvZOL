package org.allencuilib.map.tiled.graphics
{
   import flash.display.BitmapData;
   import flash.geom.Matrix;
   import org.allencuilib.map.interfaces.ITiledPlotData;
   import org.allencuilib.map.tiled.tmx.TmxPropertys;
   import org.allencuilib.map.tiled.tmx.TmxTile;
   import org.allencuilib.map.tiled.tmx.TmxTileset;
   
   public class TiledPlotData implements ITiledPlotData
   {
       
      
      public var properties:TmxPropertys;
      
      private var bmpd:BitmapData;
      
      private var bmpdXFlip:BitmapData;
      
      private var bmpdYFlip:BitmapData;
      
      private var bmpdXYFlip:BitmapData;
      
      private var scales:Array;
      
      private var _width:int;
      
      private var _height:int;
      
      public function TiledPlotData(param1:BitmapData = null)
      {
         this.scales = [];
         super();
         this.bmpd = param1;
         if(param1)
         {
            this._width = param1.width;
            this._height = param1.height;
         }
      }
      
      public function get width() : int
      {
         return this._width;
      }
      
      public function get height() : int
      {
         return this._height;
      }
      
      public function GetBitmapData(param1:Boolean = false, param2:Boolean = false, param3:Number = 1, param4:Number = 1) : BitmapData
      {
         if(this.bmpd == null)
         {
            return null;
         }
         var _loc5_:BitmapData = this.bmpd;
         if(param1 && param2)
         {
            if(this.bmpdXYFlip == null)
            {
               this.bmpdXYFlip = this.DrawFlipedBitmapData(param1,param2);
            }
            _loc5_ = this.bmpdXYFlip;
         }
         else if(param1)
         {
            if(this.bmpdXFlip == null)
            {
               this.bmpdXFlip = this.DrawFlipedBitmapData(param1,param2);
            }
            _loc5_ = this.bmpdXFlip;
         }
         else if(param2)
         {
            if(this.bmpdYFlip == null)
            {
               this.bmpdYFlip = this.DrawFlipedBitmapData(param1,param2);
            }
            _loc5_ = this.bmpdYFlip;
         }
         return this.UpdateScaledBmpd(_loc5_,param1,param2,param3,param4);
      }
      
      public function GetMemSize() : int
      {
         var _loc1_:int = 0;
         if(this.bmpd)
         {
            _loc1_ = this.bmpd.width * this.bmpd.height * 4;
         }
         return _loc1_;
      }
      
      private function UpdateScaledBmpd(param1:BitmapData, param2:Boolean, param3:Boolean, param4:Number, param5:Number) : BitmapData
      {
         var _loc6_:BitmapData = null;
         var _loc7_:Matrix = null;
         if(param4 == 1 && param5 == 1)
         {
            return param1;
         }
         if(this.scales[param2 + "_" + param3 + "_" + param4 + "_" + param5] == null)
         {
            _loc6_ = new BitmapData(param1.width * param4,param1.height * param5,param1.transparent,0);
            (_loc7_ = new Matrix()).scale(param4,param5);
            _loc6_.draw(param1,_loc7_,null,null,null,true);
            this.scales[param2 + "_" + param3 + "_" + param4 + "_" + param5] = _loc6_;
         }
         return this.scales[param2 + "_" + param3 + "_" + param4 + "_" + param5];
      }
      
      private function DrawFlipedBitmapData(param1:Boolean, param2:Boolean) : BitmapData
      {
         var _loc3_:Matrix = null;
         var _loc4_:BitmapData = null;
         _loc3_ = new Matrix();
         _loc3_.scale(!!param1 ? Number(-1) : Number(1),!!param2 ? Number(-1) : Number(1));
         _loc3_.translate(!!param1 ? Number(this.bmpd.width) : Number(0),!!param2 ? Number(this.bmpd.height) : Number(0));
         (_loc4_ = new BitmapData(this.bmpd.width,this.bmpd.height,true,0)).draw(this.bmpd,_loc3_);
         return _loc4_;
      }
      
      public function LoadTmxTileset(param1:TmxTileset) : void
      {
      }
      
      public function LoadTmxTile(param1:TmxTile) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(param1.properties != null)
         {
            this.properties = param1.properties;
         }
      }
   }
}
