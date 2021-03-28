package com.qq.modules.main.service
{
   import PVZ.Cmd.Cmd_Card_RawAttribute_SC;
   import PVZ.Cmd.Cmd_Chat_GetObjInfo_SC;
   import PVZ.Cmd.Cmd_Flag_GetList_SC;
   import PVZ.Cmd.Cmd_Flag_Sync_SC;
   import PVZ.Cmd.Dto_Flag_Info;
   import com.qq.CommandName;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.modle.BasicProxy;
   import com.qq.modules.main.logic.initData.InitDataManager;
   import com.qq.modules.main.model.ActorFlagInfo;
   import com.qq.modules.main.model.SingleDtoVO;
   import com.qq.utils.CommandDispatcher;
   import tencent.io.service.events.SocketServiceEvent;
   
   public class FlagInfoProxy extends BasicProxy
   {
       
      
      [Inject]
      public var flagInfo:ActorFlagInfo;
      
      public function FlagInfoProxy()
      {
         super();
      }
      
      override public function listMsgInterests() : Array
      {
         return [[Cmd_Flag_GetList_SC.$MessageID,this.onCmd_Flag_GetList_SC],[Cmd_Flag_Sync_SC.$MessageID,this.onCmd_Flag_Sync_SC],[Cmd_Chat_GetObjInfo_SC.$MessageID,this.onCmd_GetObjInfo_SC],[Cmd_Card_RawAttribute_SC.$MessageID,this.onCmd_Card_RawAttribute_SC]];
      }
      
      private function onCmd_Flag_GetList_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_Flag_GetList_SC = param1.socketData as Cmd_Flag_GetList_SC;
         this.flagInfo.reset(_loc2_.allFlag);
         InitDataManager.getInstance().finishTask(InitDataManager.Init_FlagInfo);
      }
      
      private function onCmd_Flag_Sync_SC(param1:SocketServiceEvent) : void
      {
         var _loc7_:Dto_Flag_Info = null;
         var _loc2_:Cmd_Flag_Sync_SC = param1.socketData as Cmd_Flag_Sync_SC;
         var _loc3_:Array = _loc2_.changeFlag;
         var _loc4_:Array = _loc2_.delType;
         var _loc5_:int = 0;
         var _loc6_:int = _loc3_.length;
         _loc5_ = 0;
         while(_loc5_ < _loc6_)
         {
            _loc7_ = _loc3_[_loc5_];
            this.flagInfo.setFlagInfoByID(_loc7_.type,_loc7_.value);
            _loc5_++;
         }
         _loc6_ = _loc4_.length;
         _loc5_ = 0;
         while(_loc5_ < _loc6_)
         {
            this.flagInfo.delFlagByID(_loc4_[_loc5_]);
            _loc5_++;
         }
      }
      
      private function onCmd_GetObjInfo_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:SingleDtoVO = new SingleDtoVO(param1.socketData as Cmd_Chat_GetObjInfo_SC);
         dispatch(new CommonEvent(CommandName.GET_SINGLE_DTO_EVENT,_loc2_));
      }
      
      private function onCmd_Card_RawAttribute_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_Card_RawAttribute_SC = param1.socketData as Cmd_Card_RawAttribute_SC;
         CommandDispatcher.send(CommandName.GET_CARD_RAWATTRIBUTE_EVENT,_loc2_.allCardInfo);
      }
   }
}
