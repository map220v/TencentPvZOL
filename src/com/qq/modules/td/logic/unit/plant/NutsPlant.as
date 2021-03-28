package com.qq.modules.td.logic.unit.plant
{
   import com.qq.CommandName;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.logic.log.TDLogCmd;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.logic.unit.object.TDNutsShield;
   import com.qq.utils.CommandDispatcher;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   
   public class NutsPlant extends BasicPlant
   {
       
      
      public var customId:uint;
      
      private var _tempUnmatched:Boolean;
      
      private var _t_timeOut:int;
      
      public function NutsPlant()
      {
         super();
      }
      
      override public function start() : void
      {
         super.start();
      }
      
      override public function changeHp(param1:int, param2:int, param3:int, param4:IGameObject) : Boolean
      {
         var _loc10_:TDNutsShield = null;
         if(this._tempUnmatched)
         {
            return false;
         }
         if(param3 != TDConstant.AttackMode_ZombieLaser)
         {
            if(_loc10_ = checkNutsShield(param1,param2,param3,param4))
            {
               CommandDispatcher.send(CommandName.TD_Damage_SwitchTo_NutsShield,[_loc10_,param1,param2,param3,param4]);
               return false;
            }
         }
         var _loc5_:int = plantData.curHp.get();
         var _loc6_:int = plantData.maxHp.get();
         if(param3 == TDConstant.AttackMode_ZombieFire)
         {
            param1 = -int.MAX_VALUE;
         }
         var _loc7_:int = plantData.curArmorHp.get();
         var _loc8_:int = param1;
         if(param1 < 0 && _loc7_ > 0)
         {
            if((_loc7_ += param1) < 0)
            {
               param1 = _loc7_;
               plantData.curArmorHp.set(0);
            }
            else
            {
               param1 = 0;
               plantData.curArmorHp.set(_loc7_);
            }
            showHPState();
            updateArmor();
         }
         var _loc9_:int;
         if((_loc9_ = _loc5_ + param1) <= 0)
         {
            _loc9_ = 0;
         }
         if(_loc9_ > _loc6_)
         {
            _loc9_ = _loc6_;
         }
         if(_loc9_ != _loc5_)
         {
            plantData.curHp.set(_loc9_);
            showHPState();
         }
         if(_loc9_ <= 0)
         {
            if(param3 == TDConstant.AttackMode_Normal)
            {
               TDSoundCmd.plantByEated();
            }
            killByZombie = true;
            this.deadDeal(param3);
         }
         else if(param1 < 0)
         {
            playEatEffect();
         }
         if(_loc8_ < 0)
         {
            TDLogCmd.recordPlantDamage(uid,plantData.plantStaticInfo.id,plantData.maxArmorHp.get(),_loc7_,_loc6_,_loc9_,_loc8_);
         }
         return killByZombie;
      }
      
      private function deadDeal(param1:int) : void
      {
         if(_isSleep || param1 == TDConstant.AttackMode_ZombieLaser)
         {
            this.isSleep = false;
            this._tempUnmatched = false;
            clearTimeout(this._t_timeOut);
            dispose();
         }
         else
         {
            this.isSleep = true;
            this._tempUnmatched = true;
            this._t_timeOut = setTimeout(this.cancelUnmatched,1000);
         }
      }
      
      private function cancelUnmatched() : void
      {
         clearTimeout(this._t_timeOut);
         this._tempUnmatched = false;
      }
      
      override public function set isSleep(param1:Boolean) : void
      {
         _isSleep = param1;
         if(param1)
         {
            this.plantData.plantHeight = TDConstant.PlantHeightType_Ground;
         }
         else
         {
            this.plantData.plantHeight = TDConstant.PlantHeightType_Normal;
         }
      }
   }
}
