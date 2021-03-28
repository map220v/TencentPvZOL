package com.qq.modules.battle.model.vo
{
   import PVZ.Cmd.Dto_FightAction;
   import PVZ.Cmd.Dto_FightDamage;
   import PVZ.Cmd.Dto_FightPuppetInfo;
   import PVZ.Cmd.E_FightActionType;
   import com.qq.modules.battle.constant.BattleConst;
   import com.qq.modules.battle.model.BattleBuffInfo;
   import com.qq.modules.battle.model.BattleFightModel;
   import com.tencent.protobuf.Int64;
   
   public class FightDamageVo
   {
       
      
      private var _damage:Dto_FightDamage;
      
      private var _isAddBuff:Boolean;
      
      public var buffInfo:BattleBuffInfo;
      
      public var realseActorIndex:int;
      
      public var skillID:int;
      
      public function FightDamageVo()
      {
         super();
      }
      
      public static function fromDtoFightDamage(param1:Dto_FightAction, param2:Dto_FightDamage) : FightDamageVo
      {
         var _loc3_:FightDamageVo = new FightDamageVo();
         var _loc4_:int = -1;
         var _loc5_:int = -1;
         if(param1.actionType == E_FightActionType.E_FightActionType_Attack && param1.actor != null)
         {
            _loc4_ = param1.actor.actorIndex;
            _loc5_ = param1.actor.skillId;
         }
         _loc3_.setDamage(param2,_loc4_,_loc5_);
         _loc3_.isAddBuff = param2.isAddBuff;
         return _loc3_;
      }
      
      public function clone(param1:FightDamageVo) : void
      {
         this._damage = new Dto_FightDamage();
         this._damage.buffId = param1._damage.buffId;
         this._damage.buffLeftRound = param1._damage.buffLeftRound;
         if(param1._damage.changeHp != null)
         {
            this._damage.changeHp = new Int64(param1._damage.changeHp.high,param1._damage.changeHp.low);
         }
         if(param1._damage.changeMaxHp != null)
         {
            this._damage.changeMaxHp = new Int64(param1._damage.changeMaxHp.high,param1._damage.changeMaxHp.low);
         }
         this._damage.changeRage = param1._damage.changeRage;
         if(param1._damage.changeShield != null)
         {
            this._damage.changeShield = new Int64(param1._damage.changeShield.high,param1._damage.changeShield.low);
         }
         this._damage.damageType = param1._damage.damageType;
         this._damage.isAddBuff = param1._damage.isAddBuff;
         this._damage.isDead = param1._damage.isDead;
         this._damage.isRelive = param1._damage.isRelive;
         this._damage.puppetBuffId = param1._damage.puppetBuffId;
         this._damage.targetIndex = param1._damage.targetIndex;
         this.realseActorIndex = param1.realseActorIndex;
         this.skillID = param1.skillID;
      }
      
      public function get damage() : Dto_FightDamage
      {
         return this._damage;
      }
      
      public function setDamage(param1:Dto_FightDamage, param2:int = -1, param3:int = -1) : void
      {
         var _loc4_:Dto_FightPuppetInfo = null;
         var _loc5_:int = 0;
         this._damage = param1;
         this.realseActorIndex = param2;
         this.skillID = param3;
         if(param1.buffId != 0)
         {
            this.buffInfo = new BattleBuffInfo(param1.buffId,BattleConst.BUFF_TYPE_CARD,this._damage.buffLeftRound);
         }
         else if(param1.puppetBuffId != 0)
         {
            _loc4_ = BattleFightModel.getInstance().getDummyInfoByPosIndex(param2);
            _loc5_ = 1;
            if(param3 != -1)
            {
               if(_loc4_ != null)
               {
                  if(_loc4_.activeSkill != null && _loc4_.activeSkill.id == param3)
                  {
                     _loc5_ = _loc4_.activeSkill.level;
                  }
                  if(_loc4_.passiveSkill != null && _loc4_.passiveSkill.id == param3)
                  {
                     _loc5_ = _loc4_.passiveSkill.level;
                  }
               }
            }
            this.buffInfo = new BattleBuffInfo(param1.puppetBuffId,BattleConst.BUFF_TYPE_DMMMY,this._damage.buffLeftRound,_loc5_);
         }
      }
      
      public function set targetIndex(param1:uint) : void
      {
         this._damage.targetIndex = param1;
      }
      
      public function get targetIndex() : uint
      {
         return this._damage.targetIndex;
      }
      
      public function set changeHp(param1:Number) : void
      {
         this._damage.changeHp = Int64.fromNumber(param1);
      }
      
      public function get changeHp() : Number
      {
         if(this._damage.hasChangeHp)
         {
            return this._damage.changeHp.toNumber();
         }
         return 0;
      }
      
      public function set damageType(param1:int) : void
      {
         this._damage.damageType = param1;
      }
      
      public function get damageType() : int
      {
         return this._damage.damageType;
      }
      
      public function set changeRage(param1:int) : void
      {
         this._damage.changeRage = param1;
      }
      
      public function get changeRage() : int
      {
         return this._damage.changeRage;
      }
      
      public function set changeShield(param1:Number) : void
      {
         this._damage.changeShield = Int64.fromNumber(param1);
      }
      
      public function get changeShield() : Number
      {
         if(this._damage.hasChangeShield)
         {
            return this._damage.changeShield.toNumber();
         }
         return 0;
      }
      
      public function get changeMaxHp() : Number
      {
         if(this._damage.hasChangeMaxHp)
         {
            return this._damage.changeMaxHp.toNumber();
         }
         return 0;
      }
      
      public function set isDead(param1:Boolean) : void
      {
         this._damage.isDead = param1;
      }
      
      public function get isDead() : Boolean
      {
         return this._damage.isDead;
      }
      
      public function get isAddBuff() : Boolean
      {
         return this._isAddBuff;
      }
      
      public function set isAddBuff(param1:Boolean) : void
      {
         this._isAddBuff = param1;
      }
      
      public function get isRelive() : Boolean
      {
         return true;
      }
   }
}
