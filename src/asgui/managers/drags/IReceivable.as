package asgui.managers.drags
{
   import asgui.core.IDisposable;
   import flash.events.IEventDispatcher;
   
   public interface IReceivable extends IDisposable, IEventDispatcher
   {
       
      
      function get hasItem() : Boolean;
      
      function DropHandler(param1:DragProxy) : void;
      
      function OverHandler(param1:DragProxy) : void;
      
      function OutHandler(param1:DragProxy) : void;
      
      function StartHandler(param1:DragProxy) : void;
      
      function EndHandler(param1:DragProxy) : void;
   }
}
