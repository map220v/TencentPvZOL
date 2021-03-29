package com.qq.modules.map.util
{
   import com.qq.modules.map.MapGlobals;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import org.allencuilib.map.tiled.graphics.LayedTiledPlotData;
   import org.allencuilib.map.tiled.graphics.TiledGraphicData;
   import org.allencuilib.map.tiled.graphics.TiledObjectData;
   import org.allencuilib.map.tiled.tmx.TmxLayer;
   
   public class QMapTiledData extends TiledGraphicData
   {
       
      
      private var times:int;
      
      private var cells:Array;
      
      private var visibleRules:Array;
      
      private var layer_deco:int = 4;
      
      public function QMapTiledData(param1:Object = null, param2:int = 1)
      {
         this.cells = [];
         this.visibleRules = [];
         super(param1);
         this.times = param2;
      }
      
      private static function checkArrayCreate(param1:Array, param2:int, param3:int) : void
      {
         if(param1[param2] == null)
         {
            param1[param2] = [];
         }
         if(param1[param2][param3] == null)
         {
            param1[param2][param3] = [];
         }
      }
      
      override public function get width() : int
      {
         return _width * this.times;
      }
      
      override public function get height() : int
      {
         return _height * this.times;
      }
      
      override public function get layerCount() : int
      {
         return this.cells.length;
      }
      
      override public function AddTmxLayer(param1:TmxLayer) : void
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc2_:Vector.<Vector.<int>> = param1.GetTileIntArray();
         var _loc3_:int = _loc2_.length;
         var _loc4_:int = _loc2_[0].length;
         var _loc5_:Array = [];
         _loc6_ = 0;
         while(_loc6_ < _loc3_)
         {
            _loc5_[_loc6_] = [];
            _loc7_ = 0;
            while(_loc7_ < _loc4_)
            {
               _loc5_[_loc6_][_loc7_] = _loc2_[_loc6_][_loc7_];
               _loc7_++;
            }
            _loc6_++;
         }
         this.cells.push(_loc5_);
         if("layer_deco" == param1.name)
         {
            this.layer_deco = param1.index;
         }
      }
      
      override public function GetCellType(param1:int, param2:int, param3:int) : int
      {
         if(param2 < 0 || param3 < 0)
         {
            return 0;
         }
         checkArrayCreate(this.cells,param1,param2);
         if(!this.getCellVisibleRule(param1,param2,param3))
         {
            return 0;
         }
         if(this.cells[param1][param2][param3] == null)
         {
            this.cells[param1][param2][param3] = this.cells[param1][param2 % _width][param3 % _height];
         }
         return this.cells[param1][param2][param3];
      }
      
      override public function GetCellFlipType(param1:int, param2:int, param3:int) : int
      {
         return 0;
      }
      
      override public function GetLayedPlotData(param1:int, param2:int, param3:int) : LayedTiledPlotData
      {
         var _loc4_:LayedTiledPlotData;
         if((_loc4_ = super.GetLayedPlotData(param1,param2,param3)) && param3 == this.layer_deco)
         {
            _loc4_.visible = this.getCellVisibleRule(param3,param1,param2);
         }
         return _loc4_;
      }
      
      override public function GetObjectDatasByRangeAndType(param1:Rectangle = null, param2:String = null) : Vector.<TiledObjectData>
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:TiledObjectData = null;
         var _loc14_:String = null;
         var _loc15_:TiledObjectData = null;
         var _loc16_:Point = null;
         var _loc3_:Vector.<TiledObjectData> = new Vector.<TiledObjectData>();
         var _loc8_:int = _objects.length;
         var _loc9_:Rectangle = MapGlobals.getTileCellRectByScreenRect(param1);
         var _loc10_:int = Math.ceil(_loc9_.width / _width);
         var _loc11_:int = Math.ceil(_loc9_.height / _height);
         var _loc12_:int = int(_loc9_.x / _width) * _width;
         var _loc13_:int = int(_loc9_.y / _height) * _height;
         _loc4_ = 0;
         while(_loc4_ < _loc8_)
         {
            _loc7_ = _objects[_loc4_] as TiledObjectData;
            _loc14_ = tiles[_loc7_.gid].properties.Get("type");
            if(!(param2 != null && param2 != _loc14_))
            {
               _loc5_ = 0;
               while(_loc5_ < _loc10_)
               {
                  _loc6_ = 0;
                  while(_loc6_ < _loc11_)
                  {
                     (_loc15_ = _loc7_.clone()).cellX = _loc12_ + _loc5_ * _width + _loc7_.cellX + int(tiles[_loc7_.gid].properties.Get("offsetX"));
                     _loc15_.cellY = _loc13_ + _loc6_ * _height + _loc7_.cellY + int(tiles[_loc7_.gid].properties.Get("offsetY"));
                     _loc16_ = MapGlobals.cellToPoint(new Point(_loc15_.cellX,_loc15_.cellY));
                     if(param1.containsPoint(_loc16_) && _loc15_.cellX >= 0 && _loc15_.cellY >= 0 && _loc15_.cellX < this.width - 1 && _loc15_.cellY < this.height - 1)
                     {
                        _loc3_.push(_loc15_);
                     }
                     _loc6_++;
                  }
                  _loc5_++;
               }
            }
            _loc4_++;
         }
         return _loc3_;
      }
      
      public function addRule(param1:IQMapRule) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:Rectangle = param1.getInvisibleRect();
         _loc3_ = _loc2_.x;
         while(_loc3_ < _loc2_.x + _loc2_.width)
         {
            _loc4_ = _loc2_.y;
            while(_loc4_ < _loc2_.y + _loc2_.height)
            {
               this.setCellVisibleRule(this.layer_deco,_loc4_,_loc3_,false);
               _loc4_++;
            }
            _loc3_++;
         }
      }
      
      public function removeRule(param1:IQMapRule) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:Rectangle = param1.getInvisibleRect();
         _loc3_ = _loc2_.x;
         while(_loc3_ < _loc2_.x + _loc2_.width)
         {
            _loc4_ = _loc2_.y;
            while(_loc4_ < _loc2_.y + _loc2_.height)
            {
               this.setCellVisibleRule(this.layer_deco,_loc4_,_loc3_,true);
               _loc4_++;
            }
            _loc3_++;
         }
      }
      
      public function getCellVisibleRule(param1:int, param2:int, param3:int) : Boolean
      {
         if(param1 != this.layer_deco)
         {
            return true;
         }
         checkArrayCreate(this.visibleRules,param1,param3);
         var _loc4_:*;
         return (_loc4_ = this.visibleRules[param1][param3][param2]) != 0;
      }
      
      public function setCellVisibleRule(param1:int, param2:int, param3:int, param4:Boolean) : void
      {
         checkArrayCreate(this.visibleRules,param1,param2);
         this.visibleRules[param1][param2][param3] = !!param4 ? 1 : 0;
      }
   }
}
