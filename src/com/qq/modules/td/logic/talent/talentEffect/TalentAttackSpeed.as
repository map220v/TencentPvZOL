package com.qq.modules.td.logic.talent.talentEffect
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.data.game.unit.TDPlantStaticInfo;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   
   public class TalentAttackSpeed extends TalentEffect
   {
       
      
      private var targetHPRateLimit:int;
      
      private var plusAttackSpeedRate:int;
      
      public function TalentAttackSpeed()
      {
         super();
      }
      
      override public function setData(param1:Array) : void
      {
         this.targetHPRateLimit = param1[0];
         this.plusAttackSpeedRate = param1[1];
      }
      
      public function getAttackSpeed(param1:TDPlantStaticInfo, param2:IGameObject, param3:Number) : Number
      {
         var _loc4_:Number = NaN;
         if(hasSamePlantType(param1))
         {
            if(param2.objectModel.unitCatalog == TDConstant.UnitCatalog_Zombie)
            {
               if((_loc4_ = param2.objectModel.curHp.get() / param2.objectModel.maxHp.get() * 100) < this.targetHPRateLimit)
               {
                  return Math.round(param3 + param3 * (this.plusAttackSpeedRate / 100));
               }
            }
         }
         return param3;
      }
   }
}
