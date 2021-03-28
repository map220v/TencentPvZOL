package com.qq.modules.td.data.map
{
   import org.as3commons.logging.api.getLogger;
   
   public class TDMapRoadData
   {
       
      
      public var startX:int;
      
      public var startY:int;
      
      public var endX:int;
      
      public var endY:int;
      
      public var index:int;
      
      public var tileW:int;
      
      public var tileH:int;
      
      public var tileList:Array;
      
      public var visible:Boolean;
      
      public function TDMapRoadData(param1:int, param2:int, param3:int, param4:int, param5:int, param6:Boolean)
      {
         super();
         this.visible = param6;
         this.tileList = new Array();
         this.startX = param1;
         this.startY = param2;
         this.endX = param3;
         this.endY = param4;
         this.index = param5;
      }
      
      public function addTile(param1:TDMapTileData) : void
      {
         if(param1 == null)
         {
            getLogger("TD").debug("加入地块数据失败");
            return;
         }
         this.tileList.push(param1);
      }
   }
}
