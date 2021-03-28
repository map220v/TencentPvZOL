package asgui.controls
{
   import asgui.core.IListItemRenderer;
   
   public class Image extends SWFLoader implements IListItemRenderer
   {
      
      public static const STYLE:String = "Image";
       
      
      public function Image()
      {
         super();
      }
      
      override protected function get $defaultStyleName() : String
      {
         return STYLE;
      }
   }
}
