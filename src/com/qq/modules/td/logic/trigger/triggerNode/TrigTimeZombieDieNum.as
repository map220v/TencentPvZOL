package com.qq.modules.td.logic.trigger.triggerNode
{
   import asgui.utils.IAnimatable;
   import asgui.utils.WorldClock;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.td.logic.trigger.TDTrigConst;
   import org.as3commons.logging.api.getLogger;
   
   public class TrigTimeZombieDieNum extends TrigPvz implements IAnimatable
   {
       
      
      private var targetTime:Number;
      
      private var cacheTime:Number;
      
      private var targetNum:int;
      
      private var cacheNum:int;
      
      private var isTimeRuning:Boolean = false;
      
      private var isPause:Boolean = false;
      
      private var pauseTime:Number;
      
      public function TrigTimeZombieDieNum()
      {
         super();
      }
      
      override protected function init() : void
      {
         this.targetTime = triggerParams[0];
         this.targetNum = triggerParams[1];
         this.cacheTime = WorldClock.clock.time;
         this._triggerType = [TDTrigConst.TYPE_ZOMBIE_DIE];
         getLogger("trigger").debug("TrigTimeZombieDieNum: " + this.targetTime + "  ,  " + this.targetNum);
         this.ui.txt.text = this.targetNum + "( " + Math.floor(this.targetTime) + " )";
         WorldClock.clock.add(this);
      }
      
      override protected function resumeHandler(param1:CommonEvent) : void
      {
         this.isPause = false;
         this.cacheTime = WorldClock.clock.time - (this.pauseTime - this.cacheTime);
      }
      
      override protected function pauseHandler(param1:CommonEvent) : void
      {
         this.isPause = true;
         this.pauseTime = WorldClock.clock.time;
      }
      
      public function advanceTime(param1:Number) : void
      {
         if(this.isPause)
         {
            return;
         }
         if(this.isTimeRuning)
         {
            if(WorldClock.clock.time - this.cacheTime > this.targetTime)
            {
               this.isTimeRuning = false;
               this.ui.txt.text = this.targetNum + "( " + Math.floor(this.targetTime) + " )";
               this.cacheTime = WorldClock.clock.time;
               this.cacheNum = 0;
            }
            else
            {
               this.ui.txt.text = this.targetNum - this.cacheNum + "( " + Math.floor(this.targetTime - (WorldClock.clock.time - this.cacheTime)) + " )";
            }
            if(this.targetNum <= this.cacheNum)
            {
               this.setResult(true);
            }
         }
      }
      
      override public function notify(param1:String, param2:Array) : void
      {
         if(!this.isTimeRuning)
         {
            this.cacheTime = WorldClock.clock.time;
         }
         this.isTimeRuning = true;
         this.cacheNum += 1;
      }
      
      override public function execute() : Boolean
      {
         if(result == 1)
         {
            return true;
         }
         if(result == -1)
         {
            return false;
         }
         if(this.targetNum <= this.cacheNum)
         {
            this.setResult(true);
         }
         this.setResult(false);
         return true;
      }
      
      override protected function setResult(param1:Boolean) : void
      {
         super.setResult(param1);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         WorldClock.clock.remove(this);
      }
   }
}
