package com.qq.modules.guide.view.components
{
   import asgui.containers.Canvas;
   import asgui.controls.Button;
   import asgui.controls.Image;
   import asgui.controls.Label;
   import com.qq.display.QWindow;
   import com.qq.utils.UrlManager;
   
   public class GuideChooseGameTypeWindowCE extends QWindow
   {
       
      
      public var canvas_bg1:Canvas;
      
      public var canvas_bg2:Canvas;
      
      public var canvas_bg3:Canvas;
      
      public var canvas_bg4:Canvas;
      
      public var label_tip:Label;
      
      public var image_type1:Image;
      
      public var image_type2:Image;
      
      public var button_td:Button;
      
      public var button_rpg:Button;
      
      public function GuideChooseGameTypeWindowCE(param1:Class = null, param2:Boolean = true)
      {
         super(!!param2 ? (!!param1 ? param1 : GuideChooseGameTypeWindowMediator) : null);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.width = 797;
         this.height = 393;
         this.title = "游戏偏好";
         this.canvas_bg1 = new Canvas();
         this.canvas_bg1.width = 773;
         this.canvas_bg1.height = 344;
         this.canvas_bg1.styleName = ".Canvas_Brown2";
         this.canvas_bg1.x = 3;
         this.canvas_bg1.y = -2;
         this.canvas_bg1.id = "canvas_bg1";
         this.canvas_bg2 = new Canvas();
         this.canvas_bg2.width = 747;
         this.canvas_bg2.height = 54;
         this.canvas_bg2.styleName = ".Canvas_Small_Green_Top";
         this.canvas_bg2.x = 13;
         this.canvas_bg2.y = 10;
         this.canvas_bg2.id = "canvas_bg2";
         this.canvas_bg1.addChild(this.canvas_bg2);
         this.canvas_bg3 = new Canvas();
         this.canvas_bg3.width = 372;
         this.canvas_bg3.height = 218;
         this.canvas_bg3.styleName = ".Canvas_Guide_Target";
         this.canvas_bg3.x = 15;
         this.canvas_bg3.y = 65;
         this.canvas_bg3.id = "canvas_bg3";
         this.canvas_bg1.addChild(this.canvas_bg3);
         this.canvas_bg4 = new Canvas();
         this.canvas_bg4.width = 375;
         this.canvas_bg4.height = 219;
         this.canvas_bg4.styleName = ".Canvas_Guide_Target";
         this.canvas_bg4.x = 388;
         this.canvas_bg4.y = 64;
         this.canvas_bg4.id = "canvas_bg4";
         this.canvas_bg1.addChild(this.canvas_bg4);
         this.label_tip = new Label();
         this.label_tip.text = "选择你喜欢的游戏类型";
         this.label_tip.styleName = ".TXT_HKHB_24_Yellow_Shadow";
         this.label_tip.x = 66;
         this.label_tip.y = 24;
         this.label_tip.width = 255;
         this.label_tip.height = 31;
         this.label_tip.id = "label_tip";
         this.label_tip.hcenter = 0;
         this.canvas_bg1.addChild(this.label_tip);
         this.image_type1 = new Image();
         this.image_type1.width = 350;
         this.image_type1.height = 196;
         this.image_type1.source = UrlManager.getUrl(0,"image/guide/gametype1.jpg");
         this.image_type1.x = 25;
         this.image_type1.y = 74;
         this.image_type1.id = "image_type1";
         this.canvas_bg1.addChild(this.image_type1);
         this.image_type2 = new Image();
         this.image_type2.width = 350;
         this.image_type2.height = 196;
         this.image_type2.source = UrlManager.getUrl(0,"image/guide/gametype2.jpg");
         this.image_type2.x = 400;
         this.image_type2.y = 73;
         this.image_type2.id = "image_type2";
         this.canvas_bg1.addChild(this.image_type2);
         this.button_td = new Button();
         this.button_td.label = "塔防";
         this.button_td.styleName = ".GreenButton";
         this.button_td.x = 132;
         this.button_td.y = 258;
         this.button_td.width = 117;
         this.button_td.height = 53;
         this.button_td.id = "button_td";
         this.button_td.hcenter = -190;
         this.button_td.bottom = 10;
         this.button_td.coolDownTime = 5000;
         this.canvas_bg1.addChild(this.button_td);
         this.button_rpg = new Button();
         this.button_rpg.label = "冒险";
         this.button_rpg.styleName = ".GreenButton";
         this.button_rpg.x = 498;
         this.button_rpg.y = 258;
         this.button_rpg.width = 116;
         this.button_rpg.height = 53;
         this.button_rpg.id = "button_rpg";
         this.button_rpg.hcenter = 190;
         this.button_rpg.bottom = 10;
         this.canvas_bg1.addChild(this.button_rpg);
         this.addChild(this.canvas_bg1);
      }
      
      override public function Dispose() : void
      {
         this.canvas_bg1 = null;
         super.Dispose();
      }
   }
}
