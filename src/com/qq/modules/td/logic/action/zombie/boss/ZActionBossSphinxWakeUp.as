package com.qq.modules.td.logic.action.zombie.boss
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.action.basic.BasicAction;
   import flash.events.Event;
   import org.as3commons.logging.api.getLogger;
   
   public class ZActionBossSphinxWakeUp extends BasicAction
   {
       
      
      private var _lastTime:Number;
      
      public function ZActionBossSphinxWakeUp()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         getLogger("boss").info("boss wakeup");
         super.enterState(param1);
         _gameObject.animation.addEventListener(Event.COMPLETE,this.onComplete);
         _gameObject.animation.gotoAndPlay("wakeup");
      }
      
      private function onComplete(param1:Event) : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onComplete);
         _gameObject.objectModel.removeBuff(TDConstant.TDBuffID_God);
         _gameObject.setAction(TDConstant.ZAction_BossSphinx_WaitingAngle);
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
