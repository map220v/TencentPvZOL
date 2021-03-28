package com.qq.modules.td.logic.action.plant.basic
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.action.plant.BasicPlantAction;
   import com.qq.modules.td.logic.trigger.TDTrigConst;
   import com.qq.modules.td.logic.trigger.events.TriggerEvent;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.utils.CommandDispatcher;
   import flash.geom.Point;
   
   public class PlantActionPushedAway extends BasicPlantAction
   {
       
      
      private var _targetCol:int;
      
      private var _targetRow:int;
      
      private var _targetPt:Point;
      
      private var _speed:int = 5;
      
      public function PlantActionPushedAway()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         var _loc3_:TDMapTileData = null;
         super.enterState(param1);
         this._targetCol = param1[0];
         this._targetRow = param1[1];
         var _loc2_:TDMapTileData = TDGameInfo.getInstance().getRoadTileInf(_plant.plantData.column,_plant.plantData.roadIndex);
         _loc2_.removePlantType(_plant.objectModel.unitType);
         if(this._targetCol < TDGameInfo.getInstance().minCol || this._targetCol > TDGameInfo.getInstance().maxCol || this._targetRow < TDGameInfo.getInstance().minRow || this._targetRow > TDGameInfo.getInstance().maxRow)
         {
            this._targetPt = new Point(_plant.x - 81,_plant.y);
         }
         else
         {
            _loc3_ = TDGameInfo.getInstance().getRoadTileInf(this._targetCol,this._targetRow);
            this._targetPt = TDGameInfo.getInstance().getPlantPos(_loc3_.index,_plant.objectModel.unitType);
            _loc3_.addPlantType(_plant.objectModel.unitType);
         }
         _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_Idle,true);
         _plant.setFrozenAI(true);
         _plant.isVaild = false;
      }
      
      override public function runningState() : void
      {
         var _loc2_:TDMapTileData = null;
         var _loc3_:Number = NaN;
         var _loc4_:Point = null;
         super.runningState();
         var _loc1_:Point = new Point(_plant.x,_plant.y);
         if(this._targetPt.equals(_loc1_))
         {
            if(this._targetCol < TDGameInfo.getInstance().minCol || this._targetCol > TDGameInfo.getInstance().maxCol || this._targetRow < TDGameInfo.getInstance().minRow || this._targetRow > TDGameInfo.getInstance().maxRow)
            {
               _plant.Dispose();
            }
            else
            {
               _loc2_ = TDGameInfo.getInstance().getRoadTileInf(this._targetCol,this._targetRow);
               _plant.plantData.loadTileData(_loc2_);
               _plant.setFrozenAI(false);
               _plant.setAction();
               _plant.isVaild = true;
               CommandDispatcher._dispatcher.dispatchEvent(new TriggerEvent(TDTrigConst.TYPE_PLANT_MOVE,[_plant]));
            }
         }
         else
         {
            _loc3_ = Point.distance(_loc1_,this._targetPt);
            _loc4_ = Point.interpolate(this._targetPt,_loc1_,this._speed >= _loc3_ ? Number(1) : Number(this._speed / _loc3_));
            _plant.setLocation(_loc4_.x,_loc4_.y);
         }
      }
      
      override public function leaveState() : void
      {
         super.leaveState();
      }
   }
}
