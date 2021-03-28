package org.robotlegs.core
{
   import flash.events.IEventDispatcher;
   
   public interface IEventMap
   {
       
      
      function mapListener(param1:IEventDispatcher, param2:String, param3:Function, param4:Class = null, param5:Boolean = false, param6:int = 0, param7:Boolean = true) : void;
      
      function unmapListener(param1:IEventDispatcher, param2:String, param3:Function, param4:Class = null, param5:Boolean = false) : void;
      
      function unmapListeners() : void;
   }
}
