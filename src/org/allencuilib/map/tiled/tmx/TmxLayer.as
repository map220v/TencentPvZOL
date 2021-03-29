package org.allencuilib.map.tiled.tmx
{
   import asgui.core.IDisposable;
   import asgui.serialization.base64.Base64Util;
   import asgui.serialization.gzip.GZIPBytesEncoder;
   import flash.utils.ByteArray;
   
   public class TmxLayer implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var _tileIntArray:Vector.<Vector.<int>>;
      
      private var _flipIntArray:Vector.<Vector.<int>>;
      
      private var intArray:Vector.<int>;
      
      private var flipArray:Vector.<int>;
      
      public var properties:TmxPropertys;
      
      private var _index:int;
      
      private var _content:String;
      
      private var _compression:String;
      
      private var _encoding:String;
      
      private var _name:String;
      
      private var _width:int;
      
      private var _height:int;
      
      public function TmxLayer(param1:XML, param2:int)
      {
         var _loc3_:int = 0;
         var _loc4_:XMLList = null;
         super();
         var _loc5_:XML = param1["data"][0];
         this._name = param1.@name;
         this._width = param1.@width;
         this._height = param1.@height;
         this._encoding = _loc5_.@encoding;
         this._compression = _loc5_.@compression;
         this._content = _loc5_.toString();
         this._index = param2;
         this.properties = new TmxPropertys(param1);
      }
      
      public function Dispose() : void
      {
         this._tileIntArray = null;
         this.intArray = null;
         this._disposed = true;
      }
      
      public function get hasDisposed() : Boolean
      {
         return this._disposed;
      }
      
      private function Parse() : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:* = 0;
         var _loc6_:int = 0;
         var _loc7_:ByteArray = null;
         var _loc8_:GZIPBytesEncoder = null;
         var _loc9_:XML = null;
         var _loc10_:XMLList = null;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc1_:int = this.width;
         var _loc2_:int = this.height;
         this._tileIntArray = new Vector.<Vector.<int>>(_loc1_,true);
         this._flipIntArray = new Vector.<Vector.<int>>(_loc1_,true);
         _loc3_ = 0;
         while(_loc3_ < _loc1_)
         {
            this._tileIntArray[_loc3_] = new Vector.<int>(_loc2_,true);
            this._flipIntArray[_loc3_] = new Vector.<int>(_loc2_,true);
            _loc3_++;
         }
         if(!this.intArray)
         {
            this.intArray = new Vector.<int>();
            this.flipArray = new Vector.<int>();
            if(this.encoding == "base64")
            {
               (_loc7_ = Base64Util.decode(this.content)).position = 0;
               if(this.compression == "gzip")
               {
                  _loc7_ = (_loc8_ = new GZIPBytesEncoder()).uncompressToByteArray(_loc7_);
               }
               else if(this.compression == "zlib")
               {
                  _loc7_.uncompress();
               }
               while(_loc7_.position < _loc7_.length)
               {
                  _loc6_ = this.GetGid(_loc7_.readByte(),_loc7_.readByte(),_loc7_.readByte(),_loc7_.readByte());
                  this.intArray.push(_loc6_);
               }
            }
            else
            {
               _loc11_ = (_loc10_ = (_loc9_ = new XML(this.content))[0]["tile"]).length();
               _loc3_ = 0;
               while(_loc3_ < _loc11_)
               {
                  _loc12_ = _loc10_[_loc3_].@gid;
                  this.intArray.push(_loc12_);
                  _loc3_++;
               }
            }
         }
         _loc3_ = 0;
         while(_loc3_ < this.intArray.length)
         {
            _loc6_ = this.intArray[_loc3_];
            this.intArray[_loc3_] = _loc6_ & 268435455;
            _loc5_ = _loc6_ >> 30 & 3;
            this.flipArray[_loc3_] = _loc5_;
            _loc3_++;
         }
         _loc3_ = 0;
         _loc4_ = 0;
         while(_loc3_ < _loc2_)
         {
            this._tileIntArray[_loc4_][_loc3_] = this.intArray[_loc4_ + _loc3_ * _loc1_];
            this._flipIntArray[_loc4_][_loc3_] = this.flipArray[_loc4_ + _loc3_ * _loc1_];
            _loc4_++;
            if(_loc4_ == _loc1_)
            {
               _loc3_++;
               _loc4_ = 0;
            }
         }
      }
      
      public function GetTileIntArray() : Vector.<Vector.<int>>
      {
         if(!this._tileIntArray)
         {
            this.Parse();
         }
         return this._tileIntArray;
      }
      
      public function GetFlipIntArray() : Vector.<Vector.<int>>
      {
         if(!this._flipIntArray)
         {
            this.Parse();
         }
         return this._flipIntArray;
      }
      
      private function GetGid(param1:int, param2:int, param3:int, param4:int) : Number
      {
         if(param1 < 0)
         {
            param1 += 256;
         }
         if(param2 < 0)
         {
            param2 += 256;
         }
         if(param3 < 0)
         {
            param3 += 256;
         }
         if(param4 < 0)
         {
            param4 += 256;
         }
         var _loc5_:Number;
         return Number((_loc5_ = (_loc5_ = (_loc5_ = (_loc5_ = 0) | param1) | param2 << 8) | param3 << 16) | param4 << 24);
      }
      
      public function get index() : int
      {
         return this._index;
      }
      
      public function get content() : String
      {
         return this._content;
      }
      
      public function get compression() : String
      {
         return this._compression;
      }
      
      public function get encoding() : String
      {
         return this._encoding;
      }
      
      public function get name() : String
      {
         return this._name;
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
