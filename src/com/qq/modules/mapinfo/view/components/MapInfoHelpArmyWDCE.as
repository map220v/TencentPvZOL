package com.qq.modules.mapinfo.view.components
{
   import asgui.containers.Canvas;
   import asgui.containers.VBox;
   import asgui.controls.Label;
   import com.qq.display.QWindow;
   
   public class MapInfoHelpArmyWDCE extends QWindow
   {
       
      
      public var canvas_75:Canvas;
      
      public var vbox_76:VBox;
      
      public var canvas_109:Canvas;
      
      public var canvas_112:Canvas;
      
      public var txt_info:Label;
      
      public var box:VBox;
      
      public function MapInfoHelpArmyWDCE(param1:Class = null, param2:Boolean = true)
      {
         super(!!param2 ? (!!param1 ? param1 : MapInfoHelpArmyWDMediator) : null);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.width = 490;
         this.height = 430;
         this.title = "盟友援军";
         this.canvas_75 = new Canvas();
         this.canvas_75.width = 400;
         this.canvas_75.height = 300;
         this.canvas_75.styleName = ".Canvas_Brown";
         this.canvas_75.x = 40;
         this.canvas_75.y = 66;
         this.canvas_75.id = "canvas_75";
         this.canvas_75.left = 5;
         this.canvas_75.right = 5;
         this.canvas_75.top = 0;
         this.canvas_75.bottom = 5;
         this.vbox_76 = new VBox();
         this.vbox_76.width = 400;
         this.vbox_76.height = 300;
         this.vbox_76.styleName = ".Canvs_List_Style";
         this.vbox_76.x = 34;
         this.vbox_76.y = 33;
         this.vbox_76.id = "vbox_76";
         this.vbox_76.left = 5;
         this.vbox_76.right = 1;
         this.vbox_76.top = 5;
         this.vbox_76.bottom = 8;
         this.canvas_75.addChild(this.vbox_76);
         this.addChild(this.canvas_75);
         this.canvas_109 = new Canvas();
         this.canvas_109.width = 400;
         this.canvas_109.height = 300;
         this.canvas_109.styleName = ".Box_Yellow";
         this.canvas_109.x = 0;
         this.canvas_109.y = 0;
         this.canvas_109.id = "canvas_109";
         this.canvas_109.left = 10;
         this.canvas_109.right = 10;
         this.canvas_109.top = 5;
         this.canvas_109.bottom = 3;
         this.canvas_112 = new Canvas();
         this.canvas_112.width = 418;
         this.canvas_112.height = 30;
         this.canvas_112.styleName = ".ListBase_yellow_depth_Cell";
         this.canvas_112.x = 7;
         this.canvas_112.y = 181;
         this.canvas_112.id = "canvas_112";
         this.canvas_112.left = 8;
         this.canvas_112.bottom = 18;
         this.txt_info = new Label();
         this.txt_info.text = "可容纳驻军人数4/5";
         this.txt_info.styleName = ".TXT_HKHB_13_White";
         this.txt_info.x = 184;
         this.txt_info.y = 10;
         this.txt_info.width = 140;
         this.txt_info.height = 24;
         this.txt_info.id = "txt_info";
         this.txt_info.hcenter = 0;
         this.txt_info.bottom = 0;
         this.canvas_112.addChild(this.txt_info);
         this.canvas_109.addChild(this.canvas_112);
         this.box = new VBox();
         this.box.width = 418;
         this.box.height = 300;
         this.box.x = 19;
         this.box.y = 10;
         this.box.id = "box";
         this.box.left = 8;
         this.canvas_109.addChild(this.box);
         this.addChild(this.canvas_109);
      }
      
      override public function Dispose() : void
      {
         this.canvas_75 = null;
         this.canvas_109 = null;
         super.Dispose();
      }
   }
}
