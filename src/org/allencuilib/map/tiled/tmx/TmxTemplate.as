package org.allencuilib.map.tiled.tmx
{
   import asgui.core.IDisposable;
   
   public class TmxTemplate implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      public var tilesets:Vector.<TmxTileset>;
      
      public var layers:Vector.<TmxLayer>;
      
      public var objectgroups:Vector.<TmxObjectgroup>;
      
      public var properties:TmxPropertys;
      
      private var _tilewidth:int;
      
      private var _tileheight:int;
      
      private var _width:int;
      
      private var _height:int;
      
      private var _orientation:String;
      
      private var _version:String;
      
      private var _tiles:Vector.<TmxTile>;
      
      public function TmxTemplate(param1:XML, param2:String = "", param3:Boolean = false)
      {
         var _loc4_:int = 0;
         var _loc5_:XMLList = null;
         super();
         this._version = param1.@version;
         this._orientation = param1.@orientation;
         this._width = param1.@width;
         this._height = param1.@height;
         this._tilewidth = param1.@tilewidth;
         this._tileheight = param1.@tileheight;
         _loc5_ = param1["tileset"];
         this.tilesets = new Vector.<TmxTileset>(_loc5_.length(),true);
         _loc4_ = 0;
         while(_loc4_ < _loc5_.length())
         {
            this.tilesets[_loc4_] = new TmxTileset(_loc5_[_loc4_],param2);
            _loc4_++;
         }
         _loc5_ = param1["layer"];
         this.layers = new Vector.<TmxLayer>(_loc5_.length(),true);
         _loc4_ = 0;
         while(_loc4_ < _loc5_.length())
         {
            this.layers[_loc4_] = new TmxLayer(_loc5_[_loc4_],_loc4_);
            _loc4_++;
         }
         _loc5_ = param1["objectgroup"];
         this.objectgroups = new Vector.<TmxObjectgroup>(_loc5_.length(),true);
         _loc4_ = 0;
         while(_loc4_ < _loc5_.length())
         {
            this.objectgroups[_loc4_] = new TmxObjectgroup(_loc5_[_loc4_],this.tilewidth,this.tileheight,this.orientation);
            _loc4_++;
         }
         this.properties = new TmxPropertys(param1);
      }
      
      public function Dispose() : void
      {
         while(this.tilesets.length > 0)
         {
            (this.tilesets.pop() as TmxTileset).Dispose();
         }
         this.tilesets = null;
         while(this.layers.length > 0)
         {
            (this.layers.pop() as TmxLayer).Dispose();
         }
         this.layers = null;
         while(this.objectgroups.length > 0)
         {
            (this.objectgroups.pop() as TmxObjectgroup).Dispose();
         }
         this.objectgroups = null;
         this.properties = null;
         this._disposed = true;
      }
      
      public function get hasDisposed() : Boolean
      {
         return this._disposed;
      }
      
      public function GetTilesArrayPropertyValue(param1:String, param2:int = 0) : Vector.<Vector.<String>>
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc3_:Vector.<Vector.<int>> = (this.layers[param2] as TmxLayer).GetTileIntArray();
         var _loc4_:Vector.<Vector.<String>> = new Vector.<Vector.<String>>();
         var _loc5_:Vector.<TmxTile> = this.tiles;
         _loc6_ = 0;
         while(_loc6_ < _loc3_.length)
         {
            _loc4_[_loc6_] = new Vector.<String>();
            _loc7_ = 0;
            while(_loc7_ < _loc3_[_loc6_].length)
            {
               if(_loc5_[_loc3_[_loc6_][_loc7_]])
               {
                  _loc4_[_loc6_][_loc7_] = _loc5_[_loc3_[_loc6_][_loc7_]].properties.Get(param1);
               }
               else
               {
                  _loc4_[_loc6_][_loc7_] = null;
               }
               _loc7_++;
            }
            _loc6_++;
         }
         return _loc4_;
      }
      
      public function GetGridsByCheckFunction(param1:Function) : Vector.<TmxCell>
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:Vector.<Vector.<int>> = null;
         var _loc7_:Vector.<TmxCell> = new Vector.<TmxCell>();
         _loc2_ = 0;
         while(_loc2_ < this.layers.length)
         {
            _loc6_ = (this.layers[_loc2_] as TmxLayer).GetTileIntArray();
            _loc3_ = 0;
            while(_loc3_ < _loc6_.length)
            {
               _loc4_ = 0;
               while(_loc4_ < _loc6_[_loc3_].length)
               {
                  _loc5_ = _loc6_[_loc3_][_loc4_];
                  if(param1.call(this,this.tiles[_loc5_] as TmxTile))
                  {
                     _loc7_.push(new TmxCell(_loc3_,_loc4_,_loc2_,this.tiles[_loc5_] as TmxTile));
                  }
                  _loc4_++;
               }
               _loc3_++;
            }
            _loc2_++;
         }
         return _loc7_;
      }
      
      public function get tilewidth() : int
      {
         return this._tilewidth;
      }
      
      public function get tileheight() : int
      {
         return this._tileheight;
      }
      
      public function get width() : int
      {
         return this._width;
      }
      
      public function get height() : int
      {
         return this._height;
      }
      
      public function get orientation() : String
      {
         return this._orientation;
      }
      
      public function get version() : String
      {
         return this._version;
      }
      
      public function get tiles() : Vector.<TmxTile>
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:TmxTileset = null;
         var _loc4_:TmxTile = null;
         var _loc5_:int = 0;
         if(!this._tiles)
         {
            this._tiles = new Vector.<TmxTile>();
            _loc1_ = 0;
            while(_loc1_ < this.tilesets.length)
            {
               _loc3_ = this.tilesets[_loc1_] as TmxTileset;
               _loc2_ = 0;
               while(_loc2_ < _loc3_.tiles.length)
               {
                  _loc4_ = _loc3_.tiles[_loc2_] as TmxTile;
                  _loc5_ = _loc3_.firstgid + _loc4_.id;
                  if(this._tiles.length < _loc5_)
                  {
                     this._tiles.length = _loc5_;
                  }
                  this._tiles[_loc5_] = _loc4_;
                  _loc2_++;
               }
               _loc1_++;
            }
         }
         return this._tiles;
      }
   }
}
