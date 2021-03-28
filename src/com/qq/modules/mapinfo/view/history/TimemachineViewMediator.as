package com.qq.modules.mapinfo.view.history
{
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.mapinfo.MapInfoGlobals;
   import com.qq.modules.mapinfo.model.MapInfoProxy;
   import flash.events.Event;
   
   public class TimemachineViewMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:TimemachineView;
      
      [Inject]
      public var mapProxy:MapInfoProxy;
      
      public function TimemachineViewMediator()
      {
         super();
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         addComponentListener(this.view,Event.ADDED_TO_STAGE,this.onAddStage);
         addContextListener(MapInfoGlobals.MAP_INFO_SIMPLE_HISTORIES_UPDATED,this.onSimpleHistoryUpdate);
      }
      
      private function onAddStage(param1:Event) : void
      {
         this.onSimpleHistoryUpdate(param1);
      }
      
      private function onSimpleHistoryUpdate(param1:Event) : void
      {
         if(this.mapProxy.data.simpleHistories.length > 0)
         {
            this.view.builderMc.gotoAndPlay(2);
         }
         else
         {
            this.view.builderMc.gotoAndStop(1);
         }
      }
   }
}
