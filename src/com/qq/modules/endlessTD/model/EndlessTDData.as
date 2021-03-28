package com.qq.modules.endlessTD.model
{
   import PVZ.Cmd.Cmd_NoEndTD_GetInfo_SC;
   import PVZ.Cmd.Dto_NoEndTD_Map;
   import PVZ.Cmd.Dto_NoEndTD_Mode;
   import PVZ.Cmd.Dto_PlantInfo;
   import com.qq.TDPrivilegeInfo;
   import com.qq.modules.td.model.vo.TDEndlessMapVO;
   
   public class EndlessTDData
   {
       
      
      private var _isWin:Boolean;
      
      private var _mapList:Vector.<TDEndlessMapVO>;
      
      private var _plantList:Vector.<Dto_PlantInfo>;
      
      private var _talentList:Array;
      
      private var _curMode:Dto_NoEndTD_Mode;
      
      public function EndlessTDData()
      {
         super();
      }
      
      public function get isWin() : Boolean
      {
         return this._isWin;
      }
      
      public function set isWin(param1:Boolean) : void
      {
         this._isWin = param1;
      }
      
      public function get mapList() : Vector.<TDEndlessMapVO>
      {
         return this._mapList;
      }
      
      public function get plantList() : Vector.<Dto_PlantInfo>
      {
         return this._plantList;
      }
      
      public function get curLevel() : int
      {
         return this._curMode.level;
      }
      
      public function get rain() : int
      {
         return this._curMode.rain;
      }
      
      public function get talentList() : Array
      {
         return this._talentList;
      }
      
      public function get curMode() : Dto_NoEndTD_Mode
      {
         return this._curMode;
      }
      
      public function set curMode(param1:Dto_NoEndTD_Mode) : void
      {
         this._curMode = param1;
      }
      
      public function setMsg(param1:Cmd_NoEndTD_GetInfo_SC) : void
      {
         var _loc2_:Dto_NoEndTD_Map = null;
         this.curMode = param1.curMode;
         this._plantList = Vector.<Dto_PlantInfo>(param1.plantList);
         this._talentList = param1.talentIdList;
         this._mapList = new Vector.<TDEndlessMapVO>();
         for each(_loc2_ in param1.curMode.mapInfo)
         {
            this.mapList.push(new TDEndlessMapVO(_loc2_));
         }
         TDPrivilegeInfo.getInstance().hasTDPrivilege = param1.hasPrivilege;
         TDPrivilegeInfo.getInstance().privilegeRemainTime = param1.remainTime;
         TDPrivilegeInfo.getInstance().unlockPlantIDList = param1.plantId;
      }
      
      public function getCurMapInfo() : TDEndlessMapVO
      {
         var _loc1_:TDEndlessMapVO = null;
         for each(_loc1_ in this.mapList)
         {
            if(_loc1_.level == this.curLevel + 1)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      public function get isPassAll() : Boolean
      {
         return this.curLevel >= this._mapList[this._mapList.length - 1].level;
      }
   }
}
