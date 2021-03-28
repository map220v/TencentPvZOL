package com.qq.modules.dummy.model
{
   import PVZ.Cmd.Dto_PuppetFormation;
   import PVZ.Cmd.Dto_PuppetFuben_StageInfo;
   import PVZ.Cmd.Dto_PuppetFullInfo;
   import PVZ.Cmd.Dto_PuppetInfo;
   import PVZ.Cmd.Dto_Puppet_ExtractGroupInfo;
   import com.qq.GameGloble;
   import com.qq.modules.dummy.DummyConst;
   import com.qq.modules.dummy.DummyGlobel;
   import com.qq.modules.dummy.DummyZombieCallInfo;
   
   public class DummyModel
   {
       
      
      public var dummyZombieDataList:Array;
      
      public var dummyZombieDataMapByID:Array;
      
      public var dummyZombieLineupList:Array;
      
      public var dummyZombieLineupMapByPos:Array;
      
      public var lastDrarCardTimes:int;
      
      public var lastPassEasyChapterId:int;
      
      public var lastPassHardChapterId:int;
      
      private var _stageList:Array;
      
      private var _zombieCallMap:Array;
      
      public var lastDropStoneFightNum:int;
      
      public var exchangeZombieList:Array;
      
      public function DummyModel()
      {
         super();
      }
      
      public function resetExchangeData() : void
      {
         this.exchangeZombieList = new Array();
      }
      
      public function getExchangeData(param1:int) : DummyZombieInfo
      {
         return this.exchangeZombieList[param1];
      }
      
      public function setExchangeData(param1:int, param2:DummyZombieInfo) : Boolean
      {
         var _loc3_:DummyZombieInfo = this.exchangeZombieList[param1];
         this.exchangeZombieList[param1] = param2;
         if(_loc3_ != null && _loc3_ != param2)
         {
            return true;
         }
         if(_loc3_ == null)
         {
            return true;
         }
         return false;
      }
      
      public function resetDummyZombieDataList(param1:Array) : void
      {
         var _loc4_:Dto_PuppetFullInfo = null;
         if(param1 == null)
         {
            return;
         }
         if(this.dummyZombieDataList == null)
         {
            this.dummyZombieDataList = new Array();
         }
         if(this.dummyZombieDataMapByID == null)
         {
            this.dummyZombieDataMapByID = new Array();
         }
         var _loc2_:int = param1.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1[_loc3_];
            this.updateDummyZombie(_loc4_);
            _loc3_++;
         }
      }
      
      public function getOwnDummyTotal() : int
      {
         if(this.dummyZombieDataList == null)
         {
            return 0;
         }
         return this.dummyZombieDataList.length;
      }
      
      public function getOwnDummyList() : Array
      {
         return this.dummyZombieDataList;
      }
      
      public function updateDummyZombie(param1:Dto_PuppetFullInfo) : void
      {
         var _loc2_:DummyZombieInfo = null;
         var _loc3_:DummyZombieInfo = null;
         if(param1.baseId != 0)
         {
            _loc2_ = this.dummyZombieDataMapByID[param1.baseId];
            if(_loc2_ == null)
            {
               _loc3_ = new DummyZombieInfo(param1.baseId);
               _loc3_.resetDtoInfo(param1);
               this.dummyZombieDataList.push(_loc3_);
               this.dummyZombieDataMapByID[_loc3_.id] = _loc3_;
            }
            else
            {
               _loc2_.resetDtoInfo(param1);
            }
         }
      }
      
      public function resetDummyLineup(param1:Dto_PuppetFormation) : void
      {
         var _loc4_:Dto_PuppetInfo = null;
         var _loc5_:DummyZombieInfo = null;
         if(param1 == null)
         {
            return;
         }
         this.dummyZombieLineupMapByPos = new Array();
         this.dummyZombieLineupList = new Array();
         var _loc2_:int = param1.puppetInfo.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if((_loc4_ = param1.puppetInfo[_loc3_]).baseId != 0)
            {
               if((_loc5_ = this.getDummyDataByID(_loc4_.baseId)) != null)
               {
                  this.dummyZombieLineupMapByPos[_loc3_] = _loc5_;
                  this.dummyZombieLineupList.push(_loc4_);
               }
            }
            else
            {
               this.dummyZombieLineupList.push(DummyGlobel.conver2Dto_PuppetInfo(null));
            }
            _loc3_++;
         }
      }
      
      public function getDummyDataByIndex(param1:int) : DummyZombieInfo
      {
         if(this.dummyZombieDataList == null)
         {
            return null;
         }
         if(param1 < this.dummyZombieDataList.length)
         {
            return this.dummyZombieDataList[param1];
         }
         return null;
      }
      
      public function getDummyDataByID(param1:int) : DummyZombieInfo
      {
         if(this.dummyZombieDataMapByID == null)
         {
            return null;
         }
         return this.dummyZombieDataMapByID[param1];
      }
      
      public function getLineupZombieInfoByPos(param1:int) : DummyZombieInfo
      {
         if(this.dummyZombieLineupMapByPos != null)
         {
            return this.dummyZombieLineupMapByPos[param1];
         }
         return null;
      }
      
      public function getDummyEquipment(param1:int, param2:int) : DummyEquipmentInfo
      {
         var _loc3_:DummyEquipmentInfo = null;
         var _loc4_:DummyZombieInfo;
         if((_loc4_ = this.getDummyDataByID(param1)) != null)
         {
            _loc3_ = _loc4_.getEquipmentInfoByType(param2);
         }
         return _loc3_;
      }
      
      public function getLineupList() : Array
      {
         if(this.dummyZombieLineupList == null)
         {
            return null;
         }
         return this.dummyZombieLineupList.concat();
      }
      
      public function getFubenStageState(param1:int) : int
      {
         var _loc3_:DummyFubenStageInfo = null;
         var _loc4_:DummyFubenStageTemplate = null;
         var _loc5_:DummyFubenStageTemplate = null;
         var _loc6_:DummyFubenStageInfo = null;
         var _loc7_:DummyFubenStageInfo = null;
         var _loc2_:DummyFubenStageTemplate = DummyDataFactory.getInstance().getFubenStageTemplateByID(param1);
         if(_loc2_ != null)
         {
            if(GameGloble.actorModel.actorLevel < _loc2_.openMinLv)
            {
               return DummyConst.FubenStage_Stage_Lock_NotMeetLevel;
            }
            _loc3_ = this.getFubenStageInfoByStageID(_loc2_.stageID);
            if(_loc3_ == null)
            {
               return DummyConst.FubenStage_State_Lock_NotPassPrevNormalStage;
            }
            if(_loc2_.mode == DummyConst.Fuben_Mode_Elite)
            {
               if(_loc2_.chaperID > this.lastPassEasyChapterId)
               {
                  return DummyConst.FubenStage_State_Lock_NotPassCurNormalStage;
               }
               if(_loc2_.chaperID - 1 > this.lastPassHardChapterId)
               {
                  return DummyConst.FubenStage_State_Lock_NotPassPrevEliteStage;
               }
               if((_loc6_ = this.getFubenStageInfoByStageID(_loc3_.stageID - 1)) != null && _loc6_.star <= 0)
               {
                  return DummyConst.FubenStage_State_Lock_NotPassPrevStage;
               }
               return DummyConst.FubenStage_Open;
            }
            if(_loc2_.chaperID - 1 > this.lastPassEasyChapterId && _loc2_.chaperID != 1)
            {
               return DummyConst.FubenStage_State_Lock_NotPassPrevNormalStage;
            }
            if((_loc7_ = this.getFubenStageInfoByStageID(_loc3_.stageID - 1)) != null && _loc7_.star <= 0)
            {
               return DummyConst.FubenStage_State_Lock_NotPassPrevStage;
            }
            return DummyConst.FubenStage_Open;
         }
         return DummyConst.FubenStage_Open;
      }
      
      public function getDefaultChapterIndexAndMode() : Array
      {
         var _loc1_:Array = new Array();
         var _loc2_:int = Math.max(this.lastPassEasyChapterId,this.lastPassHardChapterId);
         _loc2_ = Math.max(_loc2_,1);
         _loc1_.push(_loc2_);
         if(this.lastPassEasyChapterId == this.lastPassHardChapterId && this.lastPassEasyChapterId != 0)
         {
            _loc1_.push(DummyConst.Fuben_Mode_Elite);
         }
         else
         {
            _loc1_.push(DummyConst.Fuben_Mode_Normal);
         }
         return _loc1_;
      }
      
      public function setStageList(param1:int, param2:int, param3:Array) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:Dto_PuppetFuben_StageInfo = null;
         var _loc8_:DummyFubenStageInfo = null;
         var _loc4_:int = DummyDataFactory.getInstance().getTotalFubenChaperNum();
         if(this._stageList == null)
         {
            this._stageList = new Array();
            _loc5_ = 0;
            while(_loc5_ < _loc4_)
            {
               this._stageList[_loc5_ + 1] = new DummyFubenStageInfo();
               _loc5_++;
            }
         }
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc6_ = _loc5_ + 1;
            _loc7_ = null;
            _loc8_ = this._stageList[_loc6_];
            if(_loc5_ < param3.length)
            {
               _loc7_ = param3[_loc5_];
            }
            _loc8_.reset(param1,param2,_loc6_);
            _loc8_.setDtoInfo(_loc7_);
            _loc5_++;
         }
      }
      
      public function updateStageInfo(param1:Dto_PuppetFuben_StageInfo) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:DummyFubenStageInfo = this._stageList[param1.stageId];
         if(_loc2_ != null)
         {
            _loc2_.setDtoInfo(param1);
         }
      }
      
      public function getFubenStageInfoByStageID(param1:int) : DummyFubenStageInfo
      {
         return this._stageList[param1];
      }
      
      public function resetCallInfo(param1:Dto_Puppet_ExtractGroupInfo) : void
      {
         if(this._zombieCallMap == null)
         {
            this._zombieCallMap = new Array();
         }
         var _loc2_:DummyZombieCallInfo = this.getCallInfo(param1.groupId);
         if(_loc2_ == null)
         {
            _loc2_ = new DummyZombieCallInfo();
            this._zombieCallMap[param1.groupId] = _loc2_;
         }
         _loc2_.reset(param1);
      }
      
      public function getCallInfo(param1:int) : DummyZombieCallInfo
      {
         if(this._zombieCallMap == null)
         {
            return null;
         }
         return this._zombieCallMap[param1];
      }
   }
}
