package com.qq.modules.td.view.game.layer.floor
{
   import com.qq.GameGloble;
   import com.qq.modules.td.command.effects.TDEffectCmd;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.model.vo.TDPathPointVO;
   import com.qq.modules.td.model.vo.TDPathVO;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   
   public class TDFloorPathUpdateScheduler
   {
      
      private static const SCHEDULER_TILE_INTERVAL:Number = 80;
       
      
      private var t_scheduler_timeout:int;
      
      private var vo:TDPathVO;
      
      public function TDFloorPathUpdateScheduler(param1:TDPathVO)
      {
         super();
         this.vo = param1;
      }
      
      public static function createPathUpdate(param1:TDPathVO, param2:int = 0) : void
      {
         var _loc3_:TDFloorManager = null;
         if(param2 == 0)
         {
            _loc3_ = TDFloorManager.instance;
            _loc3_.updateMuds(_loc3_.updateVisiblePath().concat(_loc3_.mudsAlwaysRemoving));
            _loc3_.tryRemovePlantsByCells(param1.pathCells);
         }
         else
         {
            setTimeout(pathUpdateByIndex,param2,param1,1,param2);
         }
      }
      
      private static function pathUpdateByIndex(param1:TDPathVO, param2:int, param3:int) : void
      {
         var _loc5_:TDPathPointVO = null;
         var _loc6_:Vector.<TDPathPointVO> = null;
         var _loc7_:TDMapTileData = null;
         var _loc4_:TDFloorManager = TDFloorManager.instance;
         if(param2 < param1.pathCells.length)
         {
            _loc5_ = param1.pathCells[param2];
            _loc6_ = param1.pathCells.slice(0,param2);
            _loc4_.updateMuds(_loc4_.updateVisiblePath(_loc6_).concat(_loc4_.mudsAlwaysRemoving));
            _loc4_.tryRemovePlantsByCells(Vector.<TDPathPointVO>([_loc5_]));
            if(_loc7_ = TDGameInfo.getInstance().getRoadTileInf(_loc5_.col,_loc5_.row))
            {
               TDEffectCmd.playAnimAt(GameGloble.getMudBreakingUrl(),_loc7_.rect.x,_loc7_.rect.y);
            }
            setTimeout(pathUpdateByIndex,param3,param1,++param2,param3);
         }
         else
         {
            _loc4_.pathsVisible.push(param1);
            _loc4_.updateMuds(_loc4_.updateVisiblePath().concat(_loc4_.mudsAlwaysRemoving));
            _loc4_.tryRemovePlantsByCells(param1.pathCells);
         }
      }
      
      public function addTileList(param1:Vector.<TDPathPointVO>) : void
      {
         this.t_scheduler_timeout = setTimeout(this.schedulerTilePoint,SCHEDULER_TILE_INTERVAL,0,param1,true);
      }
      
      public function removeTileList(param1:Vector.<TDPathPointVO>) : void
      {
         this.t_scheduler_timeout = setTimeout(this.schedulerTilePoint,SCHEDULER_TILE_INTERVAL,0,param1,false);
      }
      
      private function schedulerTilePoint(param1:int, param2:Vector.<TDPathPointVO>, param3:Boolean) : void
      {
         var _loc4_:TDFloorManager = null;
         clearTimeout(this.t_scheduler_timeout);
         if(param1 < param2.length)
         {
            (_loc4_ = TDFloorManager.instance).updateMudVisible(param2[param1],param3);
            param1++;
            this.t_scheduler_timeout = setTimeout(this.schedulerTilePoint,SCHEDULER_TILE_INTERVAL,param1,param2,param3);
         }
      }
   }
}
