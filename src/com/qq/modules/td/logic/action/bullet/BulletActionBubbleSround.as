package com.qq.modules.td.logic.action.bullet
{
   import asgui.events.FrameEvent;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import flash.events.Event;
   
   public class BulletActionBubbleSround extends BasicBulletActionRunning
   {
       
      
      private var _targetZombie:IGameObject;
      
      public function BulletActionBubbleSround()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         this._targetZombie = param1[0];
         _bullet.animation.gotoAndPlay("larger");
         _bullet.animation.addEventListener(Event.COMPLETE,this.finishLarger);
         _bullet.animation.addEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onAddBuff);
      }
      
      protected function onAddBuff(param1:FrameEvent) : void
      {
         if(param1.frameLabel == "add")
         {
            _bullet.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onAddBuff);
            this._targetZombie.objectModel.addBuff(TDConstant.TDBuffID_BubbleSround,_bullet.shooter);
         }
      }
      
      override public function runningState() : void
      {
         if(this._targetZombie && _bullet)
         {
            _bullet.x = this._targetZombie.x;
            _bullet.y = this._targetZombie.y - this._targetZombie.damageArea.height * 0.75;
         }
      }
      
      protected function finishLarger(param1:Event) : void
      {
         _bullet.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onAddBuff);
         _bullet.animation.removeEventListener(Event.COMPLETE,this.finishLarger);
         _bullet.Dispose();
      }
      
      override public function leaveState() : void
      {
         _bullet.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onAddBuff);
         _bullet.animation.removeEventListener(Event.COMPLETE,this.finishLarger);
         super.leaveState();
      }
   }
}
