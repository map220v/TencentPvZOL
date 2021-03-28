package org.allencuilib.map.interfaces
{
   import flash.events.IEventDispatcher;
   
   public interface IMapBackground extends IEventDispatcher, IScrollable, ITiledBackground
   {
       
      
      function ValidateView() : void;
      
      function SetStageSize(param1:int, param2:int) : void;
      
      function Clear() : void;
      
      function get painter() : ITiledGraphicPainter;
      
      function get data() : ITiledData;
      
      function get drawMode() : String;
      
      function SetData(param1:ITiledData, param2:int = 0, param3:int = 0, param4:int = 0, param5:int = 0) : void;
   }
}
