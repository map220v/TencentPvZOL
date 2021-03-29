package com.qq.modules.map.view.mini
{
   import asgui.resources.AssetManager;
   import com.qq.modules.map.MapGlobals;
   import com.qq.modules.map.model.vo.MapBasicCellVO;
   import com.qq.modules.map.model.vo.MapCityCellVO;
   import flash.display.Bitmap;
   import flash.geom.Point;
   
   public class MapMiniViewCell extends Bitmap
   {
       
      
      private var vo:MapBasicCellVO;
      
      public function MapMiniViewCell(param1:MapBasicCellVO)
      {
         var _loc2_:uint = 0;
         super();
         this.vo = param1;
         var _loc3_:* = "Map_Mini_";
         if(param1.isMine)
         {
            _loc3_ += "My_";
         }
         else if(param1 is MapCityCellVO && (param1 as MapCityCellVO).hasDeclaredWar())
         {
            _loc3_ += "Enemy_";
         }
         else
         {
            _loc3_ += "Other_";
         }
         switch(param1.template.id)
         {
            case 1:
               _loc3_ += "City.png";
               break;
            case 2:
               _loc3_ += "Mine.png";
               break;
            case 3:
            case 4:
               _loc3_ += "Mine.png";
         }
         var _loc4_:* = AssetManager.GetNewClass(_loc3_);
         this.bitmapData = _loc4_;
      }
      
      public function Dispose() : void
      {
         this.vo = null;
      }
      
      public function updatePos(param1:int, param2:int, param3:Number, param4:Number) : void
      {
         var _loc5_:Point = MapGlobals.cellToPoint(this.vo.pos);
         this.x = (_loc5_.x - param1) * param3;
         this.y = (_loc5_.y - param2) * param4;
      }
   }
}
