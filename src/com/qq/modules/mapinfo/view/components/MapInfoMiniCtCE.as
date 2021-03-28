package com.qq.modules.mapinfo.view.components
{
   import com.qq.display.QCanvas;
   
   public class MapInfoMiniCtCE extends QCanvas
   {
       
      
      public function MapInfoMiniCtCE(param1:Class = null, param2:Boolean = true)
      {
         super(!!param2 ? (!!param1 ? param1 : MapInfoMiniCtMediator) : null);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.width = 311;
         this.height = 75;
      }
      
      override public function Dispose() : void
      {
         super.Dispose();
      }
   }
}
