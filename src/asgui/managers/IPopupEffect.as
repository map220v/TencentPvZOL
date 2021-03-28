package asgui.managers
{
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.geom.Point;
   
   public interface IPopupEffect
   {
       
      
      function AddPopUp(param1:DisplayObject, param2:Sprite = null, param3:Point = null) : void;
      
      function RemovePopUp(param1:DisplayObject) : int;
   }
}
