package com.qq.modules.td.logic.action.zombie.basic
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.events.Event;
   import flash.geom.Point;
   import org.as3commons.logging.api.getLogger;
   
   public class ZombieActionWalkVertical extends ZombieActionWalk
   {
       
      
      public function ZombieActionWalkVertical()
      {
         super();
      }
      
      override protected function get playLoop() : int
      {
         return 1;
      }
      
      override protected function get startFrame() : int
      {
         return 1;
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _zombie.animation.addEventListener(Event.COMPLETE,this.onFinish);
      }
      
      private function onFinish(param1:Event) : void
      {
         _zombie.animation.gotoAndPlay(_walkAnimFlagName,this.playLoop > 0 ? this.playLoop : true,this.startFrame);
         this.initBonePos();
      }
      
      override public function leaveState() : void
      {
         _zombie.animation.removeEventListener(Event.COMPLETE,this.onFinish);
      }
      
      override protected function initBonePos() : void
      {
         moveBone = _zombie.animation.getFrameChild(TDConstant.Ground_LayerName);
         if(moveBone)
         {
            lastMoveBonePos = moveBone.m.ty;
         }
      }
      
      override protected function updateBonePos() : void
      {
         var _loc1_:Number = NaN;
         moveBone = _zombie.animation.getFrameChild(TDConstant.Ground_LayerName);
         if(moveBone)
         {
            this.updateMoveTimeScale();
            _loc1_ = Math.abs(moveBone.m.ty - lastMoveBonePos);
            this.move(_loc1_);
            lastMoveBonePos = moveBone.m.ty;
         }
      }
      
      override protected function move(param1:Number) : void
      {
         var _loc2_:Point = null;
         var _loc3_:Number = NaN;
         var _loc4_:int = 0;
         while(param1 != 0)
         {
            if(target == null)
            {
               target = getNextWalkTarget();
            }
            _loc2_ = new Point(_zombie.x,_zombie.y);
            if(target)
            {
               _loc3_ = Point.distance(target,_loc2_);
               if(_loc3_ == 0 && endPoint && endPoint.equals(_loc2_))
               {
                  break;
               }
            }
            if(_loc3_ > param1)
            {
               _loc2_ = Point.interpolate(target,_loc2_,param1 / _loc3_);
               if(int(_zombie.y) != int(_loc2_.y))
               {
                  _loc4_ = TDGameInfo.getInstance().getRoadIndex(_loc2_.y);
                  _zombie.zombieData.roadIndex = _loc4_;
               }
            }
            continue;
            _zombie.setLocation(_loc2_.x,_loc2_.y);
            _zombie.setLocation(target.x,target.y);
            param1 -= _loc3_;
            target = getNextWalkTarget();
            break;
         }
      }
      
      override protected function updateMoveTimeScale() : void
      {
         var _loc1_:Array = null;
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         if(_gameObject.hasRunningProp(TDConstant.GameObject_Prop_ChangeMoveSpeed))
         {
            _gameObject.cleanRunningProp(TDConstant.GameObject_Prop_ChangeMoveSpeed);
            _curTimeScale = 0;
         }
         if(_curTimeScale != _zombie.animation.timeScale)
         {
            _moveSpeed = getMoveSpeed();
            _loc1_ = getWalkLayerInfo();
            if(_loc1_ == null)
            {
               return;
            }
            _loc2_ = _loc1_[2];
            _loc3_ = _loc1_[1];
            _loc4_ = _loc2_ / _loc3_;
            _loc5_ = _moveSpeed * TDGameInfo.speedRatio / _loc4_;
            _curTimeScale = _loc5_;
            _zombie.setTimeScale(_curTimeScale);
            getLogger("td").info("切换移动速度为" + _moveSpeed);
         }
      }
   }
}
