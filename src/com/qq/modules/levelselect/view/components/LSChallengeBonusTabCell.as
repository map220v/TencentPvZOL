package com.qq.modules.levelselect.view.components
{
   import com.qq.constant.ls.LSConstant;
   import com.qq.templates.font.FontHKHB;
   import flash.display.MovieClip;
   
   public class LSChallengeBonusTabCell extends LSChallengeBonusTabCellCE
   {
       
      
      private var m_tabType:uint;
      
      private var m_selected:Boolean;
      
      private var m_hasReward:Boolean;
      
      public function LSChallengeBonusTabCell(param1:Class = null, param2:Boolean = true)
      {
         super(param1,param2);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         buttonMode = true;
      }
      
      public function set tabType(param1:uint) : void
      {
         this.m_tabType = param1;
         switch(this.m_tabType)
         {
            case LSConstant.LS_CHALLENGE_WEEKLY_BONUS:
               this.l_tabName.text = FontHKHB.LS_CHALLENGE_WEEKLY_BONUS;
               this.toolTip = "塔防挑战关每周一12:00结算上周期排名并发放排名奖励";
               break;
            case LSConstant.LS_CHALLENGE_PROMOTION_BONUS:
               this.l_tabName.text = FontHKHB.LS_CHALLENGE_PROMOTION_BONUS;
               this.toolTip = "超越个人历史最高分数就有晋级奖励，欢迎不断挑战！";
         }
      }
      
      public function get tabType() : uint
      {
         return this.m_tabType;
      }
      
      public function set selected(param1:Boolean) : void
      {
         this.m_selected = param1;
         MovieClip(this.img_bk.mcHolder).gotoAndStop(!!this.m_selected ? 2 : 1);
      }
      
      public function get selected() : Boolean
      {
         return this.m_selected;
      }
      
      public function set hasReward(param1:Boolean) : void
      {
         this.m_hasReward = param1;
         this.img_excal.visible = this.m_hasReward;
      }
      
      public function get hasReward() : Boolean
      {
         return this.m_hasReward;
      }
   }
}
