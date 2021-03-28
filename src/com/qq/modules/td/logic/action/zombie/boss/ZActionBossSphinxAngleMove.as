package com.qq.modules.td.logic.action.zombie.boss
{
   import asgui.blit.bone.BlitBoneFrameChild;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.data.map.TDMapRoadData;
   import com.qq.modules.td.logic.action.zombie.BasicZombieAction;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.geom.Point;
   import org.as3commons.logging.api.getLogger;
   
   public class ZActionBossSphinxAngleMove extends BasicZombieAction
   {
       
      
      private var _nextMoveRoadIndex:int;
      
      private var _targetY:int;
      
      private var _moveSpeed:int;
      
      private var _moveDistance:Number;
      
      private var moveBone:BlitBoneFrameChild;
      
      protected var _curTimeScale:Number = 0;
      
      private var lastMoveBonePosY:Number;
      
      private var _moveUp:Boolean;
      
      private var _lastFrameIndex:int;
      
      private var _checkRoadTime:Number;
      
      public function ZActionBossSphinxAngleMove()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         var _loc3_:String = null;
         var _loc4_:TDMapRoadData = null;
         var _loc5_:Point = null;
         getLogger("boss").info("boss angle move");
         super.enterState(param1);
         var _loc2_:XML = _gameObject.getRunningProp(TDConstant.Gameobject_Prop_InitParamXml);
         if(_loc2_ != null)
         {
            this._moveSpeed = int(_loc2_.angryMoveSpeed.@value);
         }
         if(param1 != null)
         {
            this._nextMoveRoadIndex = param1[0];
            if((_loc4_ = TDGameInfo.getInstance().getRoadInfo(this._nextMoveRoadIndex)) != null)
            {
               _loc5_ = TDGameInfo.getInstance().getZombieStartWalkPos(this._nextMoveRoadIndex);
               this._targetY = _loc5_.y - 20;
            }
            if(_gameObject.objectModel.roadIndex < this._nextMoveRoadIndex)
            {
               this._moveUp = false;
            }
            else
            {
               this._moveUp = true;
            }
         }
         if(this._moveUp)
         {
            _loc3_ = "walkingUp";
         }
         else
         {
            _loc3_ = "walkingDown";
         }
         _gameObject.animation.gotoAndPlay(_loc3_,true);
         this._curTimeScale = 0;
         this._lastFrameIndex = _gameObject.animation.getCurrentFrameIndex();
         this._checkRoadTime = TDGameInfo.getInstance().getCurGameTime();
      }
      
      override public function leaveState() : void
      {
         this.moveBone = null;
         _gameObject.objectModel.roadIndex = this._nextMoveRoadIndex;
         _gameObject.setTimeScale(_gameObject.timeScale);
         super.leaveState();
      }
      
      override public function runningState() : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         this.moveBone = _zombie.animation.getFrameChild(TDConstant.Ground_LayerName);
         if(isNaN(this.lastMoveBonePosY))
         {
            this.lastMoveBonePosY = this.moveBone.m.tx;
         }
         this.updateMoveTimeScale();
         var _loc1_:int = _gameObject.animation.getCurrentFrameIndex();
         if(this._lastFrameIndex < _loc1_)
         {
            _loc3_ = this.moveBone.m.ty - this.lastMoveBonePosY;
            _loc4_ = _gameObject.y + _loc3_;
            _gameObject.setLocation(_gameObject.x,_loc4_);
         }
         if(this.moveBone)
         {
            this.lastMoveBonePosY = this.moveBone.m.ty;
         }
         super.runningState();
         if(this._moveUp)
         {
            if(_gameObject.y < this._targetY)
            {
               _gameObject.setAction(TDConstant.ZAction_BossSphinx_AngleAttack);
            }
         }
         else if(_gameObject.y > this._targetY)
         {
            _gameObject.setAction(TDConstant.ZAction_BossSphinx_AngleAttack);
         }
         var _loc2_:Number = TDGameInfo.getInstance().getCurGameTime();
         if(_loc2_ - this._checkRoadTime > 1000)
         {
            _gameObject.objectModel.roadIndex = TDGameInfo.getInstance().getRoadIndex(_gameObject.y);
            this._checkRoadTime = _loc2_;
         }
      }
      
      private function updateMoveTimeScale() : void
      {
         var _loc1_:Array = null;
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         if(this._curTimeScale != _gameObject.animation.timeScale)
         {
            _loc1_ = getWalkLayerInfo();
            if(_loc1_ == null)
            {
               return;
            }
            _loc2_ = _loc1_[2];
            this._moveDistance = _loc2_;
            _loc3_ = _loc1_[1];
            _loc4_ = _loc2_ / _loc3_;
            _loc5_ = this._moveSpeed * TDGameInfo.speedRatio / _loc4_;
            this._curTimeScale = _loc5_;
            _zombie.setTimeScale(this._curTimeScale);
            getLogger("TD").debug("切换移动速度" + this._curTimeScale);
         }
      }
   }
}
