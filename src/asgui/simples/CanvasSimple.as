package asgui.simples
{
   import asgui.core.ContainerSimple;
   
   public class CanvasSimple extends ContainerSimple
   {
       
      
      public function CanvasSimple()
      {
         absoluteLayout = true;
         super();
         this.cacheAsBitmap = false;
      }
   }
}
