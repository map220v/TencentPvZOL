package com.qq.modules.levelselect.view.components
{
   import com.qq.utils.UrlManager;
   
   public class LSChallengeRankLevelWd extends LSChallengeRankLevelWdCE
   {
       
      
      public var stageId:int;
      
      public var levelId:int;
      
      public var subLevelId:int;
      
      public var challengeLevelId:int;
      
      public var m_cellVec:Vector.<LSChallengeLevelItemCell>;
      
      public var myCell:LSChallengeLevelItemCell;
      
      public function LSChallengeRankLevelWd(param1:int, param2:int, param3:int, param4:int)
      {
         this.m_cellVec = new Vector.<LSChallengeLevelItemCell>();
         this.stageId = param1;
         this.levelId = param2;
         this.subLevelId = param3;
         this.challengeLevelId = param4;
         super(LSChallengeRankLevelWdMediator);
      }
      
      override public function InitializeComponent() : void
      {
         var _loc2_:LSChallengeLevelItemCell = null;
         super.InitializeComponent();
         var _loc1_:int = 0;
         while(_loc1_ < 9)
         {
            this["img_icon_" + _loc1_].source = UrlManager.getUrl(0,"swf/mapinfo/challenge_icon/icon_" + (9 - _loc1_) + ".png");
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < 10)
         {
            _loc2_ = new LSChallengeLevelItemCell();
            _loc2_.visible = false;
            addChild(_loc2_);
            this.m_cellVec.push(_loc2_);
            _loc2_.x = 15;
            _loc2_.y = 128 + _loc1_ * 32;
            _loc1_++;
         }
         this.myCell = new LSChallengeLevelItemCell();
         addChild(this.myCell);
         this.myCell.x = 15;
         this.myCell.bottom = 22;
      }
   }
}
