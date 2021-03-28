package com.qq.modules.mapinfo.view.components
{
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.model.templates.ServerConfigTemplateFactory;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.main.model.ActorModel;
   import com.qq.modules.mapinfo.MapInfoGlobals;
   import com.qq.modules.mapinfo.command.MapInfoProxyCmd;
   import com.qq.modules.mapinfo.model.MapInfoProxy;
   import com.qq.modules.mapinfo.model.vo.MapInfoWarHistoryVO;
   
   public class MapInfoMiniCtMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:MapInfoMiniCt;
      
      [Inject]
      public var proxy:MapInfoProxy;
      
      [Inject]
      public var actor:ActorModel;
      
      public var MAX_DISPLAY:int = 3;
      
      public function MapInfoMiniCtMediator()
      {
         super();
      }
      
      override protected function init() : void
      {
         super.init();
         MapInfoProxyCmd.getSimplelArmyHistory();
         this.view.visible = false;
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         this.addContextListener(MapInfoGlobals.MAP_INFO_SIMPLE_HISTORIES_UPDATED,this.onMAP_INFO_SIMPLE_HISTORIES_UPDATED);
      }
      
      private function onMAP_INFO_SIMPLE_HISTORIES_UPDATED(param1:CommonEvent) : void
      {
         this.update();
      }
      
      private function update() : void
      {
         var _loc1_:int = 0;
         var _loc5_:MapInfoWarHistoryVO = null;
         var _loc6_:MapInfoMiniCtCell = null;
         if(!this.actor.checkIfOpenDaySatisfiedFromTemplate(ServerConfigTemplateFactory.instance.getEntryTemplateRankMapinfoHistory()))
         {
            this.view.visible = false;
            return;
         }
         this.view.visible = true;
         var _loc2_:Array = [];
         var _loc3_:int = Math.min(this.proxy.data.simpleHistories.length,this.MAX_DISPLAY);
         var _loc4_:int = this.MAX_DISPLAY - _loc3_;
         _loc1_ = 0;
         while(_loc1_ < _loc4_)
         {
            (_loc6_ = this.view.box.getChildAt(_loc1_) as MapInfoMiniCtCell).reset(null);
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < _loc3_)
         {
            _loc5_ = this.proxy.data.simpleHistories[_loc1_];
            (_loc6_ = this.view.box.getChildAt(_loc4_ + _loc1_) as MapInfoMiniCtCell).reset(_loc5_);
            _loc1_++;
         }
      }
   }
}
