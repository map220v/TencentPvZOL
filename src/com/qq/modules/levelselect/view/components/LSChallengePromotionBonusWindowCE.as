package com.qq.modules.levelselect.view.components
{
   import asgui.controls.Image;
   import asgui.controls.Label;
   import asgui.controls.List;
   import asgui.resources.AssetManager;
   import com.qq.display.QCanvas;
   
   public class LSChallengePromotionBonusWindowCE extends QCanvas
   {
       
      
      public var img_bk:Image;
      
      public var l_welfare_name:Label;
      
      public var l_welfare_intro:Label;
      
      public var l_welfare_content:Label;
      
      public var l_date:Label;
      
      public var l_reward_info:Label;
      
      public var list_cell:List;
      
      public var tipBG:Image;
      
      public var label_rule1:Label;
      
      public var label_rule2:Label;
      
      public var label_rule3:Label;
      
      public function LSChallengePromotionBonusWindowCE(param1:Class = null, param2:Boolean = true)
      {
         super(!!param2 ? (!!param1 ? param1 : LSChallengePromotionBonusWindowMediator) : null);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.width = 722;
         this.height = 443;
         this.img_bk = new Image();
         this.img_bk.x = 0;
         this.img_bk.width = 717;
         this.img_bk.height = 313;
         this.img_bk.source = AssetManager.GetClass("LS_Score_Cell_Panel");
         this.img_bk.id = "img_bk";
         this.addChild(this.img_bk);
         this.l_welfare_name = new Label();
         this.l_welfare_name.text = "关卡";
         this.l_welfare_name.styleName = ".TXT_HKHB_21_Yellow_Shadow";
         this.l_welfare_name.x = 20;
         this.l_welfare_name.y = 15;
         this.l_welfare_name.width = 100;
         this.l_welfare_name.height = 30;
         this.l_welfare_name.id = "l_welfare_name";
         this.addChild(this.l_welfare_name);
         this.l_welfare_intro = new Label();
         this.l_welfare_intro.text = "分数提升";
         this.l_welfare_intro.styleName = ".TXT_HKHB_21_Yellow_Shadow";
         this.l_welfare_intro.x = 150;
         this.l_welfare_intro.y = 15;
         this.l_welfare_intro.width = 100;
         this.l_welfare_intro.height = 30;
         this.l_welfare_intro.id = "l_welfare_intro";
         this.addChild(this.l_welfare_intro);
         this.l_welfare_content = new Label();
         this.l_welfare_content.text = "奖励";
         this.l_welfare_content.styleName = ".TXT_HKHB_21_Yellow_Shadow";
         this.l_welfare_content.x = 263;
         this.l_welfare_content.y = 15;
         this.l_welfare_content.width = 100;
         this.l_welfare_content.height = 30;
         this.l_welfare_content.id = "l_welfare_content";
         this.addChild(this.l_welfare_content);
         this.l_date = new Label();
         this.l_date.text = "达成日期";
         this.l_date.styleName = ".TXT_HKHB_21_Yellow_Shadow";
         this.l_date.x = 390;
         this.l_date.y = 15;
         this.l_date.width = 100;
         this.l_date.height = 30;
         this.l_date.id = "l_date";
         this.addChild(this.l_date);
         this.l_reward_info = new Label();
         this.l_reward_info.text = "领取情况";
         this.l_reward_info.styleName = ".TXT_HKHB_21_Yellow_Shadow";
         this.l_reward_info.x = 550;
         this.l_reward_info.y = 15;
         this.l_reward_info.width = 100;
         this.l_reward_info.height = 30;
         this.l_reward_info.id = "l_reward_info";
         this.addChild(this.l_reward_info);
         this.list_cell = new List();
         this.list_cell.width = 700;
         this.list_cell.height = 260;
         this.list_cell.verticalScrollPolicy = "on";
         this.list_cell.horizontalScrollPolicy = "off";
         this.list_cell.x = 0;
         this.list_cell.y = 46;
         this.list_cell.id = "list_cell";
         this.list_cell.selectable = false;
         this.list_cell.styleName = ".HonorRank_List";
         this.addChild(this.list_cell);
         this.tipBG = new Image();
         this.tipBG.width = 717;
         this.tipBG.height = 125;
         this.tipBG.source = AssetManager.GetClass("LS_Score_Tip_Panel");
         this.tipBG.x = 0;
         this.tipBG.y = 314;
         this.tipBG.id = "tipBG";
         this.addChild(this.tipBG);
         this.label_rule1 = new Label();
         this.label_rule1.text = "1. 超过个人历史最高分数时就有晋级奖励，奖励内容为金币";
         this.label_rule1.styleName = ".TXT_Panel_Title_Normal";
         this.label_rule1.x = 26;
         this.label_rule1.y = 339;
         this.label_rule1.width = 487;
         this.label_rule1.height = 24;
         this.label_rule1.id = "label_rule1";
         this.addChild(this.label_rule1);
         this.label_rule2 = new Label();
         this.label_rule2.text = "2. 金币数量＝(当前分数－历史最高分数)×分数区间奖励，分数越高越值钱";
         this.label_rule2.styleName = ".TXT_Panel_Title_Normal";
         this.label_rule2.x = 27;
         this.label_rule2.y = 365;
         this.label_rule2.width = 616;
         this.label_rule2.height = 24;
         this.label_rule2.id = "label_rule2";
         this.addChild(this.label_rule2);
         this.label_rule3 = new Label();
         this.label_rule3.text = "3. 个人晋级奖励可即时领取";
         this.label_rule3.styleName = ".TXT_Panel_Title_Normal";
         this.label_rule3.x = 27;
         this.label_rule3.y = 392;
         this.label_rule3.width = 477;
         this.label_rule3.height = 24;
         this.label_rule3.id = "label_rule3";
         this.addChild(this.label_rule3);
      }
      
      override public function Dispose() : void
      {
         this.img_bk = null;
         this.l_welfare_name = null;
         this.l_welfare_intro = null;
         this.l_welfare_content = null;
         this.l_date = null;
         this.l_reward_info = null;
         this.list_cell = null;
         this.tipBG = null;
         this.label_rule1 = null;
         this.label_rule2 = null;
         this.label_rule3 = null;
         super.Dispose();
      }
   }
}
