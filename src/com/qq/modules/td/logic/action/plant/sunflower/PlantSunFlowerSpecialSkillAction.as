package com.qq.modules.td.logic.action.plant.sunflower
{
   import asgui.events.FrameEvent;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.logic.action.plant.basic.PlantSpecialSkillAction;
   import com.qq.modules.td.logic.talent.TalentManager;
   import flash.events.Event;
   import tencent.tools.planMachine.SerialPlan;
   
   public class PlantSunFlowerSpecialSkillAction extends PlantSpecialSkillAction
   {
       
      
      public function PlantSunFlowerSpecialSkillAction()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_Plantfood_on);
         _plant.animation.addEventListener(Event.COMPLETE,this.onFinishPlantfood_on);
         TDSoundCmd.playPlantSpecialAttack(_gameObject.objectModel.staticInfo.type);
      }
      
      private function onFinishPlantfood_on(param1:Event) : void
      {
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishPlantfood_on);
         _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_Plantfood);
         _plant.animation.addEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onProduct);
         _plant.animation.addEventListener(Event.COMPLETE,this.onFinishPlantfood);
      }
      
      private function onProduct(param1:FrameEvent) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:PlanProductItem = null;
         var _loc7_:SerialPlan = null;
         if(param1.frameLabel == "product")
         {
            if(_gameObject != null && _gameObject.objectModel.isVaild)
            {
               _loc2_ = _plant.plantData.plantStaticInfo.baseInfo.getSpecialSkillParam(TDConstant.SpecialSkill_Param_GenerateItemType);
               _loc3_ = _plant.plantData.plantStaticInfo.baseInfo.getSpecialSkillParam(TDConstant.SpecialSkill_Param_GenerateItemNum);
               _loc4_ = _gameObject.objectModel.staticInfo.getParam(TDConstant.Plant_Param_GenerateItem_PosOffsetX);
               _loc5_ = _gameObject.objectModel.staticInfo.getParam(TDConstant.Plant_Param_GenerateItem_PosOffsetY);
               if(TalentManager.instance.isProductBigSun(_plant.plantData.plantStaticInfo))
               {
                  _loc2_ = TDConstant.UnitType_BigSun;
               }
               _loc6_ = new PlanProductItem(_gameObject,_loc2_,_loc3_,_loc4_,_loc5_);
               if(_loc2_ == TDConstant.UnitType_BigSun)
               {
                  _loc6_.addItemParams("isBig",true);
               }
               (_loc7_ = new SerialPlan([_loc6_])).doPlan(null);
            }
         }
      }
      
      private function onFinishPlantfood(param1:Event) : void
      {
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishPlantfood);
         _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_Plantfood_off);
         _plant.animation.addEventListener(Event.COMPLETE,this.onFinishPlantfood_off);
      }
      
      private function onFinishPlantfood_off(param1:Event) : void
      {
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishPlantfood_off);
         finishSpecialSkill();
      }
      
      override public function leaveState() : void
      {
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishPlantfood_on);
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishPlantfood);
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishPlantfood_off);
         _plant.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onProduct);
         super.leaveState();
      }
   }
}
