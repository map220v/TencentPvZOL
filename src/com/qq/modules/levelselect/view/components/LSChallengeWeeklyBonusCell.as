package com.qq.modules.levelselect.view.components
{
   import com.qq.modules.quest.view.component.QuestItemCell;
   import flash.display.MovieClip;
   
   public class LSChallengeWeeklyBonusCell extends LSChallengeWeeklyBonusCellCE
   {
       
      
      public var mcTag:MovieClip;
      
      public var vecItemIcon:Vector.<QuestItemCell>;
      
      public function LSChallengeWeeklyBonusCell(param1:Class = null, param2:Boolean = true)
      {
         this.vecItemIcon = new Vector.<QuestItemCell>();
         super(param1,param2);
      }
      
      override public function InitializeComponent() : void
      {
         var _loc2_:QuestItemCell = null;
         super.InitializeComponent();
         this.mcTag = this.img_bk.mcHolder["mcTag"];
         this.mcTag.visible = false;
         this.l_name.SetStyle("fontSize","17");
         this.l_rank.SetStyle("fontSize","17");
         var _loc1_:int = 0;
         while(_loc1_ < 3)
         {
            _loc2_ = new QuestItemCell();
            this.vecItemIcon.push(_loc2_);
            addChild(_loc2_);
            _loc2_.x = this["img_item_" + (_loc1_ + 1)].x - 4;
            _loc2_.y = this["img_item_" + (_loc1_ + 1)].y - 3;
            _loc1_++;
         }
         this.btn_get.coolDownTime = 1500;
      }
      
      override public function set data(param1:Object) : void
      {
         reset(param1);
      }
   }
}
