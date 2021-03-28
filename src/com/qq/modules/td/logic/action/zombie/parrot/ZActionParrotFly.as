package com.qq.modules.td.logic.action.zombie.parrot
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.data.game.unit.basic.TDGameObjectData;
   import com.qq.modules.td.logic.action.zombie.BasicZombieAction;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.geom.Point;
   
   public class ZActionParrotFly extends BasicZombieAction
   {
       
      
      private var _lastTime:Number;
      
      private var _moveSpeed:int;
      
      private var _target:IGameObject;
      
      public function ZActionParrotFly()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _zombie.objectModel.isFlying = true;
         this._target = _zombie.curAttackTarget;
         if(this._target.x < _zombie.x)
         {
            _zombie.animation.gotoAndPlay(TDConstant.ZombieAnmi_Fly,true);
         }
         else
         {
            _zombie.animation.gotoAndPlay(TDConstant.ZombieAnmi_FlyBack,true);
         }
         this._moveSpeed = _zombie.model.getSpeed(TDGameObjectData.SPEED_WALK);
      }
      
      override public function runningState() : void
      {
         var _loc1_:int = 0;
         var _loc2_:Number = NaN;
         var _loc3_:Point = null;
         var _loc4_:Point = null;
         var _loc5_:Number = NaN;
         var _loc6_:Point = null;
         var _loc7_:int = 0;
         super.runningState();
         if(!this._target.hasDisposed)
         {
            _loc1_ = TDGameInfo.getInstance().getCurGameTime();
            _loc2_ = this._moveSpeed * (_loc1_ - this._lastTime) * 0.001;
            this._lastTime = _loc1_;
            _loc3_ = new Point(this._target.x,this._target.y);
            _loc4_ = new Point(_zombie.x,_zombie.y);
            _loc5_ = Point.distance(_loc4_,_loc3_);
            if(_loc2_ < _loc5_)
            {
               _loc6_ = Point.interpolate(_loc3_,_loc4_,_loc2_ / _loc5_);
               _loc7_ = TDGameInfo.getInstance().getRoadIndex(_loc6_.y);
               _zombie.zombieData.roadIndex = _loc7_;
               _zombie.setLocation(_loc6_.x,_loc6_.y);
            }
            if(_loc2_ >= _loc5_)
            {
               _zombie.setAction(TDConstant.ZAction_PirateParrot_Carry,[this._target]);
            }
         }
         else
         {
            _zombie.Dispose();
         }
      }
      
      override public function leaveState() : void
      {
         super.leaveState();
      }
   }
}
