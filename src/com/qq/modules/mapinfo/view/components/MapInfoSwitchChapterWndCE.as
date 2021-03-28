package com.qq.modules.mapinfo.view.components
{
   import asgui.containers.HBox;
   import com.qq.display.QWindow;
   
   public class MapInfoSwitchChapterWndCE extends QWindow
   {
       
      
      public var boxContent:HBox;
      
      public function MapInfoSwitchChapterWndCE(param1:Class = null, param2:Boolean = true)
      {
         super(!!param2 ? (!!param1 ? param1 : MapInfoSwitchChapterWndMediator) : null);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.title = "地图选择";
         this.width = 760;
         this.height = 502;
         this.boxContent = new HBox();
         this.boxContent.styleName = ".Canvas_Brown";
         this.boxContent.id = "boxContent";
         this.boxContent.left = 0;
         this.boxContent.right = 0;
         this.boxContent.top = 0;
         this.boxContent.bottom = 2;
         this.boxContent.width = 400;
         this.boxContent.height = 300;
         this.addChild(this.boxContent);
      }
      
      override public function Dispose() : void
      {
         this.boxContent = null;
         super.Dispose();
      }
   }
}
