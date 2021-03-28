package com.qq.modules.mapinfo.view.components
{
   import PVZ.Cmd.E_War_History;
   import com.qq.display.QAlert;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.model.templates.ServerConfigTemplateFactory;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.main.model.ActorModel;
   import com.qq.modules.mapinfo.MapInfoGlobals;
   import com.qq.modules.mapinfo.command.MapInfoProxyCmd;
   import com.qq.modules.mapinfo.model.MapInfoProxy;
   import com.qq.modules.mapinfo.model.vo.MapInfoWarHistoryVO;
   import com.qq.modules.union.model.UnionModel;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class MapInfoDetailWndMediator extends BasicScreenMediator
   {
      
      public static const ITEM_PER_PAGE:int = 8;
       
      
      [Inject]
      public var view:MapInfoDetailWnd;
      
      [Inject]
      public var union:UnionModel;
      
      [Inject]
      public var proxy:MapInfoProxy;
      
      [Inject]
      public var actor:ActorModel;
      
      private var timer:Timer;
      
      private var lastType:int;
      
      public function MapInfoDetailWndMediator()
      {
         super();
      }
      
      override protected function init() : void
      {
         super.init();
         if(!this.actor.checkIfOpenDaySatisfiedFromTemplate(ServerConfigTemplateFactory.instance.getEntryTemplateRankMapinfoHistory()))
         {
            QAlert.Show("功能未开启");
            this.view.Close();
            return;
         }
         if(this.view.initTabType > 0)
         {
            this.setTab(this.view.initTabType);
         }
         else
         {
            this.setTab(E_War_History.E_War_History_Personal);
         }
         this.timer = new Timer(10000);
         this.timer.addEventListener(TimerEvent.TIMER,this.timerHandler);
         this.timer.start();
      }
      
      protected function timerHandler(param1:TimerEvent) : void
      {
         if(this.lastType == E_War_History.E_War_History_Guild)
         {
            MapInfoProxyCmd.getDetailArmyHistory(this.lastType);
         }
      }
      
      public function update() : void
      {
         var _loc1_:int = 0;
         var _loc4_:MapInfoWarHistoryVO = null;
         var _loc2_:int = Math.ceil(this.proxy.data.detailedHistories.length / ITEM_PER_PAGE);
         this.view.pager.totalPage = _loc2_;
         var _loc3_:Vector.<MapInfoWarHistoryVO> = new Vector.<MapInfoWarHistoryVO>();
         _loc1_ = (this.view.pager.currentPage - 1) * ITEM_PER_PAGE;
         while(_loc1_ < this.proxy.data.detailedHistories.length && _loc1_ < this.view.pager.currentPage * ITEM_PER_PAGE)
         {
            _loc4_ = this.proxy.data.detailedHistories[_loc1_];
            _loc3_.push(_loc4_);
            _loc1_++;
         }
         _loc3_.reverse();
         this.view.list.headerText = this.lastType.toString();
         this.view.list.dataProvider = _loc3_;
         this.view.list.Refresh();
      }
      
      public function setTab(param1:int) : void
      {
         if(param1 != E_War_History.E_War_History_Personal && this.union.playerUnionInfo.id.isZero())
         {
            QAlert.Show("请先加入一个联盟");
            return;
         }
         if(this.lastType != param1)
         {
            this.lastType = param1;
            this.view.pager.currentPage = 1;
         }
         this.view.btn1.enabled = param1 != E_War_History.E_War_History_Personal;
         this.view.btn2.enabled = param1 != E_War_History.E_War_History_Guild;
         this.view.btn3.enabled = param1 != E_War_History.E_War_History_Plant_War;
         this.view.setTableType(param1);
         MapInfoProxyCmd.getDetailArmyHistory(param1);
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         this.addContextListener(MapInfoGlobals.MAP_INFO_DETAILED_HISTORIES_UPDATED,this.onMAP_INFO_DETAILED_HISTORIES_UPDATED);
         this.view.btn1.addEventListener(MouseEvent.CLICK,this.clickHandler,false,0,true);
         this.view.btn2.addEventListener(MouseEvent.CLICK,this.clickHandler,false,0,true);
         this.view.btn3.addEventListener(MouseEvent.CLICK,this.clickHandler,false,0,true);
         this.view.pager.addEventListener(Event.CHANGE,this.pagerChangeHandler,false,0,true);
      }
      
      protected function pagerChangeHandler(param1:Event) : void
      {
         this.update();
      }
      
      protected function clickHandler(param1:MouseEvent) : void
      {
         switch(param1.currentTarget)
         {
            case this.view.btn1:
               this.setTab(E_War_History.E_War_History_Personal);
               break;
            case this.view.btn2:
               this.setTab(E_War_History.E_War_History_Guild);
               break;
            case this.view.btn3:
               this.setTab(E_War_History.E_War_History_Plant_War);
         }
      }
      
      private function onMAP_INFO_DETAILED_HISTORIES_UPDATED(param1:CommonEvent) : void
      {
         this.update();
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
   }
}
