package com.qq.modules.td.logic.action.bullet
{
   import asgui.blit.bone.BlitBoneFrameChild;
   import asgui.blit.display.IBlitDisplayObject;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.TDHurtPlantCmd;
   import com.qq.modules.td.data.game.unit.basic.TDGameObjectData;
   import com.qq.modules.td.logic.bt_ai.aiUtils.TDSearchTargetUtils;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.model.TDGameInfo;
   
   public class BulletActionSphinxFireBall extends BasicBulletActionRunning
   {
       
      
      private var _speed:int;
      
      private var _counter:int;
      
      private var _groundBone:IBlitDisplayObject;
      
      private var _lastFrameIndex:int;
      
      private var lastMoveBonePosY:Number;
      
      public function BulletActionSphinxFireBall()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         this._speed = _bullet.bulletData.getSpeed(TDGameObjectData.SPEED_BULLET) * _bullet.shootDir;
         this._lastFrameIndex = _gameObject.animation.getCurrentFrameIndex();
         this.updateMoveTimeScale();
         _gameObject.animation.setBoneVisibleRule(TDConstant.Ground_LayerName,false);
      }
      
      override public function runningState() : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         if(this._groundBone == null)
         {
            this._groundBone = _gameObject.animation.getBonesByNameCompare(TDConstant.Ground_LayerName);
            this.lastMoveBonePosY = this._groundBone.y;
         }
         var _loc1_:int = _gameObject.animation.getCurrentFrameIndex();
         if(this._lastFrameIndex < _loc1_)
         {
            _loc2_ = this._groundBone.y - this.lastMoveBonePosY;
            _loc3_ = _gameObject.y + _loc2_;
            _gameObject.setLocation(_gameObject.x,_loc3_);
         }
         if(this._groundBone)
         {
            this.lastMoveBonePosY = this._groundBone.y;
         }
         super.runningState();
      }
      
      override public function leaveState() : void
      {
         this._groundBone = null;
         super.leaveState();
      }
      
      override protected function updateBulletPos() : void
      {
         var _loc1_:Number = this._speed * _pastTime;
         _bullet.setLocation(_bullet.x + _loc1_,_bullet.y);
      }
      
      override protected function updateBulletState() : void
      {
         var _loc1_:IGameObject = TDSearchTargetUtils.searchTargetPlant(_gameObject);
         if(_loc1_)
         {
            TDHurtPlantCmd.firePlant(_loc1_);
            ++this._counter;
         }
         if(this._counter >= 3 || _bullet.x < TDGameInfo.getInstance().passWarfieldPosX)
         {
            _bullet.dispose();
         }
      }
      
      private function updateMoveTimeScale() : void
      {
         var _loc1_:Array = this.getWalkLayerInfo();
         if(_loc1_ == null)
         {
            return;
         }
         var _loc2_:Number = _loc1_[2];
         var _loc3_:Number = _loc2_;
         var _loc4_:Number = _loc1_[1];
         var _loc5_:Number = _loc2_ / _loc4_;
         var _loc6_:Number = _loc3_ * TDGameInfo.speedRatio / _loc5_;
         _gameObject.setTimeScale(_loc6_);
      }
      
      public function getWalkLayerInfo() : Array
      {
         var _loc5_:BlitBoneFrameChild = null;
         var _loc6_:BlitBoneFrameChild = null;
         var _loc1_:Number = 0;
         var _loc2_:Number = 0;
         var _loc3_:Number = 0;
         var _loc4_:Vector.<BlitBoneFrameChild>;
         if((_loc4_ = _gameObject.animation.animationData.getChildFrameArray(TDConstant.Ground_LayerName,_gameObject.animation.getLastLabel())) != null && _loc4_.length > 1)
         {
            _loc5_ = _loc4_[0];
            _loc6_ = _loc4_[_loc4_.length - 1];
            _loc1_ = Math.abs(_loc5_.m.tx - _loc6_.m.tx);
            _loc2_ = Math.abs(_loc5_.m.ty - _loc6_.m.ty);
            _loc3_ = _loc4_.length / _gameObject.animation.swfFrameRate;
            return [_loc1_,_loc3_,_loc2_];
         }
         return null;
      }
   }
}
