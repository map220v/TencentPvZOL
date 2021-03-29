package com.qq.modules.levelselect.view.components
{
   public class LSChallengeRankScoreWd extends LSChallengeRankScoreWdCE
   {
       
      
      public var m_cellVec:Vector.<LSChallengeRankItemCell>;
      
      public var myCell:LSChallengeRankItemCell;
      
      public function LSChallengeRankScoreWd(param1:Class = null, param2:Boolean = true)
      {
         this.m_cellVec = new Vector.<LSChallengeRankItemCell>();
         super(param1,param2);
      }
      
      override public function InitializeComponent() : void
      {
         var _loc2_:LSChallengeRankItemCell = null;
         super.InitializeComponent();
         var _loc1_:int = 0;
         while(_loc1_ < 10)
         {
            _loc2_ = new LSChallengeRankItemCell();
            _loc2_.visible = false;
            addChild(_loc2_);
            this.m_cellVec.push(_loc2_);
            _loc2_.x = 10;
            _loc2_.y = 61 + _loc1_ * 35;
            _loc1_++;
         }
         this.myCell = new LSChallengeRankItemCell();
         addChild(this.myCell);
         this.myCell.x = 10;
         this.myCell.bottom = 32;
      }
   }
}
