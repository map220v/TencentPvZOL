package com.qq.modules.td.view.components
{
   import asgui.containers.Canvas;
   import asgui.controls.Button;
   import asgui.controls.Image;
   import asgui.controls.Label;
   import asgui.controls.TextArea;
   import com.qq.display.QWindow;
   
   public class TDInstrustationWindowCE extends QWindow
   {
       
      
      public var canvas_gray_bg:Canvas;
      
      public var image_reviewBG:Image;
      
      public var canvas_yellow_frame:Canvas;
      
      public var canvas_yellow_panel:Canvas;
      
      public var label_name:Label;
      
      public var textarea_desc:TextArea;
      
      public var canvas_split_line:Canvas;
      
      public var label_tip_title:Label;
      
      public var textarea_tip:TextArea;
      
      public var button_ok:Button;
      
      public var canvas_grass_left:Canvas;
      
      public var canvas_grass_right:Canvas;
      
      public function TDInstrustationWindowCE(param1:Class = null, param2:Boolean = true)
      {
         super(!!param2 ? (!!param1 ? param1 : TDInstrustationWindowMediator) : null);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.width = 603;
         this.height = 395;
         this.title = "新僵尸新植物";
         this.canvas_gray_bg = new Canvas();
         this.canvas_gray_bg.width = 562;
         this.canvas_gray_bg.height = 285;
         this.canvas_gray_bg.styleName = ".Box_Gray";
         this.canvas_gray_bg.x = 0;
         this.canvas_gray_bg.y = 0;
         this.canvas_gray_bg.id = "canvas_gray_bg";
         this.canvas_gray_bg.hcenter = 2;
         this.canvas_gray_bg.top = 5;
         this.image_reviewBG = new Image();
         this.image_reviewBG.width = 207;
         this.image_reviewBG.height = 242;
         this.image_reviewBG.x = 8;
         this.image_reviewBG.y = 11;
         this.image_reviewBG.id = "image_reviewBG";
         this.canvas_gray_bg.addChild(this.image_reviewBG);
         this.canvas_yellow_frame = new Canvas();
         this.canvas_yellow_frame.width = 221;
         this.canvas_yellow_frame.height = 258;
         this.canvas_yellow_frame.styleName = ".Yellow_Frame";
         this.canvas_yellow_frame.x = 0;
         this.canvas_yellow_frame.y = 5;
         this.canvas_yellow_frame.id = "canvas_yellow_frame";
         this.canvas_gray_bg.addChild(this.canvas_yellow_frame);
         this.canvas_yellow_panel = new Canvas();
         this.canvas_yellow_panel.width = 318;
         this.canvas_yellow_panel.height = 257;
         this.canvas_yellow_panel.styleName = ".YellowPanel";
         this.canvas_yellow_panel.x = 0;
         this.canvas_yellow_panel.y = 6;
         this.canvas_yellow_panel.id = "canvas_yellow_panel";
         this.canvas_yellow_panel.right = 0;
         this.label_name = new Label();
         this.label_name.x = 18;
         this.label_name.y = 18;
         this.label_name.width = 1000;
         this.label_name.height = 30;
         this.label_name.id = "label_name";
         this.label_name.text = "僵尸";
         this.label_name.styleName = ".TXT_HKHB_21_Blue";
         this.canvas_yellow_panel.addChild(this.label_name);
         this.textarea_desc = new TextArea();
         this.textarea_desc.width = 285;
         this.textarea_desc.height = 100;
         this.textarea_desc.x = 15;
         this.textarea_desc.y = 60;
         this.textarea_desc.id = "textarea_desc";
         this.textarea_desc.text = "僵尸";
         this.textarea_desc.styleName = ".textAreaNoBackground_White15";
         this.textarea_desc.selectable = false;
         this.canvas_yellow_panel.addChild(this.textarea_desc);
         this.canvas_split_line = new Canvas();
         this.canvas_split_line.width = 400;
         this.canvas_split_line.height = 300;
         this.canvas_split_line.x = 7;
         this.canvas_split_line.y = 166;
         this.canvas_split_line.id = "canvas_split_line";
         this.canvas_split_line.styleName = ".SplitLine";
         this.canvas_yellow_panel.addChild(this.canvas_split_line);
         this.label_tip_title = new Label();
         this.label_tip_title.text = "特点：";
         this.label_tip_title.styleName = ".TXT_Green_16";
         this.label_tip_title.x = 18;
         this.label_tip_title.y = 177;
         this.label_tip_title.width = 48;
         this.label_tip_title.height = 24;
         this.label_tip_title.id = "label_tip_title";
         this.canvas_yellow_panel.addChild(this.label_tip_title);
         this.textarea_tip = new TextArea();
         this.textarea_tip.text = "僵尸";
         this.textarea_tip.x = 67;
         this.textarea_tip.y = 177;
         this.textarea_tip.width = 222;
         this.textarea_tip.height = 60;
         this.textarea_tip.id = "label_tip";
         this.textarea_tip.styleName = ".textAreaNoBackground_White15";
         this.canvas_yellow_panel.addChild(this.textarea_tip);
         this.canvas_gray_bg.addChild(this.canvas_yellow_panel);
         this.addChild(this.canvas_gray_bg);
         this.button_ok = new Button();
         this.button_ok.label = "知道了";
         this.button_ok.styleName = ".GreenButton";
         this.button_ok.x = 0;
         this.button_ok.y = 0;
         this.button_ok.width = 120;
         this.button_ok.height = 55;
         this.button_ok.id = "button_ok";
         this.button_ok.hcenter = 0;
         this.button_ok.bottom = 4;
         this.addChild(this.button_ok);
         this.canvas_grass_left = new Canvas();
         this.canvas_grass_left.width = 66;
         this.canvas_grass_left.height = 40;
         this.canvas_grass_left.styleName = ".Canvas_Grass_Left";
         this.canvas_grass_left.x = 8;
         this.canvas_grass_left.y = 260;
         this.canvas_grass_left.id = "canvas_grass_left";
         this.addChild(this.canvas_grass_left);
         this.canvas_grass_right = new Canvas();
         this.canvas_grass_right.width = 66;
         this.canvas_grass_right.height = 40;
         this.canvas_grass_right.styleName = ".Canvas_Grass_Right";
         this.canvas_grass_right.x = 0;
         this.canvas_grass_right.y = 260;
         this.canvas_grass_right.id = "canvas_grass_right";
         this.canvas_grass_right.right = 6;
         this.addChild(this.canvas_grass_right);
      }
      
      override public function Dispose() : void
      {
         this.canvas_gray_bg = null;
         this.button_ok = null;
         this.canvas_grass_left = null;
         this.canvas_grass_right = null;
         super.Dispose();
      }
   }
}
