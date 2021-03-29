package com.qq.modules.td.logic.action.zombie.basic
{
   import asgui.blit.bone.BlitBoneFrameChild;
   import asgui.events.FrameEvent;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.data.game.unit.basic.TDGameObjectData;
   import com.qq.modules.td.logic.action.zombie.BasicZombieAction;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.geom.Point;
   
   public class ZombieActionWalk extends BasicZombieAction
   {
       
      
      protected var _curTimeScale:Number = 0;
      
      protected var _lastGroundBonePosX:Number;
      
      protected var _walkAnimFlagName:String;
      
      protected var _moveSpeed:Number = 0;
      
      protected var _speedType:int;
      
      protected var moveBone:BlitBoneFrameChild;
      
      protected var lastMoveBonePos:Number;
      
      protected var target:Point;
      
      public function ZombieActionWalk()
      {
         super();
         this._walkAnimFlagName = TDConstant.ZombieAnmi_Walk;
         this._speedType = TDGameObjectData.SPEED_WALK;
      }
      
      protected function getMoveSpeed() : Number
      {
         return _zombie.model.getSpeed(this._speedType);
      }
      
      protected function get playLoop() : int
      {
         return 0;
      }
      
      protected function get startFrame() : int
      {
         var _loc1_:Vector.<int> = _zombie.animation.getFrameLabelRange(this._walkAnimFlagName);
         var _loc2_:int = 0;
         if(_loc1_)
         {
            _loc2_ = _loc1_[1] - _loc1_[0];
         }
         return Math.random() * _loc2_;
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _zombie.animation.gotoAndPlay(this._walkAnimFlagName,this.playLoop > 0 ? this.playLoop : true,this.startFrame);
         this._curTimeScale = 0;
         if(_gameObject.getRunningProp(TDConstant.Gameobject_Prop_IsResetWalkPath))
         {
            this.target = null;
            _gameObject.cleanRunningProp(TDConstant.Gameobject_Prop_IsResetWalkPath);
         }
         this.initBonePos();
         _gameObject.animation.addEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onEvent);
      }
      
      protected function initBonePos() : void
      {
         this.moveBone = _zombie.animation.getFrameChild(TDConstant.Ground_LayerName);
         if(this.moveBone)
         {
            this.lastMoveBonePos = this.moveBone.m.tx;
         }
      }
      
      protected function onEvent(param1:FrameEvent) : void
      {
         if(param1.frameLabel == "playSound")
         {
            TDSoundCmd.playZombieMoveSound(_gameObject.objectModel.staticInfo.type);
         }
      }
      
      override public function runningState() : void
      {
         super.runningState();
         if(!_zombie.animation.isPlaying)
         {
            return;
         }
         this.updateBonePos();
      }
      
      protected function updateBonePos() : void
      {
         var _loc1_:Number = NaN;
         this.moveBone = _zombie.animation.getFrameChild(TDConstant.Ground_LayerName);
         if(this.moveBone)
         {
            this.updateMoveTimeScale();
            if(this.moveBone.m.tx > this.lastMoveBonePos)
            {
               _loc1_ = this.moveBone.m.tx - this.lastMoveBonePos;
               this.move(_loc1_);
            }
            this.lastMoveBonePos = this.moveBone.m.tx;
         }
      }
      
      protected function getNextWalkTarget() : Point
      {
         var _loc1_:Point = _zombie.zombieData.getNextTargetPoint();
         if(_loc1_ == null)
         {
            _loc1_ = new Point(_zombie.x - 2000,_zombie.y);
         }
         return _loc1_;
      }
      
      protected function get endPoint() : Point
      {
         return null;
      }
      
      protected function move(param1:Number) : void
      {
         var _loc_2:Point = null;
         var _loc_3:Number = NaN;
         var _loc_4:int = 0;
         while (param1 > 0)
         {

            if (this.target == null)
            {
               this.target = this.getNextWalkTarget();
            }
            _loc_2 = new Point(_zombie.x, _zombie.y);
            if (this.target)
            {
               _loc_3 = Point.distance(this.target, _loc_2);
               if (_loc_3 == 0 && this.endPoint && this.endPoint.equals(_loc_2))
               {
                  break;
               }
            }
            if (_loc_3 <= param1)
            {
               _zombie.setLocation(this.target.x, this.target.y);
               param1 = param1 - _loc_3;
               this.target = this.getNextWalkTarget();
               continue;
            }
            _loc_2 = Point.interpolate(this.target, _loc_2, param1 / _loc_3);
            if (int(_zombie.y) != int(_loc_2.y))
            {
               _loc_4 = TDGameInfo.getInstance().getRoadIndex(_loc_2.y);
               _zombie.zombieData.roadIndex = _loc_4;
            }
            _zombie.setLocation(_loc_2.x, _loc_2.y);
            break;
         }
         return;
      }
      
      protected function updateMoveTimeScale() : void
      {
         var _loc1_:Array = null;
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         if(_gameObject.hasRunningProp(TDConstant.GameObject_Prop_ChangeMoveSpeed))
         {
            _gameObject.cleanRunningProp(TDConstant.GameObject_Prop_ChangeMoveSpeed);
            this._curTimeScale = 0;
         }
         if(this._curTimeScale != _zombie.animation.timeScale)
         {
            this._moveSpeed = this.getMoveSpeed();
            _loc1_ = getWalkLayerInfo();
            if(_loc1_ == null)
            {
               return;
            }
            _loc2_ = _loc1_[0];
            _loc3_ = _loc1_[1];
            _loc4_ = _loc2_ / _loc3_;
            _loc5_ = this._moveSpeed * TDGameInfo.speedRatio / _loc4_;
            this._curTimeScale = _loc5_;
            _zombie.setTimeScale(this._curTimeScale);
         }
      }
      
      override public function leaveState() : void
      {
         _zombie.setTimeScale(_zombie.timeScale);
      }
      
      override public function dispose() : void
      {
         _gameObject.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onEvent);
         super.dispose();
      }
   }
}
