package com.qq.modules.td.logic.action.plant.peashooter
{
   import asgui.events.FrameEvent;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.TDFireBulletCmd;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.logic.action.plant.basic.PlantSpecialSkillAction;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.utils.DMath;
   import flash.events.Event;
   
   public class PPeaShooterActionSpecialSkill extends PlantSpecialSkillAction
   {
       
      
      private var _isShooting:Boolean;
      
      private var _lastUpdateTime:Number;
      
      private var _counter:int;
      
      private var _max:int;
      
      private var _bulletNum:int = 3;
      
      private var _maxBullet:int;
      
      public function PPeaShooterActionSpecialSkill()
      {
         super();
         setActionTimeScale(3);
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_Plantfood_on);
         _plant.animation.addEventListener(Event.COMPLETE,this.onFinishPlantfood_on);
         this._isShooting = false;
         this._lastUpdateTime = -1;
         this._counter = 0;
         this._maxBullet = _plant.plantData.plantStaticInfo.baseInfo.getSpecialSkillParam(TDConstant.SpecialSkill_Param_ShootMaxBullet);
      }
      
      private function onFinishPlantfood_on(param1:Event) : void
      {
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishPlantfood_on);
         _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_Plantfood,true);
         _plant.animation.addEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
      }
      
      private function onShoot(param1:FrameEvent) : void
      {
         if(param1.frameLabel == "shoot")
         {
            TDSoundCmd.playPlantSpecialAttack(_gameObject.objectModel.staticInfo.type);
            _plant.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
            this._isShooting = true;
         }
      }
      
      override public function runningState() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:String = null;
         super.runningState();
         if(this._isShooting)
         {
            _loc1_ = TDGameInfo.getInstance().getCurGameTime();
            if(_loc1_ - this._lastUpdateTime > 100)
            {
               _loc2_ = 0;
               while(_loc2_ < this._bulletNum)
               {
                  if(this._counter >= this._maxBullet)
                  {
                     this.onFinishPlantfood(null);
                     return;
                  }
                  _loc3_ = DMath.randNum(0,60) + 10;
                  _loc4_ = DMath.randNum(-15,15);
                  _loc5_ = _plant.plantData.plantStaticInfo.baseInfo.getSpecialSkillParamStr(TDConstant.SpecialSkill_Param_ShootBoneName);
                  TDFireBulletCmd.shoot(_plant,_plant.curAttackTarget,_plant.plantData.plantStaticInfo.baseInfo.bulletType,_loc5_,_loc3_,_loc4_);
                  ++this._counter;
                  _loc2_++;
               }
               this._lastUpdateTime = _loc1_;
            }
         }
      }
      
      private function onFinishPlantfood(param1:Event) : void
      {
         this._isShooting = false;
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
