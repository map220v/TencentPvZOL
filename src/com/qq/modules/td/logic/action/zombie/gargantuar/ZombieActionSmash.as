package com.qq.modules.td.logic.action.zombie.gargantuar
{
   import asgui.events.FrameEvent;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.action.zombie.BasicZombieAction;
   import com.qq.modules.td.logic.numeric.TDDamageCaculete;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import flash.events.Event;
   
   public class ZombieActionSmash extends BasicZombieAction
   {
       
      
      public function ZombieActionSmash()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _zombie.setFrozenAI(true);
         _zombie.animation.gotoAndPlay(TDConstant.ZombieAnmi_Eat);
         _zombie.animation.addEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onAttack);
         _zombie.animation.addEventListener(Event.COMPLETE,this.onComplete);
      }
      
      override public function leaveState() : void
      {
         _zombie.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onAttack);
         _zombie.animation.removeEventListener(Event.COMPLETE,this.onComplete);
      }
      
      private function onComplete(param1:Event) : void
      {
         _zombie.setFrozenAI(false);
         _zombie.setAction();
      }
      
      private function onAttack(param1:FrameEvent) : void
      {
         var _loc2_:IGameObject = null;
         if(param1.frameLabel == "smash")
         {
            if(_zombie.curAttackTarget != null)
            {
               _loc2_ = _zombie.curAttackTarget;
               if(_loc2_ != null && _loc2_.objectModel.isAlive())
               {
                  TDDamageCaculete.caculateZombieDamage(_zombie,_loc2_);
               }
            }
         }
      }
   }
}
