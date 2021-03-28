package com.qq.modules.map
{
   import asgui.core.Application;
   import com.tencent.protobuf.Int64;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import org.allencuilib.map.interfaces.IMapBackground;
   
   public final class MapGlobals
   {
      
      public static var myAllianceId:Int64;
      
      public static const MAP_AREA_ID_1:int = 1;
      
      public static const MAP_AREA_ID_2:int = 2;
      
      public static const MAP_AREA_ID_3:int = 3;
      
      public static const MAP_CELLS_IN_AREA_ADDED:String = "MAP_CELLS_IN_AREA_ADDED";
      
      public static const MAP_CELLS_IN_AREA_REMOVED:String = "MAP_CELLS_IN_AREA_REMOVED";
      
      public static const MAP_CELLS_IN_AREA_MODIFIED:String = "MAP_CELLS_IN_AREA_MODIFIED";
      
      public static const MAP_CELLS_IN_AREA_UPDATED:String = "MAP_CELLS_IN_AREA_UPDATED";
      
      public static const MAP_ARMYS_RELATIVED_UPDATED:String = "MAP_ARMYS_RELATIVED_UPDATED";
      
      public static const MAP_DO_SHOW_UI:String = "MAP_DO_SHOW_UI";
      
      public static const MAP_DO_HIDE_UI:String = "MAP_DO_HIDE_UI";
      
      public static var bg:IMapBackground;
      
      public static const MAP_VIEW_PORT_REAL:int = 1;
      
      public static const MAP_VIEW_PORT_REAL_MAX:int = 2;
      
      public static const MAP_VIEW_PORT_REQUEST_INNER:int = 3;
      
      public static const MAP_VIEW_PORT_REQUEST_OUTTER:int = 4;
      
      public static const MAP_OBJECT_TYPE:String = "1";
      
      public static const MAP_CAMERA_TO:String = "MAP_CAMERA_TO";
      
      public static const MAP_AFTER_CAMERA_TO:String = "MAP_AFTER_CAMERA_TO";
      
      public static const MAP_CELL_TYPE_CITY:int = 1;
      
      public static const MAP_CELL_TYPE_MINE:int = 2;
      
      public static const MAP_CELL_TYPE_TEMPLE:int = 3;
      
      public static const MAP_CELL_TYPE_CITY_BUILDING_TAG:int = 11;
       
      
      public function MapGlobals()
      {
         super();
      }
      
      public static function pointToCell(param1:Point) : Point
      {
         var _loc2_:Point = MapGlobals.bg.CoordToTile(param1);
         _loc2_.x /= MapGlobals.bg.data.xLength;
         _loc2_.y /= MapGlobals.bg.data.yLength;
         return _loc2_;
      }
      
      public static function cellToPoint(param1:Point) : Point
      {
         param1 = param1.clone();
         param1.x *= MapGlobals.bg.data.xLength;
         param1.y *= MapGlobals.bg.data.yLength;
         return MapGlobals.bg.TileToCoord(param1);
      }
      
      public static function getTileCellRectByScreenRect(param1:Rectangle) : Rectangle
      {
         var _loc2_:Point = MapGlobals.pointToCell(param1.topLeft);
         var _loc3_:Point = MapGlobals.pointToCell(param1.bottomRight);
         var _loc4_:Point = MapGlobals.pointToCell(new Point(param1.x + param1.width,param1.y));
         var _loc5_:Point = MapGlobals.pointToCell(new Point(param1.x,param1.y + param1.height));
         return new Rectangle(int(_loc2_.x),int(_loc4_.y),Math.ceil(_loc3_.x - _loc2_.x),Math.ceil(_loc5_.y - _loc4_.y));
      }
      
      public static function getViewPort(param1:int, param2:int, param3:int) : Rectangle
      {
         var _loc5_:Rectangle = null;
         var _loc4_:Application = Application.application;
         switch(param1)
         {
            case MAP_VIEW_PORT_REAL:
               _loc5_ = new Rectangle(param2,param3,_loc4_.width,_loc4_.height);
               break;
            case MAP_VIEW_PORT_REAL_MAX:
               _loc5_ = new Rectangle(param2 - (_loc4_.maxWidth - _loc4_.width) / 2,param3 - (_loc4_.maxHeight - _loc4_.height) / 2,_loc4_.maxWidth,_loc4_.maxHeight);
               break;
            case MAP_VIEW_PORT_REQUEST_INNER:
               _loc5_ = new Rectangle(param2 - 0.5 * _loc4_.maxWidth / 2,param3 - 0.5 * _loc4_.maxHeight / 2,_loc4_.maxWidth * 2,_loc4_.maxHeight * 2);
               break;
            case MAP_VIEW_PORT_REQUEST_OUTTER:
               _loc5_ = new Rectangle(param2 - 3 * _loc4_.maxWidth / 2,param3 - 3 * _loc4_.maxHeight / 2,_loc4_.maxWidth * 4,_loc4_.maxHeight * 4);
         }
         return _loc5_;
      }
      
      public static function getMapSize(param1:int) : int
      {
         var _loc2_:int = 0;
         switch(param1)
         {
            case 1:
               _loc2_ = 56;
               break;
            case 2:
               _loc2_ = 20;
               break;
            case 3:
               _loc2_ = 1;
         }
         return _loc2_;
      }
   }
}
