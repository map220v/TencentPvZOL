package com.qq.modules.roleInfo.view.components
{
   import asgui.controls.Image;
   import asgui.controls.Label;
   import com.greensock.TweenMax;
   import com.qq.display.QCanvas;
   import com.qq.utils.UtilsManager;
   import flash.display.MovieClip;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   
   public class BasicRoleBar extends QCanvas
   {
       
      
      public var bg:Image;
      
      public var tf:Label;
      
      protected var timer:Timer;
      
      protected var timeout:int;
      
      protected var isHaveSetValue:Boolean = false;
      
      protected var preValue:int;
      
      private var changeColor:String;
      
      private var currentColor:String;
      
      protected var counter:int;
      
      public function BasicRoleBar()
      {
         super(null);
      }
      
      public function setValue(param1:uint, param2:Boolean = false, param3:Boolean = false) : void
      {
         var _loc4_:MovieClip = null;
         this.tf.text = UtilsManager.converNum(param1,1);
         this.currentColor = !!param3 ? "#FF0000" : "FFFFFF";
         if(param2 && this.isHaveSetValue && this.preValue != param1)
         {
            this.changeColor = this.preValue < param1 ? "#00FF00" : "#FF0000";
            if(this.timer == null)
            {
               this.timer = new Timer(100);
               this.timer.addEventListener(TimerEvent.TIMER,this.timerHandler);
               this.timer.start();
            }
            this.timeout = getTimer() + 2000;
            if(_loc4_ = this.bg.mcHolder["icon"])
            {
               TweenMax.killTweensOf(_loc4_);
               _loc4_.scaleX = _loc4_.scaleY = 1;
               TweenMax.to(_loc4_,0.2,{
                  "scaleX":0.8,
                  "scaleY":0.8,
                  "repeat":1,
                  "yoyo":true
               });
            }
         }
         this.tf.SetStyle("color",this.currentColor);
         this.preValue = param1;
         this.isHaveSetValue = true;
      }
      
      protected function timerHandler(param1:TimerEvent) : void
      {
         if(getTimer() > this.timeout)
         {
            if(this.timer)
            {
               this.timer.removeEventListener(TimerEvent.TIMER,this.timerHandler);
               this.timer.stop();
               this.timer = null;
            }
            this.tf.SetStyle("color",this.currentColor);
            return;
         }
         ++this.counter;
         this.tf.SetStyle("color",this.counter % 2 == 1 ? this.changeColor : "#FFFFFF");
      }
      
      override public function Dispose() : void
      {
         if(this.timer != null)
         {
            this.timer.reset();
            this.timer.removeEventListener(TimerEvent.TIMER,this.timerHandler);
            this.timer = null;
         }
         super.Dispose();
      }
   }
}
