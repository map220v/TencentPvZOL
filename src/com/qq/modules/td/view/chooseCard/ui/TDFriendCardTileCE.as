package com.qq.modules.td.view.chooseCard.ui
{
   import asgui.containers.Canvas;
   import asgui.controls.Image;
   import asgui.controls.Label;
   import asgui.resources.AssetManager;
   import com.qq.display.QCanvas;
   
   public class TDFriendCardTileCE extends QCanvas
   {
       
      
      public var bg:Image;
      
      public var label_name:Label;
      
      public var label_passStage:Label;
      
      public var canvas_card:Canvas;
      
      public var image_flag:Image;
      
      public var image_friendIconBG:Image;
      
      public var image_friendIcon:Image;
      
      public function TDFriendCardTileCE(param1:Class = null, param2:Boolean = true)
      {
         super(!!param2 ? (!!param1 ? param1 : TDFriendCardTileMediator) : null);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.width = 102;
         this.height = 125;
         this.bg = new Image();
         this.bg.width = 105;
         this.bg.height = 125;
         this.bg.source = AssetManager.GetClass("TD_UI_FriendCardBG");
         this.bg.x = 0;
         this.bg.y = 0;
         this.bg.id = "bg";
         this.addChild(this.bg);
         this.label_name = new Label();
         this.label_name.x = 0;
         this.label_name.y = 81;
         this.label_name.width = 105;
         this.label_name.height = 22;
         this.label_name.id = "label_name";
         this.label_name.hcenter = 0;
         this.addChild(this.label_name);
         this.label_passStage = new Label();
         this.label_passStage.x = 0;
         this.label_passStage.y = 101;
         this.label_passStage.width = 105;
         this.label_passStage.height = 22;
         this.label_passStage.id = "label_passStage";
         this.label_passStage.hcenter = 0;
         this.addChild(this.label_passStage);
         this.canvas_card = new Canvas();
         this.canvas_card.width = 54;
         this.canvas_card.height = 72;
         this.canvas_card.y = 7;
         this.canvas_card.id = "canvas_card";
         this.canvas_card.hcenter = 0;
         this.addChild(this.canvas_card);
         this.image_flag = new Image();
         this.image_flag.width = 50;
         this.image_flag.height = 50;
         this.image_flag.enabled = false;
         this.image_flag.x = 0;
         this.image_flag.y = 0;
         this.image_flag.id = "image_flag";
         this.addChild(this.image_flag);
         this.image_friendIconBG = new Image();
         this.image_friendIconBG.width = 24;
         this.image_friendIconBG.height = 24;
         this.image_friendIconBG.enabled = false;
         this.image_friendIconBG.source = AssetManager.GetClass("UI_FriendCardHeadIconBG");
         this.image_friendIconBG.x = 68;
         this.image_friendIconBG.y = 61;
         this.image_friendIconBG.id = "image_friendIconBG";
         this.addChild(this.image_friendIconBG);
         this.image_friendIcon = new Image();
         this.image_friendIcon.width = 20;
         this.image_friendIcon.height = 20;
         this.image_friendIcon.enabled = false;
         this.image_friendIcon.x = 70;
         this.image_friendIcon.y = 63;
         this.image_friendIcon.id = "image_friendIcon";
         this.addChild(this.image_friendIcon);
      }
      
      override public function Dispose() : void
      {
         this.bg = null;
         this.label_name = null;
         this.label_passStage = null;
         this.canvas_card = null;
         this.image_flag = null;
         this.image_friendIconBG = null;
         this.image_friendIcon = null;
         super.Dispose();
      }
   }
}
