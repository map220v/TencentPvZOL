package com.qq.modules.levelselect.view.components
{
   import asgui.containers.HBox;
   import flash.display.SimpleButton;
   
   public class LSPromotionRewardWd extends LSPromotionRewardWdCE
   {
       
      
      public var boxRankReward:HBox;
      
      public var closeBtn:SimpleButton;
      
      public function LSPromotionRewardWd(param1:Class = null, param2:Boolean = true)
      {
         super(param1,param2);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.closeBtn = this.imageBG.mcHolder["close_btn"];
         this.l_topRank.SetStyle("fontSize","23");
         this.l_topRank.SetStyle("color","#ff8870");
         this.l_crossRank.SetStyle("fontSize","23");
         this.l_cross_num.SetStyle("color","#ffffff");
         this.l_curRank_num.SetStyle("color","#ffffff");
         this.l_preRank_num.SetStyle("color","#ffffff");
         this.l_cross_num.SetStyle("textShadowColor","#7d5531");
         this.l_curRank_num.SetStyle("textShadowColor","#7d5531");
         this.l_preRank_num.SetStyle("textShadowColor","#7d5531");
         this.text_336.SetStyle("color","#ffffff");
         this.boxRankReward = new HBox();
         this.boxRankReward.width = 300;
         this.boxRankReward.height = 60;
         this.boxRankReward.top = 75;
         this.boxRankReward.x = 80;
         this.boxRankReward.SetStyle("paddingTop","0");
         this.boxRankReward.SetStyle("horizontalGap","25");
         this.boxRankReward.SetStyle("horizontalAlign","center");
         this.boxRankReward.SetStyle("verticalAlign","center");
         addChild(this.boxRankReward);
      }
   }
}
