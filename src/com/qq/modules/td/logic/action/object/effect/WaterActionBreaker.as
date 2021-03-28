package com.qq.modules.td.logic.action.object.effect
{
   import com.qq.modules.td.logic.action.basic.BasicAction;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.events.Event;
   
   public class WaterActionBreaker extends BasicAction
   {
       
      
      private var _frameIndex:int = 0;
      
      private var _allLabelNames:Array;
      
      private var _isPlaying:Boolean;
      
      private var _restTime:int = 10000;
      
      private var _lastUpdateTime:int;
      
      public function WaterActionBreaker()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _gameObject.animation.addEventListener(Event.COMPLETE,this.onComplete);
         this._allLabelNames = _gameObject.animation.getAllLabelName();
         this.playLoopAction();
      }
      
      override public function runningState() : void
      {
         var _loc1_:int = 0;
         super.runningState();
         if(!this._isPlaying)
         {
            _loc1_ = TDGameInfo.getInstance().getCurGameTime();
            if(this._lastUpdateTime + this._restTime < _loc1_)
            {
               _gameObject.animation.visible = true;
               this.playLoopAction();
            }
         }
      }
      
      override public function leaveState() : void
      {
         super.leaveState();
      }
      
      private function onComplete(param1:Event) : void
      {
         this._isPlaying = false;
         this._lastUpdateTime = TDGameInfo.getInstance().getCurGameTime();
         _gameObject.animation.visible = false;
         this._restTime = Math.random() * 1000 + 5000;
      }
      
      override public function dispose() : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onComplete);
         super.dispose();
      }
      
      private function playLoopAction(param1:int = 1) : void
      {
         this._isPlaying = true;
         _gameObject.animation.gotoAndPlay(this._allLabelNames[this._frameIndex],param1);
         ++this._frameIndex;
         if(this._frameIndex >= this._allLabelNames.length)
         {
            this._frameIndex = 0;
         }
      }
   }
}
