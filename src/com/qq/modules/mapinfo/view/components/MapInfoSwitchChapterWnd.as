package com.qq.modules.mapinfo.view.components
{
   import PVZ.Cmd.E_WorldMapArea;
   
   public class MapInfoSwitchChapterWnd extends MapInfoSwitchChapterWndCE
   {
       
      
      public var c1:MapInfoSwitchChapterCell;
      
      public var c2:MapInfoSwitchChapterCell;
      
      public var c3:MapInfoSwitchChapterCell;
      
      public function MapInfoSwitchChapterWnd(param1:Class = null, param2:Boolean = true)
      {
         super(param1,param2);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.c1 = new MapInfoSwitchChapterCell(E_WorldMapArea.E_WorldMapArea_Primary,this);
         this.boxContent.addChild(this.c1);
         this.c2 = new MapInfoSwitchChapterCell(E_WorldMapArea.E_WorldMapArea_Middle,this);
         this.boxContent.addChild(this.c2);
         this.c3 = new MapInfoSwitchChapterCell(E_WorldMapArea.E_WorldMapArea_Advanced,this);
         this.boxContent.addChild(this.c3);
      }
   }
}
