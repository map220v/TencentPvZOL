package com.qq.modules.td.logic.action.plant.flytrap
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.effects.TDEffectCmd;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.action.plant.BasicPlantAction;
   import com.qq.modules.td.logic.bt_ai.aiNode.executeNode.plant.ExePlantResetDuration;
   import com.qq.modules.td.logic.bt_ai.aiNode.requireNode.ReqPlantDurationExpire;
   import com.qq.modules.td.logic.numeric.TDDamageCaculete;
   import com.qq.modules.td.logic.talent.TalentManager;
   import com.qq.modules.td.logic.unit.plant.BasicPlant;
   import com.qq.modules.td.logic.unit.zombie.BasicZombie;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.events.Event;
   
   public class PFlytrapActionEat extends BasicPlantAction
   {
       
      
      private var _isAttacking:Boolean = false;
      
      private var _reduceBlood:Number;
      
      private var _lastReduceTime:int;
      
      public function PFlytrapActionEat()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _gameObject.setFrozenAI(true);
         _gameObject.animation.addEventListener(Event.COMPLETE,this.onCompleteAttackOn);
         _gameObject.animation.gotoAndPlay(TDConstant.PlantAnmi_Attack_on,1);
         this._reduceBlood = TalentManager.instance.getFlyTrapCatchHp((_gameObject as BasicPlant).plantData.plantStaticInfo);
      }
      
      private function onCompleteAttackOn(param1:Event) : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onCompleteAttackOn);
         if(this.curAttackZombie)
         {
            this._isAttacking = true;
            _gameObject.animation.gotoAndPlay(TDConstant.PlantAnmi_Attack,true);
            this.curAttackZombie.setLocation(this.zombieCatchPosX,this.curAttackZombie.y);
         }
         else
         {
            _gameObject.setAction();
            _gameObject.setFrozenAI(false);
         }
      }
      
      override public function runningState() : void
      {
         var _loc1_:int = 0;
         super.runningState();
         if(this._isAttacking)
         {
            if(this.curAttackZombie && this.curAttackZombie.zombieData.isAlive() && this.curAttackZombie.x == this.zombieCatchPosX)
            {
               if(ReqPlantDurationExpire.calculate(_gameObject))
               {
                  this.curAttackZombie.objectModel.addBuff(TDConstant.TDBuffID_Stun,_plant);
                  ExePlantResetDuration.calculate(_gameObject);
                  TDDamageCaculete.caculatePlantAttckDamage(_plant,_gameObject.curAttackTarget);
                  TDEffectCmd.playBambooLiHitEffect(_gameObject,_gameObject.curAttackTarget);
                  _loc1_ = TDGameInfo.getInstance().getCurGameTime();
                  if(this._lastReduceTime == 0 || _loc1_ - this._lastReduceTime >= 500)
                  {
                     this._lastReduceTime = _loc1_;
                     TDDamageCaculete.executeDamage(this.curAttackZombie,-this._reduceBlood,TDConstant.AttackType_Normal,TDConstant.AttackMode_Normal,null);
                  }
               }
            }
            else
            {
               this._isAttacking = false;
               _gameObject.setAttackTarget(null);
               _gameObject.animation.addEventListener(Event.COMPLETE,this.onAllCompleteAttack);
               _gameObject.animation.gotoAndPlay(TDConstant.PlantAnmi_Attack_off,1);
            }
         }
      }
      
      private function onAllCompleteAttack(param1:Event) : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onAllCompleteAttack);
         _gameObject.setAction();
         _gameObject.setFrozenAI(false);
      }
      
      override public function leaveState() : void
      {
         var _loc1_:int = 0;
         if(this.curAttackZombie)
         {
            _loc1_ = TalentManager.instance.getAddBuffId((_gameObject as BasicPlant).plantData.plantStaticInfo);
            if(_loc1_ > 0)
            {
               this.curAttackZombie.objectModel.removeBuff(_loc1_);
            }
         }
         super.leaveState();
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onCompleteAttackOn);
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onAllCompleteAttack);
      }
      
      private function get curAttackZombie() : BasicZombie
      {
         return _gameObject.curAttackTarget as BasicZombie;
      }
      
      private function get zombieCatchPosX() : int
      {
         var _loc1_:TDMapTileData = TDGameInfo.getInstance().getRoadTileByIndex(_gameObject.objectModel.tileIndex);
         return _gameObject.x + (!!_loc1_ ? _loc1_.rect.width : 0) + (!!this.curAttackZombie ? this.curAttackZombie.damageArea.width * 0.5 : 0) - 35;
      }
   }
}
