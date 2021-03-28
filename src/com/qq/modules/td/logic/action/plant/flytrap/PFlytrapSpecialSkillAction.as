package com.qq.modules.td.logic.action.plant.flytrap
{
   import asgui.events.FrameEvent;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.action.plant.basic.PlantSpecialSkillAction;
   import com.qq.modules.td.logic.numeric.TDDamageCaculete;
   import com.qq.modules.td.logic.unit.zombie.BasicZombie;
   import flash.events.Event;
   
   public class PFlytrapSpecialSkillAction extends PlantSpecialSkillAction
   {
       
      
      public function PFlytrapSpecialSkillAction()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_Skill);
         _plant.animation.addEventListener(Event.COMPLETE,this.onFinishAction);
         _plant.animation.addEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onSwallow);
      }
      
      override public function runningState() : void
      {
         super.runningState();
      }
      
      private function onSwallow(param1:FrameEvent) : void
      {
         var _loc2_:BasicZombie = null;
         if(param1.frameLabel == "swallow")
         {
            _plant.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onSwallow);
            _loc2_ = this.getSwallowTarget();
            if(_loc2_)
            {
               if(_loc2_.zombieData.zombiestaticInfo.catalog == TDConstant.ZombieCatalog_Normal)
               {
                  TDDamageCaculete.caculatePlantAttckDamage(_plant,_loc2_,0,true,_plant.plantData.plantStaticInfo.baseInfo.damageType);
               }
            }
         }
      }
      
      private function onFinishAction(param1:Event) : void
      {
         finishSpecialSkill();
      }
      
      override public function leaveState() : void
      {
         super.leaveState();
      }
      
      private function getSwallowTarget() : BasicZombie
      {
         return _plant.curAttackTarget as BasicZombie;
      }
   }
}
