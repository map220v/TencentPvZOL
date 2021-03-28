package com.qq.modules.td.logic.action.object.leaf
{
   import com.qq.modules.td.logic.action.basic.BasicAction;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.utils.DMath;
   import flash.geom.Point;
   
   public class LeafActionFly extends BasicAction
   {
       
      
      private var _lastUpdateTime:Number;
      
      private var _target:Point;
      
      private var _angle:Number;
      
      public function LeafActionFly()
      {
         super();
         this._target = new Point();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _gameObject.animation.gotoAndPlay("idle",true);
         this._lastUpdateTime = TDGameInfo.getInstance().getCurGameTime();
         this.changeTarget();
      }
      
      override public function runningState() : void
      {
         super.runningState();
         var _loc1_:Number = TDGameInfo.getInstance().getCurGameTime();
         var _loc2_:Number = (_loc1_ - this._lastUpdateTime) * 0.001;
         this._lastUpdateTime = _loc1_;
         var _loc3_:Number = 60 * _loc2_;
         var _loc4_:Number = _loc3_ * Math.cos(DMath.degreesToRandinas(this._angle));
         var _loc5_:Number = _loc3_ * Math.sin(DMath.degreesToRandinas(this._angle));
         _gameObject.setLocation(_gameObject.x + _loc4_,_gameObject.y + _loc5_);
         var _loc6_:int;
         if((_loc6_ = DMath.getDistance(this._target.x,this._target.y,_gameObject.x,_gameObject.y)) < 10)
         {
            this.changeTarget();
         }
      }
      
      private function changeTarget() : void
      {
         this._target.x = DMath.randNum(TDGameInfo.getInstance().gameArea.left + 100,TDGameInfo.getInstance().gameArea.right - 100);
         this._target.y = DMath.randNum(TDGameInfo.getInstance().gameArea.top + 50,TDGameInfo.getInstance().gameArea.bottom - 50);
         this._angle = DMath.getAngle(this._target.x,this._target.y,_gameObject.x,_gameObject.y);
      }
   }
}
