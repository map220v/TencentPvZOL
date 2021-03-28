package com.qq.modules.td.logic.action.plant.boomerang
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.logic.action.plant.basic.PlantSpecialSkillAction;
   import tencent.tools.planMachine.DelayPlan;
   import tencent.tools.planMachine.ICallBack;
   import tencent.tools.planMachine.Plan;
   
   public class PBoomerangSpecialSkillAction extends PlantSpecialSkillAction implements ICallBack
   {
       
      
      private var shootNum:int = 8;
      
      private var callBackStep:int = 0;
      
      public function PBoomerangSpecialSkillAction()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         var _loc2_:PlanPlayAnimation = new PlanPlayAnimation(this._plant,"plantfoodON");
         this.callBackStep = 1;
         _loc2_.doPlan(this);
         _plant.setFrozenAI(true);
      }
      
      public function planCallBack() : void
      {
         if(this.callBackStep == 1)
         {
            this._plant.animation.gotoAndPlay("plantfood_idle",true);
            TDSoundCmd.playPlantSpecialAttack(_gameObject.objectModel.staticInfo.type);
            this.shootBullet(TDConstant.BULLET_DIR_RIGHT);
            this.shootBullet(TDConstant.BULLET_DIR_BOTTOM);
            this.shootBullet(TDConstant.BULLET_DIR_LEFT);
            this.shootBullet(TDConstant.BULLET_DIR_TOP,true);
         }
         else if(this.callBackStep == 2)
         {
            this.shootCompleteHandler();
         }
         else if(this.callBackStep == 3)
         {
            this.shootActionCompleteHandler();
         }
      }
      
      private function shootBullet(param1:int, param2:Boolean = false) : void
      {
         var _loc3_:Plan = null;
         var _loc4_:DelayPlan = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         while(_loc8_ < this.shootNum)
         {
            _loc6_ = Math.random() > 0.5 ? 1 : -1;
            _loc5_ = Math.round(Math.random() * 25) * _loc6_;
            _loc7_ = Math.round(Math.random() * 100);
            if(param1 == TDConstant.BULLET_DIR_LEFT || param1 == TDConstant.BULLET_DIR_RIGHT)
            {
               _loc4_ = new DelayPlan(new PlanShootBullet(_plant,null,_plant.plantData.plantStaticInfo.baseInfo.bulletType,0,_loc5_,param1),100 * _loc8_ + _loc7_);
            }
            else
            {
               _loc4_ = new DelayPlan(new PlanShootBullet(_plant,null,_plant.plantData.plantStaticInfo.baseInfo.bulletType,_loc5_,0,param1),100 * _loc8_ + _loc7_);
            }
            if(_loc8_ == this.shootNum - 1 && param2)
            {
               _loc3_ = _loc4_;
            }
            else
            {
               _loc4_.doPlan(null);
            }
            _loc8_++;
         }
         if(_loc3_)
         {
            this.callBackStep = 2;
            _loc3_.doPlan(this);
         }
      }
      
      private function shootCompleteHandler() : void
      {
         var _loc1_:PlanPlayAnimation = new PlanPlayAnimation(this._plant,"plantfoodOFF");
         this.callBackStep = 3;
         _loc1_.doPlan(this);
      }
      
      private function shootActionCompleteHandler() : void
      {
         _plant.setFrozenAI(false);
      }
   }
}
