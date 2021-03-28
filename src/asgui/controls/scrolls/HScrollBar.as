package asgui.controls.scrolls
{
   public class HScrollBar extends ScrollBar
   {
      
      public static const STYLE:String = "HScrollBar";
       
      
      public function HScrollBar()
      {
         super(ScrollBarDirection.HORIZONTAL);
      }
      
      override protected function get $defaultStyleName() : String
      {
         return STYLE;
      }
   }
}
