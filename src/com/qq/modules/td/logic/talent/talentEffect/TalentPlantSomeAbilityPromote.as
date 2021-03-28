package com.qq.modules.td.logic.talent.talentEffect
{
   public class TalentPlantSomeAbilityPromote extends TalentEffect implements ITalentEffect
   {
       
      
      private var _promotionType:int;
      
      private var _promotionRate:Number;
      
      public function TalentPlantSomeAbilityPromote()
      {
         super();
      }
      
      override public function setData(param1:Array) : void
      {
         super.setData(param1);
         this._promotionType = param1[0];
         this._promotionRate = param1[1];
      }
      
      public function getPromotionRateByType(param1:int) : Number
      {
         if(this._promotionType == param1)
         {
            return this._promotionRate;
         }
         return 1;
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
