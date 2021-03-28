package com.qq.modules.battle.model
{
   import PVZ.Cmd.Dto_FightCardInfo;
   import PVZ.Cmd.Dto_FightPuppetInfo;
   import com.tencent.protobuf.UInt64;
   
   public class BattleUnitInfo
   {
       
      
      public var posIndex:int;
      
      private var _fightCardInfo:Dto_FightCardInfo;
      
      private var _puppetInfo:Dto_FightPuppetInfo;
      
      public function BattleUnitInfo()
      {
         super();
      }
      
      public function loadDto_FightCardInfo(param1:Dto_FightCardInfo) : void
      {
         this.posIndex = param1.posIndex;
         this._fightCardInfo = param1;
      }
      
      public function loadDto_FightPuppetInfo(param1:Dto_FightPuppetInfo) : void
      {
         this.posIndex = param1.posIndex;
         this._puppetInfo = param1;
      }
      
      public function get cardPower() : UInt64
      {
         if(this._fightCardInfo == null)
         {
            return new UInt64();
         }
         return this._fightCardInfo.cardPower;
      }
      
      public function get powerEle() : Array
      {
         if(this._fightCardInfo == null)
         {
            return new Array();
         }
         return this._fightCardInfo.powerEle;
      }
      
      public function get maxShield() : UInt64
      {
         if(this._fightCardInfo == null)
         {
            return new UInt64();
         }
         return this._fightCardInfo.maxShield;
      }
      
      public function get maxHp() : UInt64
      {
         if(this._fightCardInfo == null)
         {
            return new UInt64();
         }
         return this._fightCardInfo.maxHp;
      }
      
      public function set maxHp(param1:UInt64) : void
      {
         if(this._fightCardInfo == null)
         {
            return;
         }
         this._fightCardInfo.maxHp = param1;
      }
      
      public function get shield() : UInt64
      {
         if(this._fightCardInfo == null)
         {
            return new UInt64();
         }
         return this._fightCardInfo.shield;
      }
      
      public function set shield(param1:UInt64) : void
      {
         if(this._fightCardInfo == null)
         {
            return;
         }
         this._fightCardInfo.shield = param1;
      }
      
      public function set maxShield(param1:UInt64) : void
      {
         if(this._fightCardInfo == null)
         {
            return;
         }
         this._fightCardInfo.maxShield = param1;
      }
      
      public function get hp() : UInt64
      {
         if(this._fightCardInfo == null)
         {
            return new UInt64();
         }
         return this._fightCardInfo.hp;
      }
      
      public function set hp(param1:UInt64) : void
      {
         if(this._fightCardInfo == null)
         {
            return;
         }
         this._fightCardInfo.hp = param1;
      }
      
      public function get rage() : Number
      {
         if(this._fightCardInfo == null)
         {
            return 0;
         }
         return this._fightCardInfo.rage;
      }
      
      public function set rage(param1:Number) : void
      {
         if(this._fightCardInfo == null)
         {
            return;
         }
         this._fightCardInfo.rage = param1;
      }
      
      public function get maxRage() : Number
      {
         if(this._fightCardInfo == null)
         {
            return 0;
         }
         return this._fightCardInfo.maxRage;
      }
      
      public function get cardId() : int
      {
         if(this._fightCardInfo == null)
         {
            return 0;
         }
         return this._fightCardInfo.cardId;
      }
   }
}
