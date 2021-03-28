package com.qq.modules.td.logic.action.plant.oxygenAlgae
{
   import asgui.events.FrameEvent;
   import com.qq.constant.td.TDConstant;
   import com.qq.constant.td.TDSoundID;
   import com.qq.modules.sound.command.SoundCmd;
   import com.qq.modules.td.logic.action.plant.basic.PlantSpecialSkillAction;
   import com.qq.modules.td.logic.unit.plant.BasicPlant;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.events.Event;
   
   public class POxygenAlgaeSpecialSkill extends PlantSpecialSkillAction
   {
       
      
      public function POxygenAlgaeSpecialSkill()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_Plantfood_on);
         _plant.animation.addEventListener(Event.COMPLETE,this.onFinishPlantFoodOn);
         SoundCmd.playSound(TDSoundID.Oxygen_Setup);
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
         var _loc2_:Array = null;
         var _loc3_:BasicPlant = null;
         if(param1.frameLabel == "shoot")
         {
            _plant.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
            _loc2_ = TDGameInfo.getInstance().getGameObjectMapByCatalg(TDConstant.UnitCatalog_Plant);
            for each(_loc3_ in _loc2_)
            {
               if(_loc3_ && !_loc3_.plantData.hasBuff(TDConstant.TDBuffID_OxygenSupplyedAlways))
               {
                  _loc3_.plantData.addBuff(TDConstant.TDBuffID_OxygenSupplyedTemp,_loc3_);
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
