package com.qq.utils
{
   import com.qq.modules.basic.event.CommonEvent;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.utils.Dictionary;
   
   public class CommandDispatcher
   {
      
      private static var _instance:CommandDispatcher;
      
      public static var _dispatcher:IEventDispatcher;
      
      private static var _commandStackID:Number = 0;
      
      private static var _commandStack:Dictionary;
       
      
      public function CommandDispatcher()
      {
         super();
      }
      
      public static function init(param1:IEventDispatcher) : void
      {
         _dispatcher = param1;
      }
      
      public static function send(param1:String, param2:Object = null, param3:String = null, param4:Object = null) : void
      {
         if(_dispatcher == null)
         {
            return;
         }
         var _loc5_:CommonEvent = new CommonEvent(param1,param2);
         if(param3 != null)
         {
            _loc5_.nextCommandID = storeCommand(param3,param4);
         }
         _dispatcher.dispatchEvent(_loc5_);
      }
      
      public static function sendEvent(param1:Event) : void
      {
         if(_dispatcher == null || param1 == null)
         {
            return;
         }
         _dispatcher.dispatchEvent(param1);
      }
      
      public static function storeCommand(param1:String, param2:Object = null) : int
      {
         if(_commandStack == null)
         {
            _commandStack = new Dictionary();
         }
         ++_commandStackID;
         _commandStack[_commandStackID] = [param1,param2];
         return _commandStackID;
      }
      
      public static function runStoreCommand(param1:int) : void
      {
         if(_commandStack[param1] == null)
         {
            return;
         }
         var _loc2_:Array = _commandStack[param1];
         delete _commandStack[param1];
         send(_loc2_[0],_loc2_[1]);
      }
   }
}
