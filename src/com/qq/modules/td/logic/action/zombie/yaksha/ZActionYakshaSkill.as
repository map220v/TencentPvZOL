package com.qq.modules.td.logic.action.zombie.yaksha
{
   import asgui.events.FrameEvent;
   import com.qq.constant.td.TDConstant;
   import com.qq.constant.td.TDObjTypeID;
   import com.qq.modules.td.command.game.TDGameObjectCmd;
   import com.qq.modules.td.logic.TDFactory;
   import com.qq.modules.td.logic.action.zombie.BasicZombieAction;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.events.Event;
   
   public class ZActionYakshaSkill extends BasicZombieAction
   {
       
      
      public function ZActionYakshaSkill()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _gameObject.setTimeRecord(TDConstant.TimeRecord_ZombieDuration,TDGameInfo.getInstance().getCurGameTime());
         _zombie.animation.gotoAndPlay("skill_on");
         _zombie.animation.addEventListener(Event.COMPLETE,this.finishSkillOn);
         _zombie.setFrozenAI(true);
      }
      
      private function finishSkillOn(param1:Event) : void
      {
         _zombie.animation.removeEventListener(Event.COMPLETE,this.finishSkillOn);
         _zombie.animation.gotoAndPlay("skill");
         _zombie.animation.addEventListener(Event.COMPLETE,this.finishSkill);
         _zombie.animation.addEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
      }
      
      private function finishSkill(param1:Event) : void
      {
         _zombie.animation.removeEventListener(Event.COMPLETE,this.finishSkill);
         _zombie.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
         _zombie.animation.gotoAndPlay("skill_off");
         _zombie.animation.addEventListener(Event.COMPLETE,this.finishSkillOff);
      }
      
      private function finishSkillOff(param1:Event) : void
      {
         _zombie.animation.removeEventListener(Event.COMPLETE,this.finishSkillOff);
         _zombie.setFrozenAI(false);
         _zombie.setAction();
      }
      
      private function onShoot(param1:FrameEvent) : void
      {
         var _loc2_:IGameObject = null;
         if(param1.frameLabel == "shoot")
         {
            _zombie.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
            TDGameObjectCmd.addNormalGameObjectByPos(TDObjTypeID.Obj_YakshaStorm_Move,_zombie.x - 25,_zombie.y - 35);
            _loc2_ = TDGameInfo.getInstance().getGameObjctByUID(TDFactory.getLastUnitUin());
            _loc2_.setAction(TDConstant.YakshaStormMove);
         }
      }
      
      override public function leaveState() : void
      {
         _zombie.animation.removeEventListener(Event.COMPLETE,this.finishSkillOn);
         _zombie.animation.removeEventListener(Event.COMPLETE,this.finishSkill);
         _zombie.animation.removeEventListener(Event.COMPLETE,this.finishSkillOff);
         _zombie.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
         super.leaveState();
      }
   }
}
