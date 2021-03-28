package com.qq.modules.battle.view.control.unitBuff
{
   import flash.events.Event;
   
   public class UnitBuffRally extends UnitBuffWithEffect
   {
       
      
      public function UnitBuffRally()
      {
         super();
      }
      
      override protected function onEffectComplete(param1:Event) : void
      {
         bufEffect.anim.removeEventListener(Event.COMPLETE,this.onEffectComplete);
         bufEffect.anim.gotoAndPlay("fanshang",0);
      }
      
      override protected function play() : void
      {
         isLoop = false;
         bufEffect.anim.gotoAndPlay("fanshang_show",!!isLoop ? 0 : 1);
      }
   }
}
