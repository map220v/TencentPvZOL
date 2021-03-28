package com.qq.modules.mapinfo.view.components
{
   public class MapInfoMiniCtCell extends MapInfoMiniCtCellCE
   {
       
      
      public function MapInfoMiniCtCell()
      {
         super();
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.buttonMode = true;
         this.mouseChildren = false;
      }
   }
}
