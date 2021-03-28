package com.qq.modules.main.model.vo
{
   import PVZ.Cmd.Dto_CardPosInfo;
   import PVZ.Cmd.Dto_CardPower;
   import PVZ.Cmd.Dto_FormationInfo;
   import PVZ.Cmd.E_PowerEle;
   import PVZ.Cmd.E_WARTEAM;
   import com.qq.GameGloble;
   import com.qq.modules.card.model.vo.CardItemVO;
   import com.qq.modules.main.model.SettingsModel;
   import com.tencent.protobuf.Int64;
   import com.tencent.protobuf.Int64Util;
   
   public class BattleCardFormationVO
   {
       
      
      private var _formation:Dto_FormationInfo;
      
      public function BattleCardFormationVO(param1:Dto_FormationInfo)
      {
         super();
         this._formation = param1;
      }
      
      public function get dto() : Dto_FormationInfo
      {
         return this._formation;
      }
      
      public function get totalPower() : uint
      {
         var _loc3_:int = 0;
         var _loc1_:uint = 0;
         var _loc2_:int = 0;
         while(_loc2_ < this.dto.cardPos.length)
         {
            _loc3_ = 0;
            while(_loc3_ < Dto_CardPosInfo(this.dto.cardPos[_loc2_]).powerEle.length)
            {
               if(Dto_CardPower(Dto_CardPosInfo(this.dto.cardPos[_loc2_]).powerEle[_loc3_]).ele == E_PowerEle.E_PowerEle_total)
               {
                  _loc1_ += Dto_CardPower(Dto_CardPosInfo(this.dto.cardPos[_loc2_]).powerEle[_loc3_]).value.toNumber();
               }
               _loc3_++;
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function get totalSpeed() : uint
      {
         var _loc3_:int = 0;
         var _loc1_:uint = 0;
         var _loc2_:int = 0;
         while(_loc2_ < this.dto.cardPos.length)
         {
            _loc3_ = 0;
            while(_loc3_ < Dto_CardPosInfo(this.dto.cardPos[_loc2_]).powerEle.length)
            {
               if(Dto_CardPower(Dto_CardPosInfo(this.dto.cardPos[_loc2_]).powerEle[_loc3_]).ele == E_PowerEle.E_PowerEle_total)
               {
                  _loc1_ += Dto_CardPower(Dto_CardPosInfo(this.dto.cardPos[_loc2_]).powerEle[_loc3_]).speed.toNumber();
               }
               _loc3_++;
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function get cardNum() : uint
      {
         if(this._formation && this._formation.cardPos)
         {
            return this._formation.cardPos.length;
         }
         return 0;
      }
      
      public function get teamId() : uint
      {
         return this._formation.teamId;
      }
      
      public function get isDefenceTeam() : Boolean
      {
         if(this._formation.teamId >= E_WARTEAM.E_WARTEAM_OUTPOSTMIN)
         {
            return true;
         }
         return false;
      }
      
      public function hasCardByUid(param1:Int64) : Boolean
      {
         var _loc4_:Boolean = false;
         var _loc2_:int = this._formation.cardPos.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(_loc4_ = Int64Util.isEqual((this._formation.cardPos[_loc3_] as Dto_CardPosInfo).uid,param1))
            {
               return _loc4_;
            }
            _loc3_++;
         }
         return false;
      }
      
      public function updateFormation(param1:Dto_FormationInfo) : void
      {
         this._formation = param1;
      }
      
      public function getCardByIndex(param1:int) : Dto_CardPosInfo
      {
         return this._formation.cardPos[param1] as Dto_CardPosInfo;
      }
      
      public function getCardByUid(param1:Int64) : Dto_CardPosInfo
      {
         var _loc4_:Dto_CardPosInfo = null;
         var _loc2_:int = this._formation.cardPos.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = this._formation.cardPos[_loc3_] as Dto_CardPosInfo;
            if(Int64Util.isEqual(_loc4_.uid,param1))
            {
               return _loc4_;
            }
            _loc3_++;
         }
         return null;
      }
      
      public function getCardByPosIndex(param1:uint) : Dto_CardPosInfo
      {
         var _loc4_:Dto_CardPosInfo = null;
         var _loc2_:int = this._formation.cardPos.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if((_loc4_ = this._formation.cardPos[_loc3_] as Dto_CardPosInfo).posIndex == param1)
            {
               return _loc4_;
            }
            _loc3_++;
         }
         return null;
      }
      
      public function removeHelpCard() : void
      {
         var _loc2_:Dto_CardPosInfo = null;
         var _loc1_:int = 0;
         while(_loc1_ < this._formation.cardPos.length)
         {
            _loc2_ = this._formation.cardPos[_loc1_] as Dto_CardPosInfo;
            if(_loc2_.ownerRoleId != null)
            {
               this._formation.cardPos.splice(_loc1_,1);
               _loc1_--;
            }
            _loc1_++;
         }
      }
      
      public function updateCardPos(param1:Int64, param2:int, param3:Int64 = null) : void
      {
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:Dto_CardPosInfo = null;
         var _loc12_:Dto_CardPosInfo = null;
         var _loc13_:Array = null;
         var _loc14_:int = 0;
         var _loc15_:Dto_CardPosInfo = null;
         var _loc4_:Dto_CardPosInfo = this.getCardByPosIndex(param2);
         var _loc5_:Dto_CardPosInfo;
         if((_loc5_ = this.getCardByUid(param1)) && _loc4_)
         {
            _loc8_ = _loc5_.posIndex;
            _loc5_.posIndex = _loc4_.posIndex;
            _loc4_.posIndex = _loc8_;
         }
         else if(_loc5_ == null && _loc4_)
         {
            _loc4_.uid = param1;
            _loc4_.ownerRoleId = param3 == null ? GameGloble.actorModel.roleId : param3;
         }
         else if(_loc5_ && _loc4_ == null)
         {
            if(param2 == 0)
            {
               _loc9_ = this._formation.cardPos.length;
               _loc10_ = 0;
               while(_loc10_ < _loc9_)
               {
                  if((this._formation.cardPos[_loc10_] as Dto_CardPosInfo).posIndex == _loc5_.posIndex)
                  {
                     this._formation.cardPos.splice(_loc10_,1);
                     return;
                  }
                  _loc10_++;
               }
            }
            else
            {
               _loc5_.posIndex = param2;
            }
         }
         else if(_loc5_ == null && _loc4_ == null)
         {
            (_loc11_ = new Dto_CardPosInfo()).uid = param1;
            _loc11_.ownerRoleId = param3 == null ? GameGloble.actorModel.roleId : param3;
            _loc11_.posIndex = param2;
            this._formation.cardPos.push(_loc11_);
         }
         var _loc6_:int = this._formation.cardPos.length;
         var _loc7_:int = 0;
         while(_loc7_ < _loc6_)
         {
            if((_loc12_ = this._formation.cardPos[_loc7_]) != null && _loc12_.uid == null)
            {
               _loc13_ = new Array();
               _loc14_ = 0;
               while(_loc14_ < _loc6_)
               {
                  if((_loc15_ = this._formation.cardPos[_loc14_]) != null && _loc15_.uid != null)
                  {
                     _loc13_.push(_loc15_);
                  }
                  _loc14_++;
               }
               this._formation.cardPos = _loc13_;
               break;
            }
            _loc7_++;
         }
      }
      
      public function get isMatchRule() : Boolean
      {
         var _loc3_:Dto_CardPosInfo = null;
         var _loc4_:CardItemVO = null;
         var _loc5_:int = 0;
         var _loc1_:int = this._formation.cardPos.length;
         var _loc2_:Array = [];
         var _loc6_:int = 0;
         while(_loc6_ < _loc1_)
         {
            _loc3_ = this._formation.cardPos[_loc6_] as Dto_CardPosInfo;
            if(_loc3_.ownerRoleId && !Int64Util.isEqual(_loc3_.ownerRoleId,GameGloble.actorModel.roleId))
            {
               _loc2_.push(_loc3_.ownerRoleId.toNumber());
            }
            else if((_loc4_ = GameGloble.actorModel.battleCardModel.getBattleCardFullInfo(_loc3_.uid)) != null)
            {
               _loc5_ = SettingsModel.instance.battleCardSettings.getBattleCardTempById(_loc4_.cardId).tdId;
               if(_loc2_.indexOf(_loc5_) != -1)
               {
                  return false;
               }
               _loc2_.push(_loc5_);
            }
            _loc6_++;
         }
         return true;
      }
   }
}
