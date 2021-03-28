package org.robotlegs.base
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import org.robotlegs.core.IContext;
   
   public class ContextBase implements IContext, IEventDispatcher
   {
       
      
      protected var _eventDispatcher:IEventDispatcher;
      
      public function ContextBase()
      {
         super();
         this._eventDispatcher = new EventDispatcher(this);
      }
      
      public function get eventDispatcher() : IEventDispatcher
      {
         return this._eventDispatcher;
      }
      
      public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         this.eventDispatcher.addEventListener(param1,param2,param3,param4);
      }
      
      public function dispatchEvent(param1:Event) : Boolean
      {
         if(this.eventDispatcher.hasEventListener(param1.type))
         {
            return this.eventDispatcher.dispatchEvent(param1);
         }
         return false;
      }
      
      public function hasEventListener(param1:String) : Boolean
      {
         return this.eventDispatcher.hasEventListener(param1);
      }
      
      public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         this.eventDispatcher.removeEventListener(param1,param2,param3);
      }
      
      public function willTrigger(param1:String) : Boolean
      {
         return this.eventDispatcher.willTrigger(param1);
      }
   }
}
