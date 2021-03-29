package com.qq.modules.levelselect.view.components
{
   import flash.display.SimpleButton;
   
   public class LSChallengeBonusWindow extends LSChallengeBonusWindowCE
   {
       
      
      public var closeBtn:SimpleButton;
      
      public var btnGetHistory:SimpleButton;
      
      public var vecTabCellList:Vector.<LSChallengeBonusTabCell>;
      
      public function LSChallengeBonusWindow(param1:Class = null, param2:Boolean = true)
      {
         this.vecTabCellList = new Vector.<LSChallengeBonusTabCell>();
         super(param1,param2);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.closeBtn = img_bk.mcHolder["close_btn"];
         this.btnGetHistory = img_bk.mcHolder["btnGetHistory"];
      }
      
      public function initTabList(param1:Array) : void
      {
         var _loc3_:LSChallengeBonusTabCell = null;
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = new LSChallengeBonusTabCell();
            _loc3_.tabType = param1[_loc2_];
            this.vecTabCellList.push(_loc3_);
            _loc3_.x = -8;
            _loc3_.y = 102 + _loc2_ * (_loc3_.height - 2);
            addChild(_loc3_);
            _loc2_++;
         }
      }
   }
}
