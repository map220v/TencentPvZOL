package com.qq.modules.td.data.map
{
   import org.as3commons.logging.api.getLogger;
   
   public class TDMapWarfieldData
   {
       
      
      public var roadList:Array;
      
      public var tileW:int;
      
      public var tileH:int;
      
      public function TDMapWarfieldData()
      {
         super();
         this.roadList = new Array();
      }
      
      public function addRoadData(param1:TDMapRoadData) : void
      {
         if(param1 == null)
         {
            getLogger("TD").debug("加入路面数据失败");
            return;
         }
         this.roadList[param1.index] = param1;
      }
      
      public function getRoadNum() : int
      {
         return this.roadList.length;
      }
      
      public function getTotalRoadTileNum() : int
      {
         var _loc1_:TDMapRoadData = this.roadList[0];
         if(_loc1_ == null || _loc1_.tileList == null)
         {
            return 0;
         }
         return _loc1_.tileList.length;
      }
   }
}
