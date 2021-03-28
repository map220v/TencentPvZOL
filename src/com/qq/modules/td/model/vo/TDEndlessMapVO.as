package com.qq.modules.td.model.vo
{
   import PVZ.Cmd.Dto_NoEndTD_Map;
   
   public class TDEndlessMapVO
   {
       
      
      private var _dto:Dto_NoEndTD_Map;
      
      public function TDEndlessMapVO(param1:Dto_NoEndTD_Map)
      {
         super();
         this.loadDto(param1);
      }
      
      public function loadDto(param1:Dto_NoEndTD_Map) : void
      {
         this._dto = param1;
      }
      
      public function get level() : uint
      {
         return this._dto.level;
      }
      
      public function get mapID() : uint
      {
         return this._dto.mapId;
      }
   }
}
