package com.qq.modules.levelselect.view.components
{
   import asgui.controls.Image;
   import asgui.controls.Label;
   import asgui.resources.AssetManager;
   import com.qq.display.QCanvas;
   import com.qq.utils.UrlManager;
   
   public class LSChallengeLevelItemCellCE extends QCanvas
   {
       
      
      public var imageBG:Image;
      
      public var l_rank:Label;
      
      public var l_name:Label;
      
      public var l_level:Label;
      
      public var l_date:Label;
      
      public var imgStage:Image;
      
      public var imgFlower:Image;
      
      public var imgRank:Image;
      
      public function LSChallengeLevelItemCellCE(param1:Class = null, param2:Boolean = true)
      {
         super(!!param2 ? (!!param1 ? param1 : LSChallengeLevelItemCellMediator) : null);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.width = 730;
         this.height = 35;
         this.imageBG = new Image();
         this.imageBG.width = 730;
         this.imageBG.height = 35;
         this.imageBG.source = AssetManager.GetClass("LS_Rank_Item_BG_Back");
         this.imageBG.x = 0;
         this.imageBG.y = 0;
         this.imageBG.id = "imageBG";
         this.addChild(this.imageBG);
         this.l_rank = new Label();
         this.l_rank.text = "999999";
         this.l_rank.x = 36;
         this.l_rank.y = 7;
         this.l_rank.width = 48;
         this.l_rank.height = 24;
         this.l_rank.id = "l_rank";
         this.addChild(this.l_rank);
         this.l_name = new Label();
         this.l_name.text = "名字只能七个字";
         this.l_name.x = 145;
         this.l_name.y = 7;
         this.l_name.width = 120;
         this.l_name.height = 24;
         this.l_name.id = "l_name";
         this.addChild(this.l_name);
         this.l_level = new Label();
         this.l_level.text = "10000000";
         this.l_level.x = 314;
         this.l_level.y = 6;
         this.l_level.width = 120;
         this.l_level.height = 24;
         this.l_level.id = "l_level";
         this.l_level.styleName = ".TXT_HKHB_21_Yellow_Shadow";
         this.addChild(this.l_level);
         this.l_date = new Label();
         this.l_date.text = "2015/7/2 14:20:29";
         this.l_date.x = 555;
         this.l_date.y = 6;
         this.l_date.width = 160;
         this.l_date.height = 24;
         this.l_date.id = "l_date";
         this.addChild(this.l_date);
         this.imgStage = new Image();
         this.imgStage.width = 63;
         this.imgStage.height = 55;
         this.imgStage.source = UrlManager.getUrl(0,"swf/mapinfo/challenge_icon/icon_9.png");
         this.imgStage.x = 89;
         this.imgStage.y = 0;
         this.imgStage.id = "imgStage";
         this.addChild(this.imgStage);
         this.imgFlower = new Image();
         this.imgFlower.width = 29;
         this.imgFlower.height = 30;
         this.imgFlower.source = UrlManager.getUrl(0,"swf/mapinfo/challenge_icon/flower.png");
         this.imgFlower.x = 421;
         this.imgFlower.y = 4;
         this.imgFlower.id = "imgFlower";
         this.addChild(this.imgFlower);
         this.imgRank = new Image();
         this.imgRank.width = 23;
         this.imgRank.height = 26;
         this.imgRank.source = UrlManager.getUrl(0,"swf/mapinfo/challenge_icon/1.png");
         this.imgRank.x = 36;
         this.imgRank.y = 8;
         this.imgRank.id = "imgRank";
         this.addChild(this.imgRank);
      }
      
      override public function Dispose() : void
      {
         this.imageBG = null;
         this.l_rank = null;
         this.l_name = null;
         this.l_level = null;
         this.l_date = null;
         this.imgStage = null;
         this.imgFlower = null;
         this.imgRank = null;
         super.Dispose();
      }
   }
}
