package com.qq.modules.td.logic.action.plant.repeater
{
   import asgui.events.FrameEvent;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.TDFireBulletCmd;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.logic.action.plant.basic.PlantSpecialSkillAction;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.utils.DMath;
   import flash.events.Event;
   
   public class PPeaRepeatShooterActionSpecialSkill extends PlantSpecialSkillAction
   {
       
      
      private var _isShooting:Boolean;
      
      private var _timeScale:Number;
      
      private var _lastUpdateTime:Number;
      
      private var _counter:int;
      
      private var _max:int;
      
      private var _bulletNum:int = 5;
      
      public function PPeaRepeatShooterActionSpecialSkill()
      {
         super();
         setActionTimeScale(3);
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         this._timeScale = _plant.timeScale;
         _plant.animation.gotoAndPlay("plantfood",true);
         _plant.animation.addEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
         this._isShooting = false;
         this._lastUpdateTime = -1;
         this._counter = 0;
         this._max = _plant.plantData.plantStaticInfo.baseInfo.getSpecialSkillParam(TDConstant.SpecialSkill_Param_ShootMaxBullet) / this._bulletNum;
      }
      
      private function onFinishPlantfood1(param1:Event) : void
      {
         this._isShooting = false;
         _plant.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
         _plant.setTimeScale(1);
         _plant.animation.gotoAndPlay("plantfood2");
         _plant.animation.addEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onBigShoot);
         _plant.animation.addEventListener(Event.COMPLETE,this.onFinishPlantfood2);
      }
      
      private function onFinishPlantfood2(param1:Event) : void
      {
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishPlantfood2);
         finishSpecialSkill();
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
      
      private function onBigShoot(param1:FrameEvent) : void
      {
         var _loc2_:String = null;
         var _loc3_:int = 0;
         if(param1.frameLabel == "shoot")
         {
            _loc2_ = _plant.plantData.plantStaticInfo.baseInfo.getSpecialSkillParamStr(TDConstant.SpecialSkill_Param_ShootBoneName);
            _loc3_ = _plant.plantData.plantStaticInfo.baseInfo.getSpecialSkillParam(TDConstant.SpecialSkill_Param_ShootBulletType);
            TDFireBulletCmd.shoot(_plant,_plant.curAttackTarget,_loc3_,_loc2_,0,0,1,true);
            TDSoundCmd.playRepeatBigBulletShoot();
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
                  _loc3_ = 30 + _loc2_ * 20;
                  _loc4_ = DMath.randNum(-20,20);
                  _loc5_ = _plant.plantData.plantStaticInfo.baseInfo.getSpecialSkillParamStr(TDConstant.SpecialSkill_Param_ShootBoneName);
                  TDFireBulletCmd.shoot(_plant,_plant.curAttackTarget,_plant.plantData.plantStaticInfo.baseInfo.bulletType,_loc5_,_loc3_,_loc4_);
                  _loc2_++;
               }
               ++this._counter;
               this._lastUpdateTime = _loc1_;
            }
            if(this._counter > this._max)
            {
               this.onFinishPlantfood1(null);
            }
         }
      }
      
      override public function leaveState() : void
      {
         super.leaveState();
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishPlantfood2);
         _plant.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
         _plant.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onBigShoot);
      }
   }
}
