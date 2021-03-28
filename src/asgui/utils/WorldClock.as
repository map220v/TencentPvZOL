package asgui.utils
{
   import flash.utils.getTimer;
   
   public final class WorldClock implements IAnimatable
   {
      
      public static var clock:WorldClock = new WorldClock();
       
      
      private var animatableList:Vector.<IAnimatable>;
      
      private var _time:Number;
      
      private var isStop:Boolean = true;
      
      private var stopAtTimer:int;
      
      private var _enabled:Boolean = true;
      
      private var _timeScale:Number = 1;
      
      public function WorldClock()
      {
         super();
         this._time = getTimer() * 0.001;
         this.animatableList = new Vector.<IAnimatable>();
      }
      
      public function get time() : Number
      {
         return this._time;
      }
      
      public function resume() : void
      {
         if(this.isStop)
         {
            this.isStop = false;
            this._time += (getTimer() - this.stopAtTimer) * 0.001;
         }
      }
      
      public function pause() : void
      {
         if(!this.isStop)
         {
            this.isStop = true;
            this.stopAtTimer = getTimer();
         }
      }
      
      public function get enabled() : Boolean
      {
         return this._enabled;
      }
      
      public function set enabled(param1:Boolean) : void
      {
         this._enabled = param1;
      }
      
      public function get timeScale() : Number
      {
         return this._timeScale;
      }
      
      public function set timeScale(param1:Number) : void
      {
         if(param1 < 0 || isNaN(param1))
         {
            param1 = 0;
         }
         this._timeScale = param1;
      }
      
      public function contains(param1:IAnimatable) : Boolean
      {
         return this.animatableList.indexOf(param1) >= 0;
      }
      
      public function add(param1:IAnimatable) : void
      {
         if(param1 && this.animatableList.indexOf(param1) == -1)
         {
            this.animatableList.push(param1);
         }
      }
      
      public function remove(param1:IAnimatable) : void
      {
         var _loc2_:int = this.animatableList.indexOf(param1);
         if(_loc2_ >= 0)
         {
            this.animatableList[_loc2_] = null;
         }
      }
      
      public function removeByClass(param1:Class) : Vector.<IAnimatable>
      {
         var _loc2_:int = 0;
         var _loc3_:int = this.animatableList.length;
         var _loc4_:Vector.<IAnimatable> = new Vector.<IAnimatable>();
         while(_loc2_ < _loc3_)
         {
            if(this.animatableList[_loc2_] is param1)
            {
               _loc4_.push(this.animatableList[_loc2_]);
               this.remove(this.animatableList[_loc2_]);
            }
            _loc2_++;
         }
         return _loc4_;
      }
      
      public function clear() : void
      {
         this.animatableList.length = 0;
      }
      
      public function advanceTime(param1:Number) : void
      {
         var _loc5_:Number = NaN;
         var _loc6_:IAnimatable = null;
         if(this.isStop)
         {
            return;
         }
         if(param1 < 0)
         {
            param1 = (_loc5_ = getTimer() * 0.001) - this._time;
            this._time = _loc5_;
         }
         param1 *= this._timeScale;
         var _loc2_:int = this.animatableList.length;
         if(!this.enabled || _loc2_ == 0)
         {
            return;
         }
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            if(_loc6_ = this.animatableList[_loc4_])
            {
               if(_loc3_ != _loc4_)
               {
                  this.animatableList[_loc3_] = _loc6_;
                  this.animatableList[_loc4_] = null;
               }
               _loc6_.advanceTime(param1);
               _loc3_++;
            }
            _loc4_++;
         }
         if(_loc3_ != _loc4_)
         {
            _loc2_ = this.animatableList.length;
            while(_loc4_ < _loc2_)
            {
               var _loc7_:*;
               this.animatableList[_loc7_ = _loc3_++] = this.animatableList[_loc4_++];
            }
            this.animatableList.length = _loc3_;
         }
      }
   }
}
