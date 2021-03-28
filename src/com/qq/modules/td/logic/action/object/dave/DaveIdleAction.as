package com.qq.modules.td.logic.action.object.dave
{
   import com.qq.modules.guide.GuideGlobals;
   import com.qq.modules.td.logic.action.basic.BasicAction;
   import com.qq.utils.CommandDispatcher;
   
   public class DaveIdleAction extends BasicAction
   {
       
      
      public function DaveIdleAction()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _gameObject.animation.gotoAndPlay("anim_idle",true);
         CommandDispatcher.send(GuideGlobals.GuideDialogue_UnLockMouse);
      }
      
      override public function runningState() : void
      {
      }
   }
}
