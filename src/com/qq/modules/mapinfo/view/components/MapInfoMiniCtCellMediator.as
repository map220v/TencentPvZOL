package com.qq.modules.mapinfo.view.components
{
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.mapinfo.command.MapInfoViewCmd;
   import com.qq.modules.mapinfo.model.vo.MapInfoWarHistoryVO;
   import com.qq.templates.font.FontNormal;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import tencent.base.utils.StringUtil;
   
   public class MapInfoMiniCtCellMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:MapInfoMiniCtCell;
      
      private var vo:MapInfoWarHistoryVO;
      
      private var timer:Timer;
      
      public function MapInfoMiniCtCellMediator()
      {
         super();
      }
      
      override protected function init() : void
      {
         super.init();
         this.timer = new Timer(1000);
         this.timer.addEventListener(TimerEvent.TIMER,this.timerHandler);
         this.timer.start();
         this.update();
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         this.view.addEventListener(MouseEvent.CLICK,this.clickHandler,false,0,true);
      }
      
      override public function dispose() : void
      {
         if(this.timer)
         {
            this.timer.removeEventListener(TimerEvent.TIMER,this.timerHandler);
            this.timer.stop();
            this.timer = null;
         }
         super.dispose();
      }
      
      override public function reset(param1:Object = null) : void
      {
         this.vo = param1 as MapInfoWarHistoryVO;
         this.update();
      }
      
      protected function clickHandler(param1:MouseEvent) : void
      {
         switch(param1.currentTarget)
         {
            case this.view:
               MapInfoViewCmd.showDetailWnd(this.vo.tabType);
         }
      }
      
      protected function timerHandler(param1:TimerEvent) : void
      {
         this.update();
      }
      
      private function update() : void
      {
         var _loc1_:int = 0;
         var _loc2_:String = null;
         this.view.visible = this.vo != null;
         this.view.mouseEnabled = this.vo != null;
         if(this.vo)
         {
            _loc1_ = this.vo.leftTime;
            _loc2_ = StringUtil.substitute(FontNormal.MAPTROOP_INF,this.vo.teamStateColor,this.vo.teamStateLabel,this.vo.getContent(),this.vo.leftTimeFullString);
            this.view.txtContent.text = _loc2_;
            if(_loc1_ < 0)
            {
               this.reset();
            }
         }
         else
         {
            this.view.txtContent.text = "";
         }
      }
   }
}
