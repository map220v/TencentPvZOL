package com.qq.modules.levelselect.view.components
{
   import asgui.controls.Image;
   import asgui.controls.Label;
   import asgui.controls.List;
   import asgui.resources.AssetManager;
   import com.qq.display.QCanvas;
   
   public class LSChallengeRankScoreWdCE extends QCanvas
   {
       
      
      public var imageBG:Image;
      
      public var l_myRank:Label;
      
      public var l_col_rank:Label;
      
      public var l_col_roleName:Label;
      
      public var l_col_level:Label;
      
      public var l_col_achi:Label;
      
      public var l_col_date:Label;
      
      public var list_cell:List;
      
      public function LSChallengeRankScoreWdCE(param1:Class = null, param2:Boolean = true)
      {
         super(!!param2 ? (!!param1 ? param1 : LSChallengeRankScoreWdMediator) : null);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.width = 758;
         this.height = 549;
         this.imageBG = new Image();
         this.imageBG.width = 758;
         this.imageBG.height = 549;
         this.imageBG.source = AssetManager.GetClass("LS_Rank_Score_BG");
         this.imageBG.x = 0;
         this.imageBG.y = 0;
         this.imageBG.id = "imageBG";
         this.addChild(this.imageBG);
         this.l_myRank = new Label();
         this.l_myRank.x = 302;
         this.l_myRank.y = 444;
         this.l_myRank.width = 160;
         this.l_myRank.height = 24;
         this.l_myRank.id = "l_myRank";
         this.l_myRank.text = "我的排名";
         this.l_myRank.styleName = ".TXT_HKHB_21_Yellow_Shadow";
         this.addChild(this.l_myRank);
         this.l_col_rank = new Label();
         this.l_col_rank.x = 50;
         this.l_col_rank.y = 19;
         this.l_col_rank.width = 48;
         this.l_col_rank.height = 24;
         this.l_col_rank.id = "l_col_rank";
         this.l_col_rank.text = "排名";
         this.l_col_rank.styleName = ".TXT_HKHB_21_Yellow_Shadow";
         this.addChild(this.l_col_rank);
         this.l_col_roleName = new Label();
         this.l_col_roleName.x = 167;
         this.l_col_roleName.y = 19;
         this.l_col_roleName.width = 48;
         this.l_col_roleName.height = 24;
         this.l_col_roleName.id = "l_col_roleName";
         this.l_col_roleName.text = "镇长";
         this.l_col_roleName.styleName = ".TXT_HKHB_21_Yellow_Shadow";
         this.addChild(this.l_col_roleName);
         this.l_col_level = new Label();
         this.l_col_level.x = 300;
         this.l_col_level.y = 19;
         this.l_col_level.width = 48;
         this.l_col_level.height = 24;
         this.l_col_level.id = "l_col_level";
         this.l_col_level.text = "等级";
         this.l_col_level.styleName = ".TXT_HKHB_21_Yellow_Shadow";
         this.addChild(this.l_col_level);
         this.l_col_achi = new Label();
         this.l_col_achi.x = 410;
         this.l_col_achi.y = 19;
         this.l_col_achi.width = 120;
         this.l_col_achi.height = 24;
         this.l_col_achi.id = "l_col_achi";
         this.l_col_achi.text = "成就";
         this.l_col_achi.styleName = ".TXT_HKHB_21_Yellow_Shadow";
         this.addChild(this.l_col_achi);
         this.l_col_date = new Label();
         this.l_col_date.x = 577;
         this.l_col_date.y = 19;
         this.l_col_date.width = 120;
         this.l_col_date.height = 24;
         this.l_col_date.id = "l_col_date";
         this.l_col_date.text = "达成日期";
         this.l_col_date.styleName = ".TXT_HKHB_21_Yellow_Shadow";
         this.addChild(this.l_col_date);
         this.list_cell = new List();
         this.list_cell.width = 725;
         this.list_cell.height = 364;
         this.list_cell.verticalScrollPolicy = "off";
         this.list_cell.horizontalScrollPolicy = "off";
         this.list_cell.x = 10;
         this.list_cell.y = 46;
         this.list_cell.id = "list_cell";
         this.list_cell.selectable = false;
         this.list_cell.styleName = ".HonorRank_List";
         this.addChild(this.list_cell);
      }
      
      override public function Dispose() : void
      {
         this.imageBG = null;
         this.l_myRank = null;
         this.l_col_rank = null;
         this.l_col_roleName = null;
         this.l_col_level = null;
         this.l_col_achi = null;
         this.l_col_date = null;
         this.list_cell = null;
         super.Dispose();
      }
   }
}
