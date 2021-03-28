package com.qq.modules.td.view.game.layer.floor
{
   import com.qq.modules.td.model.vo.TDPathPointVO;
   import com.qq.modules.td.model.vo.TDPathVO;
   
   public final class TDFloorUtil
   {
       
      
      public function TDFloorUtil()
      {
         super();
      }
      
      public static function updateCellsByPaths(param1:Vector.<Vector.<int>>, param2:Vector.<TDPathVO>, param3:Vector.<TDPathPointVO> = null) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc8_:TDPathVO = null;
         var _loc4_:Vector.<TDPathPointVO> = new Vector.<TDPathPointVO>();
         var _loc7_:int = param2.length;
         _loc5_ = 0;
         while(_loc5_ < _loc7_)
         {
            _loc8_ = param2[_loc5_];
            _loc6_ = 0;
            while(_loc6_ < _loc8_.pathCells.length)
            {
               _loc4_.push(_loc8_.pathCells[_loc6_]);
               _loc6_++;
            }
            _loc5_++;
         }
         if(param3 != null)
         {
            _loc7_ = param3.length;
            _loc5_ = 0;
            while(_loc5_ < _loc7_)
            {
               _loc4_.push(param3[_loc5_]);
               _loc5_++;
            }
         }
         updateCellsByCells(param1,_loc4_);
      }
      
      public static function updateCellsByCells(param1:Vector.<Vector.<int>>, param2:Vector.<TDPathPointVO>) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc6_:int = 0;
         _loc3_ = 0;
         while(_loc3_ < param1.length)
         {
            param1[_loc3_] = new Vector.<int>(TDPathVO.COL_MAX + 1,true);
            _loc3_++;
         }
         var _loc5_:int = param2.length;
         _loc3_ = 0;
         while(_loc3_ < _loc5_)
         {
            param1[param2[_loc3_].row][param2[_loc3_].col] = 1;
            _loc3_++;
         }
         _loc3_ = 0;
         while(_loc3_ < param1.length)
         {
            _loc4_ = param1[_loc3_].length - 1;
            while(_loc4_ >= 0)
            {
               if(param1[_loc3_][_loc4_] > 0)
               {
                  _loc6_ = (_loc3_ - 1 < 0 ? 0 : (param1[_loc3_ - 1][_loc4_] > 0 ? 1 : 0)) + (_loc3_ + 1 >= param1.length ? 0 : (param1[_loc3_ + 1][_loc4_] > 0 ? 8 : 0)) + (_loc4_ - 1 < 0 ? 0 : (param1[_loc3_][_loc4_ - 1] > 0 ? 4 : 0)) + (_loc4_ + 1 >= param1[_loc3_].length ? 0 : (param1[_loc3_][_loc4_ + 1] > 0 ? 2 : 0));
                  param1[_loc3_][_loc4_] = _loc6_;
               }
               _loc4_--;
            }
            _loc3_++;
         }
      }
   }
}
