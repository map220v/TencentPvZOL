package com.qq.modules.map.view.components
{
   import com.qq.display.QCanvas;
   
   public class MapUICE extends QCanvas
   {
       
      
      public function MapUICE(param1:Class = null, param2:Boolean = true)
      {
         super(!!param2 ? (!!param1 ? param1 : MapUIMediator) : null);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.width = 400;
         this.height = 300;
      }
      
      override public function Dispose() : void
      {
         super.Dispose();
      }
   }
}
