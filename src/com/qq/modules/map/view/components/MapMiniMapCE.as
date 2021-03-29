package com.qq.modules.map.view.components
{
   import asgui.containers.Canvas;
   import asgui.controls.Button;
   import asgui.controls.Image;
   import asgui.controls.TextInput;
   import asgui.resources.AssetManager;
   import com.qq.display.QCanvas;
   
   public class MapMiniMapCE extends QCanvas
   {
       
      
      public var canvas_73:Canvas;
      
      public var image_73:Image;
      
      public var txtX:TextInput;
      
      public var txtY:TextInput;
      
      public var btnJump:Button;
      
      public var btnHome2:Image;
      
      public var btnHome1:Image;
      
      public var ctContent:Canvas;
      
      public var btnZoom:Image;
      
      public function MapMiniMapCE(param1:Class = null, param2:Boolean = true)
      {
         super(!!param2 ? (!!param1 ? param1 : MapMiniMapMediator) : null);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.width = 212;
         this.height = 206;
         this.styleName = ".Canvas_Brown_Outter_With_Leaves";
         this.scrollRectEnabled = false;
         this.canvas_73 = new Canvas();
         this.canvas_73.width = 193;
         this.canvas_73.height = 30;
         this.canvas_73.x = 8;
         this.canvas_73.y = 150;
         this.canvas_73.id = "canvas_73";
         this.canvas_73.bottom = 8;
         this.image_73 = new Image();
         this.image_73.width = 193;
         this.image_73.height = 27;
         this.image_73.source = AssetManager.GetClass("Map_Bottom_Back");
         this.image_73.x = 0;
         this.image_73.y = 0;
         this.image_73.id = "image_73";
         this.canvas_73.addChild(this.image_73);
         this.txtX = new TextInput();
         this.txtX.x = 15;
         this.txtX.y = 5;
         this.txtX.width = 34;
         this.txtX.height = 16;
         this.txtX.id = "txtX";
         this.txtX.text = "0";
         this.txtX.styleName = ".TextInput_Gray";
         this.txtX.maxChars = 4;
         this.txtX.restrict = "0-9";
         this.canvas_73.addChild(this.txtX);
         this.txtY = new TextInput();
         this.txtY.x = 58;
         this.txtY.y = 5;
         this.txtY.width = 34;
         this.txtY.height = 16;
         this.txtY.id = "txtY";
         this.txtY.text = "0";
         this.txtY.styleName = ".TextInput_Gray";
         this.txtY.maxChars = 4;
         this.txtY.restrict = "0-9";
         this.canvas_73.addChild(this.txtY);
         this.btnJump = new Button();
         this.btnJump.label = "跳转";
         this.btnJump.x = 95;
         this.btnJump.y = 3;
         this.btnJump.width = 40;
         this.btnJump.height = 24;
         this.btnJump.id = "btnJump";
         this.btnJump.styleName = ".GreenButtonSmall";
         this.canvas_73.addChild(this.btnJump);
         this.btnHome2 = new Image();
         this.btnHome2.width = 20;
         this.btnHome2.height = 19;
         this.btnHome2.source = AssetManager.GetClass("Map_Mini_Btn_Home_2");
         this.btnHome2.x = 142;
         this.btnHome2.y = 4;
         this.btnHome2.id = "btnHome2";
         this.btnHome2.toolTip = "回家";
         this.canvas_73.addChild(this.btnHome2);
         this.btnHome1 = new Image();
         this.btnHome1.width = 20;
         this.btnHome1.height = 19;
         this.btnHome1.source = AssetManager.GetClass("Map_Mini_Btn_Home_1");
         this.btnHome1.x = 168;
         this.btnHome1.y = 4;
         this.btnHome1.id = "btnHome1";
         this.btnHome1.toolTip = "显示/隐藏建城点";
         this.canvas_73.addChild(this.btnHome1);
         this.addChild(this.canvas_73);
         this.ctContent = new Canvas();
         this.ctContent.width = 194;
         this.ctContent.height = 156;
         this.ctContent.x = 8;
         this.ctContent.y = 10;
         this.ctContent.id = "ctContent";
         this.ctContent.top = 10;
         this.ctContent.bottom = 38;
         this.addChild(this.ctContent);
         this.btnZoom = new Image();
         this.btnZoom.width = 44;
         this.btnZoom.height = 17;
         this.btnZoom.source = AssetManager.GetClass("Map_Mini_Btn_Down");
         this.btnZoom.x = 18;
         this.btnZoom.y = -6;
         this.btnZoom.id = "btnZoom";
         this.btnZoom.hcenter = 0;
         this.addChild(this.btnZoom);
      }
      
      override public function Dispose() : void
      {
         this.canvas_73 = null;
         this.ctContent = null;
         this.btnZoom = null;
         super.Dispose();
      }
   }
}
