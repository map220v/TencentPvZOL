package com.qq.modules.td.logic.action.zombie.emperorQin
{
   import asgui.events.FrameEvent;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.skill.TDSkillCmd;
   import com.qq.modules.td.data.game.skill.TDSkillInfo;
   import com.qq.modules.td.logic.action.zombie.BasicZombieAction;
   import flash.events.Event;
   
   public class ZActionEmperorQinCastSkill extends BasicZombieAction
   {
       
      
      public function ZActionEmperorQinCastSkill()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _gameObject.setFrozenAI(true);
         _gameObject.animation.addEventListener(Event.COMPLETE,this.onComplete);
         _gameObject.animation.addEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onCastSkill);
         var _loc2_:TDSkillInfo = _gameObject.getRunningProp(TDConstant.GameObject_Prop_CastSkillData) as TDSkillInfo;
         if(_loc2_.skillType == "changePath")
         {
            _gameObject.animation.gotoAndPlay("skill_2");
         }
         else if(_loc2_.skillType == "changeTerrain")
         {
            _gameObject.animation.gotoAndPlay("skill_3");
         }
         else if(_loc2_.skillType == "speedUp")
         {
            _gameObject.animation.gotoAndPlay("skill");
         }
      }
      
      private function onComplete(param1:Event) : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onComplete);
         _gameObject.cleanRunningProp(TDConstant.GameObject_Prop_CastSkillData);
         _gameObject.setAction();
         _gameObject.setFrozenAI(false);
      }
      
      override public function runningState() : void
      {
         super.runningState();
      }
      
      private function onCastSkill(param1:FrameEvent) : void
      {
         var _loc2_:TDSkillInfo = null;
         if(param1.frameLabel == "cast")
         {
            _gameObject.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onCastSkill);
            _loc2_ = _gameObject.getRunningProp(TDConstant.GameObject_Prop_CastSkillData) as TDSkillInfo;
            if(_loc2_.skillType == "changePath")
            {
               TDSkillCmd.changePath(_loc2_);
            }
            else if(_loc2_.skillType == "changeTerrain")
            {
               TDSkillCmd.changeTerrain(_loc2_);
            }
            else if(_loc2_.skillType == "speedUp")
            {
               TDSkillCmd.addZombieSpeedUpBuff();
            }
         }
      }
      
      override public function leaveState() : void
      {
         _gameObject.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onCastSkill);
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onComplete);
         super.leaveState();
      }
   }
}
