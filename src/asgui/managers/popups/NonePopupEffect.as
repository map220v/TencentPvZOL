package asgui.managers.popups
{
   import asgui.managers.IPopupEffect;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.geom.Point;
   
   public class NonePopupEffect implements IPopupEffect
   {
       
      
      public function NonePopupEffect()
      {
         super();
      }
      
      public function AddPopUp(param1:DisplayObject, param2:Sprite = null, param3:Point = null) : void
      {
      }
      
      public function RemovePopUp(param1:DisplayObject) : int
      {
         return 0;
      }
   }
}
