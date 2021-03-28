package com.qq.modules.luckystar.model.templates
{
   import com.qq.modules.bag.model.vo.ItemVO;
   import com.qq.modules.luckystar.model.templates.ce.LuckyStarItemsTemplateCE;
   
   public class LuckyStarItemsTemplate extends LuckyStarItemsTemplateCE
   {
       
      
      private var _r:Vector.<ItemVO>;
      
      public function LuckyStarItemsTemplate()
      {
         super();
      }
      
      public function getRewardItems() : Vector.<ItemVO>
      {
         var _loc1_:Array = null;
         var _loc2_:int = 0;
         var _loc3_:Array = null;
         if(this._r == null)
         {
            this._r = new Vector.<ItemVO>();
            _loc1_ = rewardItems.split(";");
            _loc2_ = 0;
            while(_loc2_ < _loc1_.length)
            {
               if(String(_loc1_[_loc2_]).length > 1)
               {
                  _loc3_ = String(_loc1_[_loc2_]).split(":");
                  this._r.push(new ItemVO(_loc3_[0],_loc3_[1]));
               }
               _loc2_++;
            }
         }
         return this._r;
      }
   }
}
