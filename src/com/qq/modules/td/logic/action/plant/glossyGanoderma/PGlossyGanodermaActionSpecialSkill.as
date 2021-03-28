package com.qq.modules.td.logic.action.plant.glossyGanoderma
{
   import asgui.events.FrameEvent;
   import com.qq.constant.td.TDConstant;
   import com.qq.constant.td.TDObjTypeID;
   import com.qq.modules.td.command.effects.TDEffectCmd;
   import com.qq.modules.td.logic.action.plant.basic.PlantSpecialSkillAction;
   import com.qq.modules.td.logic.unit.plant.BasicPlant;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.view.effects.TDEffectPlayInfo;
   import flash.events.Event;
   
   public class PGlossyGanodermaActionSpecialSkill extends PlantSpecialSkillAction
   {
       
      
      public function PGlossyGanodermaActionSpecialSkill()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_Plantfood_on);
         _plant.animation.addEventListener(Event.COMPLETE,this.onFinishRemovePosionOn);
      }
      
      protected function onFinishRemovePosionOn(param1:Event) : void
      {
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishRemovePosionOn);
         _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_Plantfood);
         _plant.animation.addEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
         _plant.animation.addEventListener(Event.COMPLETE,this.onFinishRemovePosion);
      }
      
      private function onShoot(param1:FrameEvent) : void
      {
         var _loc2_:Array = null;
         var _loc3_:BasicPlant = null;
         if(param1.frameLabel == "shoot")
         {
            _loc2_ = TDGameInfo.getInstance().getGameObjectMapByCatalg(TDConstant.UnitCatalog_Plant);
            for each(_loc3_ in _loc2_)
            {
               if(_loc3_.plantData.hasBuff(TDConstant.TDBuffID_Poisoned))
               {
                  _loc3_.plantData.removeBuff(TDConstant.TDBuffID_Poisoned);
                  TDEffectCmd.playBlitAnimation(TDObjTypeID.Obj_Glossy_Remove_Posion,_loc3_.x,_loc3_.y,new TDEffectPlayInfo("anim"));
               }
            }
            _plant.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
         }
      }
      
      private function onFinishRemovePosion(param1:Event) : void
      {
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishRemovePosion);
         _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_Plantfood_off);
         _plant.animation.addEventListener(Event.COMPLETE,this.onFinishRemovePosionOff);
      }
      
      protected function onFinishRemovePosionOff(param1:Event) : void
      {
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishRemovePosionOff);
         finishSpecialSkill();
      }
      
      override public function leaveState() : void
      {
         super.leaveState();
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishRemovePosionOn);
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishRemovePosion);
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishRemovePosionOff);
         _plant.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
      }
   }
}
