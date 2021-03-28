package com.qq.modules.td.logic.trigger.triggerNode
{
   import asgui.utils.IAnimatable;
   import asgui.utils.WorldClock;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.td.logic.trigger.TDTrigConst;
   import com.qq.templates.font.FontHKHB;
   import org.as3commons.logging.api.getLogger;
   
   public class TrigTimeUnuseSun extends TrigPvz implements IAnimatable
   {
       
      
      private var targetTime:Number;
      
      private var cacheTime:Number;
      
      private var isPause:Boolean = false;
      
      private var pauseTime:Number;
      
      public function TrigTimeUnuseSun()
      {
         super();
      }
      
      override protected function init() : void
      {
         this.targetTime = triggerParams[0];
         this.cacheTime = WorldClock.clock.time;
         this._triggerType = [TDTrigConst.TYPE_USE_SUN];
         WorldClock.clock.add(this);
         this.ui.txt.text = this.targetTime + FontHKHB.SECOND;
         getLogger("trigger").debug("TrigTimeUnuseSun: " + this.targetTime);
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
         this.ui.txt.text = Math.floor(this.targetTime - (WorldClock.clock.time - this.cacheTime)) + FontHKHB.SECOND;
         if(WorldClock.clock.time - this.cacheTime > this.targetTime)
         {
            this.setResult(true);
         }
      }
      
      override public function notify(param1:String, param2:Array) : void
      {
         this.cacheTime = WorldClock.clock.time;
      }
      
      override public function execute() : Boolean
      {
         if(result == 0 || result == -1)
         {
            this.setResult(false);
            return false;
         }
         this.setResult(true);
         return true;
      }
      
      override protected function setResult(param1:Boolean) : void
      {
         super.setResult(param1);
         WorldClock.clock.remove(this);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         WorldClock.clock.remove(this);
      }
   }
}
