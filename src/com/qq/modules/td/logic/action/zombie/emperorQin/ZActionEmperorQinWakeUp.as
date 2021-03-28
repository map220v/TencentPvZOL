package com.qq.modules.td.logic.action.zombie.emperorQin
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.action.basic.BasicAction;
   import flash.events.Event;
   
   public class ZActionEmperorQinWakeUp extends BasicAction
   {
       
      
      public function ZActionEmperorQinWakeUp()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _gameObject.setFrozenAI(true);
         _gameObject.animation.addEventListener(Event.COMPLETE,this.onComplete);
         _gameObject.animation.gotoAndPlay("idle");
      }
      
      private function onComplete(param1:Event) : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onComplete);
         _gameObject.setRunningProp(TDConstant.GameObject_Prop_BossStateChangeFinished,true);
         _gameObject.objectModel.removeBuff(TDConstant.TDBuffID_God);
         _gameObject.setFrozenAI(false);
      }
      
      override public function runningState() : void
      {
         super.runningState();
      }
      
      override public function leaveState() : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onComplete);
         super.leaveState();
      }
   }
}
