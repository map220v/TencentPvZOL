package com.qq.modules.td.logic.talent.talentEffect
{
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.logic.unit.plant.BasicPlant;
   
   public class TalentAttackPlugBuff extends TalentEffect
   {
       
      
      private var buffType:int;
      
      public function TalentAttackPlugBuff()
      {
         super();
      }
      
      override public function setData(param1:Array) : void
      {
         this.buffType = param1[0];
      }
      
      public function plugAttackBuff(param1:BasicPlant, param2:IGameObject) : void
      {
         if(hasSamePlantType(param1.plantData.plantStaticInfo))
         {
            param2.objectModel.addBuff(this.buffType,param1);
         }
      }
   }
}
