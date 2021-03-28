package com.qq.modules.battle.model
{
   import PVZ.Cmd.Dto_FightCardInfo;
   import PVZ.Cmd.Dto_FightDamage;
   import PVZ.Cmd.Dto_FightPuppetInfo;
   import PVZ.Cmd.Dto_FightReport;
   import PVZ.Cmd.Dto_FightReward;
   import PVZ.Cmd.Dto_FightRound;
   import PVZ.Cmd.Dto_FightSide;
   import PVZ.Cmd.Dto_ItemInfo;
   import PVZ.Cmd.Dto_KillReward;
   import PVZ.Cmd.E_FightResult;
   import PVZ.Cmd.E_FightRewardChangeType;
   import PVZ.Cmd.E_WinSide;
   import PVZ.Cmd.GuildFightCycles;
   import com.qq.constant.ItemID;
   import com.qq.display.QCanvas;
   import com.qq.modules.bag.model.BagItemTemplate;
   import com.qq.modules.battle.model.vo.FightDamageVo;
   import com.qq.modules.main.model.SettingsModel;
   import com.qq.net.PvzUtil;
   import com.qq.utils.db.ShareObjectConst;
   import com.qq.utils.db.ShareObjectDB;
   import com.tencent.protobuf.Int64;
   import com.tencent.protobuf.UInt64;
   import flash.utils.Dictionary;
   
   public class BattleFightModel
   {
      
      private static var _instance:BattleFightModel;
       
      
      public var source:Dto_FightReport;
      
      public var unitDataMap:Array;
      
      public var cacheReport:Dto_FightReport;
      
      public var cacheScene:QCanvas;
      
      public var cardBuffDic:Dictionary;
      
      public var battleChapterId:Number;
      
      public var battleModeId:Number;
      
      public var battleStageId:Number;
      
      public var battleFubenId:Number;
      
      public var isPlaying:Boolean = false;
      
      public var battleType:int;
      
      public var againFunc:Function;
      
      public var closeDelayFunc:Function;
      
      public var closeDelayFuncParams:Array;
      
      public function BattleFightModel()
      {
         super();
      }
      
      public static function getInstance() : BattleFightModel
      {
         if(_instance == null)
         {
            _instance = new BattleFightModel();
         }
         return _instance;
      }
      
      public function get battleFightRate() : int
      {
         if(!ShareObjectDB.getInstance().hasData(ShareObjectConst.KEY_FubenRate))
         {
            ShareObjectDB.getInstance().writeData(ShareObjectConst.KEY_FubenRate,2);
         }
         return int(ShareObjectDB.getInstance().readData(ShareObjectConst.KEY_FubenRate) as Number);
      }
      
      public function set battleFightRate(param1:int) : void
      {
         ShareObjectDB.getInstance().writeData(ShareObjectConst.KEY_FubenRate,param1);
      }
      
      public function setData(param1:Dto_FightReport) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Dto_FightCardInfo = null;
         var _loc4_:BattleUnitInfo = null;
         var _loc5_:Number = NaN;
         var _loc6_:Dto_FightPuppetInfo = null;
         var _loc7_:Dto_FightPuppetInfo = null;
         this.source = param1;
         this.cacheReport = PvzUtil.copyMessage(param1) as Dto_FightReport;
         this.cardBuffDic = new Dictionary();
         this.unitDataMap = new Array();
         _loc2_ = 0;
         while(_loc2_ < param1.leftSide.beforeCardList.length)
         {
            _loc3_ = param1.leftSide.beforeCardList[_loc2_];
            (_loc4_ = new BattleUnitInfo()).loadDto_FightCardInfo(_loc3_);
            this.unitDataMap[_loc3_.posIndex] = _loc4_;
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < param1.rightSide.beforeCardList.length)
         {
            _loc3_ = param1.rightSide.beforeCardList[_loc2_];
            (_loc4_ = new BattleUnitInfo()).loadDto_FightCardInfo(_loc3_);
            this.unitDataMap[_loc3_.posIndex] = _loc4_;
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < param1.leftSide.puppetList.length)
         {
            _loc6_ = param1.leftSide.puppetList[_loc2_];
            (_loc4_ = new BattleUnitInfo()).loadDto_FightPuppetInfo(_loc6_);
            this.unitDataMap[_loc6_.posIndex] = _loc4_;
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < param1.rightSide.puppetList.length)
         {
            _loc7_ = param1.rightSide.puppetList[_loc2_];
            (_loc4_ = new BattleUnitInfo()).loadDto_FightPuppetInfo(_loc7_);
            this.unitDataMap[_loc7_.posIndex] = _loc4_;
            _loc2_++;
         }
      }
      
      public function isRoleWin() : Boolean
      {
         if(this.source.result == E_FightResult.E_FightResult_Win)
         {
            return true;
         }
         return false;
      }
      
      public function getWinSide() : Dto_FightSide
      {
         return this.source.winSide == E_WinSide.E_WinSide_Left ? this.source.leftSide : this.source.rightSide;
      }
      
      public function getFailSide() : Dto_FightSide
      {
         return this.source.winSide == E_WinSide.E_WinSide_Left ? this.source.rightSide : this.source.leftSide;
      }
      
      public function getSelfSide() : Dto_FightSide
      {
         if(this.source.result == E_FightResult.E_FightResult_Win)
         {
            if(this.source.winSide == E_WinSide.E_WinSide_Left)
            {
               return this.source.leftSide;
            }
            return this.source.rightSide;
         }
         if(this.source.winSide == E_WinSide.E_WinSide_Left)
         {
            return this.source.rightSide;
         }
         return this.source.leftSide;
      }
      
      public function getKillRewardItemList() : Array
      {
         var _loc5_:Dto_FightReward = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:Dto_KillReward = null;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc1_:Array = this.getSelfSide().reward;
         var _loc2_:int = _loc1_.length;
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc6_ = (_loc5_ = _loc1_[_loc4_]).killRewardList.length;
            _loc7_ = 0;
            while(_loc7_ < _loc6_)
            {
               _loc9_ = (_loc8_ = _loc5_.killRewardList[_loc7_] as Dto_KillReward).itemList.length;
               _loc10_ = 0;
               while(_loc10_ < _loc9_)
               {
                  _loc3_.push(_loc8_.itemList[_loc10_]);
                  _loc10_++;
               }
               _loc7_++;
            }
            _loc4_++;
         }
         return _loc3_;
      }
      
      public function getRewardItemList(param1:Boolean = true) : Array
      {
         var _loc6_:Dto_FightReward = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:Dto_ItemInfo = null;
         var _loc10_:BagItemTemplate = null;
         var _loc2_:Array = this.getSelfSide().reward;
         var _loc3_:int = _loc2_.length;
         var _loc4_:Array = [];
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            _loc7_ = (_loc6_ = _loc2_[_loc5_]).rewardItem.length;
            _loc8_ = 0;
            while(_loc8_ < _loc7_)
            {
               _loc9_ = _loc6_.rewardItem[_loc8_] as Dto_ItemInfo;
               _loc10_ = SettingsModel.instance.itemSetting.getBagItemTemplateById(_loc9_.id);
               if(param1)
               {
                  if(_loc9_.id != ItemID.Exp && _loc9_.id != ItemID.CardExp)
                  {
                     _loc4_.push(_loc9_);
                  }
               }
               else
               {
                  _loc4_.push(_loc9_);
               }
               _loc8_++;
            }
            _loc5_++;
         }
         return _loc4_;
      }
      
      public function getRewardItemNum(param1:int) : int
      {
         var _loc2_:int = 0;
         var _loc7_:Dto_FightReward = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:Dto_ItemInfo = null;
         var _loc11_:int = 0;
         var _loc3_:Array = this.getSelfSide().reward;
         var _loc4_:int = _loc3_.length;
         var _loc5_:Array = [];
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_)
         {
            _loc8_ = (_loc7_ = _loc3_[_loc6_]).rewardItem.length;
            _loc9_ = 0;
            while(_loc9_ < _loc8_)
            {
               if((_loc10_ = _loc7_.rewardItem[_loc9_] as Dto_ItemInfo).id == param1)
               {
                  _loc11_ = _loc7_.changeType == E_FightRewardChangeType.E_FightRewardChangeType_Add ? 1 : -1;
                  _loc2_ += _loc11_ * _loc10_.num;
               }
               _loc9_++;
            }
            _loc6_++;
         }
         return _loc2_;
      }
      
      public function getDropItem(param1:int) : Dto_KillReward
      {
         var _loc6_:Dto_FightReward = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:Dto_KillReward = null;
         var _loc2_:Array = this.getSelfSide().reward;
         var _loc3_:int = _loc2_.length;
         var _loc4_:Array = [];
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            _loc7_ = (_loc6_ = _loc2_[_loc5_]).killRewardList.length;
            _loc8_ = 0;
            while(_loc8_ < _loc7_)
            {
               if((_loc9_ = _loc6_.killRewardList[_loc8_] as Dto_KillReward).killPos == param1)
               {
                  return _loc9_;
               }
               _loc8_++;
            }
            _loc5_++;
         }
         return null;
      }
      
      public function getNextRound() : Dto_FightRound
      {
         if(this.source.fightReplay.length == 0)
         {
            return null;
         }
         return this.source.fightReplay.shift();
      }
      
      public function isOver() : Boolean
      {
         if(this.source.fightReplay.length == 0)
         {
            return true;
         }
         return false;
      }
      
      public function getDummyInfoByPosIndex(param1:int) : Dto_FightPuppetInfo
      {
         var _loc4_:Dto_FightSide = null;
         var _loc5_:Array = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:Dto_FightPuppetInfo = null;
         var _loc2_:Array = [this.source.rightSide,this.source.leftSide];
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            if((_loc5_ = (_loc4_ = _loc2_[_loc3_]).puppetList) == null)
            {
               return null;
            }
            _loc6_ = _loc5_.length;
            _loc7_ = 0;
            while(_loc7_ < _loc6_)
            {
               if((_loc8_ = _loc5_[_loc7_]) != null)
               {
                  if(_loc8_.posIndex == param1)
                  {
                     return _loc8_;
                  }
               }
               _loc7_++;
            }
            _loc3_++;
         }
         return null;
      }
      
      public function getFightCardByPosIndex(param1:int) : BattleUnitInfo
      {
         if(this.unitDataMap == null)
         {
            return null;
         }
         return this.unitDataMap[param1];
      }
      
      public function updateCardHP(param1:int, param2:Number) : void
      {
         var _loc3_:BattleUnitInfo = this.getFightCardByPosIndex(param1);
         _loc3_.hp = UInt64.fromNumber(_loc3_.hp.toNumber() + param2);
      }
      
      public function updateCardRage(param1:int, param2:Number) : void
      {
         var _loc3_:BattleUnitInfo = this.getFightCardByPosIndex(param1);
         _loc3_.rage += param2;
      }
      
      public function updateCardShield(param1:int, param2:Number) : void
      {
         var _loc3_:BattleUnitInfo = this.getFightCardByPosIndex(param1);
         _loc3_.shield = UInt64.fromNumber(_loc3_.shield.toNumber() + param2);
      }
      
      public function updateCardMaxShield(param1:int, param2:Number) : void
      {
         var _loc3_:BattleUnitInfo = this.getFightCardByPosIndex(param1);
         var _loc4_:Number = Math.max(param2 + _loc3_.shield.toNumber(),_loc3_.maxShield.toNumber());
         _loc3_.maxShield = UInt64.fromNumber(_loc4_);
      }
      
      public function updateCardMaxHp(param1:int, param2:Number) : void
      {
         var _loc3_:BattleUnitInfo = this.getFightCardByPosIndex(param1);
         _loc3_.maxHp = UInt64.fromNumber(_loc3_.maxHp.toNumber() + param2);
         if(param2 > 0)
         {
            _loc3_.hp = UInt64.fromNumber(_loc3_.hp.toNumber() + param2);
         }
         if(_loc3_.hp.toNumber() > _loc3_.maxHp.toNumber())
         {
            _loc3_.hp = UInt64.fromNumber(_loc3_.maxHp.toNumber());
         }
      }
      
      public function updateCardBuff(param1:int, param2:int) : void
      {
      }
      
      public function revertGuildFightHp() : void
      {
         var _loc2_:Dto_FightCardInfo = null;
         var _loc3_:Number = NaN;
         var _loc1_:int = 0;
         _loc1_ = 0;
         while(_loc1_ < this.source.leftSide.beforeCardList.length)
         {
            _loc2_ = this.source.leftSide.beforeCardList[_loc1_];
            _loc3_ = Int64(this.source.guildFight.subHpValue[_loc2_.posIndex - 1]).toNumber();
            _loc2_.hp = UInt64.fromNumber(_loc2_.hp.toNumber() - _loc3_);
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < this.source.rightSide.beforeCardList.length)
         {
            _loc2_ = this.source.rightSide.beforeCardList[_loc1_];
            _loc2_.hp = UInt64.fromNumber(_loc2_.hp.toNumber() - Int64(this.source.guildFight.subHpValue[_loc2_.posIndex - 1]).toNumber());
            _loc1_++;
         }
      }
      
      public function getGuildFightLeftDamage() : Array
      {
         var _loc2_:Dto_FightDamage = null;
         var _loc3_:FightDamageVo = null;
         var _loc1_:Array = new Array();
         var _loc4_:int = 0;
         while(_loc4_ < this.source.guildFight.subHpValue.length)
         {
            if(_loc4_ % 2 == 0)
            {
               if(Int64(this.source.guildFight.subHpValue[_loc4_]).toNumber() != 0)
               {
                  _loc2_ = new Dto_FightDamage();
                  _loc2_.targetIndex = _loc4_ + 1;
                  _loc2_.changeHp = this.source.guildFight.subHpValue[_loc4_];
                  _loc3_ = new FightDamageVo();
                  _loc3_.setDamage(_loc2_);
                  _loc1_.push(_loc3_);
               }
            }
            _loc4_++;
         }
         return _loc1_;
      }
      
      public function getGuildFightRightDamage() : Array
      {
         var _loc2_:Dto_FightDamage = null;
         var _loc3_:FightDamageVo = null;
         var _loc1_:Array = new Array();
         var _loc4_:int = 0;
         while(_loc4_ < this.source.guildFight.subHpValue.length)
         {
            if(_loc4_ % 2 != 0)
            {
               if(Int64(this.source.guildFight.subHpValue[_loc4_]).toNumber() != 0)
               {
                  _loc2_ = new Dto_FightDamage();
                  _loc2_.targetIndex = _loc4_ + 1;
                  _loc2_.changeHp = Int64.fromNumber(this.source.guildFight.subHpValue[_loc4_]);
                  _loc3_ = new FightDamageVo();
                  _loc3_.setDamage(_loc2_);
                  _loc1_.push(_loc3_);
               }
            }
            _loc4_++;
         }
         return _loc1_;
      }
      
      public function get guildFightLeftCycleIsWin() : Boolean
      {
         if(!this.source.guildFight)
         {
            return false;
         }
         if(this.source.guildFight.leftCycles >= this.source.guildFight.rightCycles || this.source.guildFight.leftCycles == GuildFightCycles.GuildFightCycles_Cloth && this.source.guildFight.rightCycles == GuildFightCycles.GuildFightCycles_Stone)
         {
            return true;
         }
         return false;
      }
      
      public function get guildFightRightCycleIsWin() : Boolean
      {
         if(!this.source.guildFight)
         {
            return false;
         }
         if(this.source.guildFight.rightCycles >= this.source.guildFight.leftCycles || this.source.guildFight.rightCycles == GuildFightCycles.GuildFightCycles_Cloth && this.source.guildFight.leftCycles == GuildFightCycles.GuildFightCycles_Stone)
         {
            return true;
         }
         return false;
      }
      
      public function closeBattle() : void
      {
         this.cardBuffDic = null;
         this.source = null;
         this.cacheReport = null;
         this.isPlaying = false;
         this.unitDataMap = null;
      }
   }
}
