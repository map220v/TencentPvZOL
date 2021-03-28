package asgui.managers
{
   import flash.display.DisplayObject;
   import flash.events.IEventDispatcher;
   
   public interface ISystemManager extends IEventDispatcher
   {
       
      
      function AddDropDown(param1:DisplayObject, param2:DisplayObject) : void;
      
      function RemoveDropDown(param1:DisplayObject) : void;
   }
}
