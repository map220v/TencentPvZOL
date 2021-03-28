package com.qq.modules.td.logic.action.object.sunBomb
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.action.basic.BasicAction;
   import flash.events.Event;
   
   public class SunBombTrackDisappear extends BasicAction
   {
       
      
      public function SunBombTrackDisappear()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _gameObject.animation.addEventListener(Event.COMPLETE,this.onDisappearComplete);
         _gameObject.animation.gotoAndPlay(TDConstant.ObjectAction_Disappear);
      }
      
      override public function runningState() : void
      {
      }
      
      protected function onDisappearComplete(param1:Event) : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onDisappearComplete);
         _gameObject.dispose();
         _gameObject = null;
      }
   }
}
