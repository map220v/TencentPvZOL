package com.qq.modules.td.model
{
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.miniGame.jewels.TDMiniGameJewelsControler;
   import flash.geom.Point;
   import tencent.data.ArgData;
   
   public class TDMiniGameJewelsData
   {
      
      private static var _instance:TDMiniGameJewelsData;
       
      
      private var control:TDMiniGameJewelsControler;
      
      public var colNum:int;
      
      public var rowNum:int;
      
      public var jewelTypeList:Array;
      
      public function TDMiniGameJewelsData()
      {
         super();
      }
      
      public static function get instance() : TDMiniGameJewelsData
      {
         if(!_instance)
         {
            _instance = new TDMiniGameJewelsData();
         }
         return _instance;
      }
      
      public function reset() : void
      {
         this.colNum = (TDStageInfo.getInstance().miniGameParamDic["colNum"] as ArgData).arg[0];
         this.rowNum = (TDStageInfo.getInstance().miniGameParamDic["rowNum"] as ArgData).arg[0];
         this.jewelTypeList = (TDStageInfo.getInstance().miniGameParamDic["jewelType"] as ArgData).arg;
         if(!this.control)
         {
            this.control = new TDMiniGameJewelsControler();
         }
         this.control.reset();
      }
      
      public function getMapData(param1:int, param2:int) : TDMapTileData
      {
         var _loc3_:int = TDGameInfo.getInstance().getRoadTileNum();
         return TDGameInfo.getInstance().getRoadTileInf(this.colNum - param1 - 1 + (_loc3_ - this.colNum),param2 + 1);
      }
      
      public function getIdxyData(param1:TDMapTileData) : Point
      {
         var _loc2_:Point = new Point();
         var _loc3_:int = TDGameInfo.getInstance().getRoadTileNum();
         _loc2_.x = this.colNum - (param1.roadCol - (_loc3_ - this.colNum)) - 1;
         _loc2_.y = param1.roadRow - 1;
         return _loc2_;
      }
      
      public function dispose() : void
      {
         if(this.control)
         {
            this.control.dispose();
            this.control = null;
         }
      }
   }
}
