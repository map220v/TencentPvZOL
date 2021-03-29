package com.qq.modules.levelselect.view.components
{
   import asgui.controls.Image;
   import asgui.controls.Label;
   import asgui.controls.List;
   import asgui.resources.AssetManager;
   import com.qq.display.QCanvas;
   
   public class LSChallengeWeeklyBonusWindowCE extends QCanvas
   {
       
      
      public var img_bk:Image;
      
      public var l_welfare_name:Label;
      
      public var l_welfare_intro:Label;
      
      public var l_welfare_content:Label;
      
      public var l_reward_info:Label;
      
      public var list_cell:List;
      
      public function LSChallengeWeeklyBonusWindowCE(param1:Class = null, param2:Boolean = true)
      {
         super(!!param2 ? (!!param1 ? param1 : LSChallengeWeeklyBonusWindowMediator) : null);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.width = 722;
         this.height = 443;
         this.img_bk = new Image();
         this.img_bk.x = 0;
         this.img_bk.width = 722;
         this.img_bk.height = 443;
         this.img_bk.source = AssetManager.GetClass("LS_Challenge_Bonus_White_Bk");
         this.img_bk.id = "img_bk";
         this.addChild(this.img_bk);
         this.l_welfare_name = new Label();
         this.l_welfare_name.text = "关卡";
         this.l_welfare_name.styleName = ".TXT_HKHB_21_Yellow_Shadow";
         this.l_welfare_name.x = 40;
         this.l_welfare_name.y = 15;
         this.l_welfare_name.width = 100;
         this.l_welfare_name.height = 30;
         this.l_welfare_name.id = "l_welfare_name";
         this.addChild(this.l_welfare_name);
         this.l_welfare_intro = new Label();
         this.l_welfare_intro.text = "我的排名";
         this.l_welfare_intro.styleName = ".TXT_HKHB_21_Yellow_Shadow";
         this.l_welfare_intro.x = 210;
         this.l_welfare_intro.y = 15;
         this.l_welfare_intro.width = 100;
         this.l_welfare_intro.height = 30;
         this.l_welfare_intro.id = "l_welfare_intro";
         this.addChild(this.l_welfare_intro);
         this.l_welfare_content = new Label();
         this.l_welfare_content.text = "奖励内容";
         this.l_welfare_content.styleName = ".TXT_HKHB_21_Yellow_Shadow";
         this.l_welfare_content.x = 377;
         this.l_welfare_content.y = 15;
         this.l_welfare_content.width = 100;
         this.l_welfare_content.height = 30;
         this.l_welfare_content.id = "l_welfare_content";
         this.addChild(this.l_welfare_content);
         this.l_reward_info = new Label();
         this.l_reward_info.text = "领取情况";
         this.l_reward_info.styleName = ".TXT_HKHB_21_Yellow_Shadow";
         this.l_reward_info.x = 540;
         this.l_reward_info.y = 15;
         this.l_reward_info.width = 100;
         this.l_reward_info.height = 30;
         this.l_reward_info.id = "l_reward_info";
         this.addChild(this.l_reward_info);
         this.list_cell = new List();
         this.list_cell.width = 700;
         this.list_cell.height = 373;
         this.list_cell.verticalScrollPolicy = "on";
         this.list_cell.horizontalScrollPolicy = "off";
         this.list_cell.x = 0;
         this.list_cell.y = 46;
         this.list_cell.id = "list_cell";
         this.list_cell.selectable = false;
         this.list_cell.styleName = ".HonorRank_List";
         this.addChild(this.list_cell);
      }
      
      override public function Dispose() : void
      {
         this.img_bk = null;
         this.l_welfare_name = null;
         this.l_welfare_intro = null;
         this.l_welfare_content = null;
         this.l_reward_info = null;
         this.list_cell = null;
         super.Dispose();
      }
   }
}
