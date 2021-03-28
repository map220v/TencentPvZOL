package com.qq.modules.td.logic.action.plant.pomegranate
{
   import asgui.events.FrameEvent;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.TDFireBulletCmd;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.logic.action.plant.basic.PlantSpecialSkillAction;
   import com.qq.modules.td.logic.bt_ai.aiUtils.TDSearchTargetUtils;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import flash.events.Event;
   
   public class PPomegranateActionSpecialSkill extends PlantSpecialSkillAction
   {
       
      
      private const MAX_TARGET_COUNT:int = 5;
      
      private var _attackTarget:Vector.<IGameObject>;
      
      public function PPomegranateActionSpecialSkill()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_Plantfood);
         _plant.animation.addEventListener(Event.COMPLETE,this.onFinishPlantfood);
         _plant.animation.addEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
         this._attackTarget = this.getAttackTarget();
      }
      
      private function getAttackTarget() : Vector.<IGameObject>
      {
         var _loc3_:IGameObject = null;
         var _loc1_:Vector.<IGameObject> = new Vector.<IGameObject>();
         var _loc2_:Array = TDSearchTargetUtils.getZombieList(_plant,null,true,null,null,true);
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
      
      private function onShoot(param1:FrameEvent) : void
      {
         if(param1.frameLabel == "shoot")
         {
            this.shootRocket();
         }
      }
      
      private function shootRocket() : void
      {
         var _loc1_:IGameObject = this._attackTarget.pop();
         if(_loc1_ && _loc1_.isVaild)
         {
            TDFireBulletCmd.shoot(_plant,_loc1_,_plant.plantData.plantStaticInfo.baseInfo.getSpecialSkillParam(TDConstant.SpecialSkill_Param_ShootBulletType),null,0,-50,1,true);
            TDSoundCmd.playPlantSpecialAttack(_gameObject.objectModel.staticInfo.type);
         }
      }
      
      private function onFinishPlantfood(param1:Event) : void
      {
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishPlantfood);
         finishSpecialSkill();
      }
      
      override public function leaveState() : void
      {
         super.leaveState();
         this._attackTarget = null;
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishPlantfood);
         _plant.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
      }
   }
}
