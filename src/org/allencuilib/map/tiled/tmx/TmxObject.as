package org.allencuilib.map.tiled.tmx
{
   import asgui.core.IDisposable;
   import org.allencuilib.map.tiled.TiledOrientation;
   
   public class TmxObject implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      public var properties:TmxPropertys;
      
      private var _gid:int;
      
      private var _name:String;
      
      private var _type:String;
      
      private var _x:int;
      
      private var _y:int;
      
      private var _cellX:Number;
      
      private var _cellY:Number;
      
      private var _cellWidth:int;
      
      private var _cellHeight:int;
      
      private var _width:int;
      
      private var _height:int;
      
      public function TmxObject(param1:XML, param2:int, param3:int, param4:String)
      {
         super();
         this._x = param1.@x;
         this._y = param1.@y;
         this._width = param1.@width;
         this._height = param1.@height;
         this._name = param1.@name;
         this._type = param1.@type;
         this._cellY = this.y / param3;
         this._cellHeight = this.height / param3;
         if(param4 == TiledOrientation.ISOMETRIC)
         {
            this._cellX = this.x / param3;
            this._cellWidth = this.width / param3;
            if(int(param1.@gid) > 0)
            {
               this._width = param3;
               this._height = param3;
               this._gid = param1.@gid;
            }
         }
         else
         {
            this._cellX = this.x / param2;
            this._cellWidth = this.width / param2;
            if(int(param1.@gid) > 0)
            {
               this._width = param2;
               this._height = param3;
               this._gid = param1.@gid;
            }
         }
         this.properties = new TmxPropertys(param1);
      }
      
      public function Dispose() : void
      {
         this.properties = null;
         this._disposed = true;
      }
      
      public function get hasDisposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get gid() : int
      {
         return this._gid;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get x() : int
      {
         return this._x;
      }
      
      public function get y() : int
      {
         return this._y;
      }
      
      public function get cellX() : Number
      {
         return this._cellX;
      }
      
      public function get cellY() : Number
      {
         return this._cellY;
      }
      
      public function get cellWidth() : int
      {
         return this._cellWidth;
      }
      
      public function get cellHeight() : int
      {
         return this._cellHeight;
      }
      
      public function get width() : int
      {
         return this._width;
      }
      
      public function get height() : int
      {
         return this._height;
      }
   }
}
