package com.qq.modules.td.logic.action.zombie.supervisor
{
   import asgui.events.FrameEvent;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.skill.TDSkillCmd;
   import com.qq.modules.td.logic.action.zombie.basic.ZombieActionWalk;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.events.Event;
   
   public class ZombieActionSupervisonAddSpeed extends ZombieActionWalk
   {
       
      
      public function ZombieActionSupervisonAddSpeed()
      {
         super();
         _walkAnimFlagName = "walk1";
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _zombie.animation.addEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onWhip);
         _zombie.animation.addEventListener(Event.COMPLETE,this.onComplete);
         _zombie.animation.gotoAndPlay(_walkAnimFlagName,false);
      }
      
      private function onWhip(param1:FrameEvent) : void
      {
         if(param1.frameLabel == "whip")
         {
            TDSkillCmd.addZombieSpeedUpBuffWithGameObjects([_zombie]);
            _gameObject.setTimeRecord(TDConstant.TimeRecord_ZombieDuration,TDGameInfo.getInstance().getCurGameTime());
         }
      }
      
      private function onComplete(param1:Event) : void
      {
         _zombie.setAction();
      }
      
      override public function leaveState() : void
      {
         super.leaveState();
         _zombie.animation.removeEventListener(Event.COMPLETE,this.onComplete);
         _zombie.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onWhip);
      }
   }
}
