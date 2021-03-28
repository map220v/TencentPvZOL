package com.qq.modules.td.logic.action.object.achieve
{
   import com.qq.modules.td.logic.action.basic.BasicAction;
   import flash.events.Event;
   
   public class ObjectAchieveActionResult extends BasicAction
   {
       
      
      private var isWin:Boolean = false;
      
      public function ObjectAchieveActionResult()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         if(param1[0] == 1)
         {
            _gameObject.animation.gotoAndPlay("win",false);
         }
         else
         {
            _gameObject.animation.gotoAndPlay("fail",false);
         }
         _gameObject.animation.addEventListener(Event.COMPLETE,this.onPlayComplete);
      }
      
      protected function onPlayComplete(param1:Event) : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onPlayComplete);
         _gameObject.dispose(true);
      }
   }
}
