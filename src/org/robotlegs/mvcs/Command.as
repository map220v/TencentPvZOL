package org.robotlegs.mvcs
{
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import org.robotlegs.core.ICommandMap;
   import org.robotlegs.core.IInjector;
   import org.robotlegs.core.IMediatorMap;
   
   public class Command
   {
       
      
      [Inject]
      public var contextView:DisplayObjectContainer;
      
      [Inject]
      public var commandMap:ICommandMap;
      
      [Inject]
      public var eventDispatcher:IEventDispatcher;
      
      [Inject]
      public var injector:IInjector;
      
      [Inject]
      public var mediatorMap:IMediatorMap;
      
      public function Command()
      {
         super();
      }
      
      public function execute() : void
      {
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
