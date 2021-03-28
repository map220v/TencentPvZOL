package org.robotlegs.extend.command
{
   import flash.events.Event;
   
   public class StrongRobotlegCommandEvent extends Event
   {
       
      
      public var map:Array;
      
      public function StrongRobotlegCommandEvent(param1:String)
      {
         this.map = [];
         super(param1);
      }
      
      public static function addFunction(param1:String, param2:String, param3:Array = null) : StrongRobotlegCommandEvent
      {
         var _loc4_:StrongRobotlegCommandEvent = new StrongRobotlegCommandEvent(param1);
         var _loc5_:Object;
         (_loc5_ = new Object()).name = param2;
         _loc5_.arg = param3;
         _loc4_.map.push(_loc5_);
         return _loc4_;
      }
      
      override public function clone() : Event
      {
         var _loc1_:StrongRobotlegCommandEvent = new StrongRobotlegCommandEvent(type);
         _loc1_.map = this.map;
         return _loc1_;
      }
   }
}
