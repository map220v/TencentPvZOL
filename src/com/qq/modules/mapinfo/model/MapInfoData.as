package com.qq.modules.mapinfo.model
{
   import PVZ.Cmd.Dto_Outpost_AllyTeam;
   import PVZ.Cmd.Dto_War_History;
   import com.qq.modules.mapinfo.model.vo.MapInfoWarHistoryVO;
   import com.tencent.protobuf.Int64;
   import flash.geom.Point;
   
   public class MapInfoData
   {
      
      public static const MAX_ALLY_NUM:int = 5;
       
      
      public var myPos:Point;
      
      public var nextMapInitPos:Point;
      
      public var myAreaId:int;
      
      private var _showNullCity:Boolean = false;
      
      public var detailedHistories:Vector.<MapInfoWarHistoryVO>;
      
      public var simpleHistories:Vector.<MapInfoWarHistoryVO>;
      
      public var allyTeamList:Array;
      
      private var m_changeCityCD:uint;
      
      public function MapInfoData()
      {
         this.myPos = new Point();
         this.detailedHistories = new Vector.<MapInfoWarHistoryVO>();
         this.simpleHistories = new Vector.<MapInfoWarHistoryVO>();
         this.allyTeamList = [];
         super();
      }
      
      public function get showNullCity() : Boolean
      {
         return this._showNullCity;
      }
      
      public function set showNullCity(param1:Boolean) : void
      {
         this._showNullCity = param1;
      }
      
      public function getVOByDtoCompare(param1:Dto_War_History, param2:Boolean) : MapInfoWarHistoryVO
      {
         var _loc4_:int = 0;
         var _loc5_:MapInfoWarHistoryVO = null;
         var _loc3_:Vector.<MapInfoWarHistoryVO> = !!param2 ? this.detailedHistories : this.simpleHistories;
         _loc4_ = 0;
         while(_loc4_ < _loc3_.length)
         {
            if((_loc5_ = _loc3_[_loc4_]).campareDto(param1))
            {
               return _loc5_;
            }
            _loc4_++;
         }
         return null;
      }
      
      public function addVO(param1:MapInfoWarHistoryVO, param2:Boolean) : void
      {
         var _loc3_:Vector.<MapInfoWarHistoryVO> = !!param2 ? this.detailedHistories : this.simpleHistories;
         _loc3_.push(param1);
      }
      
      public function setAllyTeam(param1:Array) : void
      {
         this.allyTeamList = param1;
      }
      
      public function removeAllyTeam(param1:Int64, param2:uint) : void
      {
         var _loc5_:Dto_Outpost_AllyTeam = null;
         var _loc3_:uint = this.allyTeamList.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if((_loc5_ = this.allyTeamList[_loc4_] as Dto_Outpost_AllyTeam).allyTeamId == param2)
            {
               this.allyTeamList.splice(_loc4_,1);
               break;
            }
            _loc4_++;
         }
      }
      
      public function removeVOByDtoCompare(param1:Dto_War_History) : void
      {
         var _loc3_:int = 0;
         var _loc4_:MapInfoWarHistoryVO = null;
         var _loc2_:Vector.<MapInfoWarHistoryVO> = this.detailedHistories;
         _loc3_ = 0;
         while(_loc3_ < _loc2_.length)
         {
            if((_loc4_ = _loc2_[_loc3_]).campareDto(param1))
            {
               _loc2_.splice(_loc3_,1);
               break;
            }
            _loc3_++;
         }
      }
      
      public function set changeCityCD(param1:uint) : void
      {
         this.m_changeCityCD = param1;
      }
      
      public function get changeCityCD() : uint
      {
         return this.m_changeCityCD;
      }
   }
}
