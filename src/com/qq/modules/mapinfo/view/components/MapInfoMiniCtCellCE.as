package com.qq.modules.mapinfo.view.components
{
   import asgui.controls.Image;
   import asgui.controls.Text;
   import com.qq.display.QCanvas;
   import com.qq.utils.UrlManager;
   
   public class MapInfoMiniCtCellCE extends QCanvas
   {
       
      
      public var image_71:Image;
      
      public var txtContent:Text;
      
      public function MapInfoMiniCtCellCE(param1:Class = null, param2:Boolean = true)
      {
         super(!!param2 ? (!!param1 ? param1 : MapInfoMiniCtCellMediator) : null);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.width = 300;
         this.height = 25;
         this.image_71 = new Image();
         this.image_71.width = 294;
         this.image_71.height = 25;
         this.image_71.source = UrlManager.getUrl(0,"swf/mapinfo/minict_cell.png");
         this.image_71.x = 0;
         this.image_71.y = 0;
         this.image_71.id = "image_71";
         this.addChild(this.image_71);
         this.txtContent = new Text();
         this.txtContent.text = "test";
         this.txtContent.x = 40;
         this.txtContent.y = 3;
         this.txtContent.width = 180;
         this.txtContent.height = 24;
         this.txtContent.id = "txtContent";
         this.txtContent.left = 0;
         this.txtContent.right = 0;
         this.addChild(this.txtContent);
      }
      
      override public function Dispose() : void
      {
         this.image_71 = null;
         this.txtContent = null;
         super.Dispose();
      }
   }
}
