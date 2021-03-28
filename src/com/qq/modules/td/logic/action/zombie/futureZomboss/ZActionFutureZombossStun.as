package com.qq.modules.td.logic.action.zombie.futureZomboss
{
   import com.qq.modules.td.logic.action.zombie.BasicZombieAction;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.events.Event;
   
   public class ZActionFutureZombossStun extends BasicZombieAction
   {
       
      
      private var _startTime:int;
      
      private var _stunTime:int = 8000;
      
      private var _isStuning:Boolean;
      
      public function ZActionFutureZombossStun()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         if(param1 != null)
         {
            this._stunTime = param1[0];
         }
         this._isStuning = false;
         _gameObject.setFrozenAI(true);
         _gameObject.animation.addEventListener(Event.COMPLETE,this.onFinishStunStart);
         _gameObject.animation.gotoAndPlay("stun_start");
      }
      
      private function onFinishStunStart(param1:Event) : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinishStunStart);
         this._isStuning = true;
         this._startTime = TDGameInfo.getInstance().getCurGameTime();
         _gameObject.animation.gotoAndPlay("stun_loop",true);
      }
      
      override public function runningState() : void
      {
         super.runningState();
         if(this._isStuning && TDGameInfo.getInstance().getCurGameTime() > this._startTime + this._stunTime)
         {
            _gameObject.animation.addEventListener(Event.COMPLETE,this.onFinishStunEnd);
            _gameObject.animation.gotoAndPlay("stun_end");
            this._isStuning = false;
         }
      }
      
      private function onFinishStunEnd(param1:Event) : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinishStunEnd);
         _gameObject.setFrozenAI(false);
         _gameObject.setAction();
      }
      
      override public function leaveState() : void
      {
         super.leaveState();
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinishStunStart);
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinishStunEnd);
      }
   }
}
