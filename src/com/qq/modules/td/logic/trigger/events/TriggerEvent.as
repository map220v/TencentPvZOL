package com.qq.modules.td.logic.trigger.events
{
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import flash.events.Event;
   
   public class TriggerEvent extends Event
   {
      
      public static const TRIGGER_CHANGE:String = "triggerChange";
      
      public static const TRIGGER_CREATE:String = "triggerCreate";
       
      
      private var _triggerType:String;
      
      private var _triggerForce:Boolean;
      
      private var _params:Array;
      
      public function TriggerEvent(param1:String, param2:Array = null, param3:Boolean = false, param4:String = "triggerChange", param5:Boolean = false, param6:Boolean = false)
      {
         this._params = [];
         this._triggerType = param1;
         this._triggerForce = param3;
         this._params = param2;
         super(param4,param5,param6);
      }
      
      public function param_usedSun(param1:Number) : void
      {
         this._params[0] = param1;
      }
      
      public function param_gameObject(param1:IGameObject) : void
      {
         this._params[0] = param1;
      }
      
      public function get triggerForce() : Boolean
      {
         return this._triggerForce;
      }
      
      public function get triggerType() : String
      {
         return this._triggerType;
      }
      
      public function get params() : Array
      {
         return this._params;
      }
   }
}
