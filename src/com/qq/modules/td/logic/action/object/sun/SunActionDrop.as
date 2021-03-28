package com.qq.modules.td.logic.action.object.sun
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.data.game.unit.basic.TDGameObjectData;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.geom.Point;
   
   public class SunActionDrop extends BasicSunAction
   {
       
      
      private var _lastUpdateTime:Number;
      
      public function SunActionDrop()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         if(_sun.beCatchingStep == 0)
         {
            _sun.animation.gotoAndPlay(TDConstant.ObjectAnmi_Idle,true);
         }
         this._lastUpdateTime = TDGameInfo.getInstance().getCurGameTime();
      }
      
      override public function leaveState() : void
      {
         super.leaveState();
      }
      
      override public function runningState() : void
      {
         var _loc7_:Point = null;
         var _loc1_:Number = TDGameInfo.getInstance().getCurGameTime();
         var _loc2_:int = _loc1_ - this._lastUpdateTime;
         this._lastUpdateTime = _loc1_;
         var _loc3_:Number = _sun.sunData.getSpeed(TDGameObjectData.SPEED_SUNDROP) * _loc2_ * 0.01;
         var _loc4_:Point = new Point(_sun.x,_sun.y);
         var _loc5_:Point = _sun.dropTargetPoint;
         var _loc6_:Number;
         if((_loc6_ = Point.distance(_loc4_,_loc5_)) > _loc3_)
         {
            _loc7_ = Point.interpolate(_loc5_,_loc4_,_loc3_ / _loc6_);
            _sun.x = _loc7_.x;
            _sun.y = _loc7_.y;
         }
         else
         {
            _sun.setAction(TDConstant.SunAction_Idle);
         }
      }
   }
}
