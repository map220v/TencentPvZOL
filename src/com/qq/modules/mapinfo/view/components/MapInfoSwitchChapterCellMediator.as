package com.qq.modules.mapinfo.view.components
{
   import PVZ.Cmd.E_WorldMapArea;
   import asgui.controls.Alert;
   import asgui.events.CloseEvent;
   import asgui.utils.StringUtil;
   import com.qq.display.QAlert;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.expedition.command.ExpeditionProxyCmd;
   import com.qq.modules.main.command.GameFlowCmd;
   import com.qq.modules.main.model.ActorModel;
   import com.qq.modules.map.model.templates.MapTemplateFactory;
   import com.qq.modules.mapinfo.command.MapInfoProxyCmd;
   import com.qq.modules.mapinfo.model.MapInfoProxy;
   import com.qq.templates.font.FontNormal;
   import com.qq.utils.DateUtils;
   import com.qq.utils.UrlManager;
   import flash.events.MouseEvent;
   
   public class MapInfoSwitchChapterCellMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:MapInfoSwitchChapterCell;
      
      [Inject]
      public var actor:ActorModel;
      
      [Inject]
      public var mapInfo:MapInfoProxy;
      
      private var isOn:Boolean;
      
      public function MapInfoSwitchChapterCellMediator()
      {
         super();
      }
      
      override protected function init() : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:int = 0;
         super.init();
         this.isOn = this.actor.getOpenMapNeedLevelNotSatified(this.view.areaID) == 0;
         var _loc1_:String = !!this.isOn ? "on" : "off";
         this.view.txtTitle.visible = this.isOn;
         this.view.txtDesc.visible = !this.isOn;
         switch(this.view.areaID)
         {
            case E_WorldMapArea.E_WorldMapArea_Primary:
               this.view.imgBack.source = UrlManager.getUrl(0,"swf/mapinfo/map_chapter_1_" + _loc1_ + ".png");
               break;
            case E_WorldMapArea.E_WorldMapArea_Middle:
               this.view.imgBack.source = UrlManager.getUrl(0,"swf/mapinfo/map_chapter_2_" + _loc1_ + ".png");
               break;
            case E_WorldMapArea.E_WorldMapArea_Advanced:
               this.view.imgBack.source = UrlManager.getUrl(0,"swf/mapinfo/map_chapter_3_" + _loc1_ + ".png");
         }
         this.view.btnEnter.visible = this.isOn && this.mapInfo.data.myAreaId != this.view.areaID;
         _loc2_ = this.mapInfo.data.changeCityCD - DateUtils.getInstance().getServerTime();
         this.view.selectedBG.visible = this.view.areaID == this.mapInfo.data.myAreaId;
         if(this.view.areaID == E_WorldMapArea.E_WorldMapArea_Advanced || _loc2_ <= 0)
         {
            this.view.btnEnter.enabled = true;
            this.view.btnEnter.toolTip = null;
         }
         else
         {
            this.view.btnEnter.enabled = false;
            _loc3_ = Math.max(1,_loc2_ / 86400);
            this.view.btnEnter.toolTip = StringUtil.substitute(FontNormal.MAP_CHANGE_CD,_loc3_);
         }
         this.view.rewardContent = MapTemplateFactory.instance.getMapLevelTemplateById(this.view.areaID).buffDesc;
         this.view.txtDesc.text = this.view.template.getDesc(this.actor.getIfIsOldUser());
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         addComponentListener(this.view.imgBack,MouseEvent.CLICK,this.onViewClick);
         addComponentListener(this.view.btnEnter,MouseEvent.CLICK,this.onEnterClick);
      }
      
      private function onEnterClick(param1:MouseEvent) : void
      {
         if(this.view.areaID == E_WorldMapArea.E_WorldMapArea_Advanced)
         {
            ExpeditionProxyCmd.requestOutlineData();
         }
         else if(this.actor.battleCardModel.currentInOutState)
         {
            QAlert.Show(FontNormal.MOVE_CITY_IS_OUT);
         }
         else
         {
            QAlert.Show(FontNormal.MAP_CHANGE_CONFIRM,"",Alert.YES | Alert.NO,null,this.onConfirmClose);
         }
      }
      
      private function onConfirmClose(param1:CloseEvent) : void
      {
         if(param1.detail == Alert.YES)
         {
            MapInfoProxyCmd.relocateToArea(this.view.areaID);
            this.view.dependWindow.Close();
         }
      }
      
      private function onViewClick(param1:MouseEvent) : void
      {
         this.view.dependWindow.Close();
         if(this.view.areaID == E_WorldMapArea.E_WorldMapArea_Advanced)
         {
            ExpeditionProxyCmd.requestOutlineData();
         }
         else
         {
            GameFlowCmd.gotoMap(this.view.areaID);
         }
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
