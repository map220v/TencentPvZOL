package com.qq.modules.levelselect.view.components
{
   import asgui.controls.Button;
   import asgui.controls.Image;
   import asgui.controls.Label;
   import asgui.resources.AssetManager;
   import com.qq.display.QCanvas;
   import com.qq.utils.UrlManager;
   
   public class LSChallengeRankLevelWdCE extends QCanvas
   {
       
      
      public var imageBG:Image;
      
      public var l_myRank:Label;
      
      public var btnGetReward:Button;
      
      public var l_stage_0:Label;
      
      public var l_stage_1:Label;
      
      public var l_stage_2:Label;
      
      public var l_stage_3:Label;
      
      public var l_stage_4:Label;
      
      public var l_stage_5:Label;
      
      public var img_icon_0:Image;
      
      public var img_icon_1:Image;
      
      public var img_icon_2:Image;
      
      public var img_icon_3:Image;
      
      public var img_icon_4:Image;
      
      public var img_icon_5:Image;
      
      public var img_icon_6:Image;
      
      public var l_stage_6:Label;
      
      public var img_icon_7:Image;
      
      public var l_stage_7:Label;
      
      public var img_icon_8:Image;
      
      public var l_stage_8:Label;
      
      public var label_level_name:Label;
      
      public function LSChallengeRankLevelWdCE(param1:Class = null, param2:Boolean = true)
      {
         super(!!param2 ? (!!param1 ? param1 : LSChallengeRankLevelWdMediator) : null);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.width = 758;
         this.height = 549;
         this.imageBG = new Image();
         this.imageBG.width = 758;
         this.imageBG.height = 549;
         this.imageBG.source = AssetManager.GetClass("LS_Rank_Level_BG");
         this.imageBG.x = 0;
         this.imageBG.y = 0;
         this.imageBG.id = "imageBG";
         this.addChild(this.imageBG);
         this.l_myRank = new Label();
         this.l_myRank.x = 302;
         this.l_myRank.y = 465;
         this.l_myRank.width = 160;
         this.l_myRank.height = 24;
         this.l_myRank.id = "l_myRank";
         this.l_myRank.text = "我的排名";
         this.l_myRank.styleName = ".TXT_HKHB_21_Yellow_Shadow";
         this.addChild(this.l_myRank);
         this.btnGetReward = new Button();
         this.btnGetReward.label = "领取奖励";
         this.btnGetReward.styleName = ".GreenButtonMid";
         this.btnGetReward.x = 611;
         this.btnGetReward.y = 462;
         this.btnGetReward.width = 80;
         this.btnGetReward.height = 24;
         this.btnGetReward.id = "btnGetReward";
         this.addChild(this.btnGetReward);
         this.l_stage_0 = new Label();
         this.l_stage_0.text = "1000";
         this.l_stage_0.styleName = ".TXT_HKHB_15_White";
         this.l_stage_0.x = 23;
         this.l_stage_0.y = 88;
         this.l_stage_0.width = 48;
         this.l_stage_0.height = 24;
         this.l_stage_0.id = "l_stage_0";
         this.addChild(this.l_stage_0);
         this.l_stage_1 = new Label();
         this.l_stage_1.text = "3000";
         this.l_stage_1.styleName = ".TXT_HKHB_15_White";
         this.l_stage_1.x = 107;
         this.l_stage_1.y = 88;
         this.l_stage_1.width = 48;
         this.l_stage_1.height = 24;
         this.l_stage_1.id = "l_stage_1";
         this.addChild(this.l_stage_1);
         this.l_stage_2 = new Label();
         this.l_stage_2.text = "5000";
         this.l_stage_2.styleName = ".TXT_HKHB_15_White";
         this.l_stage_2.x = 185;
         this.l_stage_2.y = 88;
         this.l_stage_2.width = 48;
         this.l_stage_2.height = 24;
         this.l_stage_2.id = "l_stage_2";
         this.addChild(this.l_stage_2);
         this.l_stage_3 = new Label();
         this.l_stage_3.text = "10000";
         this.l_stage_3.styleName = ".TXT_HKHB_15_White";
         this.l_stage_3.x = 266;
         this.l_stage_3.y = 88;
         this.l_stage_3.width = 48;
         this.l_stage_3.height = 24;
         this.l_stage_3.id = "l_stage_3";
         this.addChild(this.l_stage_3);
         this.l_stage_4 = new Label();
         this.l_stage_4.text = "30000";
         this.l_stage_4.styleName = ".TXT_HKHB_15_White";
         this.l_stage_4.x = 350;
         this.l_stage_4.y = 70;
         this.l_stage_4.width = 90;
         this.l_stage_4.height = 23;
         this.l_stage_4.id = "l_stage_4";
         this.addChild(this.l_stage_4);
         this.l_stage_5 = new Label();
         this.l_stage_5.text = "50000";
         this.l_stage_5.styleName = ".TXT_HKHB_15_White";
         this.l_stage_5.x = 430;
         this.l_stage_5.y = 70;
         this.l_stage_5.width = 90;
         this.l_stage_5.height = 24;
         this.l_stage_5.id = "l_stage_5";
         this.addChild(this.l_stage_5);
         this.img_icon_0 = new Image();
         this.img_icon_0.width = 63;
         this.img_icon_0.height = 55;
         this.img_icon_0.source = UrlManager.getUrl(0,"swf/mapinfo/challenge_icon/icon_9.png");
         this.img_icon_0.x = 27;
         this.img_icon_0.y = 32;
         this.img_icon_0.id = "img_icon_0";
         this.addChild(this.img_icon_0);
         this.img_icon_1 = new Image();
         this.img_icon_1.width = 63;
         this.img_icon_1.height = 55;
         this.img_icon_1.source = UrlManager.getUrl(0,"swf/mapinfo/challenge_icon/icon_9.png");
         this.img_icon_1.x = 107;
         this.img_icon_1.y = 32;
         this.img_icon_1.id = "img_icon_1";
         this.addChild(this.img_icon_1);
         this.img_icon_2 = new Image();
         this.img_icon_2.width = 63;
         this.img_icon_2.height = 55;
         this.img_icon_2.source = UrlManager.getUrl(0,"swf/mapinfo/challenge_icon/icon_9.png");
         this.img_icon_2.x = 185;
         this.img_icon_2.y = 32;
         this.img_icon_2.id = "img_icon_2";
         this.addChild(this.img_icon_2);
         this.img_icon_3 = new Image();
         this.img_icon_3.width = 63;
         this.img_icon_3.height = 55;
         this.img_icon_3.source = UrlManager.getUrl(0,"swf/mapinfo/challenge_icon/icon_9.png");
         this.img_icon_3.x = 266;
         this.img_icon_3.y = 32;
         this.img_icon_3.id = "img_icon_3";
         this.addChild(this.img_icon_3);
         this.img_icon_4 = new Image();
         this.img_icon_4.width = 63;
         this.img_icon_4.height = 55;
         this.img_icon_4.source = UrlManager.getUrl(0,"swf/mapinfo/challenge_icon/icon_9.png");
         this.img_icon_4.x = 350;
         this.img_icon_4.y = 12;
         this.img_icon_4.id = "img_icon_4";
         this.addChild(this.img_icon_4);
         this.img_icon_5 = new Image();
         this.img_icon_5.width = 63;
         this.img_icon_5.height = 55;
         this.img_icon_5.source = UrlManager.getUrl(0,"swf/mapinfo/challenge_icon/icon_9.png");
         this.img_icon_5.x = 430;
         this.img_icon_5.y = 12;
         this.img_icon_5.id = "img_icon_5";
         this.addChild(this.img_icon_5);
         this.img_icon_6 = new Image();
         this.img_icon_6.width = 63;
         this.img_icon_6.height = 55;
         this.img_icon_6.source = UrlManager.getUrl(0,"swf/mapinfo/challenge_icon/icon_9.png");
         this.img_icon_6.x = 510;
         this.img_icon_6.y = 12;
         this.img_icon_6.id = "img_icon_6";
         this.addChild(this.img_icon_6);
         this.l_stage_6 = new Label();
         this.l_stage_6.text = "50000";
         this.l_stage_6.styleName = ".TXT_HKHB_15_White";
         this.l_stage_6.x = 510;
         this.l_stage_6.y = 70;
         this.l_stage_6.width = 90;
         this.l_stage_6.height = 24;
         this.l_stage_6.id = "l_stage_6";
         this.addChild(this.l_stage_6);
         this.img_icon_7 = new Image();
         this.img_icon_7.width = 63;
         this.img_icon_7.height = 55;
         this.img_icon_7.source = UrlManager.getUrl(0,"swf/mapinfo/challenge_icon/icon_9.png");
         this.img_icon_7.x = 590;
         this.img_icon_7.y = 12;
         this.img_icon_7.id = "img_icon_7";
         this.addChild(this.img_icon_7);
         this.l_stage_7 = new Label();
         this.l_stage_7.text = "50000";
         this.l_stage_7.styleName = ".TXT_HKHB_15_White";
         this.l_stage_7.x = 590;
         this.l_stage_7.y = 70;
         this.l_stage_7.width = 90;
         this.l_stage_7.height = 24;
         this.l_stage_7.id = "l_stage_7";
         this.addChild(this.l_stage_7);
         this.img_icon_8 = new Image();
         this.img_icon_8.width = 63;
         this.img_icon_8.height = 55;
         this.img_icon_8.source = UrlManager.getUrl(0,"swf/mapinfo/challenge_icon/icon_9.png");
         this.img_icon_8.x = 670;
         this.img_icon_8.y = 12;
         this.img_icon_8.id = "img_icon_8";
         this.addChild(this.img_icon_8);
         this.l_stage_8 = new Label();
         this.l_stage_8.text = "50000";
         this.l_stage_8.styleName = ".TXT_HKHB_15_White";
         this.l_stage_8.x = 665;
         this.l_stage_8.y = 70;
         this.l_stage_8.width = 90;
         this.l_stage_8.height = 24;
         this.l_stage_8.id = "l_stage_8";
         this.addChild(this.l_stage_8);
         this.label_level_name = new Label();
         this.label_level_name.text = "";
         this.label_level_name.styleName = ".TXT_Panel_Title_LEFT";
         this.label_level_name.x = 27;
         this.label_level_name.y = 465;
         this.label_level_name.width = 278;
         this.label_level_name.height = 24;
         this.label_level_name.id = "label_level_name";
         this.addChild(this.label_level_name);
      }
      
      override public function Dispose() : void
      {
         this.imageBG = null;
         this.l_myRank = null;
         this.btnGetReward = null;
         this.l_stage_0 = null;
         this.l_stage_1 = null;
         this.l_stage_2 = null;
         this.l_stage_3 = null;
         this.l_stage_4 = null;
         this.l_stage_5 = null;
         this.img_icon_0 = null;
         this.img_icon_1 = null;
         this.img_icon_2 = null;
         this.img_icon_3 = null;
         this.img_icon_4 = null;
         this.img_icon_5 = null;
         this.img_icon_6 = null;
         this.l_stage_6 = null;
         this.img_icon_7 = null;
         this.l_stage_7 = null;
         this.img_icon_8 = null;
         this.l_stage_8 = null;
         this.label_level_name = null;
         super.Dispose();
      }
   }
}
