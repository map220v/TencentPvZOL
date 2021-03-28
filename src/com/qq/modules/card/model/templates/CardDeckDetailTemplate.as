package com.qq.modules.card.model.templates
{
   import com.qq.modules.card.model.templates.ce.CardDeckDetailTemplateCE;
   
   public class CardDeckDetailTemplate extends CardDeckDetailTemplateCE
   {
       
      
      private var attributePromotionList:Array;
      
      private var featureList:Array;
      
      public function CardDeckDetailTemplate()
      {
         super();
      }
      
      public function getAttributePromotion(param1:int) : int
      {
         var _loc2_:Array = null;
         var _loc3_:String = null;
         var _loc4_:Array = null;
         if(this.attributePromotionList == null)
         {
            this.attributePromotionList = [];
            _loc2_ = this._attribute.split(";");
            for each(_loc3_ in _loc2_)
            {
               _loc4_ = _loc3_.split(":");
               this.attributePromotionList[int(_loc4_[0])] = int(_loc4_[1]);
            }
         }
         return int(this.attributePromotionList[param1]);
      }
      
      public function getFeatureList() : Array
      {
         var _loc1_:Array = null;
         var _loc2_:String = null;
         if(this.featureList == null)
         {
            this.featureList = [];
            _loc1_ = this._feature.split(";");
            for each(_loc2_ in _loc1_)
            {
               this.featureList.push(int(_loc2_));
            }
         }
         return this.featureList;
      }
   }
}
