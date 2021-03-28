package asgui.containers
{
   import asgui.containers.boxes.BoxDirection;
   
   public class VBox extends Box
   {
       
      
      public function VBox()
      {
         super();
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.direction = BoxDirection.VERTICAL;
      }
   }
}
