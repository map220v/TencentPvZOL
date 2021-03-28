package com.qq.modules.battle.view.control.unitBuff
{
   import flash.events.Event;
   
   public class UnitBuffPoison extends UnitBuffWithEffect
   {
       
      
      public function UnitBuffPoison()
      {
         super();
      }
      
      override protected function onEffectComplete(param1:Event) : void
      {
         bufEffect.anim.removeEventListener(Event.COMPLETE,this.onEffectComplete);
         bufEffect.anim.gotoAndPlay("animation2",0);
      }
      
      override protected function play() : void
      {
         isLoop = false;
         bufEffect.anim.gotoAndPlay("animation",!!isLoop ? 0 : 1);
      }
   }
}
