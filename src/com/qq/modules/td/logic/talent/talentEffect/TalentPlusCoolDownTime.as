package com.qq.modules.td.logic.talent.talentEffect
{
   import com.qq.modules.td.data.game.unit.TDPlantStaticInfo;
   
   public class TalentPlusCoolDownTime extends TalentEffect
   {
       
      
      private var dissTime:int;
      
      public function TalentPlusCoolDownTime()
      {
         super();
      }
      
      override public function setData(param1:Array) : void
      {
         super.setData(param1);
         this.dissTime = param1[0];
      }
      
      public function getPlusDurationTime(param1:TDPlantStaticInfo) : Number
      {
         if(hasSamePlantType(param1))
         {
            return -this.dissTime;
         }
         return param1.baseInfo.duration;
      }
   }
}
