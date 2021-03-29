package com.qq.modules.levelselect.view.components
{
   import asgui.controls.Button;
   import asgui.controls.Image;
   import asgui.controls.Label;
   import asgui.resources.AssetManager;
   import com.qq.display.QWindow;
   
   public class LSLevelChallengeWdCE extends QWindow
   {
       
      
      public var imageBG1:Image;
      
      public var image_309:Image;
      
      public var image_330:Image;
      
      public var image_319:Image;
      
      public var image_329:Image;
      
      public var image_349:Image;
      
      public var btnGo:Button;
      
      public var label_332:Label;
      
      public var btnTop:Button;
      
      public var btnMe:Button;
      
      public var imgBtnLeft:Image;
      
      public var imgBtnRight:Image;
      
      public var imgBtnChallenge:Image;
      
      public var label_330:Label;
      
      public var label_335:Label;
      
      public var label_329:Label;
      
      public var image_357:Image;
      
      public var image_362:Image;
      
      public var image_364:Image;
      
      public var image_366:Image;
      
      public var image_367:Image;
      
      public var image_368:Image;
      
      public var image_369:Image;
      
      public var image_370:Image;
      
      public var image_371:Image;
      
      public var image_372:Image;
      
      public var image_373:Image;
      
      public var image_374:Image;
      
      public var image_375:Image;
      
      public var image_376:Image;
      
      public function LSLevelChallengeWdCE(param1:Class = null, param2:Boolean = true)
      {
         super(!!param2 ? (!!param1 ? param1 : LSLevelChallengeWdMediator) : null);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.title = "关卡 2 - 2";
         this.width = 632;
         this.height = 537;
         this.imageBG1 = new Image();
         this.imageBG1.width = 604;
         this.imageBG1.height = 387;
         this.imageBG1.source = AssetManager.GetClass("LS_Select_BG_2");
         this.imageBG1.x = 4;
         this.imageBG1.y = 0;
         this.imageBG1.id = "imageBG1";
         this.addChild(this.imageBG1);
         this.image_309 = new Image();
         this.image_309.width = 285;
         this.image_309.height = 97;
         this.image_309.source = AssetManager.GetClass("LS_Select_Desc_BG");
         this.image_309.x = 17;
         this.image_309.y = 37;
         this.image_309.id = "image_309";
         this.addChild(this.image_309);
         this.image_330 = new Image();
         this.image_330.width = 285;
         this.image_330.height = 97;
         this.image_330.source = AssetManager.GetClass("LS_Select_Desc_BG");
         this.image_330.x = 310;
         this.image_330.y = 37;
         this.image_330.id = "image_330";
         this.addChild(this.image_330);
         this.image_319 = new Image();
         this.image_319.width = 583;
         this.image_319.height = 91;
         this.image_319.source = AssetManager.GetClass("LS_Select_Ache_BG");
         this.image_319.x = 17;
         this.image_319.y = 140;
         this.image_319.id = "image_319";
         this.addChild(this.image_319);
         this.image_329 = new Image();
         this.image_329.width = 593;
         this.image_329.height = 28;
         this.image_329.source = AssetManager.GetClass("LS_Select_Grass");
         this.image_329.x = 12;
         this.image_329.y = 208;
         this.image_329.id = "image_329";
         this.addChild(this.image_329);
         this.image_349 = new Image();
         this.image_349.width = 590;
         this.image_349.height = 137;
         this.image_349.source = AssetManager.GetClass("LS_Select_Rank_BG");
         this.image_349.x = 17;
         this.image_349.y = 244;
         this.image_349.id = "image_349";
         this.addChild(this.image_349);
         this.btnGo = new Button();
         this.btnGo.label = "开始战斗";
         this.btnGo.styleName = ".GreenButton";
         this.btnGo.x = 236;
         this.btnGo.y = 415;
         this.btnGo.width = 140;
         this.btnGo.height = 55;
         this.btnGo.id = "btnGo";
         this.addChild(this.btnGo);
         this.label_332 = new Label();
         this.label_332.text = "本关排名";
         this.label_332.styleName = ".TXT_HKHB_21_Yellow_Shadow";
         this.label_332.x = 237;
         this.label_332.y = 250;
         this.label_332.width = 160;
         this.label_332.height = 24;
         this.label_332.id = "label_332";
         this.addChild(this.label_332);
         this.btnTop = new Button();
         this.btnTop.label = "第 一";
         this.btnTop.styleName = ".GreenButtonRect";
         this.btnTop.x = 22;
         this.btnTop.y = 238;
         this.btnTop.width = 60;
         this.btnTop.height = 30;
         this.btnTop.id = "btnTop";
         this.addChild(this.btnTop);
         this.btnMe = new Button();
         this.btnMe.label = "我";
         this.btnMe.styleName = ".GreenButtonRect";
         this.btnMe.x = 91;
         this.btnMe.y = 238;
         this.btnMe.width = 60;
         this.btnMe.height = 30;
         this.btnMe.id = "btnMe";
         this.addChild(this.btnMe);
         this.imgBtnLeft = new Image();
         this.imgBtnLeft.width = 34;
         this.imgBtnLeft.height = 32;
         this.imgBtnLeft.source = AssetManager.GetClass("LS_RANK_BTN_LEFT");
         this.imgBtnLeft.x = 18;
         this.imgBtnLeft.y = 312;
         this.imgBtnLeft.id = "imgBtnLeft";
         this.addChild(this.imgBtnLeft);
         this.imgBtnRight = new Image();
         this.imgBtnRight.width = 34;
         this.imgBtnRight.height = 32;
         this.imgBtnRight.source = AssetManager.GetClass("LS_RANK_BTN_RIGHT");
         this.imgBtnRight.x = 572;
         this.imgBtnRight.y = 312;
         this.imgBtnRight.id = "imgBtnRight";
         this.addChild(this.imgBtnRight);
         this.imgBtnChallenge = new Image();
         this.imgBtnChallenge.width = 124;
         this.imgBtnChallenge.height = 101;
         this.imgBtnChallenge.source = AssetManager.GetClass("LS_Select_Btn_Challenge");
         this.imgBtnChallenge.x = 434;
         this.imgBtnChallenge.y = 385;
         this.imgBtnChallenge.id = "imgBtnChallenge";
         this.addChild(this.imgBtnChallenge);
         this.label_330 = new Label();
         this.label_330.text = "挑战模式";
         this.label_330.styleName = ".TXT_HKHB_21_Yellow_Shadow";
         this.label_330.x = 434;
         this.label_330.y = 462;
         this.label_330.width = 120;
         this.label_330.height = 24;
         this.label_330.id = "label_330";
         this.addChild(this.label_330);
         this.label_335 = new Label();
         this.label_335.styleName = ".TXT_HKHB_21_Yellow_Shadow";
         this.label_335.x = 8;
         this.label_335.y = 46;
         this.label_335.width = 160;
         this.label_335.height = 24;
         this.label_335.id = "label_335";
         this.label_335.text = "首次通关奖励";
         this.addChild(this.label_335);
         this.label_329 = new Label();
         this.label_329.text = "金币奖励";
         this.label_329.styleName = ".TXT_HKHB_21_Yellow_Shadow";
         this.label_329.x = 300;
         this.label_329.y = 46;
         this.label_329.width = 120;
         this.label_329.height = 24;
         this.label_329.id = "label_329";
         this.addChild(this.label_329);
         this.image_357 = new Image();
         this.image_357.width = 100;
         this.image_357.height = 100;
         this.image_357.x = 448;
         this.image_357.y = 66;
         this.image_357.id = "image_357";
         this.addChild(this.image_357);
         this.image_362 = new Image();
         this.image_362.width = 100;
         this.image_362.height = 100;
         this.image_362.x = 225;
         this.image_362.y = 19;
         this.image_362.id = "image_362";
         this.addChild(this.image_362);
         this.image_364 = new Image();
         this.image_364.width = 100;
         this.image_364.height = 100;
         this.image_364.x = 311;
         this.image_364.y = 8;
         this.image_364.id = "image_364";
         this.addChild(this.image_364);
         this.image_366 = new Image();
         this.image_366.width = 100;
         this.image_366.height = 100;
         this.image_366.x = 400;
         this.image_366.y = 1;
         this.image_366.id = "image_366";
         this.addChild(this.image_366);
         this.image_367 = new Image();
         this.image_367.width = 100;
         this.image_367.height = 100;
         this.image_367.x = 400;
         this.image_367.y = 3;
         this.image_367.id = "image_367";
         this.addChild(this.image_367);
         this.image_368 = new Image();
         this.image_368.width = 100;
         this.image_368.height = 100;
         this.image_368.x = 404;
         this.image_368.y = 5;
         this.image_368.id = "image_368";
         this.addChild(this.image_368);
         this.image_369 = new Image();
         this.image_369.width = 100;
         this.image_369.height = 100;
         this.image_369.x = 400;
         this.image_369.y = 9;
         this.image_369.id = "image_369";
         this.addChild(this.image_369);
         this.image_370 = new Image();
         this.image_370.width = 100;
         this.image_370.height = 100;
         this.image_370.x = 409;
         this.image_370.y = 14;
         this.image_370.id = "image_370";
         this.addChild(this.image_370);
         this.image_371 = new Image();
         this.image_371.width = 100;
         this.image_371.height = 100;
         this.image_371.x = 401;
         this.image_371.y = 7;
         this.image_371.id = "image_371";
         this.addChild(this.image_371);
         this.image_372 = new Image();
         this.image_372.width = 100;
         this.image_372.height = 100;
         this.image_372.x = 403;
         this.image_372.y = 6;
         this.image_372.id = "image_372";
         this.addChild(this.image_372);
         this.image_373 = new Image();
         this.image_373.width = 100;
         this.image_373.height = 100;
         this.image_373.x = 417;
         this.image_373.y = 20;
         this.image_373.id = "image_373";
         this.addChild(this.image_373);
         this.image_374 = new Image();
         this.image_374.width = 100;
         this.image_374.height = 100;
         this.image_374.x = 414;
         this.image_374.y = 12;
         this.image_374.id = "image_374";
         this.addChild(this.image_374);
         this.image_375 = new Image();
         this.image_375.width = 100;
         this.image_375.height = 100;
         this.image_375.x = 445;
         this.image_375.y = 5;
         this.image_375.id = "image_375";
         this.addChild(this.image_375);
         this.image_376 = new Image();
         this.image_376.width = 100;
         this.image_376.height = 100;
         this.image_376.x = 431;
         this.image_376.y = 14;
         this.image_376.id = "image_376";
         this.addChild(this.image_376);
      }
      
      override public function Dispose() : void
      {
         this.imageBG1 = null;
         this.image_309 = null;
         this.image_330 = null;
         this.image_319 = null;
         this.image_329 = null;
         this.image_349 = null;
         this.btnGo = null;
         this.label_332 = null;
         this.btnTop = null;
         this.btnMe = null;
         this.imgBtnLeft = null;
         this.imgBtnRight = null;
         this.imgBtnChallenge = null;
         this.label_330 = null;
         this.label_335 = null;
         this.label_329 = null;
         this.image_357 = null;
         this.image_362 = null;
         this.image_364 = null;
         this.image_366 = null;
         this.image_367 = null;
         this.image_368 = null;
         this.image_369 = null;
         this.image_370 = null;
         this.image_371 = null;
         this.image_372 = null;
         this.image_373 = null;
         this.image_374 = null;
         this.image_375 = null;
         this.image_376 = null;
         super.Dispose();
      }
   }
}
