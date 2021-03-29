package com.qq.modules.map.view.map
{
   import com.qq.modules.map.model.vo.MapBasicCellVO;
   import com.qq.modules.map.model.vo.MapTempleCellVO;
   
   public class MapTempleCell extends MapBasicCell
   {
       
      
      public function MapTempleCell()
      {
         super();
         this.hasAllianceFlag = true;
         this.allianceFlagOffsetY = 55;
      }
      
      override public function loadVO(param1:MapBasicCellVO) : void
      {
         super.loadVO(param1);
         var _loc2_:MapTempleCellVO = param1 as MapTempleCellVO;
         setText(_loc2_.templateTemple.name);
      }
   }
}
