package com.qq.modules.td.logic.trigger
{
   import com.qq.GameGloble;
   import com.qq.modules.td.logic.trigger.events.TriggerEvent;
   import org.robotlegs.mvcs.Actor;
   import tencent.tools.trigger.ITrigger;
   import tencent.tools.trigger.TriggerCenter;
   
   public class TDTriggerManager extends Actor
   {
      
      private static var _instance:TDTriggerManager;
       
      
      private var factory:TDTriggerFactory;
      
      private var triggerCenter:TriggerCenter;
      
      public function TDTriggerManager(param1:Lock)
      {
         super();
         this.init();
      }
      
      public static function get instance() : TDTriggerManager
      {
         if(!_instance)
         {
            _instance = new TDTriggerManager(new Lock());
         }
         return _instance;
      }
      
      public static function disposeInstance() : void
      {
         if(_instance)
         {
            _instance.Dispose();
            _instance = null;
         }
      }
      
      public function Dispose() : void
      {
         if(this.factory)
         {
            this.factory = null;
         }
         if(this.triggerCenter)
         {
            this.triggerCenter.removeAll();
            this.triggerCenter = null;
         }
         this.eventDispatcher.removeEventListener(TriggerEvent.TRIGGER_CHANGE,this.triggerOccurHandler);
      }
      
      public function getTriggerListByString(param1:String, param2:Array) : Array
      {
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc6_:String = null;
         var _loc7_:Array = null;
         var _loc8_:int = 0;
         var _loc9_:Boolean = false;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc3_:Array = [];
         if(param1 != null && param2 != null)
         {
            _loc4_ = param1.split("|");
            _loc5_ = 0;
            while(_loc5_ < _loc4_.length)
            {
               _loc7_ = (_loc6_ = _loc4_[_loc5_]).split(":");
               _loc8_ = Number(_loc7_.shift());
               _loc9_ = false;
               _loc10_ = param2.length;
               _loc11_ = 0;
               while(_loc11_ < _loc10_)
               {
                  if(param2[_loc11_] == _loc8_)
                  {
                     _loc9_ = true;
                     _loc11_ = _loc10_;
                  }
                  _loc11_++;
               }
               if(_loc8_ != 10)
               {
                  _loc3_.push([_loc8_,_loc9_]);
               }
               _loc5_++;
            }
         }
         return _loc3_;
      }
      
      public function addTriggerByString(param1:String, param2:Array) : void
      {
         var _loc5_:String = null;
         var _loc6_:Array = null;
         var _loc7_:int = 0;
         var _loc8_:Boolean = false;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         if(param1 == null || param1.length == 0)
         {
            return;
         }
         var _loc3_:Array = param1.split("|");
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_.length)
         {
            _loc6_ = (_loc5_ = _loc3_[_loc4_]).split(":");
            _loc7_ = Number(_loc6_.shift());
            _loc8_ = false;
            _loc9_ = param2.length;
            _loc10_ = 0;
            while(_loc10_ < _loc9_)
            {
               if(param2[_loc10_] == _loc7_)
               {
                  _loc8_ = true;
                  _loc10_ = _loc9_;
               }
               _loc10_++;
            }
            if(_loc7_ != 10)
            {
               this.addTrigger(_loc7_,_loc6_);
            }
            _loc4_++;
         }
      }
      
      public function addTrigger(param1:int, param2:Array) : void
      {
         if(param1 == 10)
         {
            return;
         }
         var _loc3_:ITrigger = this.factory.createTrigger(param1,param2);
         this.triggerCenter.addTrigger(_loc3_);
         _loc3_.initialize();
      }
      
      public function removeTrigger(param1:ITrigger) : void
      {
         this.triggerCenter.removeTrigger(param1);
         param1.dispose();
      }
      
      public function reset() : void
      {
         this.triggerCenter.removeAll();
      }
      
      public function triggerNotify(param1:String = null, param2:Array = null, param3:Boolean = false) : void
      {
         if(!param1)
         {
            this.triggerCenter.notifyTriggerAll(param3);
         }
         else
         {
            this.triggerCenter.notifyTrigger(param1,param2,param3);
         }
      }
      
      private function init() : void
      {
         GameGloble.injector.injectInto(this);
         this.factory = new TDTriggerFactory();
         this.triggerCenter = new TriggerCenter();
         this.eventDispatcher.addEventListener(TriggerEvent.TRIGGER_CHANGE,this.triggerOccurHandler);
      }
      
      private function triggerOccurHandler(param1:TriggerEvent) : void
      {
         this.triggerNotify(param1.triggerType,param1.params,param1.triggerForce);
      }
   }
}

class Lock
{
    
   
   function Lock()
   {
      super();
   }
}
