package com.qq.modules.td.logic.action.object.effect
{
   import com.qq.modules.td.logic.action.basic.BasicAction;
   import flash.events.Event;
   
   public class EffectLoopAction extends BasicAction
   {
       
      
      private var _frameIndex:int = 0;
      
      private var _allLabelNames:Array;
      
      public function EffectLoopAction()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _gameObject.animation.addEventListener(Event.COMPLETE,this.onComplete);
         this._allLabelNames = _gameObject.animation.getAllLabelName();
         this.playLoopAction();
      }
      
      private function onComplete(param1:Event) : void
      {
         this.playLoopAction();
      }
      
      override public function dispose() : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onComplete);
         super.dispose();
      }
      
      private function playLoopAction(param1:int = 1) : void
      {
         _gameObject.animation.gotoAndPlay(this._allLabelNames[this._frameIndex],param1);
         ++this._frameIndex;
         if(this._frameIndex >= this._allLabelNames.length)
         {
            this._frameIndex = 0;
         }
      }
   }
}
