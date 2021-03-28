package com.qq.modules.td.logic.action.plant.frostMushroom
{
   import com.greensock.TweenLite;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.action.plant.BasicPlantAction;
   import com.qq.modules.td.logic.bt_ai.aiUtils.TDSearchTargetUtils;
   import com.qq.modules.td.logic.unit.zombie.BasicZombie;
   import flash.events.Event;
   
   public class FrostMushroomAttackAction extends BasicPlantAction
   {
       
      
      public function FrostMushroomAttackAction()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_Idle,0);
         _plant.animation.addEventListener(Event.COMPLETE,this.idleCompleteHandler);
      }
      
      protected function idleCompleteHandler(param1:Event) : void
      {
         _plant.animation.removeEventListener(Event.COMPLETE,this.idleCompleteHandler);
         this.frostZombie();
      }
      
      private function frostZombie() : void
      {
         var _loc4_:BasicZombie = null;
         var _loc1_:Array = TDSearchTargetUtils.getZombieList(_plant);
         var _loc2_:int = _loc1_.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = _loc1_[_loc3_] as BasicZombie;
            _plant.setFrozenAI(true);
            _loc3_++;
         }
         TweenLite.delayedCall(3000,this.frostCompleteHandler);
      }
      
      private function frostCompleteHandler() : void
      {
         _plant.removeSelf();
      }
   }
}
