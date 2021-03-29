package com.qq.modules.levelselect.view.components
{
   import asgui.controls.Image;
   import asgui.controls.Label;
   import asgui.resources.AssetManager;
   import com.qq.display.QCanvas;
   
   public class LSChallengeRankItemCellCE extends QCanvas
   {
       
      
      public var imageBG:Image;
      
      public var l_rank:Label;
      
      public var l_name:Label;
      
      public var l_level:Label;
      
      public var l_score:Label;
      
      public var l_date:Label;
      
      public function LSChallengeRankItemCellCE(param1:Class = null, param2:Boolean = true)
      {
         super(!!param2 ? (!!param1 ? param1 : LSChallengeRankItemCellMediator) : null);
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
         this.l_rank.x = 44;
         this.l_rank.y = 7;
         this.l_rank.width = 48;
         this.l_rank.height = 24;
         this.l_rank.id = "l_rank";
         this.addChild(this.l_rank);
         this.l_name = new Label();
         this.l_name.text = "名字只能七个字";
         this.l_name.x = 140;
         this.l_name.y = 7;
         this.l_name.width = 120;
         this.l_name.height = 24;
         this.l_name.id = "l_name";
         this.addChild(this.l_name);
         this.l_level = new Label();
         this.l_level.text = "100";
         this.l_level.x = 304;
         this.l_level.y = 6;
         this.l_level.width = 48;
         this.l_level.height = 24;
         this.l_level.id = "l_level";
         this.addChild(this.l_level);
         this.l_score = new Label();
         this.l_score.text = "470";
         this.l_score.x = 451;
         this.l_score.y = 6;
         this.l_score.width = 48;
         this.l_score.height = 24;
         this.l_score.id = "l_score";
         this.addChild(this.l_score);
         this.l_date = new Label();
         this.l_date.text = "2015/7/2 14:20:29";
         this.l_date.x = 560;
         this.l_date.y = 6;
         this.l_date.width = 175;
         this.l_date.height = 24;
         this.l_date.id = "l_date";
         this.addChild(this.l_date);
      }
      
      override public function Dispose() : void
      {
         this.imageBG = null;
         this.l_rank = null;
         this.l_name = null;
         this.l_level = null;
         this.l_score = null;
         this.l_date = null;
         super.Dispose();
      }
   }
}
