package com.qq.modules.luckystar.model.templates
{
   import com.qq.modules.bag.model.vo.ItemVO;
   import com.qq.modules.luckystar.model.templates.ce.LuckyStarDayBuyTemplateCE;
   
   public class LuckyStarDayBuyTemplate extends LuckyStarDayBuyTemplateCE
   {
       
      
      private var _rewardItem:ItemVO;
      
      public function LuckyStarDayBuyTemplate()
      {
         super();
      }
      
      public function getRewardItem() : ItemVO
      {
         var _loc1_:Array = null;
         if(this._rewardItem == null)
         {
            _loc1_ = rewardItems.split(":");
            this._rewardItem = new ItemVO(_loc1_[0],_loc1_[1]);
         }
         return this._rewardItem;
      }
   }
}
