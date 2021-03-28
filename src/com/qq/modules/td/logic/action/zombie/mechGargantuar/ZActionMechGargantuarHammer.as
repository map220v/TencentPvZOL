package com.qq.modules.td.logic.action.zombie.mechGargantuar
{
   import asgui.events.FrameEvent;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.action.zombie.BasicZombieAction;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.logic.unit.plant.BasicPlant;
   import com.qq.modules.td.logic.unit.zombie.BasicZombie;
   import flash.events.Event;
   
   public class ZActionMechGargantuarHammer extends BasicZombieAction
   {
       
      
      public function ZActionMechGargantuarHammer()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _gameObject.setFrozenAI(true);
         _gameObject.animation.addEventListener(Event.COMPLETE,this.onFinish);
         _gameObject.animation.addEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onSmash);
         this._gameObject.animation.gotoAndPlay("smash");
         if(_gameObject.getRunningProp(TDConstant.Gameobject_Prop_Mech_Gargantuar_Has_Summoned) == true)
         {
            (_gameObject as BasicZombie).setBoneVisible("pod",false);
         }
      }
      
      protected function onSmash(param1:FrameEvent) : void
      {
         if(param1.frameLabel == "shoot1")
         {
            this.hammer();
         }
         else if(param1.frameLabel == "shoot2")
         {
            this.hammer();
         }
      }
      
      private function onFinish(param1:Event = null) : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinish);
         _gameObject.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onSmash);
         _gameObject.setAction();
         _gameObject.setFrozenAI(false);
      }
      
      override public function leaveState() : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinish);
         _gameObject.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onSmash);
         super.leaveState();
      }
      
      private function hammer() : void
      {
         var _loc2_:BasicPlant = null;
         var _loc3_:Number = NaN;
         var _loc1_:IGameObject = _gameObject.curAttackTarget;
         if(_loc1_)
         {
            if(_loc1_ is BasicPlant)
            {
               _loc2_ = _loc1_ as BasicPlant;
               if(_loc2_.plantData.plantStaticInfo.id == TDConstant.PlantType_SpikeRock)
               {
                  _loc3_ = _loc2_.plantData.maxHp.get() * 0.34;
               }
               else
               {
                  _loc3_ = _loc2_.plantData.maxHp.get() * 0.5;
               }
               _loc2_.changeHp(0 - _loc3_,TDConstant.AttackType_Normal,TDConstant.AttackMode_Normal,_zombie);
            }
            else
            {
               _loc1_.changeHp(-_zombie.zombieData.zombiestaticInfo.attackValue * 0.1,TDConstant.AttackType_Normal,TDConstant.AttackMode_Normal,_zombie);
            }
         }
      }
   }
}
