package asgui.containers
{
   import asgui.containers.boxes.BoxDirection;
   
   public class HBox extends Box
   {
       
      
      private var __:int;
      
      public function HBox()
      {
         super();
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.direction = BoxDirection.HORIZONTAL;
      }
   }
}
