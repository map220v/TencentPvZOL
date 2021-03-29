package com.qq.modules.levelselect.view.components
{
   import asgui.controls.Button;
   import asgui.controls.Image;
   import asgui.controls.Label;
   import asgui.resources.AssetManager;
   import com.qq.display.QCanvas;
   
   public class LSLevelChallengeEnterWdCE extends QCanvas
   {
       
      
      public var imageBG:Image;
      
      public var label_332:Label;
      
      public var btnTop:Button;
      
      public var btnMe:Button;
      
      public var imgBtnLevelReward:Image;
      
      public var imgBtnNormalMode:Image;
      
      public var imgBtnLeft:Image;
      
      public var imgBtnRight:Image;
      
      public var l_levelReward_up:Label;
      
      public var l_levelReward_down:Label;
      
      public var label_335:Label;
      
      public var btnStart:Button;
      
      public var l_free_word:Label;
      
      public var l_vip_word:Label;
      
      public var l_free_times:Label;
      
      public var l_vip_times:Label;
      
      public var label_336:Label;
      
      public var btnExtend:Button;
      
      public function LSLevelChallengeEnterWdCE(param1:Class = null, param2:Boolean = true)
      {
         super(!!param2 ? (!!param1 ? param1 : LSLevelChallengeEnterWdMediator) : null);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.width = 631;
         this.height = 571;
         this.imageBG = new Image();
         this.imageBG.width = 631;
         this.imageBG.height = 571;
         this.imageBG.source = AssetManager.GetClass("LS_Challenge_BG");
         this.imageBG.x = 0;
         this.imageBG.y = 0;
         this.imageBG.id = "imageBG";
         this.addChild(this.imageBG);
         this.label_332 = new Label();
         this.label_332.text = "本关排名";
         this.label_332.styleName = ".TXT_HKHB_21_Yellow_Shadow";
         this.label_332.x = 237;
         this.label_332.y = 320;
         this.label_332.width = 160;
         this.label_332.height = 24;
         this.label_332.id = "label_332";
         this.addChild(this.label_332);
         this.btnTop = new Button();
         this.btnTop.label = "第 一";
         this.btnTop.styleName = ".GreenButtonRect";
         this.btnTop.x = 22;
         this.btnTop.y = 310;
         this.btnTop.width = 60;
         this.btnTop.height = 30;
         this.btnTop.id = "btnTop";
         this.addChild(this.btnTop);
         this.btnMe = new Button();
         this.btnMe.label = "我";
         this.btnMe.styleName = ".GreenButtonRect";
         this.btnMe.x = 91;
         this.btnMe.y = 310;
         this.btnMe.width = 60;
         this.btnMe.height = 30;
         this.btnMe.id = "btnMe";
         this.addChild(this.btnMe);
         this.imgBtnLevelReward = new Image();
         this.imgBtnLevelReward.width = 76;
         this.imgBtnLevelReward.height = 76;
         this.imgBtnLevelReward.source = AssetManager.GetClass("LS_Challenge_LevelReward_Btn");
         this.imgBtnLevelReward.x = 40;
         this.imgBtnLevelReward.y = 475;
         this.imgBtnLevelReward.id = "imgBtnLevelReward";
         this.addChild(this.imgBtnLevelReward);
         this.imgBtnNormalMode = new Image();
         this.imgBtnNormalMode.width = 104;
         this.imgBtnNormalMode.height = 82;
         this.imgBtnNormalMode.source = AssetManager.GetClass("LS_Challenge_NormalMode_Btn");
         this.imgBtnNormalMode.x = 490;
         this.imgBtnNormalMode.y = 472;
         this.imgBtnNormalMode.id = "imgBtnNormalMode";
         this.addChild(this.imgBtnNormalMode);
         this.imgBtnLeft = new Image();
         this.imgBtnLeft.width = 34;
         this.imgBtnLeft.height = 32;
         this.imgBtnLeft.source = AssetManager.GetClass("LS_RANK_BTN_LEFT");
         this.imgBtnLeft.x = 18;
         this.imgBtnLeft.y = 382;
         this.imgBtnLeft.id = "imgBtnLeft";
         this.addChild(this.imgBtnLeft);
         this.imgBtnRight = new Image();
         this.imgBtnRight.width = 34;
         this.imgBtnRight.height = 32;
         this.imgBtnRight.source = AssetManager.GetClass("LS_RANK_BTN_RIGHT");
         this.imgBtnRight.x = 578;
         this.imgBtnRight.y = 382;
         this.imgBtnRight.id = "imgBtnRight";
         this.addChild(this.imgBtnRight);
         this.l_levelReward_up = new Label();
         this.l_levelReward_up.text = "晋级";
         this.l_levelReward_up.styleName = ".TXT_HKHB_21_Yellow_Shadow";
         this.l_levelReward_up.x = 55;
         this.l_levelReward_up.y = 490;
         this.l_levelReward_up.width = 48;
         this.l_levelReward_up.height = 24;
         this.l_levelReward_up.id = "l_levelReward_up";
         this.addChild(this.l_levelReward_up);
         this.l_levelReward_down = new Label();
         this.l_levelReward_down.text = "奖励";
         this.l_levelReward_down.styleName = ".TXT_HKHB_21_Yellow_Shadow";
         this.l_levelReward_down.x = 55;
         this.l_levelReward_down.y = 512;
         this.l_levelReward_down.width = 48;
         this.l_levelReward_down.height = 24;
         this.l_levelReward_down.id = "l_levelReward_down";
         this.addChild(this.l_levelReward_down);
         this.label_335 = new Label();
         this.label_335.text = "普通模式";
         this.label_335.styleName = ".TXT_HKHB_21_Yellow_Shadow";
         this.label_335.x = 500;
         this.label_335.y = 531;
         this.label_335.width = 90;
         this.label_335.height = 24;
         this.label_335.id = "label_335";
         this.addChild(this.label_335);
         this.btnStart = new Button();
         this.btnStart.label = "开始战斗";
         this.btnStart.styleName = ".RedButton";
         this.btnStart.x = 250;
         this.btnStart.y = 515;
         this.btnStart.width = 80;
         this.btnStart.height = 32;
         this.btnStart.id = "btnStart";
         this.addChild(this.btnStart);
         this.l_free_word = new Label();
         this.l_free_word.text = "免费挑战次数：";
         this.l_free_word.styleName = ".TXT_HKHB_16_Yellow_Shadow";
         this.l_free_word.x = 260;
         this.l_free_word.y = 463;
         this.l_free_word.width = 150;
         this.l_free_word.height = 24;
         this.l_free_word.id = "l_free_word";
         this.addChild(this.l_free_word);
         this.l_vip_word = new Label();
         this.l_vip_word.text = "付费挑战次数：";
         this.l_vip_word.styleName = ".TXT_HKHB_16_Yellow_Shadow";
         this.l_vip_word.x = 260;
         this.l_vip_word.y = 485;
         this.l_vip_word.width = 150;
         this.l_vip_word.height = 24;
         this.l_vip_word.id = "l_vip_word";
         this.addChild(this.l_vip_word);
         this.l_free_times = new Label();
         this.l_free_times.text = "0";
         this.l_free_times.styleName = ".TXT_HKHB_16_Yellow_Shadow";
         this.l_free_times.x = 365;
         this.l_free_times.y = 463;
         this.l_free_times.width = 70;
         this.l_free_times.height = 24;
         this.l_free_times.id = "l_free_times";
         this.addChild(this.l_free_times);
         this.l_vip_times = new Label();
         this.l_vip_times.text = "0";
         this.l_vip_times.styleName = ".TXT_HKHB_16_Yellow_Shadow";
         this.l_vip_times.x = 365;
         this.l_vip_times.y = 485;
         this.l_vip_times.width = 70;
         this.l_vip_times.height = 24;
         this.l_vip_times.id = "l_vip_times";
         this.addChild(this.l_vip_times);
         this.label_336 = new Label();
         this.label_336.text = "挑战关卡排名奖励";
         this.label_336.styleName = ".TXT_HKHB_16_Yellow_Shadow";
         this.label_336.x = 245;
         this.label_336.y = 112;
         this.label_336.width = 148;
         this.label_336.height = 24;
         this.label_336.id = "label_336";
         this.addChild(this.label_336);
         this.btnExtend = new Button();
         this.btnExtend.label = "继承积分";
         this.btnExtend.styleName = ".RedButton";
         this.btnExtend.x = 360;
         this.btnExtend.y = 515;
         this.btnExtend.width = 80;
         this.btnExtend.height = 32;
         this.btnExtend.id = "btnExtend";
         this.addChild(this.btnExtend);
      }
      
      override public function Dispose() : void
      {
         this.imageBG = null;
         this.label_332 = null;
         this.btnTop = null;
         this.btnMe = null;
         this.imgBtnLevelReward = null;
         this.imgBtnNormalMode = null;
         this.imgBtnLeft = null;
         this.imgBtnRight = null;
         this.l_levelReward_up = null;
         this.l_levelReward_down = null;
         this.label_335 = null;
         this.btnStart = null;
         this.l_free_word = null;
         this.l_vip_word = null;
         this.l_free_times = null;
         this.l_vip_times = null;
         this.label_336 = null;
         this.btnExtend = null;
         super.Dispose();
      }
   }
}
