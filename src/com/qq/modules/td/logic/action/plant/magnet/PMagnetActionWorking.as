package com.qq.modules.td.logic.action.plant.magnet
{
   import asgui.events.FrameEvent;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.action.plant.BasicPlantAction;
   import com.qq.modules.td.logic.bt_ai.aiUtils.TDSearchTargetUtils;
   import com.qq.modules.td.logic.unit.zombie.BasicZombie;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.events.Event;
   import flash.geom.Rectangle;
   
   public class PMagnetActionWorking extends BasicPlantAction
   {
       
      
      public function PMagnetActionWorking()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_Working);
         _plant.animation.addEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onWorking);
         _plant.animation.addEventListener(Event.COMPLETE,this.onFinish);
      }
      
      override public function leaveState() : void
      {
         _plant.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onWorking);
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinish);
      }
      
      private function onWorking(param1:FrameEvent) : void
      {
         if(param1.frameLabel == "work")
         {
            this.working();
         }
      }
      
      private function onFinish(param1:Event) : void
      {
         _gameObject.setAction(TDConstant.PlantAction_FadeOut);
      }
      
      private function working() : void
      {
         var _loc3_:BasicZombie = null;
         var _loc1_:Rectangle = TDGameInfo.getInstance().getEffectRectByRoadTile(_plantModel.tileIndex,_plantModel.plantStaticInfo.baseInfo.getParam(TDConstant.Plant_Param_DamageTileCol),_plantModel.plantStaticInfo.baseInfo.getParam(TDConstant.Plant_Param_DamageTileRow));
         var _loc2_:Array = TDSearchTargetUtils.getZombieList(_plant);
         for each(_loc3_ in _loc2_)
         {
            if(_loc1_.contains(_loc3_.x,_loc3_.y))
            {
               _loc3_.magnetArmor(_gameObject.x,_gameObject.y - 40);
            }
         }
      }
   }
}
