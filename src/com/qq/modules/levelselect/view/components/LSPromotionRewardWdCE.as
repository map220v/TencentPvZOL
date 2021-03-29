package com.qq.modules.levelselect.view.components
{
   import asgui.controls.Image;
   import asgui.controls.Label;
   import asgui.controls.Text;
   import asgui.resources.AssetManager;
   import com.qq.display.QCanvas;
   
   public class LSPromotionRewardWdCE extends QCanvas
   {
       
      
      public var imageBG:Image;
      
      public var l_topRank:Label;
      
      public var l_crossRank:Label;
      
      public var text_336:Text;
      
      public var l_preRank_num:Label;
      
      public var l_curRank_num:Label;
      
      public var l_cross_num:Label;
      
      public function LSPromotionRewardWdCE(param1:Class = null, param2:Boolean = true)
      {
         super(!!param2 ? (!!param1 ? param1 : LSPromotionRewardWdMediator) : null);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.width = 439;
         this.height = 361;
         this.imageBG = new Image();
         this.imageBG.width = 439;
         this.imageBG.height = 361;
         this.imageBG.source = AssetManager.GetClass("LS_Promotion_Reward_BG");
         this.imageBG.x = 0;
         this.imageBG.y = 0;
         this.imageBG.id = "imageBG";
         this.addChild(this.imageBG);
         this.l_topRank = new Label();
         this.l_topRank.text = "最高排名：";
         this.l_topRank.styleName = ".TXT_HKHB_21_Yellow_Shadow";
         this.l_topRank.x = 76;
         this.l_topRank.y = 154;
         this.l_topRank.width = 120;
         this.l_topRank.height = 24;
         this.l_topRank.id = "l_topRank";
         this.addChild(this.l_topRank);
         this.l_crossRank = new Label();
         this.l_crossRank.text = "跨越名次：";
         this.l_crossRank.styleName = ".TXT_HKHB_21_Yellow_Shadow";
         this.l_crossRank.x = 76;
         this.l_crossRank.y = 190;
         this.l_crossRank.width = 120;
         this.l_crossRank.height = 24;
         this.l_crossRank.id = "l_crossRank";
         this.addChild(this.l_crossRank);
         this.text_336 = new Text();
         this.text_336.text = "恭喜你在挑战关取得进步，你的奖励已发送到背包，记得去查看";
         this.text_336.styleName = ".TXT_HKHB_21_Yellow_Shadow";
         this.text_336.x = 39;
         this.text_336.y = 261;
         this.text_336.width = 350;
         this.text_336.height = 60;
         this.text_336.id = "text_336";
         this.addChild(this.text_336);
         this.l_preRank_num = new Label();
         this.l_preRank_num.text = "2000";
         this.l_preRank_num.styleName = ".TXT_HKHB_21_Yellow_Shadow";
         this.l_preRank_num.x = 200;
         this.l_preRank_num.y = 156;
         this.l_preRank_num.width = 48;
         this.l_preRank_num.height = 24;
         this.l_preRank_num.id = "l_preRank_num";
         this.addChild(this.l_preRank_num);
         this.l_curRank_num = new Label();
         this.l_curRank_num.text = "1500";
         this.l_curRank_num.styleName = ".TXT_HKHB_21_Yellow_Shadow";
         this.l_curRank_num.x = 292;
         this.l_curRank_num.y = 157;
         this.l_curRank_num.width = 48;
         this.l_curRank_num.height = 24;
         this.l_curRank_num.id = "l_curRank_num";
         this.addChild(this.l_curRank_num);
         this.l_cross_num = new Label();
         this.l_cross_num.text = "800";
         this.l_cross_num.styleName = ".TXT_HKHB_21_Yellow_Shadow";
         this.l_cross_num.x = 201;
         this.l_cross_num.y = 191;
         this.l_cross_num.width = 48;
         this.l_cross_num.height = 24;
         this.l_cross_num.id = "l_cross_num";
         this.addChild(this.l_cross_num);
      }
      
      override public function Dispose() : void
      {
         this.imageBG = null;
         this.l_topRank = null;
         this.l_crossRank = null;
         this.text_336 = null;
         this.l_preRank_num = null;
         this.l_curRank_num = null;
         this.l_cross_num = null;
         super.Dispose();
      }
   }
}
