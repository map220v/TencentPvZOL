package com.qq.modules.td.logic.action.plant.narcissus
{
   import asgui.events.FrameEvent;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.action.plant.basic.PlantSpecialSkillAction;
   import com.qq.modules.td.logic.bt_ai.aiUtils.TDSearchTargetUtils;
   import com.qq.modules.td.logic.buff.TDBuffManager;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.events.Event;
   
   public class PDaffodilActionSpecialSkill extends PlantSpecialSkillAction
   {
       
      
      public function PDaffodilActionSpecialSkill()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_Plantfood,false);
         _plant.animation.addEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
         _plant.animation.addEventListener(Event.COMPLETE,this.onComplete);
      }
      
      private function onShoot(param1:FrameEvent) : void
      {
         var _loc2_:Array = null;
         var _loc3_:Array = null;
         if(param1.frameLabel == "shoot")
         {
            _loc2_ = TDGameInfo.getInstance().getGameObjectMapByCatalgAndType(TDConstant.UnitCatalog_Object,TDConstant.UnitType_GroundFire);
            TDBuffManager.getInstance().addGameObjectsBuffWithBuffId(_loc2_,TDConstant.TDBuffID_WetForDaffodil);
            _loc3_ = TDSearchTargetUtils.getZombieList(_plant);
            TDBuffManager.getInstance().addGameObjectsBuffWithBuffId(_loc3_,TDConstant.TDBuffID_WetForDaffodil);
         }
      }
      
      private function onComplete(param1:Event) : void
      {
         super.finishSpecialSkill();
      }
      
      override public function leaveState() : void
      {
         _plant.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
         _plant.animation.removeEventListener(Event.COMPLETE,this.onComplete);
         super.leaveState();
      }
   }
}
