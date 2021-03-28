package com.qq.modules.td.view.ui
{
   import com.qq.CommandName;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.events.Event;
   
   public class TDRainBarCtMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:TDRainBarCt;
      
      public function TDRainBarCtMediator()
      {
         super();
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         addContextListener(CommandName.TD_ChangeRain,this.onChangeRain);
         addContextListener(CommandName.TD_ShowOrHideRainBar,this.onShowOrHide);
      }
      
      private function onShowOrHide(param1:CommonEvent) : void
      {
         this.view.visible = Boolean(param1.param);
      }
      
      private function onChangeRain(param1:Event) : void
      {
         this.view.rainTF.text = TDGameInfo.getInstance().rain.get().toString();
      }
   }
}
