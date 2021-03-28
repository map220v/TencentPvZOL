package com.qq.modules.qzoneShare.view.components
{
   import asgui.containers.Canvas;
   import asgui.controls.Button;
   import asgui.controls.Image;
   import asgui.controls.Label;
   import com.qq.display.QWindow;
   import com.qq.utils.UrlManager;
   
   public class QZoneShareMsgWindowCE extends QWindow
   {
       
      
      public var img_bk:Image;
      
      public var img_2:Image;
      
      public var img_3:Image;
      
      public var img_cav:Canvas;
      
      public var img_icon:Image;
      
      public var img_4:Image;
      
      public var txt_desc:Label;
      
      public var btn_share:Button;
      
      public function QZoneShareMsgWindowCE(param1:Class = null, param2:Boolean = true)
      {
         super(!!param2 ? (!!param1 ? param1 : QZoneShareMsgWindowMediator) : null);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.title = "标题";
         this.width = 325;
         this.height = 240;
         this.img_bk = new Image();
         this.img_bk.width = 294;
         this.img_bk.height = 151;
         this.img_bk.x = 5;
         this.img_bk.y = 0;
         this.img_bk.id = "img_bk";
         this.img_bk.source = UrlManager.getUrl(0,"swf/qzoneShare/img_1.png");
         this.addChild(this.img_bk);
         this.img_2 = new Image();
         this.img_2.width = 175;
         this.img_2.height = 138;
         this.img_2.x = 120;
         this.img_2.y = 7;
         this.img_2.id = "img_2";
         this.img_2.source = UrlManager.getUrl(0,"swf/qzoneShare/img_2.png");
         this.addChild(this.img_2);
         this.img_3 = new Image();
         this.img_3.width = 100;
         this.img_3.height = 135;
         this.img_3.x = 10;
         this.img_3.y = 7;
         this.img_3.id = "img_3";
         this.img_3.source = UrlManager.getUrl(0,"swf/qzoneShare/img_3.png");
         this.addChild(this.img_3);
         this.img_cav = new Canvas();
         this.img_cav.width = 100;
         this.img_cav.height = 135;
         this.img_cav.x = 10;
         this.img_cav.y = 7;
         this.img_cav.id = "img_cav";
         this.img_icon = new Image();
         this.img_icon.width = 100;
         this.img_icon.height = 135;
         this.img_icon.hcenter = 0;
         this.img_icon.vcenter = 0;
         this.img_icon.id = "img_icon";
         this.img_cav.addChild(this.img_icon);
         this.addChild(this.img_cav);
         this.img_4 = new Image();
         this.img_4.width = 105;
         this.img_4.height = 145;
         this.img_4.x = 7;
         this.img_4.y = 5;
         this.img_4.id = "img_4";
         this.img_4.source = UrlManager.getUrl(0,"swf/qzoneShare/img_4.png");
         this.addChild(this.img_4);
         this.txt_desc = new Label();
         this.txt_desc.x = 120;
         this.txt_desc.y = 60;
         this.txt_desc.width = 170;
         this.txt_desc.height = 50;
         this.txt_desc.id = "txt_desc";
         this.txt_desc.styleName = ".TXT_HKHB_30_White_BEVEL";
         this.addChild(this.txt_desc);
         this.btn_share = new Button();
         this.btn_share.label = "炫耀一下";
         this.btn_share.styleName = ".GreenButton_Bigger";
         this.btn_share.x = 116;
         this.btn_share.y = 155;
         this.btn_share.width = 100;
         this.btn_share.height = 40;
         this.btn_share.id = "btn_share";
         this.btn_share.hcenter = 0;
         this.addChild(this.btn_share);
      }
      
      override public function Dispose() : void
      {
         this.img_bk = null;
         this.img_2 = null;
         this.img_3 = null;
         this.img_cav = null;
         this.img_4 = null;
         this.txt_desc = null;
         this.btn_share = null;
         super.Dispose();
      }
   }
}
