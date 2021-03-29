package org.allencuilib.map.interfaces
{
   import asgui.core.IDisposable;
   import flash.display.DisplayObjectContainer;
   
   public interface IMapEffect extends IDisposable
   {
       
      
      function UpdateFrame(param1:DisplayObjectContainer) : void;
      
      function get id() : int;
      
      function set id(param1:int) : void;
   }
}
