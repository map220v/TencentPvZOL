package org.allencuilib.map.interfaces
{
   import asgui.core.IDisposable;
   import flash.display.BitmapData;
   import flash.events.IEventDispatcher;
   import flash.geom.Rectangle;
   import org.allencuilib.map.tiled.graphics.LayedTiledPlotData;
   import org.allencuilib.map.tiled.graphics.TiledObjectData;
   import org.allencuilib.map.tiled.graphics.TiledPlotData;
   
   public interface ITiledData extends IDisposable, IEventDispatcher
   {
       
      
      function get tiledGraphicDataOption() : Object;
      
      function GetTilesArrayPropertyValue(param1:String, param2:int = 0) : Vector.<Vector.<String>>;
      
      function GetObjectDatas(param1:int, param2:int) : Vector.<TiledObjectData>;
      
      function GetObjectDatasByRangeAndType(param1:Rectangle = null, param2:String = null) : Vector.<TiledObjectData>;
      
      function get hasCompleted() : Boolean;
      
      function get orientation() : String;
      
      function get stagewidth() : int;
      
      function get stageheight() : int;
      
      function get width() : int;
      
      function get height() : int;
      
      function get tilewidth() : int;
      
      function get tileheight() : int;
      
      function get xLength() : Number;
      
      function get yLength() : Number;
      
      function GetCellType(param1:int, param2:int, param3:int) : int;
      
      function get layerCount() : int;
      
      function GetCellFlipType(param1:int, param2:int, param3:int) : int;
      
      function get objects() : Vector.<TiledObjectData>;
      
      function get tiles() : Vector.<TiledPlotData>;
      
      function GetCopyPixelsObjectsByArea(param1:int, param2:int, param3:int, param4:int) : Array;
      
      function GetBitmapData(param1:int, param2:int, param3:int, param4:Boolean = false, param5:Boolean = false, param6:Number = 1, param7:Number = 1) : BitmapData;
      
      function GetLayedPlotData(param1:int, param2:int, param3:int) : LayedTiledPlotData;
      
      function HasBitmapData(param1:int, param2:int, param3:int) : Boolean;
      
      function GetTiledPlotDataMemSize() : int;
      
      function GetTiledPlotData(param1:int, param2:int, param3:int) : ITiledPlotData;
      
      function GetThumb() : BitmapData;
   }
}
