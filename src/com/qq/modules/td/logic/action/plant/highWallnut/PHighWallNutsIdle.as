package com.qq.modules.td.logic.action.plant.highWallnut
{
   import com.qq.modules.td.logic.action.plant.BasicPlantAction;
   
   public class PHighWallNutsIdle extends BasicPlantAction
   {
       
      
      public function PHighWallNutsIdle()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         this.updateState();
      }
      
      override public function runningState() : void
      {
         super.runningState();
         this.updateState();
      }
      
      private function updateState() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:String = null;
         if(_plant.objectModel.curArmorHp.get() > 0)
         {
            _loc1_ = _plant.objectModel.curArmorHp.get() / _plant.objectModel.maxArmorHp.get();
            _loc2_ = "idle";
         }
         else
         {
            _loc1_ = _plant.objectModel.curHp.get() / _plant.objectModel.maxHp.get();
            if(_loc1_ > 0.75)
            {
               _loc2_ = "idle";
            }
            else if(_loc1_ > 0.5)
            {
               _loc2_ = "damage";
            }
            else
            {
               _loc2_ = "damage2";
            }
         }
         _plant.animation.gotoAndPlay(_loc2_,true);
      }
   }
}
