package com.qq.modules.td.logic.action.object.dropCard
{
   import com.qq.modules.td.logic.TDUILayerManager;
   import com.qq.modules.td.logic.action.basic.BasicAction;
   import com.qq.modules.td.logic.unit.object.TDDropCard;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.utils.DMath;
   import flash.display.Sprite;
   import flash.geom.Point;
   
   public class DropCardActionFly extends BasicAction
   {
       
      
      private var _target:Point;
      
      private var _angle:Number;
      
      private var _lastUpdateTime:Number;
      
      private var _startTime:int;
      
      private var _existTime:int;
      
      public function DropCardActionFly()
      {
         super();
         this._target = new Point();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         TDUILayerManager.topSceneLayer.addChild(this.view);
         this.setViewPosition(_gameObject.x - this.view.width * 0.5,_gameObject.y - this.view.height);
         this._startTime = TDGameInfo.getInstance().getCurGameTime();
         this._existTime = 5000;
         this._lastUpdateTime = TDGameInfo.getInstance().getCurGameTime();
         this.changeTarget();
      }
      
      override public function runningState() : void
      {
         super.runningState();
         var _loc1_:Number = TDGameInfo.getInstance().getCurGameTime();
         if(_loc1_ - this._startTime > this._existTime)
         {
            _gameObject.Dispose();
            return;
         }
         var _loc2_:Number = (_loc1_ - this._lastUpdateTime) * 0.001;
         this._lastUpdateTime = _loc1_;
         var _loc3_:Number = 60 * _loc2_;
         var _loc4_:Number = _loc3_ * Math.cos(DMath.degreesToRandinas(this._angle));
         var _loc5_:Number = _loc3_ * Math.sin(DMath.degreesToRandinas(this._angle));
         this.setViewPosition(_gameObject.x + _loc4_,_gameObject.y + _loc5_);
         var _loc6_:int;
         if((_loc6_ = DMath.getDistance(this._target.x,this._target.y,_gameObject.x,_gameObject.y)) < 20)
         {
            this.changeTarget();
         }
      }
      
      private function changeTarget() : void
      {
         this._target.x = DMath.randNum(TDGameInfo.getInstance().gameArea.left,TDGameInfo.getInstance().gameArea.right);
         this._target.y = DMath.randNum(TDGameInfo.getInstance().gameArea.top,TDGameInfo.getInstance().gameArea.bottom);
         this._angle = DMath.getAngle(this._target.x,this._target.y,_gameObject.x,_gameObject.y);
      }
      
      private function setViewPosition(param1:Number, param2:Number) : void
      {
         _gameObject.x = this.view.x = param1;
         _gameObject.y = this.view.y = param2;
      }
      
      private function get view() : Sprite
      {
         return (_gameObject as TDDropCard).cardItem;
      }
   }
}
