package com.qq.modules.td.logic.action.object.dave
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.guide.GuideGlobals;
   import com.qq.modules.td.logic.action.basic.BasicAction;
   import com.qq.utils.CommandDispatcher;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   
   public class DaveBlahblahAction extends BasicAction
   {
       
      
      public function DaveBlahblahAction()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _gameObject.animation.gotoAndPlay("anim_blahblah");
         _gameObject.animation.addEventListener(Event.COMPLETE,this.onPlayComplete);
         CommandDispatcher.send(GuideGlobals.GuideDialogue_LockMouse);
      }
      
      protected function onPlayComplete(param1:Event) : void
      {
         (param1.currentTarget as IEventDispatcher).removeEventListener(Event.COMPLETE,this.onPlayComplete);
         CommandDispatcher.send(GuideGlobals.GuideDialogue_DoAct);
         CommandDispatcher.send(GuideGlobals.GuideDialogue_UnLockMouse);
         _gameObject.setAction(TDConstant.DaveIdleAction);
      }
   }
}
