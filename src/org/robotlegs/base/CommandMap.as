package org.robotlegs.base
{
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.utils.Dictionary;
   import flash.utils.describeType;
   import org.robotlegs.core.ICommandMap;
   import org.robotlegs.core.IInjector;
   import org.robotlegs.core.IReflector;
   
   public class CommandMap implements ICommandMap
   {
       
      
      protected var eventDispatcher:IEventDispatcher;
      
      protected var injector:IInjector;
      
      protected var reflector:IReflector;
      
      protected var eventTypeMap:Dictionary;
      
      protected var verifiedCommandClasses:Dictionary;
      
      protected var detainedCommands:Dictionary;
      
      public function CommandMap(param1:IEventDispatcher, param2:IInjector, param3:IReflector)
      {
         super();
         this.eventDispatcher = param1;
         this.injector = param2;
         this.reflector = param3;
         this.eventTypeMap = new Dictionary(false);
         this.verifiedCommandClasses = new Dictionary(false);
         this.detainedCommands = new Dictionary(false);
      }
      
      public function mapEvent(param1:String, param2:Class, param3:Class = null, param4:Boolean = false) : void
      {
         var eventType:String = param1;
         var commandClass:Class = param2;
         var eventClass:Class = param3;
         var oneshot:Boolean = param4;
         this.verifyCommandClass(commandClass);
         eventClass = eventClass || Event;
         var eventClassMap:Dictionary = this.eventTypeMap[eventType] = this.eventTypeMap[eventType] || new Dictionary(false);
         var callbacksByCommandClass:Dictionary = eventClassMap[eventClass] = eventClassMap[eventClass] || new Dictionary(false);
         if(callbacksByCommandClass[commandClass] != null)
         {
            throw new ContextError(ContextError.E_COMMANDMAP_OVR + " - eventType (" + eventType + ") and Command (" + commandClass + ")");
         }
         var callback:Function = function(param1:Event):void
         {
            routeEventToCommand(param1,commandClass,oneshot,eventClass);
         };
         this.eventDispatcher.addEventListener(eventType,callback,false,0,true);
         callbacksByCommandClass[commandClass] = callback;
      }
      
      public function unmapEvent(param1:String, param2:Class, param3:Class = null) : void
      {
         var _loc4_:Dictionary;
         if((_loc4_ = this.eventTypeMap[param1]) == null)
         {
            return;
         }
         var _loc5_:Dictionary;
         if((_loc5_ = _loc4_[param3 || Event]) == null)
         {
            return;
         }
         var _loc6_:Function;
         if((_loc6_ = _loc5_[param2]) == null)
         {
            return;
         }
         this.eventDispatcher.removeEventListener(param1,_loc6_,false);
         _loc5_[param2] = null;
      }
      
      public function unmapEvents() : void
      {
         var _loc1_:* = null;
         var _loc2_:Dictionary = null;
         var _loc3_:Dictionary = null;
         var _loc4_:Function = null;
         for(_loc1_ in this.eventTypeMap)
         {
            _loc2_ = this.eventTypeMap[_loc1_];
            for each(_loc3_ in _loc2_)
            {
               for each(_loc4_ in _loc3_)
               {
                  this.eventDispatcher.removeEventListener(_loc1_,_loc4_,false);
               }
            }
         }
         this.eventTypeMap = new Dictionary(false);
      }
      
      public function hasEventCommand(param1:String, param2:Class, param3:Class = null) : Boolean
      {
         var _loc4_:Dictionary;
         if((_loc4_ = this.eventTypeMap[param1]) == null)
         {
            return false;
         }
         var _loc5_:Dictionary;
         if((_loc5_ = _loc4_[param3 || Event]) == null)
         {
            return false;
         }
         return _loc5_[param2] != null;
      }
      
      public function execute(param1:Class, param2:Object = null, param3:Class = null, param4:String = "") : void
      {
         this.verifyCommandClass(param1);
         if(param2 != null || param3 != null)
         {
            param3 = param3 || this.reflector.getClass(param2);
            if(param2 is Event && param3 != Event)
            {
               this.injector.mapValue(Event,param2);
            }
            this.injector.mapValue(param3,param2,param4);
         }
         var _loc5_:Object = this.injector.instantiate(param1);
         if(param2 !== null || param3 != null)
         {
            if(param2 is Event && param3 != Event)
            {
               this.injector.unmap(Event);
            }
            this.injector.unmap(param3,param4);
         }
         _loc5_.execute();
      }
      
      public function detain(param1:Object) : void
      {
         this.detainedCommands[param1] = true;
      }
      
      public function release(param1:Object) : void
      {
         if(this.detainedCommands[param1])
         {
            delete this.detainedCommands[param1];
         }
      }
      
      protected function verifyCommandClass(param1:Class) : void
      {
         var commandClass:Class = param1;
         if(!this.verifiedCommandClasses[commandClass])
         {
            this.verifiedCommandClasses[commandClass] = describeType(commandClass).factory.method.(@name == "execute").length();
            if(!this.verifiedCommandClasses[commandClass])
            {
               throw new ContextError(ContextError.E_COMMANDMAP_NOIMPL + " - " + commandClass);
            }
         }
      }
      
      protected function routeEventToCommand(param1:Event, param2:Class, param3:Boolean, param4:Class) : Boolean
      {
         if(!(param1 is param4))
         {
            return false;
         }
         this.execute(param2,param1);
         if(param3)
         {
            this.unmapEvent(param1.type,param2,param4);
         }
         return true;
      }
   }
}
