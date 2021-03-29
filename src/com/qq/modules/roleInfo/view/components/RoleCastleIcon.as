package com.qq.modules.roleInfo.view.components
{
   import asgui.controls.Image;
   import com.qq.modules.main.model.vo.BuffVO;
   import com.qq.utils.UrlManager;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import org.allencuilib.util.TimeUtils;
   
   public class RoleCastleIcon extends RoleBuffIcon
   {
       
      
      private var img:Image;
      
      private var vo:BuffVO;
      
      private var timer:Timer;
      
      public function RoleCastleIcon()
      {
         super();
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.img = new Image();
         this.img.source = UrlManager.getUrl(UrlManager.Url_RoleInfo,"castle2.png");
         this.addChild(this.img);
         this.buttonMode = true;
      }
      
      override public function Dispose() : void
      {
         this.clearTimer();
         super.Dispose();
      }
      
      private function runTimer() : void
      {
         if(!this.timer)
         {
            this.timer = new Timer(1000);
            this.timer.addEventListener(TimerEvent.TIMER,this.timerHandler);
            this.timer.start();
         }
      }
      
      private function clearTimer() : void
      {
         if(this.timer)
         {
            this.timer.stop();
            this.timer.removeEventListener(TimerEvent.TIMER,this.timerHandler);
            this.timer = null;
         }
      }
      
      protected function timerHandler(param1:TimerEvent) : void
      {
         this.setData(this.vo);
      }
      
      public function setData(param1:BuffVO) : void
      {
         var _loc2_:* = null;
         this.vo = param1;
         if(param1 && param1.remainingTime > 0)
         {
            this.img.source = UrlManager.getUrl(UrlManager.Url_RoleInfo,"castle1.png");
            if(param1.remainingTime > 3600 * 24)
            {
               this.toolTip = param1.buffTemplate.desc.replace("{0}",int(param1.remainingTime / 3600 / 24) + "天");
               this.clearTimer();
            }
            else
            {
               _loc2_ = TimeUtils.formatSecondToStr(param1.remainingTime);
               if(param1.remainingTime < 2 * 3600)
               {
                  this.img.source = UrlManager.getUrl(UrlManager.Url_RoleInfo,"castle3.swf");
                  _loc2_ = "<font color=\'#FF0000\'>" + _loc2_ + "</font>";
               }
               this.toolTip = param1.buffTemplate.desc.replace("{0}",_loc2_);
               this.runTimer();
            }
         }
         else
         {
            this.img.source = UrlManager.getUrl(UrlManager.Url_RoleInfo,"castle2.png");
            this.toolTip = "当前未使用城堡";
            this.clearTimer();
         }
      }
      
      public function click() : void
      {
      }
   }
}
