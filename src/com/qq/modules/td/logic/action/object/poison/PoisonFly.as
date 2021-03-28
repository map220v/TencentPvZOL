package com.qq.modules.td.logic.action.object.poison
{
   import com.qq.constant.td.TDConstant;
   import com.qq.constant.td.TDObjTypeID;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.action.basic.BasicAction;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.logic.unit.object.TDZombieThrowItem;
   import com.qq.modules.td.logic.unit.plant.BasicPlant;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.utils.DMath;
   import flash.events.Event;
   
   public class PoisonFly extends BasicAction
   {
       
      
      protected var _targetCurSpeed:Number;
      
      protected var _lastUpdateTime:Number;
      
      protected var _pastTime:Number;
      
      private var _maxY:Number;
      
      private var _totalTime:Number;
      
      private var _assY:Number;
      
      private var _speedX:Number;
      
      private var _speedY:Number;
      
      private var _groundY:Number;
      
      private var _isDrop:Boolean;
      
      private var _throwItem:TDZombieThrowItem;
      
      private var _lastPosY:int;
      
      public function PoisonFly()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         this.init();
         this._lastUpdateTime = TDGameInfo.getInstance().getCurGameTime();
         _gameObject.animation.gotoAndStop(TDConstant.PoisonAction_Fly);
      }
      
      private function init() : void
      {
         this._throwItem = _gameObject as TDZombieThrowItem;
         this._targetCurSpeed = 200;
         this._totalTime = 0.6;
         var _loc1_:Number = 0;
         _loc1_ = DMath.getDistance(_gameObject.x,_gameObject.y,this._throwItem.throwTargetX,this._throwItem.throwTargetY);
         this._speedX = Math.abs(_gameObject.x - this._throwItem.throwTargetX) / this._totalTime;
         this._speedY = Math.abs(_gameObject.y - this._throwItem.throwTargetY) * 0.5 / this._totalTime;
         this._assY = this._speedY * 2 / this._totalTime;
         this._groundY = this._throwItem.throwTargetY;
         this._isDrop = false;
         this._lastPosY = _gameObject.y;
      }
      
      override public function runningState() : void
      {
         super.runningState();
         var _loc1_:Number = TDGameInfo.getInstance().getCurGameTime();
         this._pastTime = (_loc1_ - this._lastUpdateTime) * 0.001;
         this._lastUpdateTime = _loc1_;
         this.updatePos();
      }
      
      override public function leaveState() : void
      {
         this._throwItem = null;
         super.leaveState();
      }
      
      protected function updatePos() : void
      {
         var _loc1_:TDMapTileData = null;
         var _loc2_:Array = null;
         var _loc3_:Array = null;
         var _loc4_:IGameObject = null;
         var _loc5_:BasicPlant = null;
         if(_gameObject.getRunningProp(TDConstant.Gameobject_Prop_PoisonHitedTarget) == true)
         {
            return;
         }
         this._speedY += this._assY * this._pastTime;
         _gameObject.setLocation(_gameObject.x - this._speedX * this._pastTime,_gameObject.y + this._speedY * this._pastTime);
         if(this._lastPosY < _gameObject.y)
         {
            this._isDrop = true;
         }
         this._lastPosY = _gameObject.y;
         if(this._isDrop && _gameObject.y > this._groundY)
         {
            _gameObject.setRunningProp(TDConstant.Gameobject_Prop_PoisonHitedTarget,true);
            _loc1_ = TDGameInfo.getInstance().getRoadTileByGamePos(_gameObject.x,_gameObject.y);
            if(_loc1_ != null)
            {
               _loc2_ = TDGameInfo.getInstance().getPlantByTileIndex(_loc1_.index);
               if(_loc2_.length == 0)
               {
                  if(_loc1_.hasState(TDConstant.RoadTileState_Has_UNMUD))
                  {
                     _gameObject.Dispose();
                  }
                  else
                  {
                     if(_loc1_.hasState(TDConstant.RoadTileState_Poison))
                     {
                        _loc1_.cleanState(TDConstant.RoadTileState_Poison);
                        _loc3_ = TDGameInfo.getInstance().getGameObjectMapByCatalgAndType(TDConstant.UnitCatalog_Object,TDObjTypeID.Obj_Poison);
                        for each(_loc4_ in _loc3_)
                        {
                           if(_loc4_.objectModel.tileIndex == _loc1_.index)
                           {
                              _loc4_.Dispose();
                           }
                        }
                     }
                     _gameObject.setAction(TDConstant.PoisonAction_Idle);
                     _loc1_.setState(TDConstant.RoadTileState_Poison);
                     _gameObject.objectModel.loadTileData(_loc1_);
                  }
               }
               else if(_loc2_.length == 1 && (_loc2_[0] as BasicPlant).plantData.plantStaticInfo.id == 1500 && (_loc2_[0] as BasicPlant).getActionID() == TDConstant.PPotatomineAction_Idle)
               {
                  if(_loc1_.hasState(TDConstant.RoadTileState_Has_UNMUD))
                  {
                     _gameObject.Dispose();
                  }
                  else
                  {
                     if(_loc1_.hasState(TDConstant.RoadTileState_Poison))
                     {
                        _loc1_.cleanState(TDConstant.RoadTileState_Poison);
                        _loc3_ = TDGameInfo.getInstance().getGameObjectMapByCatalgAndType(TDConstant.UnitCatalog_Object,TDObjTypeID.Obj_Poison);
                        for each(_loc4_ in _loc3_)
                        {
                           if(_loc4_.objectModel.tileIndex == _loc1_.index)
                           {
                              _loc4_.Dispose();
                           }
                        }
                     }
                     _gameObject.setAction(TDConstant.PoisonAction_Idle);
                     _loc1_.setState(TDConstant.RoadTileState_Poison);
                     _gameObject.objectModel.loadTileData(_loc1_);
                  }
               }
               else
               {
                  for each(_loc5_ in _loc2_)
                  {
                     if(_loc5_.plantData.curArmorHp.get() > 0)
                     {
                        break;
                     }
                     _loc5_.plantData.addBuff(TDConstant.TDBuffID_Poisoned,_loc5_);
                  }
                  _gameObject.animation.addEventListener(Event.COMPLETE,this.explodeCompleteHandler);
                  _gameObject.animation.gotoAndPlay(TDConstant.PoisonAction_Explod);
               }
            }
         }
      }
      
      protected function explodeCompleteHandler(param1:Event) : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.explodeCompleteHandler);
         _gameObject.Dispose();
      }
   }
}
