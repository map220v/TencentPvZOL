package com.qq.modules.levelselect.view.components
{
   import asgui.controls.Button;
   import asgui.controls.Image;
   import asgui.controls.Label;
   import asgui.controls.TextArea;
   import asgui.resources.AssetManager;
   import com.qq.display.QCanvas;
   import com.qq.utils.UrlManager;
   
   public class LSChallengePromotionBonusCellCE extends QCanvas
   {
       
      
      public var img_bk:Image;
      
      public var l_name:Label;
      
      public var l_rank:TextArea;
      
      public var img_item:Image;
      
      public var l_got:Label;
      
      public var btn_get:Button;
      
      public var btn_go:Button;
      
      public var l_date:Label;
      
      public function LSChallengePromotionBonusCellCE(param1:Class = null, param2:Boolean = true)
      {
         super(!!param2 ? (!!param1 ? param1 : LSChallengePromotionBonusCellMediator) : null);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.width = 671;
         this.height = 66;
         this.img_bk = new Image();
         this.img_bk.x = 0;
         this.img_bk.width = 671;
         this.img_bk.height = 66;
         this.img_bk.source = AssetManager.GetClass("LS_Challenge_Bonus_ListCell");
         this.img_bk.id = "img_bk";
         this.addChild(this.img_bk);
         this.l_name = new Label();
         this.l_name.text = "";
         this.l_name.styleName = ".TXT_FZYH_13_Yellow";
         this.l_name.x = 15;
         this.l_name.y = 26;
         this.l_name.width = 130;
         this.l_name.height = 30;
         this.l_name.id = "l_name";
         this.l_name.vcenter = 1;
         this.addChild(this.l_name);
         this.l_rank = new TextArea();
         this.l_rank.width = 130;
         this.l_rank.height = 50;
         this.l_rank.selectable = false;
         this.l_rank.text = "999 -> 800";
         this.l_rank.styleName = ".TXT_HKHB_13_Yellow";
         this.l_rank.x = 150;
         this.l_rank.y = 23;
         this.l_rank.id = "l_rank";
         this.addChild(this.l_rank);
         this.img_item = new Image();
         this.img_item.x = 275;
         this.img_item.y = 2;
         this.img_item.width = 54;
         this.img_item.height = 54;
         this.img_item.source = UrlManager.getUrl(0,"image/iwan/itembg.png");
         this.img_item.id = "img_item";
         this.addChild(this.img_item);
         this.l_got = new Label();
         this.l_got.text = "已领取";
         this.l_got.styleName = ".TXT_HKHB_21_Yellow_Shadow";
         this.l_got.x = 541;
         this.l_got.y = 20;
         this.l_got.width = 100;
         this.l_got.height = 30;
         this.l_got.id = "l_got";
         this.l_got.vcenter = 1;
         this.addChild(this.l_got);
         this.btn_get = new Button();
         this.btn_get.label = "领取";
         this.btn_get.styleName = ".GreenButtonMid";
         this.btn_get.x = 554;
         this.btn_get.y = 15;
         this.btn_get.width = 80;
         this.btn_get.height = 20;
         this.btn_get.id = "btn_get";
         this.addChild(this.btn_get);
         this.btn_go = new Button();
         this.btn_go.label = "前往挑战";
         this.btn_go.styleName = ".RedButton";
         this.btn_go.x = 546;
         this.btn_go.y = 15;
         this.btn_go.width = 100;
         this.btn_go.height = 30;
         this.btn_go.id = "btn_go";
         this.addChild(this.btn_go);
         this.l_date = new Label();
         this.l_date.text = "2015-11-15 00:15:56";
         this.l_date.styleName = ".TXT_HKHB_13_Yellow";
         this.l_date.x = 352;
         this.l_date.y = 23;
         this.l_date.width = 175;
         this.l_date.height = 24;
         this.l_date.id = "l_date";
         this.addChild(this.l_date);
      }
      
      override public function Dispose() : void
      {
         this.img_bk = null;
         this.l_name = null;
         this.l_rank = null;
         this.img_item = null;
         this.l_got = null;
         this.btn_get = null;
         this.btn_go = null;
         this.l_date = null;
         super.Dispose();
      }
   }
}
