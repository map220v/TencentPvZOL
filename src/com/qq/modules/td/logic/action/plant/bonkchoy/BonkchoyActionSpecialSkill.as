package com.qq.modules.td.logic.action.plant.bonkchoy
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.logic.action.plant.basic.PlantSpecialSkillAction;
   import com.qq.modules.td.logic.bt_ai.aiUtils.TDSearchTargetUtils;
   import com.qq.modules.td.logic.numeric.TDCheckCollision;
   import com.qq.modules.td.logic.numeric.TDDamageCaculete;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.utils.DelayManager;
   import flash.events.Event;
   
   public class BonkchoyActionSpecialSkill extends PlantSpecialSkillAction
   {
       
      
      public var _lastAttackTime:Number;
      
      private var _skillEndDelay:int;
      
      private var _hasFinished:Boolean;
      
      public function BonkchoyActionSpecialSkill()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_Plantfood_on);
         _plant.animation.addEventListener(Event.COMPLETE,this.onFinishPlantfood_on);
         this._lastAttackTime = -1;
      }
      
      override public function runningState() : void
      {
         var _loc2_:Array = null;
         var _loc3_:Boolean = false;
         var _loc4_:int = 0;
         var _loc5_:IGameObject = null;
         super.runningState();
         var _loc1_:Number = TDGameInfo.getInstance().getCurGameTime();
         if(_plant.animation.getLastLabel() == TDConstant.PlantAnmi_Plantfood)
         {
            if(this._lastAttackTime == -1)
            {
               this._lastAttackTime = _loc1_;
            }
            if(_loc1_ - this._lastAttackTime >= 33)
            {
               _loc2_ = TDSearchTargetUtils.getZombieList(_plant);
               _loc3_ = false;
               _loc4_ = 0;
               while(_loc4_ < _loc2_.length)
               {
                  _loc5_ = _loc2_[_loc4_];
                  if(TDCheckCollision.isCollision(_plant,_plant.attackArea,_loc5_,_loc5_.damageArea))
                  {
                     TDDamageCaculete.caculatePlantAttckDamage(_plant,_loc5_,0,true);
                     _loc3_ = true;
                  }
                  _loc4_++;
               }
               if(_loc3_)
               {
                  TDSoundCmd.zombieHitByBonkchoySpecialSkill();
               }
               TDSoundCmd.bonkchoyAttack(TDConstant.Bonkchoy_AttckType_NoAttack);
               this._lastAttackTime = _loc1_;
            }
         }
      }
      
      private function onFinishPlantfood_on(param1:Event) : void
      {
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishPlantfood_on);
         _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_Plantfood,3);
         _plant.animation.addEventListener(Event.COMPLETE,this.onFinishPlantfood);
         TDSoundCmd.zombieHitByBonkchoySpecialSkill();
         this._skillEndDelay = DelayManager.getInstance().addDelay(8000,this.endSkill);
      }
      
      private function endSkill() : void
      {
         DelayManager.getInstance().removeDelay(this._skillEndDelay);
         if(!this._hasFinished)
         {
            this._hasFinished = true;
            if(_plant)
            {
               finishSpecialSkill();
            }
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
         this._hasFinished = true;
         finishSpecialSkill();
      }
      
      override public function leaveState() : void
      {
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishPlantfood_on);
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishPlantfood);
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishPlantfood_off);
         super.leaveState();
      }
   }
}
