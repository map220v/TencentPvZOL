package asgui.managers
{
   import asgui.managers.drags.DragProxy;
   import asgui.managers.drags.IReceivable;
   import flash.display.DisplayObject;
   import flash.events.IEventDispatcher;
   import flash.events.MouseEvent;
   
   public interface IDragManagerImpl extends IEventDispatcher
   {
       
      
      function get isDragging() : Boolean;
      
      function get dragProxy() : DragProxy;
      
      function DoDrag(param1:DisplayObject, param2:MouseEvent, param3:DisplayObject = null, param4:Number = 0, param5:Number = 0, param6:Number = 0.5, param7:String = "move") : void;
      
      function EndDrag() : void;
      
      function AddReceiver(param1:IReceivable) : void;
      
      function RemoveReceiver(param1:IReceivable) : void;
   }
}
