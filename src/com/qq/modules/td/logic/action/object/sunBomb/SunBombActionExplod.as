package com.qq.modules.td.logic.action.object.sunBomb
{
   import com.qq.constant.td.TDConstant;
   import flash.events.Event;
   
   public class SunBombActionExplod extends BasicSunBombAction
   {
       
      
      public function SunBombActionExplod()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _gameObject.animation.addEventListener(Event.COMPLETE,this.onComplete);
         _gameObject.animation.gotoAndPlay(TDConstant.TDSunBombAction_Explod);
      }
      
      protected function onComplete(param1:Event) : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onComplete);
         _gameObject.dispose();
         _gameObject = null;
      }
   }
}
