package com.qq.modules.td.logic.action.object.bossRocket
{
   import com.qq.modules.td.logic.action.basic.BasicAction;
   import flash.events.Event;
   
   public class FutureBossRocketTargetAction extends BasicAction
   {
       
      
      public function FutureBossRocketTargetAction()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _gameObject.animation.gotoAndPlay("show");
         _gameObject.animation.addEventListener(Event.COMPLETE,this.onCompleteShow);
      }
      
      protected function onCompleteShow(param1:Event) : void
      {
         _gameObject.animation.gotoAndPlay("miaozhun",true);
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onCompleteShow);
      }
      
      override public function leaveState() : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onCompleteShow);
         super.leaveState();
      }
   }
}
