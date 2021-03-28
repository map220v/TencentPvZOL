package com.qq.modules.mapinfo.view.components
{
   import asgui.containers.Canvas;
   import asgui.controls.Button;
   import asgui.controls.Image;
   import asgui.controls.List;
   import com.qq.display.QWindow;
   import com.qq.utils.UrlManager;
   
   public class MapInfoDetailWndCE extends QWindow
   {
       
      
      public var cContent:Canvas;
      
      public var btn1:Button;
      
      public var btn2:Button;
      
      public var btn3:Button;
      
      public var list:List;
      
      public var image_72:Image;
      
      public var image_71:Image;
      
      public function MapInfoDetailWndCE(param1:Class = null, param2:Boolean = true)
      {
         super(!!param2 ? (!!param1 ? param1 : MapInfoDetailWndMediator) : null);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.title = "情报";
         this.width = 590;
         this.height = 444;
         this.cContent = new Canvas();
         this.cContent.width = 560;
         this.cContent.height = 300;
         this.cContent.styleName = ".Canvas_Brown_With_Leaves";
         this.cContent.x = 0;
         this.cContent.y = 0;
         this.cContent.id = "cContent";
         this.cContent.left = 4;
         this.cContent.right = 4;
         this.cContent.top = 0;
         this.cContent.bottom = 4;
         this.btn1 = new Button();
         this.btn1.x = 14;
         this.btn1.y = 3;
         this.btn1.width = 94;
         this.btn1.height = 32;
         this.btn1.id = "btn1";
         this.btn1.label = "个人情报";
         this.btn1.styleName = ".GreenButtonTab";
         this.cContent.addChild(this.btn1);
         this.btn2 = new Button();
         this.btn2.x = 114;
         this.btn2.y = 3;
         this.btn2.width = 94;
         this.btn2.height = 32;
         this.btn2.id = "btn2";
         this.btn2.label = "联盟情报";
         this.btn2.styleName = ".GreenButtonTab";
         this.cContent.addChild(this.btn2);
         this.btn3 = new Button();
         this.btn3.x = 214;
         this.btn3.y = 3;
         this.btn3.width = 94;
         this.btn3.height = 32;
         this.btn3.id = "btn3";
         this.btn3.label = "植物大作战";
         this.btn3.styleName = ".GreenButtonTab";
         this.cContent.addChild(this.btn3);
         this.list = new List();
         this.list.width = 540;
         this.list.height = 200;
         this.list.x = 0;
         this.list.y = 40;
         this.list.id = "list";
         this.list.left = 4;
         this.list.right = 4;
         this.list.top = 34;
         this.list.bottom = 30;
         this.list.selectable = false;
         this.list.verticalScrollPolicy = "off";
         this.list.horizontalScrollPolicy = "off";
         this.list.rowHeight = 30;
         this.cContent.addChild(this.list);
         this.image_72 = new Image();
         this.image_72.width = 88;
         this.image_72.height = 28;
         this.image_72.source = UrlManager.getUrl(0,"swf/mapinfo/pager_back.png");
         this.image_72.x = 307;
         this.image_72.y = 304;
         this.image_72.id = "image_72";
         this.image_72.hcenter = 0;
         this.image_72.bottom = 2;
         this.cContent.addChild(this.image_72);
         this.addChild(this.cContent);
         this.image_71 = new Image();
         this.image_71.width = 100;
         this.image_71.height = 100;
         this.image_71.x = 249;
         this.image_71.y = 396;
         this.image_71.id = "image_71";
         this.addChild(this.image_71);
      }
      
      override public function Dispose() : void
      {
         this.cContent = null;
         this.image_71 = null;
         super.Dispose();
      }
   }
}
