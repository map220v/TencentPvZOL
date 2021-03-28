package org.allencuilib.map.interfaces
{
   import flash.display.BitmapData;
   
   public interface ITiledPlotData
   {
       
      
      function GetBitmapData(param1:Boolean = false, param2:Boolean = false, param3:Number = 1, param4:Number = 1) : BitmapData;
      
      function get width() : int;
      
      function get height() : int;
   }
}
