package com.qq.modules.mapinfo.view.components
{
   import asgui.containers.Canvas;
   import asgui.containers.HBox;
   import asgui.containers.VBox;
   import asgui.controls.Button;
   import asgui.controls.Image;
   import asgui.controls.Label;
   import asgui.controls.LinkButton;
   import com.qq.display.QCanvas;
   import com.qq.utils.UrlManager;
   
   public class MapInfoRoleWndCE extends QCanvas
   {
       
      
      public var imgBack:Image;
      
      public var boxBtns:HBox;
      
      public var boxHistories:VBox;
      
      public var canvas_85:Canvas;
      
      public var image_76:Image;
      
      public var imgRole:Image;
      
      public var imgStamp:Image;
      
      public var imgStar:Image;
      
      public var txtLevel:Label;
      
      public var txtName:Label;
      
      public var txtPos:Label;
      
      public var txtAlliance:Label;
      
      public var btnClose:Image;
      
      public var btnMail:Image;
      
      public var linkbutton_block:LinkButton;
      
      public var linkbutton_not_block:LinkButton;
      
      public var button_my_word_save:Button;
      
      public var label_my_word_title:Label;
      
      public function MapInfoRoleWndCE(param1:Class = null, param2:Boolean = true)
      {
         super(!!param2 ? (!!param1 ? param1 : MapInfoRoleWndMediator) : null);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.width = 476;
         this.height = 270;
         this.styleName = ".LightBluePanel";
         this.imgBack = new Image();
         this.imgBack.width = 466;
         this.imgBack.height = 259;
         this.imgBack.source = UrlManager.getUrl(0,"swf/mapinfo/role_back.png");
         this.imgBack.x = 7;
         this.imgBack.y = 6;
         this.imgBack.id = "imgBack";
         this.addChild(this.imgBack);
         this.boxBtns = new HBox();
         this.boxBtns.width = 450;
         this.boxBtns.height = 40;
         this.boxBtns.x = 15;
         this.boxBtns.y = 219;
         this.boxBtns.id = "boxBtns";
         this.addChild(this.boxBtns);
         this.boxHistories = new VBox();
         this.boxHistories.width = 450;
         this.boxHistories.height = 100;
         this.boxHistories.x = 16;
         this.boxHistories.y = 118;
         this.boxHistories.id = "boxHistories";
         this.addChild(this.boxHistories);
         this.canvas_85 = new Canvas();
         this.canvas_85.width = 257;
         this.canvas_85.height = 80;
         this.canvas_85.x = 20;
         this.canvas_85.y = 20;
         this.canvas_85.id = "canvas_85";
         this.canvas_85.scrollRectEnabled = false;
         this.image_76 = new Image();
         this.image_76.width = 80;
         this.image_76.height = 80;
         this.image_76.source = UrlManager.getUrl(0,"swf/mapinfo/role_icon_back.png");
         this.image_76.x = 0;
         this.image_76.y = 0;
         this.image_76.id = "image_76";
         this.canvas_85.addChild(this.image_76);
         this.imgRole = new Image();
         this.imgRole.width = 67;
         this.imgRole.height = 67;
         this.imgRole.x = 5;
         this.imgRole.y = 5;
         this.imgRole.id = "imgRole";
         this.imgRole.scaleContent = true;
         this.canvas_85.addChild(this.imgRole);
         this.imgStamp = new Image();
         this.imgStamp.width = 42;
         this.imgStamp.height = 42;
         this.imgStamp.source = UrlManager.getUrl(0,"swf/mapinfo/role_icon_stamp.png");
         this.imgStamp.x = -6;
         this.imgStamp.y = 40;
         this.imgStamp.id = "imgStamp";
         this.canvas_85.addChild(this.imgStamp);
         this.imgStar = new Image();
         this.imgStar.width = 32;
         this.imgStar.height = 33;
         this.imgStar.source = UrlManager.getUrl(0,"swf/mapinfo/role_icon_star.png");
         this.imgStar.x = 42;
         this.imgStar.y = 56;
         this.imgStar.id = "imgStar";
         this.canvas_85.addChild(this.imgStar);
         this.txtLevel = new Label();
         this.txtLevel.text = "000";
         this.txtLevel.x = 48;
         this.txtLevel.y = 64;
         this.txtLevel.width = 24;
         this.txtLevel.height = 24;
         this.txtLevel.id = "txtLevel";
         this.canvas_85.addChild(this.txtLevel);
         this.txtName = new Label();
         this.txtName.text = "我的名字我的名字";
         this.txtName.x = 77;
         this.txtName.y = 3;
         this.txtName.width = 149;
         this.txtName.height = 24;
         this.txtName.id = "txtName";
         this.txtName.styleName = ".TXT_Panel_Title_Normal";
         this.canvas_85.addChild(this.txtName);
         this.txtPos = new Label();
         this.txtPos.text = "";
         this.txtPos.x = 80;
         this.txtPos.y = 29;
         this.txtPos.width = 160;
         this.txtPos.height = 21;
         this.txtPos.id = "txtPos";
         this.canvas_85.addChild(this.txtPos);
         this.txtAlliance = new Label();
         this.txtAlliance.text = "";
         this.txtAlliance.x = 115;
         this.txtAlliance.y = 55;
         this.txtAlliance.width = 133;
         this.txtAlliance.height = 24;
         this.txtAlliance.id = "txtAlliance";
         this.canvas_85.addChild(this.txtAlliance);
         this.addChild(this.canvas_85);
         this.btnClose = new Image();
         this.btnClose.width = 32;
         this.btnClose.height = 29;
         this.btnClose.source = UrlManager.getUrl(0,"swf/mapinfo/btn_close.swf");
         this.btnClose.x = 415;
         this.btnClose.y = 22;
         this.btnClose.id = "btnClose";
         this.btnClose.right = 12;
         this.btnClose.top = 14;
         this.addChild(this.btnClose);
         this.btnMail = new Image();
         this.btnMail.width = 45;
         this.btnMail.height = 42;
         this.btnMail.source = UrlManager.getUrl(0,"swf/mapinfo/btn_mail.swf");
         this.btnMail.x = 20;
         this.btnMail.y = 216;
         this.btnMail.id = "btnMail";
         this.addChild(this.btnMail);
         this.linkbutton_block = new LinkButton();
         this.linkbutton_block.label = "加入黑名单";
         this.linkbutton_block.x = 400;
         this.linkbutton_block.y = 236;
         this.linkbutton_block.width = 50;
         this.linkbutton_block.height = 18;
         this.linkbutton_block.id = "linkbutton_block";
         this.addChild(this.linkbutton_block);
         this.linkbutton_not_block = new LinkButton();
         this.linkbutton_not_block.label = "移除黑名单";
         this.linkbutton_not_block.x = 400;
         this.linkbutton_not_block.y = 236;
         this.linkbutton_not_block.width = 50;
         this.linkbutton_not_block.height = 24;
         this.linkbutton_not_block.id = "linkbutton_not_block";
         this.addChild(this.linkbutton_not_block);
         this.button_my_word_save = new Button();
         this.button_my_word_save.label = "修改";
         this.button_my_word_save.styleName = ".RedButtonRect";
         this.button_my_word_save.x = 369;
         this.button_my_word_save.y = 18;
         this.button_my_word_save.width = 48;
         this.button_my_word_save.height = 24;
         this.button_my_word_save.id = "button_my_word_save";
         this.addChild(this.button_my_word_save);
         this.label_my_word_title = new Label();
         this.label_my_word_title.text = "个性签名：";
         this.label_my_word_title.x = 281;
         this.label_my_word_title.y = 21;
         this.label_my_word_title.width = 64;
         this.label_my_word_title.height = 20;
         this.label_my_word_title.id = "label_my_word_title";
         this.addChild(this.label_my_word_title);
      }
      
      override public function Dispose() : void
      {
         this.imgBack = null;
         this.boxBtns = null;
         this.boxHistories = null;
         this.canvas_85 = null;
         this.btnClose = null;
         this.btnMail = null;
         this.linkbutton_block = null;
         this.linkbutton_not_block = null;
         this.button_my_word_save = null;
         this.label_my_word_title = null;
         super.Dispose();
      }
   }
}
