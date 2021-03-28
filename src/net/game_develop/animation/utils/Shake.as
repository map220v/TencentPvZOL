package net.game_develop.animation.utils
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class Shake extends EventDispatcher
   {
       
      
      private var target:Object;
      
      private var timer:Timer;
      
      public var time:int;
      
      public var len:Number;
      
      public var oy:Number;
      
      public var ox:Number;
      
      public var offsetX:Number = 0;
      
      public var offsetY:Number = 0;
      
      public var x:Number;
      
      public var y:Number;
      
      public function Shake(param1:Number, param2:Number, param3:Object, param4:int = 0, param5:Number = 2, param6:int = 100)
      {
         super();
         this.time = param6;
         this.len = param5;
         this.target = param3;
         this.oy = param2;
         this.ox = param1;
         this.timer = new Timer(param6,param4);
         this.timer.addEventListener(TimerEvent.TIMER_COMPLETE,this.timer_timerComplete);
         this.timer.addEventListener(TimerEvent.TIMER,this.interSprite_enterFrame);
      }
      
      private function timer_timerComplete(param1:TimerEvent) : void
      {
         this.stop();
      }
      
      public function start() : void
      {
         this.timer.reset();
         this.timer.start();
      }
      
      public function stop() : void
      {
         this.target.x = this.ox;
         this.target.y = this.oy;
         this.timer.stop();
         this.timer.removeEventListener(TimerEvent.TIMER_COMPLETE,this.timer_timerComplete);
         this.timer.removeEventListener(TimerEvent.TIMER,this.interSprite_enterFrame);
      }
      
      private function interSprite_enterFrame(param1:Event) : void
      {
         var _loc2_:Number = Math.PI * 2 * Math.random();
         this.offsetX = this.len * Math.cos(_loc2_);
         this.offsetY = this.len * Math.sin(_loc2_);
         this.x = this.ox + this.offsetX;
         this.y = this.oy + this.offsetY;
         this.target.x = this.x;
         this.target.y = this.y;
      }
   }
}
