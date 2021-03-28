package com.qq.modules.map.model
{
   import PVZ.Cmd.Dto_War_History;
   import com.qq.modules.map.model.vo.MapBasicCellVO;
   import com.qq.modules.mapinfo.model.vo.MapInfoWarHistoryVO;
   import com.tencent.protobuf.Int64;
   import flash.geom.Point;
   
   public class MapData
   {
       
      
      public var mapCellsInArea:Vector.<MapBasicCellVO>;
      
      public var initPos:Point;
      
      public var caneraCenterPoint:Point;
      
      public var armyRelatived:Vector.<MapInfoWarHistoryVO>;
      
      public function MapData()
      {
         this.mapCellsInArea = new Vector.<MapBasicCellVO>();
         this.initPos = new Point();
         this.caneraCenterPoint = new Point();
         this.armyRelatived = new Vector.<MapInfoWarHistoryVO>();
         super();
      }
      
      public function getCellVoByRoleId(param1:Int64) : MapBasicCellVO
      {
         var _loc2_:int = 0;
         var _loc4_:MapBasicCellVO = null;
         var _loc3_:int = this.mapCellsInArea.length;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = this.mapCellsInArea[_loc2_];
            if(param1.compare(_loc4_.roleId))
            {
               return _loc4_;
            }
            _loc2_++;
         }
         return null;
      }
      
      public function getCellVoByPos(param1:int, param2:int) : MapBasicCellVO
      {
         var _loc3_:int = 0;
         var _loc5_:MapBasicCellVO = null;
         var _loc4_:int = this.mapCellsInArea.length;
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            if((_loc5_ = this.mapCellsInArea[_loc3_]).pos.x == param1 && _loc5_.pos.y == param2)
            {
               return _loc5_;
            }
            _loc3_++;
         }
         return null;
      }
      
      public function getVOByDtoCompare(param1:Dto_War_History) : MapInfoWarHistoryVO
      {
         var _loc3_:int = 0;
         var _loc4_:MapInfoWarHistoryVO = null;
         var _loc2_:Vector.<MapInfoWarHistoryVO> = this.armyRelatived;
         _loc3_ = 0;
         while(_loc3_ < _loc2_.length)
         {
            if((_loc4_ = _loc2_[_loc3_]).campareDto(param1))
            {
               return _loc4_;
            }
            _loc3_++;
         }
         return null;
      }
      
      public function removeVOByDtoCompare(param1:Dto_War_History) : void
      {
         var _loc3_:int = 0;
         var _loc4_:MapInfoWarHistoryVO = null;
         var _loc2_:Vector.<MapInfoWarHistoryVO> = this.armyRelatived;
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
   }
}
