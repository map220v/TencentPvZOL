package com.qq.modules.td.logic.action.zombie.polevaulter
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.action.zombie.BasicZombieAction;
   import flash.events.Event;
   import tencent.tools.behaviourTrees.BehaviourTreeCenter;
   
   public class ZombieActionJump extends BasicZombieAction
   {
       
      
      public function ZombieActionJump()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _zombie.animation.gotoAndPlay(TDConstant.ZombieAnmi_Jump);
         _zombie.animation.addEventListener(Event.COMPLETE,this.onFinishJump);
         _zombie.setShadeVisible(false);
         _zombie.zombieData.canJump = false;
         BehaviourTreeCenter.instance.setLock(_zombie.uid,true);
      }
      
      override public function runningState() : void
      {
         super.runningState();
      }
      
      override public function leaveState() : void
      {
         _zombie.animation.removeEventListener(Event.COMPLETE,this.onFinishJump);
         _zombie.setShadeVisible(true);
      }
      
      private function onFinishJump(param1:Event) : void
      {
         _zombie.startWalk();
         _zombie.animation.advanceTime(1);
         _zombie.setLocation(_zombie.x - 150,_zombie.y);
         BehaviourTreeCenter.instance.runAI(_zombie.uid);
         BehaviourTreeCenter.instance.setLock(_zombie.uid,false);
      }
   }
}
