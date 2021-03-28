package com.qq.modules.td.logic.action.plant.pineapple
{
   import asgui.events.FrameEvent;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.TDFireBulletCmd;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.logic.action.plant.basic.PlantSpecialSkillAction;
   import com.qq.modules.td.logic.bt_ai.aiUtils.TDSearchTargetUtils;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.events.Event;
   
   public class PPineappleActionSpecialSkill extends PlantSpecialSkillAction
   {
       
      
      private const MAX_TARGET_COUNT:int = 5;
      
      private var attackTarget:Vector.<IGameObject>;
      
      public function PPineappleActionSpecialSkill()
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
         this.attackTarget = this.getAttackTarget();
         var _loc2_:int = this.attackTarget.length > 0 ? int(this.attackTarget.length) : 1;
         _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_Plantfood,_loc2_);
         _plant.animation.addEventListener(Event.COMPLETE,this.onFinishPlantfood);
         _plant.animation.addEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
      }
      
      private function getAttackTarget() : Vector.<IGameObject>
      {
         var _loc2_:Array = null;
         var _loc3_:IGameObject = null;
         var _loc1_:Vector.<IGameObject> = new Vector.<IGameObject>();
         var _loc4_:int = TDGameInfo.getInstance().minRow;
         while(_loc4_ <= TDGameInfo.getInstance().maxRow)
         {
            _loc2_ = TDSearchTargetUtils.getZombieList(_plant,[_loc4_]).sort(this.sortFunction);
            if(_loc2_.length > 0)
            {
               _loc3_ = _loc2_[_loc2_.length - 1];
               if(_plant.x < _loc3_.x)
               {
                  _loc1_.push(_loc3_);
               }
            }
            _loc4_++;
         }
         return _loc1_;
      }
      
      private function sortFunction(param1:IGameObject, param2:IGameObject) : Number
      {
         return param2.x - param1.x;
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
         var _loc1_:IGameObject = this.attackTarget.shift();
         if(_loc1_ && _loc1_.isVaild)
         {
            TDFireBulletCmd.shoot(_plant,_loc1_,_plant.plantData.plantStaticInfo.baseInfo.getSpecialSkillParam(TDConstant.SpecialSkill_Param_ShootBulletType),null,0,-90,1,true);
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
      }
   }
}
