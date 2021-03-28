package com.qq.modules.td.logic.action.object.effect
{
   import com.qq.modules.td.logic.action.basic.BasicAction;
   import flash.events.Event;
   
   public class ArrowTargetEffectHideAction extends BasicAction
   {
       
      
      public function ArrowTargetEffectHideAction()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _gameObject.animation.addEventListener(Event.COMPLETE,this.onComplete);
         _gameObject.animation.gotoAndPlay("hide",1);
      }
      
      private function onComplete(param1:Event) : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onComplete);
         _gameObject.Dispose();
      }
      
      override public function dispose() : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onComplete);
         super.dispose();
      }
   }
}
