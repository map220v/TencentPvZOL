package com.qq.modules.td.logic.action.zombie.tombraiser
{
   import asgui.events.FrameEvent;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.TDFireBulletCmd;
   import com.qq.modules.td.logic.action.zombie.BasicZombieAction;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.events.Event;
   
   public class ZombieTombraiserActionThrow extends BasicZombieAction
   {
       
      
      public function ZombieTombraiserActionThrow()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _gameObject.animation.gotoAndPlay("power",1);
         _gameObject.animation.addEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onThrow);
         _gameObject.animation.addEventListener(Event.COMPLETE,this.onFinish);
      }
      
      private function onFinish(param1:Event) : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinish);
         _gameObject.setAction();
         _gameObject.setTimeRecord(TDConstant.TimeRecord_ZombieDuration,TDGameInfo.getInstance().getCurGameTime());
      }
      
      private function onThrow(param1:FrameEvent) : void
      {
         if(param1.frameLabel == "throw")
         {
            TDFireBulletCmd.zombieThrowTombBone(_gameObject);
         }
      }
      
      override public function leaveState() : void
      {
         _gameObject.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onThrow);
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinish);
      }
   }
}
