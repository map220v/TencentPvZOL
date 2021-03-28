package com.qq.modules.td.view.components
{
   import asgui.controls.Image;
   import asgui.controls.Label;
   import asgui.resources.AssetManager;
   import com.qq.display.QCanvas;
   
   public class TDYetiKeyPanel extends QCanvas
   {
       
      
      public var keyImage:Image;
      
      public var txtKeyCount:Label;
      
      public function TDYetiKeyPanel(param1:Class = null)
      {
         super(TDYetiKeyPanelMediator);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.x = 960;
         this.y = 10;
         this.keyImage = new Image();
         this.keyImage.source = AssetManager.GetNewClass("TD_UI_YetiKey");
         this.addChild(this.keyImage);
         this.txtKeyCount = new Label();
         this.txtKeyCount.width = 100;
         this.txtKeyCount.height = 30;
         this.txtKeyCount.x = 25;
         this.txtKeyCount.y = 10;
         this.txtKeyCount.styleName = ".Label_MiniGame_Score";
         this.addChild(this.txtKeyCount);
      }
      
      public function setKeyCount(param1:int) : void
      {
         if(this.keyImage)
         {
            this.txtKeyCount.text = "×" + param1;
         }
      }
   }
}
