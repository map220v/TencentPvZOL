package asgui.controls
{
   import asgui.core.IListItemRenderer;
   
   public class CheckBox extends SelectableButton implements IListItemRenderer
   {
      
      public static const STYLE:String = "CheckBox";
       
      
      public function CheckBox()
      {
         textFiledAutoSize = true;
         super();
      }
      
      override protected function get $defaultStyleName() : String
      {
         return STYLE;
      }
      
      override protected function get lableX() : int
      {
         if($SkinNormal)
         {
            return $SkinNormal.width;
         }
         return 0;
      }
      
      override protected function get lableY() : int
      {
         return 0;
      }
   }
}
