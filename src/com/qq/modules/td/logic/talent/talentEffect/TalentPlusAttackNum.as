package com.qq.modules.td.logic.talent.talentEffect
{
   import com.qq.modules.td.data.game.unit.TDPlantStaticInfo;
   
   public class TalentPlusAttackNum extends TalentEffect
   {
       
      
      private var plusNum:int;
      
      public function TalentPlusAttackNum()
      {
         super();
      }
      
      override public function setData(param1:Array) : void
      {
         this.plusNum = param1[0];
         if(this.plusNum == 0)
         {
            this.plusNum = int.MAX_VALUE;
         }
      }
      
      public function getPlusAttackNum(param1:TDPlantStaticInfo) : int
      {
         if(hasSamePlantType(param1))
         {
            return this.plusNum;
         }
         return 0;
      }
   }
}
