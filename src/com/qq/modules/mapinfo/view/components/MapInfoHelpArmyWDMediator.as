package com.qq.modules.mapinfo.view.components
{
   import PVZ.Cmd.Dto_Outpost_AllyTeam;
   import asgui.controls.Alert;
   import asgui.controls.Button;
   import asgui.events.CloseEvent;
   import com.qq.display.QAlert;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.mapinfo.MapInfoGlobals;
   import com.qq.modules.mapinfo.command.MapInfoProxyCmd;
   import com.qq.modules.mapinfo.model.MapInfoData;
   import com.qq.modules.mapinfo.model.MapInfoProxy;
   import com.qq.templates.font.FontNormal;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import tencent.base.utils.StringUtil;
   
   public class MapInfoHelpArmyWDMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:MapInfoHelpArmyWD;
      
      [Inject]
      public var proxy:MapInfoProxy;
      
      public var timer:Timer;
      
      public function MapInfoHelpArmyWDMediator()
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
         addContextListener(MapInfoGlobals.ALLY_INFO_AT_HOME_UPDATE,this.allyInfoAtHomeHandler);
         var _loc1_:int = this.view.box.numChildren;
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            addComponentListener((this.view.box.getChildAt(_loc2_) as MapInfoHelpArmyWDCell).btn_sendBack,MouseEvent.CLICK,this.returnBackHandler);
            _loc2_++;
         }
         MapInfoProxyCmd.getAllyTeamAtHome();
         this.timer = new Timer(1000);
         this.timer.addEventListener(TimerEvent.TIMER,this.timerHandler);
         this.timer.start();
      }
      
      protected function timerHandler(param1:TimerEvent) : void
      {
         var _loc4_:Dto_Outpost_AllyTeam = null;
         var _loc2_:int = this.proxy.data.allyTeamList.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = this.proxy.data.allyTeamList[_loc3_] as Dto_Outpost_AllyTeam;
            --_loc4_.returnRemainTime;
            if(_loc4_.returnRemainTime <= 0)
            {
               MapInfoProxyCmd.getAllyTeamAtHome();
            }
            _loc3_++;
         }
         this.allyInfoAtHomeHandler();
      }
      
      protected function returnBackHandler(param1:MouseEvent) : void
      {
         var dto:Dto_Outpost_AllyTeam = null;
         var closeHandler:Function = null;
         var event:MouseEvent = param1;
         closeHandler = function(param1:CloseEvent):void
         {
            if(param1.detail == Alert.YES)
            {
               MapInfoProxyCmd.returnAllyTeamAtHome(dto.allyId,dto.allyTeamId);
               MapInfoProxyCmd.getAllyTeamAtHome();
            }
         };
         var ui:MapInfoHelpArmyWDCell = (event.currentTarget as Button).parent as MapInfoHelpArmyWDCell;
         dto = ui.data as Dto_Outpost_AllyTeam;
         QAlert.Show("确定要遣返该部队吗？","",Alert.YES | Alert.NO,null,closeHandler,"","");
      }
      
      private function allyInfoAtHomeHandler(param1:Event = null) : void
      {
         var _loc5_:Dto_Outpost_AllyTeam = null;
         var _loc6_:String = null;
         var _loc7_:String = null;
         var _loc2_:int = this.view.box.numChildren;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            (this.view.box.getChildAt(_loc3_) as MapInfoHelpArmyWDCell).setData();
            _loc3_++;
         }
         _loc2_ = this.proxy.data.allyTeamList.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc5_ = this.proxy.data.allyTeamList[_loc4_] as Dto_Outpost_AllyTeam;
            _loc6_ = StringUtil.getLeftTime_Hour_Min_SecString(_loc5_.returnRemainTime);
            _loc7_ = StringUtil.substitute(FontNormal.ALLY_AT_HOME,_loc5_.allyName,_loc6_);
            (this.view.box.getChildAt(_loc4_) as MapInfoHelpArmyWDCell).setData(_loc7_);
            (this.view.box.getChildAt(_loc4_) as MapInfoHelpArmyWDCell).data = _loc5_;
            _loc4_++;
         }
         this.view.txt_info.text = StringUtil.substitute("可容纳驻军人数{0}/{1}",_loc2_,MapInfoData.MAX_ALLY_NUM);
      }
      
      override public function dispose() : void
      {
         this.timer.removeEventListener(TimerEvent.TIMER,this.timerHandler);
         super.dispose();
      }
   }
}
