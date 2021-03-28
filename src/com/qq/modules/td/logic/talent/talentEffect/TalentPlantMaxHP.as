package com.qq.modules.td.logic.talent.talentEffect
{
   import com.qq.modules.td.data.game.unit.TDPlantStaticInfo;
   
   public class TalentPlantMaxHP extends TalentEffect implements ITalentEffect
   {
       
      
      private var maxHPArg:Number;
      
      public function TalentPlantMaxHP()
      {
         super();
      }
      
      override public function setData(param1:Array) : void
      {
         super.setData(param1);
         this.maxHPArg = param1[0] / 100;
      }
      
      public function getPlantMaxHP(param1:TDPlantStaticInfo) : Number
      {
         if(hasSamePlantType(param1))
         {
            return param1.baseInfo.hp + param1.baseInfo.hp * this.maxHPArg;
         }
         return param1.baseInfo.hp;
      }
   }
}
