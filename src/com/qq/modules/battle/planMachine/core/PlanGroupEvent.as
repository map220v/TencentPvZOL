package com.qq.modules.battle.planMachine.core
{
   import flash.events.Event;
   
   public class PlanGroupEvent extends Event
   {
      
      public static const PLAY_INJURED_PLAN:String = "playInjured";
      
      public static const BULLET_HITED:String = "bulletHited";
       
      
      public var eventData:String;
      
      public function PlanGroupEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
   }
}
