package org.allencuilib.map.events
{
   import flash.events.Event;
   import org.allencuilib.map.interfaces.IMapRole;
   
   public class MapRoleEvent extends Event
   {
      
      public static const POSITION_CHANGED:String = "positionChanged";
      
      public static const TARGET_CHANGED:String = "targetChanged";
      
      public static const SELECT_CHANGED:String = "selectChanged";
      
      public static const OVER_CHANGED:String = "overChanged";
      
      public static const ROLE_CLICK:String = "roleClick";
      
      public static const ARRIVALED:String = "arrivaled";
      
      public static const MAIN_ROLE_MOVE_TO:String = "mainRoleMoveTo";
       
      
      public var role:IMapRole;
      
      public var lastRole:IMapRole;
      
      public function MapRoleEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      override public function clone() : Event
      {
         var _loc1_:MapRoleEvent = new MapRoleEvent(type);
         _loc1_.role = this.role;
         _loc1_.lastRole = this.lastRole;
         return _loc1_;
      }
   }
}
