package org.robotlegs.mvcs
{
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import org.robotlegs.base.EventMap;
   import org.robotlegs.core.IEventMap;
   
   public class Actor
   {
       
      
      protected var _eventDispatcher:IEventDispatcher;
      
      protected var _eventMap:IEventMap;
      
      public function Actor()
      {
         super();
      }
      
      public function get eventDispatcher() : IEventDispatcher
      {
         return this._eventDispatcher;
      }
      
      [Inject]
      public function set eventDispatcher(param1:IEventDispatcher) : void
      {
         this._eventDispatcher = param1;
      }
      
      protected function get eventMap() : IEventMap
      {
         return this._eventMap || (this._eventMap = new EventMap(this.eventDispatcher));
      }
      
      protected function dispatch(param1:Event) : Boolean
      {
         if(this.eventDispatcher.hasEventListener(param1.type))
         {
            return this.eventDispatcher.dispatchEvent(param1);
         }
         return false;
      }
   }
}
