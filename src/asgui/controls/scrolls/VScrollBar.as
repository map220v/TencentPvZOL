package asgui.controls.scrolls
{
   public class VScrollBar extends ScrollBar
   {
      
      public static const STYLE:String = "VScrollBar";
       
      
      public function VScrollBar()
      {
         super(ScrollBarDirection.VERTICAL);
      }
      
      override protected function get $defaultStyleName() : String
      {
         return STYLE;
      }
   }
}
