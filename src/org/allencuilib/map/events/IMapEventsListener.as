package org.allencuilib.map.events
{
   import org.allencuilib.map.MapStage;
   
   public interface IMapEventsListener
   {
       
      
      function StartListen(param1:MapStage) : void;
      
      function StopListen() : void;
   }
}
