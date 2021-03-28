package com.qq.modules.td.logic.talent.talentEffect
{
   import com.qq.modules.td.data.game.unit.TDPlantStaticInfo;
   
   public class TalentProductBigSun extends TalentEffect
   {
       
      
      private var odds:Number;
      
      public function TalentProductBigSun()
      {
         super();
      }
      
      override public function setData(param1:Array) : void
      {
         this.odds = param1[0];
      }
      
      public function isProductBigSun(param1:TDPlantStaticInfo) : Boolean
      {
         var _loc2_:Number = NaN;
         if(hasSamePlantType(param1))
         {
            _loc2_ = Math.random() * 100;
            if(_loc2_ < this.odds)
            {
               return true;
            }
         }
         return false;
      }
   }
}
