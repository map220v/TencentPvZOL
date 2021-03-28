package asgui.managers
{
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.events.IEventDispatcher;
   import flash.geom.Point;
   
   public interface IPopUpManagerImpl extends IEventDispatcher
   {
       
      
      function CreatePopUp(param1:Class, param2:DisplayObjectContainer = null, param3:Boolean = false, param4:Boolean = true) : DisplayObject;
      
      function AddPopUp(param1:DisplayObject, param2:DisplayObjectContainer = null, param3:Boolean = false, param4:Boolean = true, param5:Point = null) : void;
      
      function CenterPopUp(param1:DisplayObject) : void;
      
      function RemovePopUp(param1:DisplayObject, param2:Boolean = true) : void;
      
      function BringToFront(param1:DisplayObject) : void;
      
      function BringToBottom(param1:DisplayObject) : void;
      
      function UpdateModalMask() : void;
      
      function get effect() : IPopupEffect;
      
      function set effect(param1:IPopupEffect) : void;
      
      function hasPopedWindow(param1:String) : Boolean;
   }
}
