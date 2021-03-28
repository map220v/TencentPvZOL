package com.qq.modules.td.logic.action.object.yakshaStorm
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.action.basic.BasicAction;
   import com.qq.modules.td.logic.numeric.TDCheckCollision;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.model.TDGameInfo;
   
   public class YakshaStormMove extends BasicAction
   {
       
      
      private var _speed:Number;
      
      private var _pastTime:Number;
      
      private var _lastUpdateTime:Number;
      
      private var _direction:int = -1;
      
      private var _passedPlantList:Array;
      
      public function YakshaStormMove()
      {
         this._passedPlantList = [];
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         this._speed = _gameObject.objectModel.staticInfo.getParam(TDConstant.NormalObj_Param_MoveSpeed);
         this._lastUpdateTime = TDGameInfo.getInstance().getCurGameTime();
         _gameObject.animation.gotoAndPlay("animation",true);
      }
      
      override public function runningState() : void
      {
         var _loc2_:TDMapTileData = null;
         var _loc3_:Array = null;
         var _loc4_:IGameObject = null;
         var _loc1_:Number = TDGameInfo.getInstance().getCurGameTime();
         this._pastTime = (_loc1_ - this._lastUpdateTime) * 0.001;
         this._lastUpdateTime = _loc1_;
         _gameObject.setLocation(_gameObject.x - this._speed * this._pastTime,_gameObject.y);
         if(!TDGameInfo.getInstance().isInScreen(_gameObject.x,_gameObject.y))
         {
            _gameObject.Dispose();
         }
         else
         {
            _loc2_ = TDGameInfo.getInstance().getRoadTileByGamePos(_gameObject.x,_gameObject.y);
            if(_loc2_)
            {
               _loc3_ = TDGameInfo.getInstance().getPlantListByRoadIndex([_loc2_.roadIndex]);
               for each(_loc4_ in _loc3_)
               {
                  if(_loc4_ && this._passedPlantList.indexOf(_loc4_.uid) < 0)
                  {
                     if(TDCheckCollision.isCollision(_loc4_,_loc4_.damageArea,_gameObject,_gameObject.damageArea))
                     {
                        this._passedPlantList.push(_loc4_.uid);
                        _loc4_.objectModel.addBuff(TDConstant.TDBuffID_StormDown,_loc4_);
                     }
                  }
               }
            }
         }
         super.runningState();
      }
   }
}
