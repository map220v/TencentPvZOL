package com.qq.modules.td.logic.action.plant.garlic
{
   import asgui.events.FrameEvent;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.action.plant.basic.PlantSpecialSkillAction;
   import com.qq.modules.td.logic.unit.zombie.BasicZombie;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.events.Event;
   
   public class PGarlicSpecialSkill extends PlantSpecialSkillAction
   {
       
      
      public function PGarlicSpecialSkill()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         this.onShoot(null);
         finishSpecialSkill();
      }
      
      protected function onFinishPlantFoodOn(param1:Event) : void
      {
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishPlantFoodOn);
         _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_Plantfood,false,2);
         _plant.animation.addEventListener(Event.COMPLETE,this.onFinishPlantFood);
         _plant.animation.addEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
      }
      
      protected function onShoot(param1:FrameEvent) : void
      {
         var _loc3_:BasicZombie = null;
         var _loc4_:int = 0;
         _plant.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
         var _loc2_:Array = TDGameInfo.getInstance().getGameObjectMapByCatalg(TDConstant.UnitCatalog_Zombie);
         for each(_loc3_ in _loc2_)
         {
            if(_loc3_ && _loc3_.isVaild && _loc3_.objectModel.curHp.get() > 0)
            {
               if(_loc3_.zombieData.zombiestaticInfo.bodySize != 4)
               {
                  if(_loc3_.getRunningProp(TDConstant.TDBuffID_God) != true)
                  {
                     if(!(_loc3_.zombieData.zombiestaticInfo.type == TDConstant.ZombieType_Wolf_Knight && _loc3_.getActionID() == TDConstant.ZAction_Wolf_Knight_Swoop))
                     {
                        _loc4_ = _plant.plantData.plantStaticInfo.baseInfo.getSpecialSkillParam(TDConstant.SpecialSkill_Param_Garlic_FixedDuration);
                        _loc3_.setAction(TDConstant.ZAction_Fixed,[_loc4_],true);
                     }
                  }
               }
            }
         }
      }
      
      protected function onFinishPlantFood(param1:Event) : void
      {
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishPlantFood);
         _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_Plantfood_off);
         _plant.animation.addEventListener(Event.COMPLETE,this.onFinishPlantFoodOff);
      }
      
      protected function onFinishPlantFoodOff(param1:Event) : void
      {
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishPlantFoodOff);
         finishSpecialSkill();
      }
      
      override public function leaveState() : void
      {
         _plant.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishPlantFoodOn);
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishPlantFood);
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishPlantFoodOff);
         super.leaveState();
      }
   }
}
