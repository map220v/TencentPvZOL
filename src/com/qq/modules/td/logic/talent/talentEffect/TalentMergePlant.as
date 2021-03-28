package com.qq.modules.td.logic.talent.talentEffect
{
   import com.qq.modules.td.data.game.unit.TDPlantStaticInfo;
   
   public class TalentMergePlant extends TalentEffect
   {
       
      
      private var newPlantType:int;
      
      public function TalentMergePlant()
      {
         super();
      }
      
      override public function setData(param1:Array) : void
      {
         super.setData(param1);
         this.newPlantType = param1[0];
      }
      
      public function getMergePlantType(param1:TDPlantStaticInfo) : Number
      {
         if(hasSamePlantType(param1))
         {
            return this.newPlantType;
         }
         return 0;
      }
   }
}
