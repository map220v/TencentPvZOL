package org.allencuilib.map.interfaces
{
   import org.allencuilib.map.tiled.display.TiledPlot;
   
   public interface IEveryModeMapBackground extends IMapBackground
   {
       
      
      function GetTiledPlot(param1:int) : TiledPlot;
   }
}
