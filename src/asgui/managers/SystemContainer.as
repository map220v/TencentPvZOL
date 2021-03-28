package asgui.managers
{
   import asgui.core.ITopContainer;
   import flash.display.Sprite;
   
   public class SystemContainer extends Sprite implements ITopContainer
   {
       
      
      public function SystemContainer()
      {
         super();
      }
      
      public function InvalidateDisplayList(param1:Object = null) : void
      {
      }
      
      public function get getAbsoluteLayout() : Boolean
      {
         return false;
      }
   }
}
