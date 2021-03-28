package org.robotlegs.mvcs
{
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import org.robotlegs.base.EventMap;
   import org.robotlegs.base.MediatorBase;
   import org.robotlegs.core.IEventMap;
   import org.robotlegs.core.IMediatorMap;
   
   public class Mediator extends MediatorBase
   {
       
      
      [Inject]
      public var contextView:DisplayObjectContainer;
      
      [Inject]
      public var mediatorMap:IMediatorMap;
      
      protected var _eventDispatcher:IEventDispatcher;
      
      protected var _eventMap:IEventMap;
      
      public function Mediator()
      {
         super();
      }
      
      override public function preRemove() : void
      {
         if(this._eventMap)
         {
            this._eventMap.unmapListeners();
         }
         super.preRemove();
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
         if(!this._eventMap)
         {
            this._eventMap = new EventMap(this.eventDispatcher);
         }
         return this._eventMap;
      }
      
      protected function dispatch(param1:Event) : Boolean
      {
         if(this.eventDispatcher.hasEventListener(param1.type))
         {
            return this.eventDispatcher.dispatchEvent(param1);
         }
         return false;
      }
      
      protected function addViewListener(param1:String, param2:Function, param3:Class = null, param4:Boolean = false, param5:int = 0, param6:Boolean = true) : void
      {
         this.eventMap.mapListener(IEventDispatcher(viewComponent),param1,param2,param3,param4,param5,param6);
      }
      
      protected function removeViewListener(param1:String, param2:Function, param3:Class = null, param4:Boolean = false) : void
      {
         this.eventMap.unmapListener(IEventDispatcher(viewComponent),param1,param2,param3,param4);
      }
      
      protected function addContextListener(param1:String, param2:Function, param3:Class = null, param4:Boolean = false, param5:int = 0, param6:Boolean = true) : void
      {
         this.eventMap.mapListener(this.eventDispatcher,param1,param2,param3,param4,param5,param6);
      }
      
      protected function removeContextListener(param1:String, param2:Function, param3:Class = null, param4:Boolean = false) : void
      {
         this.eventMap.unmapListener(this.eventDispatcher,param1,param2,param3,param4);
      }
   }
}
