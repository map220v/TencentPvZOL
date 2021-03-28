package com.qq.modules.td.logic.action.plant.highWallnut
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.action.plant.basic.PlantSpecialSkillAction;
   
   public class PHighWallNutSpecialSkill extends PlantSpecialSkillAction
   {
       
      
      public function PHighWallNutSpecialSkill()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         var _loc2_:int = _plant.plantData.plantStaticInfo.baseInfo.getSpecialSkillParam(TDConstant.SpecialSkill_Param_Wallnut_ArmorHP);
         _plant.plantData.curArmorHp.set(_loc2_);
         _plant.plantData.maxArmorHp.set(_loc2_);
         var _loc3_:String = _plant.plantData.plantStaticInfo.baseInfo.getSpecialSkillParamStr(TDConstant.SpecialSkill_Param_Wallnut_ArmorBoneName);
         _plant.plantData.armorNameList = _loc3_.split(",");
         _plant.updateArmor();
         finishSpecialSkill();
      }
   }
}
