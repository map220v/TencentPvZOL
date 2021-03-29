package com.qq.modules.quest.view.component
{
   import asgui.containers.Canvas;
   import asgui.controls.Image;
   import asgui.controls.Label;
   import com.qq.display.QCanvas;
   
   public class QuestItemCellCE extends QCanvas
   {
       
      
      public var imageLoader:Image;
      
      public var label_6:Label;
      
      public var imgMask:Canvas;
      
      public function QuestItemCellCE(param1:Class = null, param2:Boolean = true)
      {
         super(!!param2 ? (!!param1 ? param1 : QuestItemCellMediator) : null);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.width = 62;
         this.height = 63;
         this.imageLoader = new Image();
         this.imageLoader.width = 50;
         this.imageLoader.height = 50;
         this.imageLoader.x = 6;
         this.imageLoader.y = 6;
         this.imageLoader.id = "imageLoader";
         this.addChild(this.imageLoader);
         this.label_6 = new Label();
         this.label_6.text = "10000";
         this.label_6.styleName = ".TXT_ArialBd_14";
         this.label_6.x = 0;
         this.label_6.y = 35;
         this.label_6.width = 58;
         this.label_6.height = 24;
         this.label_6.id = "label_6";
         this.addChild(this.label_6);
         this.imgMask = new Canvas();
         this.imgMask.width = 50;
         this.imgMask.height = 50;
         this.imgMask.enabled = false;
         this.imgMask.x = 7;
         this.imgMask.y = 5;
         this.imgMask.id = "imgMask";
         this.addChild(this.imgMask);
      }
      
      override public function Dispose() : void
      {
         this.imageLoader = null;
         this.label_6 = null;
         this.imgMask = null;
         super.Dispose();
      }
   }
}
