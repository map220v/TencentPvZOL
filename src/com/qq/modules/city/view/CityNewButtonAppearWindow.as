package com.qq.modules.city.view
{
   import com.qq.GameGloble;
   import com.qq.display.QCanvas;
   import flash.display.Loader;
   
   public class CityNewButtonAppearWindow extends QCanvas
   {
       
      
      public var loader:Loader;
      
      public function CityNewButtonAppearWindow()
      {
         super(CityNewButtonAppearWindowMediator);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         width = GameGloble.stage.stageWidth;
         height = GameGloble.stage.stageHeight;
      }
   }
}
