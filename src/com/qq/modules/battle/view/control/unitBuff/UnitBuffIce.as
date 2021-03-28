package com.qq.modules.battle.view.control.unitBuff
{
   public class UnitBuffIce extends UnitBuffWithEffect
   {
       
      
      public function UnitBuffIce()
      {
         super();
         isLoop = false;
      }
      
      override public function dispose() : void
      {
         if(unit != null)
         {
            unit.animation.isPlaying = true;
         }
         super.dispose();
      }
      
      override protected function render() : void
      {
         super.render();
         if(unit != null)
         {
            unit.animation.stop();
         }
      }
   }
}
