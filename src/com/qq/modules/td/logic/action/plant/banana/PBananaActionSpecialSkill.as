package com.qq.modules.td.logic.action.plant.banana
{
   import asgui.events.FrameEvent;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.TDFireBulletCmd;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.logic.action.plant.basic.PlantSpecialSkillAction;
   import flash.events.Event;
   
   public class PBananaActionSpecialSkill extends PlantSpecialSkillAction
   {
       
      
      public function PBananaActionSpecialSkill()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         if(_plant.getRunningProp(TDConstant.Gameobject_Prop_Banana_Weak) == true)
         {
            _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_Plantfood_on2);
         }
         else
         {
            _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_Plantfood_on);
         }
         _plant.animation.addEventListener(Event.COMPLETE,this.onFinishPlantFoodOn);
      }
      
      protected function onFinishPlantFoodOn(param1:Event) : void
      {
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishPlantFoodOn);
         if(_plant.getRunningProp(TDConstant.Gameobject_Prop_Banana_Weak) == true)
         {
            _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_Plantfood2);
         }
         else
         {
            _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_Plantfood);
         }
         _plant.animation.addEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
         _plant.animation.addEventListener(Event.COMPLETE,this.onFinishPlantFood);
      }
      
      private function onShoot(param1:FrameEvent) : void
      {
         var _loc2_:int = 0;
         if(param1.frameLabel == "shoot")
         {
            _loc2_ = _plant.plantData.plantStaticInfo.baseInfo.getSpecialSkillParam(TDConstant.SpecialSkill_Param_ShootBulletType);
            if(_plant.getRunningProp(TDConstant.Gameobject_Prop_Banana_Weak) == true)
            {
               TDFireBulletCmd.shoot(_plant,_plant.curAttackTarget,_loc2_,"",0,0,1,true,null,["middle"]);
               TDSoundCmd.playPlantSpecialAttack(_gameObject.objectModel.staticInfo.type);
            }
            else
            {
               TDFireBulletCmd.shoot(_plant,_plant.curAttackTarget,_loc2_,"",0,0,1,true,null,["top"]);
               TDSoundCmd.playPlantSpecialAttack(_gameObject.objectModel.staticInfo.type);
               TDFireBulletCmd.shoot(_plant,_plant.curAttackTarget,_loc2_,"",0,0,1,true,null,["bottom"]);
               TDSoundCmd.playPlantSpecialAttack(_gameObject.objectModel.staticInfo.type);
            }
            _plant.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
         }
      }
      
      private function onFinishPlantFood(param1:Event) : void
      {
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishPlantFood);
         if(_plant.getRunningProp(TDConstant.Gameobject_Prop_Banana_Weak) == true)
         {
            _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_Plantfood_off2);
         }
         else
         {
            _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_Plantfood_off);
         }
         _plant.animation.addEventListener(Event.COMPLETE,this.onFinishPlantFoodOff);
      }
      
      protected function onFinishPlantFoodOff(param1:Event) : void
      {
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishPlantFoodOff);
         finishSpecialSkill();
      }
      
      override public function leaveState() : void
      {
         super.leaveState();
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishPlantFoodOn);
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishPlantFood);
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishPlantFoodOff);
         _plant.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
      }
   }
}
