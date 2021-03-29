package com.qq.modules.roleInfo.view.components
{
   import asgui.utils.StringUtil;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.main.model.vo.BuffVO;
   import com.qq.modules.main.service.BuffProxy;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import org.allencuilib.util.TimeUtils;
   
   public class BuffTooltipMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var buffProxy:BuffProxy;
      
      [Inject]
      public var view:BuffTooltip;
      
      private var _buffInfo:BuffVO;
      
      private var _timer:Timer;
      
      public function BuffTooltipMediator()
      {
         super();
      }
      
      override protected function init() : void
      {
         super.init();
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         this._timer = new Timer(1000);
         this._timer.addEventListener(TimerEvent.TIMER,this.onTimer);
      }
      
      public function update(param1:int) : void
      {
         this._buffInfo = this.buffProxy.getBuffById(param1);
         if(this._buffInfo)
         {
            this._timer.repeatCount = this._buffInfo.remainingTime;
            this._timer.start();
            this.updateText();
         }
      }
      
      private function onTimer(param1:TimerEvent) : void
      {
         this.updateText();
      }
      
      private function updateText() : void
      {
         this.view.txtCountDown.text = StringUtil.substitute(this._buffInfo.buffTemplate.desc,TimeUtils.GetDigitalTimeString(this._buffInfo.remainingTime,true)).replace(/\\n/g,"\n");
      }
      
      override public function dispose() : void
      {
         this._timer.removeEventListener(TimerEvent.TIMER,this.onTimer);
         this._timer.stop();
         this._timer = null;
         super.dispose();
      }
   }
}
