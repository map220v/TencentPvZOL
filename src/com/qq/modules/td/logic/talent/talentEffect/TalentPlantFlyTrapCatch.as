package com.qq.modules.td.logic.talent.talentEffect
{
   public class TalentPlantFlyTrapCatch extends TalentEffect implements ITalentEffect
   {
       
      
      private var _blood:Number;
      
      public function TalentPlantFlyTrapCatch()
      {
         super();
      }
      
      override public function setData(param1:Array) : void
      {
         super.setData(param1);
         this._blood = param1[0];
      }
      
      public function getBlood() : Number
      {
         return this._blood;
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
