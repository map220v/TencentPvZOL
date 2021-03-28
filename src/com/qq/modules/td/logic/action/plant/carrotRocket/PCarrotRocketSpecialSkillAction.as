package com.qq.modules.td.logic.action.plant.carrotRocket
{
   import asgui.events.FrameEvent;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.TDFireBulletCmd;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.logic.action.plant.basic.PlantSpecialSkillAction;
   import com.qq.modules.td.logic.bt_ai.aiUtils.TDSearchTargetUtils;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class PCarrotRocketSpecialSkillAction extends PlantSpecialSkillAction
   {
       
      
      private const MAX_TARGET_COUNT:int = 4;
      
      private var attackTarget:Vector.<IGameObject>;
      
      private var timer:Timer;
      
      public function PCarrotRocketSpecialSkillAction()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_Plantfood_on);
         _plant.animation.addEventListener(Event.COMPLETE,this.onFinishPlantfood_on);
      }
      
      private function onFinishPlantfood_on(param1:Event) : void
      {
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishPlantfood_on);
         _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_Plantfood);
         _plant.animation.addEventListener(Event.COMPLETE,this.onFinishPlantfood);
         _plant.animation.addEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
      }
      
      private function getAttackTarget() : Vector.<IGameObject>
      {
         var _loc3_:IGameObject = null;
         var _loc1_:Vector.<IGameObject> = new Vector.<IGameObject>();
         var _loc2_:Array = TDSearchTargetUtils.getZombieList(_plant).sort(this.sortFunction);
         for each(_loc3_ in _loc2_)
         {
            if(_plant.x < _loc3_.x)
            {
               _loc1_.push(_loc3_);
            }
            if(_loc1_.length >= this.MAX_TARGET_COUNT)
            {
               break;
            }
         }
         return _loc1_;
      }
      
      private function sortFunction(param1:IGameObject, param2:IGameObject) : Number
      {
         return param2.x - param1.x;
      }
      
      private function onShoot(param1:FrameEvent) : void
      {
         if(param1.frameLabel == "shootStart")
         {
            _plant.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
            this.attackTarget = this.getAttackTarget();
            this.timer = new Timer(150,this.attackTarget.length - 1);
            this.timer.addEventListener(TimerEvent.TIMER,this.onTimer);
            this.timer.addEventListener(TimerEvent.TIMER_COMPLETE,this.onTimerComplete);
            this.timer.start();
            this.shootRocket();
         }
      }
      
      private function onTimer(param1:TimerEvent) : void
      {
         this.shootRocket();
      }
      
      private function onTimerComplete(param1:TimerEvent) : void
      {
         this.timer.removeEventListener(TimerEvent.TIMER,this.onTimer);
         this.timer.removeEventListener(TimerEvent.TIMER_COMPLETE,this.onTimerComplete);
      }
      
      private function shootRocket() : void
      {
         var _loc1_:IGameObject = this.attackTarget.pop();
         if(_loc1_ && _loc1_.isVaild)
         {
            TDFireBulletCmd.shoot(_plant,_loc1_,_plant.plantData.plantStaticInfo.baseInfo.getSpecialSkillParam(TDConstant.SpecialSkill_Param_ShootBulletType),_plant.plantData.plantStaticInfo.baseInfo.getSpecialSkillParamStr(TDConstant.SpecialSkill_Param_ShootBoneName),10,-40,1,true);
            TDSoundCmd.playPlantSpecialAttack(_gameObject.objectModel.staticInfo.type);
         }
      }
      
      private function onFinishPlantfood(param1:Event) : void
      {
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishPlantfood);
         _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_Plantfood_off);
         _plant.animation.addEventListener(Event.COMPLETE,this.onFinishPlantfood_off);
      }
      
      private function onFinishPlantfood_off(param1:Event) : void
      {
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishPlantfood_off);
         finishSpecialSkill();
      }
      
      override public function leaveState() : void
      {
         super.leaveState();
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishPlantfood_on);
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishPlantfood);
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishPlantfood_off);
         _plant.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
         if(this.timer)
         {
            this.timer.removeEventListener(TimerEvent.TIMER,this.onTimer);
            this.timer.stop();
            this.timer = null;
         }
      }
   }
}
