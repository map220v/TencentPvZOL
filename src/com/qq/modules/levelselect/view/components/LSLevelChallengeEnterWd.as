package com.qq.modules.levelselect.view.components
{
   import asgui.containers.HBox;
   import com.qq.templates.font.FontHKHB;
   import flash.display.SimpleButton;
   
   public class LSLevelChallengeEnterWd extends LSLevelChallengeEnterWdCE
   {
       
      
      public var stageId:int;
      
      public var levelId:int;
      
      public var subLevelId:int;
      
      public var challengeId:int;
      
      public var boxAch:HBox;
      
      public var boxRankReward:HBox;
      
      public var closeBtn:SimpleButton;
      
      public var giftBtn:SimpleButton;
      
      public function LSLevelChallengeEnterWd(param1:int, param2:int, param3:int = 1, param4:int = 1)
      {
         this.challengeId = param4;
         this.subLevelId = param3;
         this.levelId = param2;
         this.stageId = param1;
         super(LSLevelChallengeEnterWdMediator);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.closeBtn = this.imageBG.mcHolder["close_btn"];
         this.giftBtn = this.imageBG.mcHolder["btnGift"];
         this.l_free_word.SetStyle("color","#65fff7");
         this.l_vip_word.SetStyle("color","#f2807f");
         this.l_vip_word.text = FontHKHB.TD_PAY_CHALLENGE_TIME;
         this.label_332.SetStyle("color","#a9ff8d");
         this.l_levelReward_up.mouseEnabled = this.l_levelReward_down.mouseEnabled = false;
         this.imgBtnLevelReward.buttonMode = this.imgBtnNormalMode.buttonMode = true;
         this.boxAch = new HBox();
         this.boxAch.width = 360;
         this.boxAch.height = 90;
         this.boxAch.hcenter = -5;
         this.boxAch.bottom = 262.5;
         this.boxAch.SetStyle("paddingTop","0");
         this.boxAch.SetStyle("horizontalGap","59");
         this.boxAch.SetStyle("horizontalAlign","center");
         this.boxAch.SetStyle("verticalAlign","center");
         addChild(this.boxAch);
         this.boxRankReward = new HBox();
         this.boxRankReward.width = 300;
         this.boxRankReward.height = 60;
         this.boxRankReward.top = 140;
         this.boxRankReward.x = 280;
         this.boxRankReward.SetStyle("paddingTop","0");
         this.boxRankReward.SetStyle("horizontalGap","25");
         this.boxRankReward.SetStyle("horizontalAlign","center");
         this.boxRankReward.SetStyle("verticalAlign","center");
         addChild(this.boxRankReward);
         this.l_free_word.visible = true;
         this.l_free_times.visible = true;
         this.l_vip_word.visible = true;
         this.l_vip_times.visible = true;
         this.btnExtend.coolDownTime = 500;
         this.btnStart.coolDownTime = 500;
      }
   }
}
