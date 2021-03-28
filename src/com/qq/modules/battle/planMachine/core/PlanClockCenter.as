package com.qq.modules.battle.planMachine.core
{
   import asgui.utils.IAnimatable;
   import asgui.utils.WorldClock;
   import com.greensock.TweenLite;
   import com.qq.modules.battle.view.unit.UnitBase;
   import flash.utils.Timer;
   
   public class PlanClockCenter implements IAnimatable
   {
       
      
      private var _timeRate:int = 1;
      
      private var timerList:Vector.<Timer>;
      
      private var tweenLiteList:Vector.<TweenLite>;
      
      private var unitList:Vector.<UnitBase>;
      
      public function PlanClockCenter()
      {
         super();
         WorldClock.clock.add(this);
         this.reset();
      }
      
      public function reset() : void
      {
         this.stop();
         this.timerList = new Vector.<Timer>();
         this.tweenLiteList = new Vector.<TweenLite>();
         this.unitList = new Vector.<UnitBase>();
      }
      
      public function stop() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(this.timerList)
         {
            _loc1_ = this.timerList.length;
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               this.timerList[_loc2_].stop();
               _loc2_++;
            }
         }
         if(this.tweenLiteList)
         {
            _loc1_ = this.tweenLiteList.length;
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               this.tweenLiteList[_loc2_].kill();
               _loc2_++;
            }
         }
         if(this.unitList)
         {
            _loc1_ = this.unitList.length;
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               if(this.unitList[_loc2_].animation)
               {
                  this.unitList[_loc2_].animation.stop();
               }
               _loc2_++;
            }
         }
      }
      
      public function dispose() : void
      {
         this.reset();
         WorldClock.clock.remove(this);
      }
      
      public function advanceTime(param1:Number) : void
      {
      }
      
      public function set timeRate(param1:int) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(this._timeRate == param1)
         {
            return;
         }
         _loc3_ = this.timerList.length;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.timerList[_loc2_].delay *= this._timeRate;
            this.setTimerRate(this.timerList[_loc2_],param1);
            _loc2_++;
         }
         _loc3_ = this.tweenLiteList.length;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.tweenLiteList[_loc2_].delay *= this._timeRate;
            this.tweenLiteList[_loc2_].duration *= this._timeRate;
            this.setTweenRate(this.tweenLiteList[_loc2_],param1);
            _loc2_++;
         }
         _loc3_ = this.unitList.length;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.setUnitRate(this.unitList[_loc2_],param1);
            _loc2_++;
         }
         this._timeRate = param1;
      }
      
      public function get timeRate() : int
      {
         return this._timeRate;
      }
      
      private function setTimerRate(param1:Timer, param2:int) : void
      {
         param1.delay /= param2;
      }
      
      private function setTweenRate(param1:TweenLite, param2:int) : void
      {
         param1.delay /= param2;
         param1.duration /= param2;
      }
      
      private function setUnitRate(param1:UnitBase, param2:int) : void
      {
         param1.animaRate = param2;
      }
      
      public function addTimer(param1:Timer) : void
      {
         this.timerList.push(param1);
         this.setTimerRate(param1,this._timeRate);
      }
      
      public function removeTimer(param1:Timer) : void
      {
         var _loc2_:int = this.timerList.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(this.timerList[_loc3_] == param1)
            {
               this.timerList.splice(_loc3_,1);
               return;
            }
            _loc3_++;
         }
      }
      
      public function addTweenLite(param1:TweenLite) : void
      {
         this.tweenLiteList.push(param1);
         this.setTweenRate(param1,this._timeRate);
      }
      
      public function removeTweenLite(param1:TweenLite) : void
      {
         var _loc2_:int = this.tweenLiteList.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(this.tweenLiteList[_loc3_] == param1)
            {
               this.tweenLiteList.splice(_loc3_,1);
               return;
            }
            _loc3_++;
         }
      }
      
      public function addUnit(param1:UnitBase) : void
      {
         this.setUnitRate(param1,this._timeRate);
         this.unitList.push(param1);
      }
      
      public function removeUnit(param1:UnitBase) : void
      {
         var _loc2_:int = this.unitList.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(this.unitList[_loc3_] == param1)
            {
               this.unitList.splice(_loc3_,1);
               return;
            }
            _loc3_++;
         }
      }
   }
}
