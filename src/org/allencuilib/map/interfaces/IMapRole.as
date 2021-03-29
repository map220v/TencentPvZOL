package org.allencuilib.map.interfaces
{
   import asgui.core.IDisposable;
   import flash.events.IEventDispatcher;
   import flash.geom.Point;
   
   public interface IMapRole extends IEventDispatcher, IDisposable
   {
       
      
      function StageClickTo(param1:Vector.<Point>) : void;
      
      function get microTargets() : Vector.<Point>;
      
      function StopMoving() : void;
      
      function GetPixelAt(param1:Number, param2:Number) : uint;
      
      function get x() : Number;
      
      function get y() : Number;
      
      function set x(param1:Number) : void;
      
      function set y(param1:Number) : void;
      
      function get targetX() : Number;
      
      function get targetY() : Number;
      
      function get depth() : int;
   }
}
