package org.allencuilib.map.tiled.tmx
{
   import asgui.core.ByteLoader;
   import asgui.core.IDisposable;
   import asgui.managers.LoaderManager;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import org.allencuilib.map.tiled.TiledResource;
   
   public class TmxTileset extends EventDispatcher implements IDisposable
   {
       
      
      private var resourceFolder:String;
      
      private var _disposed:Boolean;
      
      private var _hasLoaded:Boolean;
      
      public var tiles:Vector.<TmxTile>;
      
      private var _imageSource:String;
      
      private var _imageHeight:int;
      
      private var _imageWidth:int;
      
      private var _trans:Number;
      
      private var _tilewidth:int;
      
      private var _tileheight:int;
      
      private var _name:String;
      
      private var _firstgid:int;
      
      private var _spacing:int;
      
      private var _margin:int;
      
      public function TmxTileset(param1:XML, param2:String = "")
      {
         super();
         this.resourceFolder = param2;
         this.LoadXml(param1);
      }
      
      public function LoadXml(param1:XML) : void
      {
         var _loc2_:int = 0;
         var _loc3_:XMLList = null;
         var _loc5_:String = null;
         var _loc6_:ByteLoader = null;
         if(int(param1.@firstgid) != 0)
         {
            this._firstgid = param1.@firstgid;
         }
         this._name = param1.@name;
         this._tilewidth = param1.@tilewidth;
         this._tileheight = param1.@tileheight;
         this._spacing = param1.@spacing;
         this._margin = param1.@margin;
         var _loc4_:XML;
         if(_loc4_ = param1["image"][0])
         {
            this._hasLoaded = true;
            this._imageSource = _loc4_.@source;
            this._imageWidth = _loc4_.@width;
            this._imageHeight = _loc4_.@height;
            this._trans = Number("0x" + _loc4_.@trans);
            _loc3_ = param1["tile"];
            this.tiles = new Vector.<TmxTile>(_loc3_.length(),true);
            _loc2_ = 0;
            while(_loc2_ < _loc3_.length())
            {
               this.tiles[_loc2_] = new TmxTile(_loc3_[_loc2_]);
               _loc2_++;
            }
         }
         else
         {
            _loc5_ = param1.@source;
            if((_loc6_ = LoaderManager.GetByteLoader(TiledResource.urlChangeFunc(this.resourceFolder + "" + _loc5_))).hasLoaded)
            {
               this.UpdateTsx(XML(_loc6_.data));
            }
            else
            {
               _loc6_.addEventListener(Event.COMPLETE,this.CompleteHandler);
            }
         }
      }
      
      public function Dispose() : void
      {
         while(this.tiles.length > 0)
         {
            (this.tiles.pop() as TmxTile).Dispose();
         }
         this.tiles = null;
         this._disposed = true;
      }
      
      public function get hasDisposed() : Boolean
      {
         return this._disposed;
      }
      
      public function GetTmxTileByIndex(param1:int) : TmxTile
      {
         var _loc2_:TmxTile = null;
         var _loc3_:int = 0;
         _loc3_ = 0;
         while(_loc3_ < this.tiles.length)
         {
            _loc2_ = this.tiles[_loc3_] as TmxTile;
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
            _loc3_++;
         }
         return null;
      }
      
      public function get hasLoaded() : Boolean
      {
         return this._hasLoaded;
      }
      
      public function get imageSource() : String
      {
         return this._imageSource;
      }
      
      public function get imageHeight() : int
      {
         return this._imageHeight;
      }
      
      public function get imageWidth() : int
      {
         return this._imageWidth;
      }
      
      public function get trans() : Number
      {
         return this._trans;
      }
      
      public function get tilewidth() : int
      {
         return this._tilewidth;
      }
      
      public function get tileheight() : int
      {
         return this._tileheight;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get firstgid() : int
      {
         return this._firstgid;
      }
      
      public function get spacing() : int
      {
         return this._spacing;
      }
      
      public function get margin() : int
      {
         return this._margin;
      }
      
      private function CompleteHandler(param1:Event) : void
      {
         (param1.currentTarget as IEventDispatcher).removeEventListener(Event.COMPLETE,this.CompleteHandler);
         this.UpdateTsx(XML((param1.currentTarget as ByteLoader).data));
      }
      
      private function UpdateTsx(param1:XML) : void
      {
         this.LoadXml(param1);
         this._hasLoaded = true;
         this.dispatchEvent(new Event(Event.COMPLETE));
      }
   }
}
