package com.qq.modules.yetiTD.model
{
   import PVZ.Cmd.Cmd_SnowMan_GetInfo_SC;
   import PVZ.Cmd.Dto_PlantInfo;
   import com.qq.TDPrivilegeInfo;
   
   public class YetiTDData
   {
       
      
      public var mapsInfo:Array;
      
      public var iRemainChallenge:uint;
      
      public var iRemainPayChallenge:uint;
      
      public var talentIdList:Array;
      
      public var plantList:Vector.<Dto_PlantInfo>;
      
      public var modeID:int;
      
      public var tdResult:int;
      
      public var killNum:int;
      
      public var leftKeyNum:int;
      
      private var m_keyCount:int;
      
      public var openCount:int;
      
      public var chestRewardArr:Array;
      
      public function YetiTDData()
      {
         super();
      }
      
      public function set keyCount(param1:int) : void
      {
         this.m_keyCount = param1;
         this.leftKeyNum = param1;
      }
      
      public function get keyCount() : int
      {
         return this.m_keyCount;
      }
      
      public function loadMsg(param1:Cmd_SnowMan_GetInfo_SC) : void
      {
         this.mapsInfo = param1.mapInfo;
         this.iRemainChallenge = param1.iRemainChallenge;
         this.iRemainPayChallenge = param1.iReTicketChallenge;
         this.talentIdList = param1.talentIdList;
         this.plantList = Vector.<Dto_PlantInfo>(param1.plantList);
         this.openCount = 0;
         TDPrivilegeInfo.getInstance().hasTDPrivilege = param1.hasPrivilege;
         TDPrivilegeInfo.getInstance().privilegeRemainTime = param1.remainTime;
      }
      
      public function getMapIdByDifficult(param1:int) : int
      {
         return this.mapsInfo[param1 - 1].mapId;
      }
      
      public function getUnlockPlants(param1:int) : Array
      {
         return this.mapsInfo[param1 - 1].plantId;
      }
   }
}
