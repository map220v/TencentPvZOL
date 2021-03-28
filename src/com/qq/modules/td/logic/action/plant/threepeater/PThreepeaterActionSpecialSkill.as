package com.qq.modules.td.logic.action.plant.threepeater
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.TDFireBulletCmd;
   import com.qq.modules.td.logic.action.plant.basic.PlantSpecialSkillAction;
   import com.qq.modules.td.model.TDGameInfo;
   
   public class PThreepeaterActionSpecialSkill extends PlantSpecialSkillAction
   {
      
      private static const SHOOT_INTERVAL:int = 60;
      
      private static const MAX_ANGLE:Number = Math.PI * 0.4;
      
      private static const ANGLE_STEP_COUNT:int = 20;
       
      
      private var _lastUpdateTime:int;
      
      private var _counter:int;
      
      private var _angleStepCount:int;
      
      private var _angleStepChangeValue:int = 1;
      
      private var _shootAngle:Number;
      
      private var _maxBulletNum:int;
      
      public function PThreepeaterActionSpecialSkill()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_Plantfood,true);
         this._lastUpdateTime = -1;
         this._counter = 0;
         this._angleStepCount = 1;
         this._shootAngle = 0;
         this._maxBulletNum = _plant.plantData.plantStaticInfo.baseInfo.getSpecialSkillParam(TDConstant.SpecialSkill_Param_ShootMaxBullet);
      }
      
      override public function runningState() : void
      {
         var _loc2_:int = 0;
         super.runningState();
         if(this._counter >= this._maxBulletNum)
         {
            finishSpecialSkill();
            return;
         }
         var _loc1_:Number = TDGameInfo.getInstance().getCurGameTime();
         if(_loc1_ - this._lastUpdateTime > SHOOT_INTERVAL)
         {
            if(this._angleStepCount >= ANGLE_STEP_COUNT)
            {
               this._angleStepChangeValue = -1;
            }
            else if(this._angleStepCount <= 1)
            {
               this._angleStepChangeValue = 1;
            }
            this._angleStepCount += this._angleStepChangeValue;
            this._shootAngle = MAX_ANGLE / ANGLE_STEP_COUNT * this._angleStepCount;
            _loc2_ = -1;
            while(_loc2_ <= 1)
            {
               TDFireBulletCmd.shoot(_plant,_plant.curAttackTarget,_plant.plantData.plantStaticInfo.baseInfo.getSpecialSkillParam(TDConstant.SpecialSkill_Param_ShootBulletType),null,Math.random() * 10,-40,1,true,null,[this._shootAngle * _loc2_]);
               _loc2_++;
            }
            ++this._counter;
            this._lastUpdateTime = _loc1_;
         }
      }
      
      override public function leaveState() : void
      {
         super.leaveState();
      }
   }
}
