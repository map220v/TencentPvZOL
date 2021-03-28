package com.qq.modules.main.view
{
   import com.qq.CommandName;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.main.command.GameFlowCmd;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class PopupLayerMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:PopupLayerView;
      
      private var _timer:Timer;
      
      private var _counter:int;
      
      public function PopupLayerMediator()
      {
         super();
         this._counter = 0;
      }
      
      override protected function init() : void
      {
         super.init();
         this._timer = new Timer(1000,1);
         this._timer.addEventListener(TimerEvent.TIMER_COMPLETE,this.onTimerComplete);
      }
      
      override protected function initListener() : void
      {
         addContextListener(CommandName.Common_LockScreen,this.onLockScreen,CommonEvent);
         addContextListener(CommandName.Common_UnlockScreen,this.onUnlockScreen,CommonEvent);
      }
      
      private function onTimerComplete(param1:TimerEvent) : void
      {
         GameFlowCmd.unlockScreen();
      }
      
      private function onLockScreen(param1:CommonEvent) : void
      {
         var _loc2_:int = 0;
         if(!this._timer.running)
         {
            _loc2_ = param1.readCustomParam_Number("lockTime");
            this.view.addMask();
         }
         else
         {
            this._timer.reset();
         }
         this._timer.delay = _loc2_ * 1000;
         this._timer.start();
      }
      
      private function onUnlockScreen(param1:CommonEvent) : void
      {
         this.view.removeMask();
         this._timer.reset();
      }
      
      override public function dispose() : void
      {
         if(this._timer != null)
         {
            this._timer.reset();
            this._timer.removeEventListener(TimerEvent.TIMER_COMPLETE,this.onTimerComplete);
            this._timer = null;
         }
         super.dispose();
      }
   }
}
