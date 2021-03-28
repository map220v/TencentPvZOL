package com.qq.modules.td.logic.talent.talentEffect
{
   public class TalentPlantSkillCostLess extends TalentEffect implements ITalentEffect
   {
       
      
      private var costCut:Number;
      
      public function TalentPlantSkillCostLess()
      {
         super();
      }
      
      override public function setData(param1:Array) : void
      {
         super.setData(param1);
         this.costCut = param1[0];
      }
      
      public function getCostCut() : Number
      {
         return this.costCut;
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
