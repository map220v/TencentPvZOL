package com.qq.modules.mapinfo.view.components
{
   import com.qq.display.QVBox;
   
   public class MapInfoMiniCt extends MapInfoMiniCtCE
   {
       
      
      public var cell1:MapInfoMiniCtCell;
      
      public var cell2:MapInfoMiniCtCell;
      
      public var cell3:MapInfoMiniCtCell;
      
      public var box:QVBox;
      
      public function MapInfoMiniCt(param1:Class = null, param2:Boolean = true)
      {
         super(param1,param2);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.width = 300;
         this.height = 70;
         this.box = new QVBox();
         this.box.mouseBackground = false;
         this.box.setFullSize();
         this.box.SetStyle("verticalAlign","bottom");
         this.addChild(this.box);
         this.cell1 = new MapInfoMiniCtCell();
         this.box.addChild(this.cell1);
         this.cell2 = new MapInfoMiniCtCell();
         this.box.addChild(this.cell2);
         this.cell3 = new MapInfoMiniCtCell();
         this.box.addChild(this.cell3);
      }
      
      override public function Dispose() : void
      {
         super.Dispose();
      }
   }
}
