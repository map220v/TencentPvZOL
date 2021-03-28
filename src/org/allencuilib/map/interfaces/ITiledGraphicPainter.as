package org.allencuilib.map.interfaces
{
   import asgui.core.IDisposable;
   import org.allencuilib.map.tiled.display.TiledPlot;
   import org.allencuilib.map.tiled.graphics.TiledPlotPaintedCounter;
   
   public interface ITiledGraphicPainter extends IDisposable
   {
       
      
      function DrawBitmapByCoordinate(param1:TiledPlot, param2:int, param3:int, param4:TiledPlotPaintedCounter = null, param5:int = 65535, param6:Number = 1, param7:Number = 1, param8:String = "rectangle") : int;
      
      function DrawBitmap(param1:TiledPlot, param2:int, param3:int, param4:int, param5:int, param6:int, param7:Number = 1, param8:Number = 1) : Boolean;
      
      function GetBitmapDataAllLayers(param1:int, param2:int) : Array;
   }
}
