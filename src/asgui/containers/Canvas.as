package asgui.containers
{
   import asgui.core.Container;
   
   public class Canvas extends Container
   {
      
      public static const STYLE:String = "Canvas";
       
      
      public function Canvas()
      {
         super();
         absoluteLayout = true;
      }
      
      override protected function get $defaultStyleName() : String
      {
         return STYLE;
      }
   }
}
