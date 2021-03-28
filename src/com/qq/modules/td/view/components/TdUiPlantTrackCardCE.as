package com.qq.modules.td.view.components
{
   import asgui.containers.Canvas;
   import asgui.controls.Image;
   import asgui.controls.Label;
   import asgui.resources.AssetManager;
   import com.qq.display.QCanvas;
   
   public class TdUiPlantTrackCardCE extends QCanvas
   {
       
      
      public var bg:Canvas;
      
      public var txtName:Label;
      
      public var image_icon:Image;
      
      public function TdUiPlantTrackCardCE(param1:Class = null, param2:Boolean = true)
      {
         super(!!param2 ? (!!param1 ? param1 : TdUiPlantTrackCardMediator) : null);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.width = 54;
         this.height = 72;
         this.bg = new Canvas();
         this.bg.width = 54;
         this.bg.height = 72;
         this.bg.x = 0;
         this.bg.y = 0;
         this.bg.id = "bg";
         this.addChild(this.bg);
         this.txtName = new Label();
         this.txtName.styleName = ".TXT_TD_Card";
         this.txtName.x = 3;
         this.txtName.y = 52;
         this.txtName.width = 48;
         this.txtName.height = 24;
         this.txtName.id = "txtName";
         this.txtName.left = 3;
         this.txtName.right = 2;
         this.addChild(this.txtName);
         this.image_icon = new Image();
         this.image_icon.width = 16;
         this.image_icon.height = 16;
         this.image_icon.source = AssetManager.GetClass("TD_UI_Trash");
         this.image_icon.x = 38;
         this.image_icon.y = 0;
         this.image_icon.id = "image_icon";
         this.addChild(this.image_icon);
      }
      
      override public function Dispose() : void
      {
         this.bg = null;
         this.txtName = null;
         this.image_icon = null;
         super.Dispose();
      }
   }
}
