package com.qq.modules.td.logic.action.plant.dandelion
{
   import asgui.events.FrameEvent;
   import com.qq.modules.td.logic.action.plant.BasicPlantAction;
   import com.qq.modules.td.logic.bt_ai.aiUtils.TDSearchTargetUtils;
   import com.qq.modules.td.logic.numeric.TDDamageCaculete;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import flash.events.Event;
   
   public class DandelionAttackAction extends BasicPlantAction
   {
       
      
      private var _attackAreas:Array;
      
      public function DandelionAttackAction()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         this._attackAreas = param1[0];
         _gameObject.animation.gotoAndPlay("attack",false);
         _gameObject.animation.addEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onAttack);
         _gameObject.animation.addEventListener(Event.COMPLETE,this.onCompleteAttack);
      }
      
      private function onAttack(param1:FrameEvent) : void
      {
         var _loc2_:Array = null;
         var _loc3_:Vector.<IGameObject> = null;
         var _loc4_:IGameObject = null;
         if(param1.frameLabel == "attack")
         {
            _loc2_ = [_plant.objectModel.roadIndex - 1,_plant.objectModel.roadIndex,_plant.objectModel.roadIndex + 1];
            _loc3_ = TDSearchTargetUtils.searchTargetForPlant(_plant,this._attackAreas,_loc2_);
            for each(_loc4_ in _loc3_)
            {
               TDDamageCaculete.caculatePlantAttckDamage(_plant,_loc4_);
            }
         }
      }
      
      private function onCompleteAttack(param1:Event) : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onCompleteAttack);
         _gameObject.setAction();
      }
      
      override public function leaveState() : void
      {
         _gameObject.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onAttack);
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onCompleteAttack);
         super.leaveState();
      }
   }
}
