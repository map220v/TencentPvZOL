package org.allencuilib.map.events
{
   import flash.events.Event;
   import flash.geom.Rectangle;
   
   public class MapStageEvent extends Event
   {
      
      public static const SCROLLING:String = "scrolling";
       
      
      public var scrollRect:Rectangle;
      
      public function MapStageEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
   }
}
