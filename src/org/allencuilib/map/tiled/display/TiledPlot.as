package org.allencuilib.map.tiled.display
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class TiledPlot extends Sprite
   {
       
      
      private var backHolder:Sprite;
      
      public var bmp:Bitmap;
      
      public var row:int;
      
      public var column:int;
      
      private var rect:Rectangle;
      
      public function TiledPlot(param1:BitmapData, param2:int = -1, param3:int = -1)
      {
         super();
         this.row = param2;
         this.column = param3;
         this.backHolder = new Sprite();
         this.addChild(this.backHolder);
         this.bmp = new Bitmap(param1);
         this.backHolder.addChild(this.bmp);
         this.rect = new Rectangle(this.backHolder.x,this.backHolder.y,this.bmp.width,this.bmp.height);
      }
      
      public function SetRectanglePosition(param1:Point) : void
      {
         this.backHolder.x = param1.x;
         this.backHolder.y = param1.y;
         this.rect = new Rectangle(this.backHolder.x,this.backHolder.y,this.bmp.width,this.bmp.height);
      }
      
      public function SetEveryPosition(param1:Point, param2:int) : void
      {
         this.backHolder.x = param1.x;
         this.backHolder.y = param1.y - this.bmp.height + param2 / 2;
         this.rect = new Rectangle(this.backHolder.x,this.backHolder.y,this.bmp.width,this.bmp.height);
      }
      
      public function AddBackChild(param1:DisplayObject) : DisplayObject
      {
         return this.backHolder.addChild(param1);
      }
      
      public function RemoveBackChild(param1:DisplayObject) : DisplayObject
      {
         return this.backHolder.removeChild(param1);
      }
      
      public function GetPixel(param1:int, param2:int) : uint
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(this.rect.contains(param1,param2) && this.bmp.bitmapData != null)
         {
            _loc3_ = param1 - this.backHolder.x;
            _loc4_ = param2 - this.backHolder.y;
            return this.bmp.bitmapData.getPixel32(_loc3_,_loc4_);
         }
         return 0;
      }
      
      public function Dispose() : void
      {
         if(this.bmp)
         {
            if(this.bmp.bitmapData)
            {
               this.bmp.bitmapData.dispose();
            }
            this.bmp = null;
         }
      }
      
      public function get bitmapData() : BitmapData
      {
         if(!this.bmp)
         {
            return null;
         }
         return this.bmp.bitmapData;
      }
      
      override public function toString() : String
      {
         return "[TiledPlot  row:" + this.row + ", column:" + this.column + "]";
      }
   }
}
