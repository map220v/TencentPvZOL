package com.qq.modules.td.logic.action.object.sunBomb
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.unit.object.TDSunBomb;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.geom.Point;
   
   public class SunBombActionFall extends BasicSunBombAction
   {
       
      
      private var _lastUpdateTime:Number;
      
      public function SunBombActionFall()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _sunBomb.animation.gotoAndPlay(TDConstant.TDSunBombAction_Fall,true);
         this._lastUpdateTime = TDGameInfo.getInstance().getCurGameTime();
      }
      
      override public function runningState() : void
      {
         var _loc1_:Number = TDGameInfo.getInstance().getCurGameTime();
         var _loc2_:int = _loc1_ - this._lastUpdateTime;
         this._lastUpdateTime = _loc1_;
         var _loc3_:Number = _sunBomb.speed * _loc2_ * 65 * 0.001 * 0.1;
         var _loc4_:Point = new Point(_sunBomb.x,_sunBomb.y);
         var _loc5_:Point = _sunBomb.dropTargetPoint;
         var _loc6_:Number;
         if((_loc6_ = Point.distance(_loc4_,_loc5_)) > _loc3_)
         {
            _sunBomb.x = _loc4_.x;
            _sunBomb.y = _loc4_.y + _loc3_;
         }
         else
         {
            _sunBomb.status = TDSunBomb.STATUS_DISAPPEAR;
            _sunBomb.exchangeToNormalSun();
         }
      }
   }
}
