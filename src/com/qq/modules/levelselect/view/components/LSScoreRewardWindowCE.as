package com.qq.modules.levelselect.view.components
{
   import asgui.controls.Button;
   import asgui.controls.Image;
   import asgui.controls.Label;
   import asgui.controls.Text;
   import asgui.resources.AssetManager;
   import com.qq.display.QCanvas;
   
   public class LSScoreRewardWindowCE extends QCanvas
   {
       
      
      public var panelBG:Image;
      
      public var btnClose:Button;
      
      public var labelScore:Label;
      
      public var txtOldScore:Label;
      
      public var txtNewScore:Label;
      
      public var image_438:Image;
      
      public var btnGO:Image;
      
      public var txtGO:Text;
      
      public function LSScoreRewardWindowCE(param1:Class = null, param2:Boolean = true)
      {
         super(!!param2 ? (!!param1 ? param1 : LSScoreRewardWindowMediator) : null);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.width = 439;
         this.height = 361;
         this.panelBG = new Image();
         this.panelBG.width = 439;
         this.panelBG.height = 361;
         this.panelBG.source = AssetManager.GetClass("LS_Score_Reward_BG");
         this.panelBG.x = 0;
         this.panelBG.y = 0;
         this.panelBG.id = "panelBG";
         this.addChild(this.panelBG);
         this.btnClose = new Button();
         this.btnClose.styleName = ".closeButton";
         this.btnClose.x = 400;
         this.btnClose.y = 10;
         this.btnClose.width = 29;
         this.btnClose.height = 28;
         this.btnClose.id = "btnClose";
         this.addChild(this.btnClose);
         this.labelScore = new Label();
         this.labelScore.text = "跨越分数：";
         this.labelScore.styleName = ".TXT_HKHB_24_Yellow_Shadow";
         this.labelScore.x = 85;
         this.labelScore.y = 152;
         this.labelScore.width = 120;
         this.labelScore.height = 30;
         this.labelScore.id = "labelScore";
         this.addChild(this.labelScore);
         this.txtOldScore = new Label();
         this.txtOldScore.styleName = ".TXT_HKHB_16_White_Brown";
         this.txtOldScore.x = 200;
         this.txtOldScore.y = 156;
         this.txtOldScore.width = 70;
         this.txtOldScore.height = 24;
         this.txtOldScore.id = "txtOldScore";
         this.addChild(this.txtOldScore);
         this.txtNewScore = new Label();
         this.txtNewScore.styleName = ".TXT_HKHB_16_White_Brown";
         this.txtNewScore.x = 316;
         this.txtNewScore.y = 156;
         this.txtNewScore.width = 70;
         this.txtNewScore.height = 24;
         this.txtNewScore.id = "txtNewScore";
         this.addChild(this.txtNewScore);
         this.image_438 = new Image();
         this.image_438.width = 36;
         this.image_438.height = 19;
         this.image_438.source = AssetManager.GetClass("LS_Arrow_To_Right");
         this.image_438.x = 275;
         this.image_438.y = 158;
         this.image_438.id = "image_438";
         this.addChild(this.image_438);
         this.btnGO = new Image();
         this.btnGO.width = 76;
         this.btnGO.height = 76;
         this.btnGO.source = AssetManager.GetClass("LS_Challenge_LevelReward_Btn");
         this.btnGO.x = 345;
         this.btnGO.y = 268;
         this.btnGO.id = "btnGO";
         this.addChild(this.btnGO);
         this.txtGO = new Text();
         this.txtGO.text = "晋级奖励";
         this.txtGO.styleName = ".TXT_HKHB_21_Yellow_Shadow";
         this.txtGO.x = 358;
         this.txtGO.y = 281;
         this.txtGO.width = 50;
         this.txtGO.height = 50;
         this.txtGO.id = "txtGO";
         this.addChild(this.txtGO);
      }
      
      override public function Dispose() : void
      {
         this.panelBG = null;
         this.btnClose = null;
         this.labelScore = null;
         this.txtOldScore = null;
         this.txtNewScore = null;
         this.image_438 = null;
         this.btnGO = null;
         this.txtGO = null;
         super.Dispose();
      }
   }
}
