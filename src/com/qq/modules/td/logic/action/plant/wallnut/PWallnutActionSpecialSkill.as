package com.qq.modules.td.logic.action.plant.wallnut
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.logic.action.plant.basic.PlantSpecialSkillAction;
   import flash.events.Event;
   
   public class PWallnutActionSpecialSkill extends PlantSpecialSkillAction
   {
       
      
      public function PWallnutActionSpecialSkill()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         var _loc2_:int = _plant.plantData.plantStaticInfo.baseInfo.getSpecialSkillParam(TDConstant.SpecialSkill_Param_Wallnut_ArmorHP);
         _plant.plantData.curArmorHp.set(_loc2_);
         _plant.plantData.maxArmorHp.set(_loc2_);
         _plant.plantData.curHp.set(_plant.plantData.maxHp.get());
         var _loc3_:String = _plant.plantData.plantStaticInfo.baseInfo.getSpecialSkillParamStr(TDConstant.SpecialSkill_Param_Wallnut_ArmorBoneName);
         _plant.plantData.armorNameList = _loc3_.split(",");
         _plant.updateArmor();
         _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_Plantfood_on);
         _plant.animation.addEventListener(Event.COMPLETE,this.onFinishPlantfood_on);
         TDSoundCmd.playPlantSpecialAttack(_gameObject.objectModel.staticInfo.type);
      }
      
      private function onFinishPlantfood_on(param1:Event) : void
      {
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishPlantfood_on);
         _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_Plantfood);
         _plant.animation.addEventListener(Event.COMPLETE,this.onFinishPlantfood);
      }
      
      private function onFinishPlantfood(param1:Event) : void
      {
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishPlantfood);
         finishSpecialSkill();
      }
      
      override public function leaveState() : void
      {
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishPlantfood_on);
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishPlantfood);
         super.leaveState();
      }
   }
}
