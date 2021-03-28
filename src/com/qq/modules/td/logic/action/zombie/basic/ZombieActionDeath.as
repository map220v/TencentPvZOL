package com.qq.modules.td.logic.action.zombie.basic
{
   import asgui.blit.bone.BlitBoneFrameChild;
   import com.greensock.TweenMax;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.action.zombie.BasicZombieAction;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.utils.DMath;
   import flash.events.Event;
   
   public class ZombieActionDeath extends BasicZombieAction
   {
       
      
      protected var _animFlagName:String;
      
      private var isFixAnimationState:Boolean = false;
      
      private var _moveBone:BlitBoneFrameChild;
      
      private var lastMoveBonePosX:Number;
      
      private var lastGetMoveBoneFrame:int = -1;
      
      public function ZombieActionDeath()
      {
         super();
      }
      
      override public function setGameObject(param1:IGameObject, param2:String) : void
      {
         var _loc3_:Array = null;
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:String = null;
         super.setGameObject(param1,param2);
         if(param1 != null)
         {
            _loc3_ = param1.animation.getAllLabelName();
            _loc4_ = new Array();
            _loc5_ = 0;
            while(_loc5_ < _loc3_.length)
            {
               if((_loc7_ = _loc3_[_loc5_]).indexOf(TDConstant.ZombieAnmi_Death) != -1)
               {
                  _loc4_.push(_loc7_);
               }
               _loc5_++;
            }
            _loc6_ = Math.max(0,DMath.randNum(0,_loc4_.length - 1));
            this._animFlagName = _loc4_[_loc6_];
         }
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         if(_zombie.animation.getLastLabel() == TDConstant.ZombieAnmi_Walk)
         {
            this.isFixAnimationState = true;
         }
         else
         {
            _zombie.animation.gotoAndPlay(this._animFlagName,false);
            _zombie.animation.addEventListener(Event.COMPLETE,this.onFinishAction);
            _zombie.dropArmor();
            this.isFixAnimationState = false;
         }
      }
      
      override public function runningState() : void
      {
         var _loc1_:Vector.<int> = null;
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         if(this.isFixAnimationState)
         {
            _loc1_ = _zombie.animation.getFrameLabelRange(TDConstant.ZombieAnmi_Walk);
            if(_loc1_[1] - _zombie.animation.currentFrame < 20 || _zombie.animation.currentFrame - _loc1_[0] < 40)
            {
               _zombie.animation.gotoAndPlay(this._animFlagName,false);
               _zombie.animation.addEventListener(Event.COMPLETE,this.onFinishAction);
               _zombie.dropArmor();
               this.isFixAnimationState = false;
            }
            else
            {
               _loc2_ = this.moveBone.m.tx - this.lastMoveBonePosX;
               if(_loc2_ > 0)
               {
                  _loc3_ = _zombie.x - _loc2_ * _gameObject.objectModel.dirction;
                  _zombie.setLocation(_loc3_,_zombie.y);
               }
               if(this.moveBone)
               {
                  this.lastMoveBonePosX = this.moveBone.m.tx;
               }
            }
         }
      }
      
      override public function leaveState() : void
      {
         _zombie.animation.removeEventListener(Event.COMPLETE,this.onFinishAction);
         TweenMax.killTweensOf(_zombie);
      }
      
      protected function onFinishAction(param1:Event) : void
      {
         if(_zombie)
         {
            TweenMax.to(_zombie,0.3,{
               "alpha":0,
               "delay":1,
               "onComplete":this.onFinishDisappear
            });
         }
      }
      
      protected function onFinishDisappear() : void
      {
         if(_zombie == null || !_zombie.isVaild)
         {
            return;
         }
         _zombie.setAction(TDConstant.ZAction_Disappear,null,true);
      }
      
      private function get moveBone() : BlitBoneFrameChild
      {
         if(this.lastGetMoveBoneFrame != _zombie.animation.currentFrame)
         {
            this._moveBone = _zombie.animation.getFrameChild(TDConstant.Ground_LayerName);
            if(isNaN(this.lastMoveBonePosX))
            {
               this.lastMoveBonePosX = this._moveBone.m.tx;
            }
            this.lastGetMoveBoneFrame != _zombie.animation.currentFrame;
         }
         return this._moveBone;
      }
   }
}
