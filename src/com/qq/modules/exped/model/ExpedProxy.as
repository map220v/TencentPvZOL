package com.qq.modules.exped.model
{
   import PVZ.Cmd.Cmd_Setout_BuyMapWarSetoutTimes_SC;
   import PVZ.Cmd.Cmd_Setout_GetCityList_SC;
   import PVZ.Cmd.Cmd_Setout_GetSetoutTimes_SC;
   import PVZ.Cmd.Cmd_Setout_GetTempleList_SC;
   import PVZ.Cmd.SetoutTimesType;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.modle.BasicProxy;
   import com.qq.modules.exped.ExpedGlobal;
   import com.qq.modules.exped.model.vo.ExpedCityVO;
   import com.qq.modules.exped.model.vo.ExpedInfoVO;
   import flash.utils.Dictionary;
   import tencent.io.service.events.SocketServiceEvent;
   
   public class ExpedProxy extends BasicProxy
   {
       
      
      private var m_vecCity:Vector.<ExpedCityVO>;
      
      private var m_dicInfo:Dictionary;
      
      private var m_totalCount:uint;
      
      public function ExpedProxy()
      {
         this.m_vecCity = new Vector.<ExpedCityVO>(ExpedGlobal.SHOW_BOUNDS);
         var _loc1_:int = 0;
         while(_loc1_ < ExpedGlobal.SHOW_BOUNDS)
         {
            this.m_vecCity[_loc1_] = new ExpedCityVO();
            _loc1_++;
         }
         this.m_dicInfo = new Dictionary();
         super();
      }
      
      public function getInfo(param1:int) : ExpedInfoVO
      {
         var _loc2_:ExpedInfoVO = null;
         if(this.m_dicInfo.hasOwnProperty(param1) == false)
         {
            _loc2_ = new ExpedInfoVO(param1);
            this.m_dicInfo[param1] = _loc2_;
         }
         else
         {
            _loc2_ = this.m_dicInfo[param1];
         }
         return _loc2_;
      }
      
      override public function listMsgInterests() : Array
      {
         return [[Cmd_Setout_GetCityList_SC.$MessageID,this.onCmd_Setout_GetCityList_SC],[Cmd_Setout_GetTempleList_SC.$MessageID,this.onCmd_Setout_GetTempleList_SC],[Cmd_Setout_GetSetoutTimes_SC.$MessageID,this.onCmd_Setout_GetSetoutTimes_SC],[Cmd_Setout_BuyMapWarSetoutTimes_SC.$MessageID,this.onCmd_Setout_BuyMapWarSetoutTimes_SC]];
      }
      
      private function onCmd_Setout_BuyMapWarSetoutTimes_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_Setout_BuyMapWarSetoutTimes_SC = param1.socketData as Cmd_Setout_BuyMapWarSetoutTimes_SC;
         var _loc3_:ExpedInfoVO = this.getInfo(SetoutTimesType.SetoutTimesType_City);
         _loc3_.updateExpedCount(_loc3_.expedCount + 1,_loc3_.totalExpedCount);
         _loc3_.updatePayCount(_loc2_.payTimes,_loc2_.totalPayTimes);
         this.dispatch(new CommonEvent(ExpedGlobal.EVENT_EXPED_TIME_UPDATE,_loc3_));
         ExpedGlobal.applyBuyCallBack();
      }
      
      private function onCmd_Setout_GetSetoutTimes_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_Setout_GetSetoutTimes_SC = param1.socketData as Cmd_Setout_GetSetoutTimes_SC;
         var _loc3_:ExpedInfoVO = this.getInfo(_loc2_.type);
         _loc3_.updateExpedCount(_loc2_.times,_loc2_.totalTimes);
         _loc3_.updatePayCount(_loc2_.payTimes,_loc2_.totalPayTimes);
         this.dispatch(new CommonEvent(ExpedGlobal.EVENT_EXPED_TIME_UPDATE,_loc3_));
      }
      
      private function onCmd_Setout_GetCityList_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_Setout_GetCityList_SC = param1.socketData as Cmd_Setout_GetCityList_SC;
         this.cityList = _loc2_.cityInfo;
         this.m_totalCount = _loc2_.totalNum;
         this.dispatch(new CommonEvent(ExpedGlobal.EVENT_GET_CITY_INFO));
      }
      
      private function set cityList(param1:Array) : void
      {
         var _loc3_:ExpedCityVO = null;
         var _loc2_:int = param1.length;
         var _loc4_:int = 0;
         while(_loc4_ < ExpedGlobal.SHOW_BOUNDS)
         {
            _loc3_ = this.m_vecCity[_loc4_];
            _loc3_.reset();
            if(_loc4_ < _loc2_)
            {
               _loc3_.dto = param1[_loc4_];
            }
            _loc4_++;
         }
      }
      
      public function getExpedCityVO(param1:int) : ExpedCityVO
      {
         return this.m_vecCity[param1];
      }
      
      public function get totalCount() : uint
      {
         return this.m_totalCount;
      }
      
      private function onCmd_Setout_GetTempleList_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_Setout_GetTempleList_SC = param1.socketData as Cmd_Setout_GetTempleList_SC;
      }
   }
}
