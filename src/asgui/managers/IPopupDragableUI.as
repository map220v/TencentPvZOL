package asgui.managers
{
   import flash.geom.Point;
   
   public interface IPopupDragableUI
   {
       
      
      function get dragable() : Boolean;
      
      function CheckCenterPopUpWhenOutScreen(param1:int, param2:int) : Point;
   }
}
