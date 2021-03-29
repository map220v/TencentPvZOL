package com.qq.modules.levelselect.view.components
{
   import asgui.utils.StringUtil;
   import com.qq.managers.FilterManager;
   import com.qq.templates.font.FontHKHB;
   
   public class LSLevelChallengeEnterBonusCell extends LSLevelChallengeEnterBonusCellCE
   {
       
      
      private var _selected:Boolean;
      
      public function LSLevelChallengeEnterBonusCell(param1:Class = null, param2:Boolean = true)
      {
         super(param1,param2);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         buttonMode = true;
      }
      
      public function setBonusRank(param1:int) : void
      {
         this.l_name.text = StringUtil.substitute(FontHKHB.TD_RANK_BONUS_NAME,param1);
      }
      
      public function set selected(param1:Boolean) : void
      {
         this._selected = param1;
         if(this._selected)
         {
            this.imgArrow.filters = [];
         }
         else
         {
            this.imgArrow.filters = [FilterManager.getGaryFilter()];
         }
      }
      
      public function get selected() : Boolean
      {
         return this._selected;
      }
   }
}
