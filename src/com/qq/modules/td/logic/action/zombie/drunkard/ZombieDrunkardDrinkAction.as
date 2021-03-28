package com.qq.modules.td.logic.action.zombie.drunkard
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.action.zombie.BasicZombieAction;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class ZombieDrunkardDrinkAction extends BasicZombieAction
   {
       
      
      private const FRAME_LEN:int = 40;
      
      private var _isDrinkComplete:Boolean;
      
      private var _changePath:Vector.<Point>;
      
      public function ZombieDrunkardDrinkAction()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _gameObject.setFrozenAI(true);
         _gameObject.animation.addEventListener(Event.COMPLETE,this.onFinish);
         _gameObject.animation.gotoAndPlay("drink");
         this._isDrinkComplete = false;
      }
      
      override public function leaveState() : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinish);
         super.leaveState();
      }
      
      private function onFinish(param1:Event) : void
      {
         var _loc4_:Point = null;
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinish);
         _gameObject.setTimeRecord(TDConstant.TimeRecord_ZombieDuration,TDGameInfo.getInstance().getCurGameTime());
         var _loc2_:int = _zombie.zombieData.roadIndex;
         if(_loc2_ <= 1)
         {
            _loc2_++;
         }
         else if(_loc2_ >= TDGameInfo.getInstance().getRoadNum())
         {
            _loc2_--;
         }
         else if(Math.random() > 0.5)
         {
            _loc2_++;
         }
         else
         {
            _loc2_--;
         }
         var _loc3_:Point = new Point(_zombie.x - 20,TDGameInfo.getInstance().getZombieStartWalkPos(_loc2_).y);
         _zombie.zombieData.path = null;
         _zombie.zombieData.roadIndex = _loc2_;
         this._changePath = new Vector.<Point>();
         var _loc5_:int = 1;
         while(_loc5_ <= this.FRAME_LEN)
         {
            _loc4_ = new Point(_zombie.x + (_loc3_.x - _zombie.x) * _loc5_ / this.FRAME_LEN,_zombie.y + (_loc3_.y - _zombie.y) * _loc5_ / this.FRAME_LEN);
            this._changePath.push(_loc4_);
            _loc5_++;
         }
         this._isDrinkComplete = true;
         _zombie.zombieData.addBuff(TDConstant.TDBuffID_God,_zombie);
         _zombie.setRunningProp(TDConstant.Gameobject_Prop_IsResetWalkPath,true);
      }
      
      override public function runningState() : void
      {
         var _loc1_:Point = null;
         if(this._isDrinkComplete)
         {
            if(this._changePath.length > 0)
            {
               _loc1_ = this._changePath.shift();
               _zombie.setLocation(_loc1_.x,_loc1_.y);
            }
            else
            {
               _zombie.zombieData.removeBuff(TDConstant.TDBuffID_God);
               _zombie.setFrozenAI(false);
            }
         }
         super.runningState();
      }
   }
}
