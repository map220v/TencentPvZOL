package com.qq.modules.dragonBoat.model
{
   import PVZ.Cmd.Cmd_DragonBoat_Exchange_SC;
   import PVZ.Cmd.Cmd_DragonBoat_SetOut_SC;
   import PVZ.Cmd.Cmd_DragonBoat_Summon_SC;
   import PVZ.Cmd.Dto_DragonBoatExchange;
   import PVZ.Cmd.Dto_IdNum;
   import PVZ.Cmd.FlexibleActivity_1005;
   import com.qq.modules.activity.ActivityGlobal;
   import com.qq.modules.activity.model.ActivityCommonInfo;
   import com.qq.modules.activity.model.ActivityProxy;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.modle.BasicProxy;
   import com.qq.modules.dragonBoat.DragonBoatConst;
   import com.qq.modules.dragonBoat.command.DragonBoatCmd;
   import com.qq.modules.dragonBoat.model.vo.DragonBoatExchangeVO;
   import com.qq.modules.main.command.CommonCmd;
   import tencent.io.service.events.SocketServiceEvent;
   
   public class DragonBoatProxy extends BasicProxy
   {
       
      
      private var m_activityID:uint;
      
      [Inject]
      public var activityProxy:ActivityProxy;
      
      private var m_acitivityInfo:ActivityCommonInfo;
      
      private var m_players:Vector.<Dto_IdNum>;
      
      private var m_vecExchange:Vector.<DragonBoatExchangeVO>;
      
      private var m_totalScore:uint;
      
      private var m_summonGetScore:uint;
      
      private var m_playerTicketCost:Array;
      
      public function DragonBoatProxy()
      {
         super();
      }
      
      override public function listMsgInterests() : Array
      {
         return [[Cmd_DragonBoat_Summon_SC.$MessageID,this.onCmd_DragonBoat_Summon_SC],[Cmd_DragonBoat_Exchange_SC.$MessageID,this.onCmd_DragonBoat_Exchange_SC],[Cmd_DragonBoat_SetOut_SC.$MessageID,this.onCmd_DragonBoat_SetOut_SC],[FlexibleActivity_1005.$MessageID,this.onFlexibleActivity_1005]];
      }
      
      public function get activityInfo() : ActivityCommonInfo
      {
         return this.m_acitivityInfo;
      }
      
      public function get players() : Vector.<Dto_IdNum>
      {
         return this.m_players;
      }
      
      public function get totalScore() : uint
      {
         return this.m_totalScore;
      }
      
      override public function init(param1:Array = null) : void
      {
         super.init(param1);
         this.m_vecExchange = new Vector.<DragonBoatExchangeVO>();
      }
      
      public function get totalTicketCost() : uint
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         while(_loc2_ < this.m_players.length)
         {
            if(this.m_players[_loc2_].num <= 0)
            {
               _loc1_++;
            }
            _loc2_++;
         }
         return this.m_playerTicketCost[_loc1_ - 1];
      }
      
      public function get exchangeList() : Vector.<DragonBoatExchangeVO>
      {
         return this.m_vecExchange;
      }
      
      private function onFlexibleActivity_1005(param1:SocketServiceEvent) : void
      {
         var _loc3_:Dto_DragonBoatExchange = null;
         var _loc4_:int = 0;
         var _loc5_:Dto_IdNum = null;
         var _loc2_:FlexibleActivity_1005 = param1.socketData as FlexibleActivity_1005;
         if(_loc2_.activityid == DragonBoatConst.ACTIVITY_ID)
         {
            this.m_acitivityInfo = this.activityProxy.getGroupByViewType(ActivityGlobal.VIEW_TYPE_DRAGON_BOAT)[0];
            this.m_totalScore = _loc2_.credit;
            this.m_playerTicketCost = _loc2_.lackmembercost;
            if(this.m_players == null)
            {
               this.m_players = new Vector.<Dto_IdNum>();
               _loc4_ = 0;
               while(_loc4_ < _loc2_.activitymembernum)
               {
                  (_loc5_ = new Dto_IdNum()).id = _loc4_ + 1;
                  _loc5_.num = 0;
                  this.m_players.push(_loc5_);
                  _loc4_++;
               }
            }
            for each(_loc5_ in _loc2_.activitymembers)
            {
               _loc4_ = 0;
               while(_loc4_ < this.m_players.length)
               {
                  if(this.m_players[_loc4_].id == _loc5_.id)
                  {
                     this.m_players[_loc4_].num = _loc5_.num;
                  }
                  _loc4_++;
               }
            }
            this.m_vecExchange.length = 0;
            for each(_loc3_ in _loc2_.exchangeitems)
            {
               this.m_vecExchange.push(new DragonBoatExchangeVO(_loc3_));
            }
            this.dispatch(new CommonEvent(DragonBoatConst.EVENT_UPDATE));
         }
      }
      
      private function onCmd_DragonBoat_Summon_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_DragonBoat_Summon_SC = param1.socketData as Cmd_DragonBoat_Summon_SC;
         if(_loc2_.activityid == DragonBoatConst.ACTIVITY_ID)
         {
            DragonBoatCmd.getInfo();
            this.dispatch(new CommonEvent(DragonBoatConst.EVENT_SUMMON,_loc2_.itemids));
         }
      }
      
      private function onCmd_DragonBoat_Exchange_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_DragonBoat_Exchange_SC = param1.socketData as Cmd_DragonBoat_Exchange_SC;
         if(_loc2_.activityid == DragonBoatConst.ACTIVITY_ID)
         {
            CommonCmd.itemFly([_loc2_.item]);
            DragonBoatCmd.getInfo();
         }
      }
      
      private function onCmd_DragonBoat_SetOut_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_DragonBoat_SetOut_SC = param1.socketData as Cmd_DragonBoat_SetOut_SC;
         if(_loc2_.activityid == DragonBoatConst.ACTIVITY_ID)
         {
            this.m_summonGetScore = _loc2_.credit;
            DragonBoatCmd.getInfo();
            this.dispatch(new CommonEvent(DragonBoatConst.EVENT_SETOUT));
         }
      }
   }
}
