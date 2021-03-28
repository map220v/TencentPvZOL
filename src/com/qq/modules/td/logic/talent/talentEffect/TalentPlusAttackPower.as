package com.qq.modules.td.logic.talent.talentEffect
{
   import com.qq.modules.td.data.game.unit.TDPlantStaticInfo;
   
   public class TalentPlusAttackPower extends TalentEffect
   {
       
      
      private var attackTargetType:int;
      
      private var plusAttackPowerRate:Number;
      
      private var attackRate:int;
      
      public function TalentPlusAttackPower()
      {
         super();
      }
      
      override public function setData(param1:Array) : void
      {
         this.attackTargetType = param1[0];
         this.plusAttackPowerRate = param1[1];
         this.attackRate = param1[2];
      }
      
      public function getPlusAttackPower(param1:TDPlantStaticInfo, param2:int) : int
      {
         var _loc3_:int = 0;
         if(hasSamePlantType(param1))
         {
            if(param2 == this.attackTargetType || this.attackTargetType == 0)
            {
               _loc3_ = Math.round(Math.random() * 100);
               if(_loc3_ < this.attackRate)
               {
                  return this.plusAttackPowerRate;
               }
            }
         }
         return 0;
      }
   }
}
