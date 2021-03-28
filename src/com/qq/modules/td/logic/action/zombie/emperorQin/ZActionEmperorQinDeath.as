package com.qq.modules.td.logic.action.zombie.emperorQin
{
   import com.greensock.TweenMax;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.TDGameCmd;
   import com.qq.modules.td.logic.action.basic.BasicAction;
   import flash.events.Event;
   
   public class ZActionEmperorQinDeath extends BasicAction
   {
       
      
      public function ZActionEmperorQinDeath()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _gameObject.animation.addEventListener(Event.COMPLETE,this.onComplete);
         _gameObject.animation.gotoAndPlay("die");
      }
      
      override public function leaveState() : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onComplete);
         super.leaveState();
      }
      
      override public function runningState() : void
      {
         super.runningState();
      }
      
      private function onComplete(param1:Event) : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onComplete);
         TDGameCmd.ImmediatelyWinGame();
         TweenMax.to(_gameObject,0.3,{
            "alpha":0,
            "delay":1,
            "onComplete":this.onFinishDisappear
         });
      }
      
      private function onFinishDisappear() : void
      {
         if(_gameObject == null || !_gameObject.isVaild)
         {
            return;
         }
         _gameObject.setAction(TDConstant.ZAction_Disappear,null,true);
      }
   }
}
