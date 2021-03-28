package com.qq.modules.td.logic.process
{
   import com.qq.modules.td.model.TDGameInfo;
   import flash.utils.getTimer;
   
   public class TDBasicProcess implements IProcess
   {
       
      
      public var updateDuration:int = -1;
      
      protected var _lastUpdateTime:Number = -1;
      
      private var _pauseTime:int = -1;
      
      private var _pauseTotalDelay:int;
      
      public function TDBasicProcess()
      {
         super();
      }
      
      public function update() : void
      {
         var _loc1_:Number = NaN;
         if(this.updateDuration != -1)
         {
            this.doProcess();
         }
         else
         {
            _loc1_ = TDGameInfo.getInstance().getCurGameTime();
            if(this._lastUpdateTime == -1)
            {
               this._lastUpdateTime = _loc1_;
            }
            if(_loc1_ - this._lastUpdateTime > this.updateDuration)
            {
               this.doProcess();
               this._lastUpdateTime = _loc1_;
            }
         }
      }
      
      public function doProcess() : void
      {
      }
      
      public function reset() : void
      {
         this._lastUpdateTime = -1;
      }
      
      public function dispose() : void
      {
      }
      
      public function get isStop() : Boolean
      {
         return !TDGameInfo.getInstance().isRunningGame && this._pauseTime == -1;
      }
      
      public function get time() : int
      {
         return TDGameInfo.getInstance().getCurGameTime();
      }
      
      public function pause() : void
      {
         this._pauseTime = getTimer();
      }
      
      public function resume() : void
      {
         this._pauseTotalDelay += getTimer() - this._pauseTime;
         this._pauseTime = -1;
      }
   }
}
