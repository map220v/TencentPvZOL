package org.allencuilib.map.events
{
   import flash.events.Event;
   import flash.geom.Point;
   import org.allencuilib.map.tiled.display.TiledPlot;
   
   public class MapTiledEvent extends Event
   {
      
      public static const OVER_CELL_CHANGED:String = "overCellChanged";
      
      public static const OVER_PLOT_CHANGED:String = "overPlotChanged";
      
      public static const SCROLLING:String = "scrolling";
      
      public static const STAGE_SIZE_CHANGED:String = "stageSizeChanged";
       
      
      public var lastOverCell:Point;
      
      public var overCell:Point;
      
      public var lastOverPlot:TiledPlot;
      
      public var overPlot:TiledPlot;
      
      public function MapTiledEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
   }
}
