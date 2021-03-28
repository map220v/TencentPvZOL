package com.qq.modules.city.model
{
   import PVZ.Cmd.Cmd_City_GetBuildingEvent_SC;
   import PVZ.Cmd.Cmd_City_GetBuildingInfo_SC;
   import PVZ.Cmd.Cmd_City_GetTownDurability_SC;
   import PVZ.Cmd.Cmd_TD_CollectProduct_SC;
   import PVZ.Cmd.Cmd_TD_GetProductInfo_SC;
   import PVZ.Cmd.Cmd_TD_GetStageInfo_SC;
   import com.qq.GameGloble;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.modle.BasicProxy;
   import com.qq.modules.city.constant.CityBuildConstant;
   import com.qq.modules.city.model.vo.CityData;
   import com.qq.modules.levelselect.LSGlobals;
   import com.qq.modules.levelselect.model.LSData;
   import com.qq.modules.levelselect.model.templates.LSLevelTemplate;
   import com.qq.modules.levelselect.model.templates.LSLevelTemplateFactory;
   import com.qq.modules.levelselect.model.vo.LSLevelInfoVO;
   import com.qq.modules.main.logic.initData.InitDataManager;
   import com.qq.utils.CommandDispatcher;
   import org.as3commons.logging.api.getLogger;
   import tencent.io.service.events.SocketServiceEvent;
   
   public class CityProxy extends BasicProxy
   {
       
      
      private var _lsData:LSData;
      
      [Inject]
      public var data:CityData;
      
      public function CityProxy()
      {
         super();
      }
      
      override public function init(param1:Array = null) : void
      {
         super.init(param1);
         this.data.initToolBarButton();
      }
      
      public function get lsData() : LSData
      {
         return this._lsData;
      }
      
      override public function listMsgInterests() : Array
      {
         return [[Cmd_City_GetBuildingInfo_SC.$MessageID,this.onCmd_City_GetBuildingInfo_SC],[Cmd_TD_CollectProduct_SC.$MessageID,this.onCmd_TD_Collect_SC],[Cmd_TD_GetProductInfo_SC.$MessageID,this.onCmd_TD_GetCollectInfo_SC],[Cmd_City_GetTownDurability_SC.$MessageID,this.onCmd_City_GetTownDurability_SC],[Cmd_TD_GetStageInfo_SC.$MessageID,this.onCmd_TD_RequestStageInfo_SC],[Cmd_City_GetBuildingEvent_SC.$MessageID,this.onGetBuildingEvent]];
      }
      
      private function onCmd_TD_RequestStageInfo_SC(param1:SocketServiceEvent) : void
      {
         var _loc5_:int = 0;
         var _loc6_:LSLevelTemplate = null;
         var _loc7_:LSLevelInfoVO = null;
         var _loc2_:Cmd_TD_GetStageInfo_SC = param1.socketData as Cmd_TD_GetStageInfo_SC;
         if(this.lsData == null)
         {
            this._lsData = new LSData();
         }
         this.lsData.loadCmd_TD_GetStageInfo_SC(_loc2_);
         var _loc3_:Boolean = false;
         var _loc4_:int = 1;
         if(GameGloble.actorModel.actorLatestTDLevel.stageId != 0)
         {
            _loc4_ = GameGloble.actorModel.actorLatestTDLevel.levelId;
            _loc5_ = LSLevelTemplateFactory.instance.getStageTotalLevelByStageId(GameGloble.actorModel.actorLatestTDLevel.stageId);
            if(GameGloble.actorModel.actorLatestTDLevel.levelId == _loc5_)
            {
               if((_loc6_ = LSLevelTemplateFactory.instance.getTemplateByStageIdAndLevelId(GameGloble.actorModel.actorLatestTDLevel.stageId + 1,1,1)) != null && _loc6_.needRoleLevel <= GameGloble.actorModel.actorLevel)
               {
                  _loc3_ = true;
               }
               else
               {
                  _loc3_ = false;
               }
            }
            else if((_loc7_ = this.lsData.getLevelByLevelId(GameGloble.actorModel.actorLatestTDLevel.levelId + 1,1)).unlocked == true && _loc7_.passed == false)
            {
               _loc3_ = true;
            }
            else
            {
               _loc3_ = false;
            }
         }
         else
         {
            _loc3_ = true;
         }
         dispatch(new CommonEvent(LSGlobals.LS_STAGE_INFO_UPDATED,_loc3_));
      }
      
      private function onCmd_TD_GetCollectInfo_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_TD_GetProductInfo_SC = param1.socketData as Cmd_TD_GetProductInfo_SC;
         this.data.lastCollectTime = _loc2_.lastCollectTime * 1000;
         this.data.coinCanProduct = _loc2_.coinProduct;
         this.data.canCollect = _loc2_.canCollect;
      }
      
      private function onCmd_TD_Collect_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_TD_CollectProduct_SC = param1.socketData as Cmd_TD_CollectProduct_SC;
         getLogger("LSProxy").info("onCmd_TD_Collect_SC : " + _loc2_.coinProduct + "(TODO:需要添加收获后的动画)");
      }
      
      private function onCmd_City_GetBuildingInfo_SC(param1:SocketServiceEvent) : void
      {
         this.data.loadCityInfo(param1.socketData as Cmd_City_GetBuildingInfo_SC);
         InitDataManager.getInstance().finishTask(InitDataManager.Init_CityInfo);
      }
      
      private function onCmd_City_GetTownDurability_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_City_GetTownDurability_SC = param1.socketData as Cmd_City_GetTownDurability_SC;
         GameGloble.actorModel.updateDurability(_loc2_.townDurability,_loc2_.townDurabilityMax,_loc2_.leftRebuildCoolDown);
      }
      
      private function onGetBuildingEvent(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_City_GetBuildingEvent_SC = param1.socketData as Cmd_City_GetBuildingEvent_SC;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.buildingType.length)
         {
            CommandDispatcher.send(CityBuildConstant.BUILD_NOTICE_EVENT,{"type":_loc2_.buildingType[_loc3_]});
            _loc3_++;
         }
      }
   }
}
