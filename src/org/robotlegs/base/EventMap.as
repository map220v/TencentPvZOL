package org.robotlegs.base
{
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import org.robotlegs.core.IEventMap;
   
   public class EventMap implements IEventMap
   {
       
      
      protected var eventDispatcher:IEventDispatcher;
      
      protected var _dispatcherListeningEnabled:Boolean = true;
      
      protected var listeners:Array;
      
      public function EventMap(param1:IEventDispatcher)
      {
         super();
         this.listeners = new Array();
         this.eventDispatcher = param1;
      }
      
      public function get dispatcherListeningEnabled() : Boolean
      {
         return this._dispatcherListeningEnabled;
      }
      
      public function set dispatcherListeningEnabled(param1:Boolean) : void
      {
         this._dispatcherListeningEnabled = param1;
      }
      
      public function mapListener(param1:IEventDispatcher, param2:String, param3:Function, param4:Class = null, param5:Boolean = false, param6:int = 0, param7:Boolean = true) : void
      {
         var params:Object = null;
         var dispatcher:IEventDispatcher = param1;
         var type:String = param2;
         var listener:Function = param3;
         var eventClass:Class = param4;
         var useCapture:Boolean = param5;
         var priority:int = param6;
         var useWeakReference:Boolean = param7;
         if(this.dispatcherListeningEnabled == false && dispatcher == this.eventDispatcher)
         {
            throw new ContextError(ContextError.E_EVENTMAP_NOSNOOPING);
         }
         eventClass = eventClass || Event;
         var i:int = this.listeners.length;
         while(i--)
         {
            params = this.listeners[i];
            if(params.dispatcher == dispatcher && params.type == type && params.listener == listener && params.useCapture == useCapture && params.eventClass == eventClass)
            {
               return;
            }
         }
         var callback:Function = function(param1:Event):void
         {
            routeEventToListener(param1,listener,eventClass);
         };
         params = {
            "dispatcher":dispatcher,
            "type":type,
            "listener":listener,
            "eventClass":eventClass,
            "callback":callback,
            "useCapture":useCapture
         };
         this.listeners.push(params);
         dispatcher.addEventListener(type,callback,useCapture,priority,useWeakReference);
      }
      
      public function unmapListener(param1:IEventDispatcher, param2:String, param3:Function, param4:Class = null, param5:Boolean = false) : void
      {
         var _loc6_:Object = null;
         param4 = param4 || Event;
         var _loc7_:int = this.listeners.length;
         while(_loc7_--)
         {
            if((_loc6_ = this.listeners[_loc7_]).dispatcher == param1 && _loc6_.type == param2 && _loc6_.listener == param3 && _loc6_.useCapture == param5 && _loc6_.eventClass == param4)
            {
               param1.removeEventListener(param2,_loc6_.callback,param5);
               this.listeners.splice(_loc7_,1);
               return;
            }
         }
      }
      
      public function unmapListeners() : void
      {
         var _loc1_:Object = null;
         var _loc2_:IEventDispatcher = null;
         _loc1_ = this.listeners.pop();
         while(_loc1_)
         {
            _loc2_ = _loc1_.dispatcher;
            _loc2_.removeEventListener(_loc1_.type,_loc1_.callback,_loc1_.useCapture);
            _loc1_ = this.listeners.pop();
         }
      }
      
      protected function routeEventToListener(param1:Event, param2:Function, param3:Class) : void
      {
         if(param1 is param3)
         {
            param2(param1);
         }
      }
   }
}
