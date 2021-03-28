package com.qq.modules.td.logic.action.object.bone
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.TDGameObjectCmd;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.TDCropUtil;
   import com.qq.modules.td.logic.action.basic.BasicAction;
   import com.qq.modules.td.logic.unit.object.TDZombieThrowItem;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.utils.DMath;
   
   public class BoneActionThrowing extends BasicAction
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
      
      public function BoneActionThrowing()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         this.init();
         this._lastUpdateTime = TDGameInfo.getInstance().getCurGameTime();
         _gameObject.animation.gotoAndStop("idle");
      }
      
      private function init() : void
      {
         this._throwItem = _gameObject as TDZombieThrowItem;
         this._targetCurSpeed = 200;
         this._maxY = 627;
         this._totalTime = 1.2;
         var _loc1_:Number = 0;
         _loc1_ = DMath.getDistance(_gameObject.x,_gameObject.y,this._throwItem.throwTargetX,this._throwItem.throwTargetY);
         this._speedX = _loc1_ / this._totalTime;
         this._speedY = this._maxY / (this._totalTime / 2);
         this._assY = -this._speedY / (this._totalTime / 2);
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
         this._speedY += this._assY * this._pastTime;
         _gameObject.setLocation(_gameObject.x - this._speedX * this._pastTime,_gameObject.y - this._speedY * this._pastTime);
         _gameObject.rotation += 10;
         if(this._lastPosY < _gameObject.y)
         {
            this._isDrop = true;
         }
         this._lastPosY = _gameObject.y;
         if(this._isDrop && _gameObject.y > this._groundY)
         {
            _loc1_ = TDGameInfo.getInstance().getRoadTileByGamePos(_gameObject.x,_gameObject.y);
            if(_loc1_ != null && TDCropUtil.isPermitCropPlant(_loc1_))
            {
               _loc1_.cleanState(TDConstant.RoadTileState_Ready_Add_Tomb);
               TDGameObjectCmd.addNormalGameObjectByTile(TDConstant.UnitType_TDTomb,_loc1_);
            }
            _gameObject.dispose();
         }
      }
   }
}
