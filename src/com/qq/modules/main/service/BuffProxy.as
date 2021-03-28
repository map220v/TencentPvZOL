package com.qq.modules.main.service
{
   import PVZ.Cmd.Cmd_Buff_GetList_SC;
   import PVZ.Cmd.Cmd_Buff_Sync_SC;
   import PVZ.Cmd.Dto_Buff_Info;
   import com.qq.CommandName;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.modle.BasicProxy;
   import com.qq.modules.main.command.BuffProxyCmd;
   import com.qq.modules.main.logic.initData.InitDataManager;
   import com.qq.modules.main.model.vo.BuffVO;
   import com.qq.utils.DateUtils;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import tencent.io.service.events.SocketServiceEvent;
   
   public class BuffProxy extends BasicProxy
   {
       
      
      private var _buffArr:Vector.<BuffVO>;
      
      private var _timer:Timer;
      
      public function BuffProxy()
      {
         super();
      }
      
      override public function init(param1:Array = null) : void
      {
         super.init(param1);
         this._timer = new Timer(1000);
         this._timer.addEventListener(TimerEvent.TIMER_COMPLETE,this.onTimerComplete);
      }
      
      override public function listMsgInterests() : Array
      {
         return [[Cmd_Buff_GetList_SC.$MessageID,this.onCmd_Buff_GetList_SC],[Cmd_Buff_Sync_SC.$MessageID,this.onCmd_Buff_Sync_SC]];
      }
      
      private function onCmd_Buff_GetList_SC(param1:SocketServiceEvent) : void
      {
         var _loc3_:Dto_Buff_Info = null;
         var _loc2_:Cmd_Buff_GetList_SC = param1.socketData as Cmd_Buff_GetList_SC;
         this._buffArr = new Vector.<BuffVO>();
         for each(_loc3_ in _loc2_.buffs)
         {
            this._buffArr.push(new BuffVO(_loc3_));
         }
         InitDataManager.getInstance().finishTask(InitDataManager.Init_BuffInfo);
         dispatch(new CommonEvent(CommandName.BUFF_GET_LIST_EVENT));
         this.resetNextRefreshTime();
      }
      
      private function onCmd_Buff_Sync_SC(param1:SocketServiceEvent) : void
      {
         var _loc5_:BuffVO = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(!this._buffArr)
         {
            return;
         }
         var _loc2_:Cmd_Buff_Sync_SC = param1.socketData as Cmd_Buff_Sync_SC;
         var _loc3_:int = this._buffArr.length;
         var _loc4_:int = -1;
         if(_loc2_.buffs.endTime != 0)
         {
            _loc6_ = 0;
            while(_loc6_ < _loc3_)
            {
               if((_loc5_ = this._buffArr[_loc6_]).buffType == _loc2_.buffs.buffType)
               {
                  _loc5_.loadDto(_loc2_.buffs);
                  break;
               }
               _loc6_++;
            }
            if(_loc6_ == _loc3_)
            {
               this._buffArr.push(new BuffVO(_loc2_.buffs));
            }
         }
         else
         {
            _loc7_ = 0;
            while(_loc7_ < _loc3_)
            {
               if((_loc5_ = this._buffArr[_loc7_]).dto.buffId == _loc2_.buffs.buffId)
               {
                  this._buffArr.splice(_loc7_,1);
                  break;
               }
               _loc7_++;
            }
         }
         this.resetNextRefreshTime();
         dispatch(new CommonEvent(CommandName.BUFF_CHANGED));
      }
      
      private function resetNextRefreshTime() : void
      {
         var _loc2_:BuffVO = null;
         if(this._buffArr.length <= 0)
         {
            return;
         }
         var _loc1_:int = int.MAX_VALUE;
         for each(_loc2_ in this._buffArr)
         {
            if(_loc1_ > _loc2_.dto.endTime)
            {
               _loc1_ = _loc2_.dto.endTime;
            }
         }
         this._timer.repeatCount = _loc1_ - DateUtils.getInstance().getServerTime() < 2 ? int(2 + 1) : int(int(_loc1_ - DateUtils.getInstance().getServerTime() + 1));
         this._timer.reset();
         this._timer.start();
      }
      
      private function onTimerComplete(param1:TimerEvent) : void
      {
         BuffProxyCmd.getBuffList();
      }
      
      public function getBuffById(param1:int) : BuffVO
      {
         var _loc2_:BuffVO = null;
         for each(_loc2_ in this._buffArr)
         {
            if(_loc2_.dto.buffId == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function getBuffByType(param1:int) : BuffVO
      {
         var _loc2_:BuffVO = null;
         for each(_loc2_ in this._buffArr)
         {
            if(_loc2_.dto.buffType == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
   }
}
