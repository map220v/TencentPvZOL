package com.qq.modules.td.logic.action.object.quickSand
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.TDGameObjectCmd;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.action.basic.BasicAction;
   import com.qq.modules.td.logic.numeric.TDCheckCollision;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.geom.Rectangle;
   
   public class LongQuickSandAction extends BasicAction
   {
       
      
      private const sandLen:int = 8;
      
      private var _duringTime:int;
      
      private var _enterTime:int;
      
      private var forbidTileList:Array;
      
      public function LongQuickSandAction()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         var _loc3_:IGameObject = null;
         var _loc4_:int = 0;
         var _loc5_:TDMapTileData = null;
         super.enterState(param1);
         var _loc2_:Array = TDGameInfo.getInstance().getGameObjectMapByCatalg(TDConstant.UnitCatalog_Plant).concat();
         for each(_loc3_ in _loc2_)
         {
            if(_loc3_ != null && _loc3_.isVaild)
            {
               if(_loc3_.objectModel.roadIndex == _gameObject.objectModel.roadIndex && _loc3_.objectModel.column > _gameObject.objectModel.column - this.sandLen && _loc3_.objectModel.column <= _gameObject.objectModel.column)
               {
                  _loc3_.Dispose();
               }
            }
         }
         this.forbidTileList = [];
         _loc4_ = 0;
         while(_loc4_ < this.sandLen)
         {
            if((_loc5_ = TDGameInfo.getInstance().getRoadTileInf(_gameObject.objectModel.column - _loc4_,_gameObject.objectModel.roadIndex)) != null)
            {
               this.forbidTileList.push(_loc5_.index);
            }
            _loc4_++;
         }
         this.setPlantForbid(true);
         this._duringTime = _gameObject.getRunningProp(TDConstant.Gameobject_Prop_InitUnitParam) * 1000;
         this._enterTime = TDGameInfo.getInstance().getCurGameTime();
         _gameObject.animation.gotoAndPlay("start",true);
         _gameObject.animation.setBoneVisibleRule("flower_*",false);
      }
      
      override public function runningState() : void
      {
         var _loc5_:IGameObject = null;
         if(this._enterTime + this._duringTime < TDGameInfo.getInstance().getCurGameTime())
         {
            this.setPlantForbid(false);
            _gameObject.Dispose();
            return;
         }
         var _loc1_:Array = TDGameInfo.getInstance().getZombieList([_gameObject.objectModel.roadIndex],0,false,true,false);
         var _loc2_:int = _loc1_.length;
         var _loc3_:Rectangle = TDCheckCollision.getNewObjRect(_gameObject,_gameObject.attackArea);
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            if(!(_loc5_ = _loc1_[_loc4_]).objectModel.checkState(TDConstant.TDUnitState_OnConvey))
            {
               if(!_loc5_.objectModel.hasBuff(TDConstant.TDBuffID_UsedConvey))
               {
                  if(_loc3_.contains(_loc5_.x,_loc5_.y))
                  {
                     _loc5_.objectModel.addBuff(TDConstant.TDBuffID_Convey,_loc5_);
                     _loc5_.objectModel.addBuff(TDConstant.TDBuffID_UsedConvey,_loc5_);
                     TDGameObjectCmd.addConveyEffect(_loc5_,_gameObject.uid,_loc3_.x);
                  }
               }
            }
            _loc4_++;
         }
      }
      
      override public function leaveState() : void
      {
         super.leaveState();
         this.setPlantForbid(false);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         this.forbidTileList = null;
      }
      
      private function setPlantForbid(param1:Boolean) : void
      {
         var _loc4_:int = 0;
         var _loc5_:TDMapTileData = null;
         if(this.forbidTileList == null)
         {
            return;
         }
         var _loc2_:int = this.forbidTileList.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = this.forbidTileList[_loc3_];
            if((_loc5_ = TDGameInfo.getInstance().getRoadTileByIndex(_loc4_)) != null)
            {
               if(param1)
               {
                  _loc5_.setState(TDConstant.RoadTileState_forbidCropPlant_Temporary);
               }
               else
               {
                  _loc5_.cleanState(TDConstant.RoadTileState_forbidCropPlant_Temporary);
               }
            }
            _loc3_++;
         }
      }
   }
}
