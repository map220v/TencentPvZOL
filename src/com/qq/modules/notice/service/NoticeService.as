package com.qq.modules.notice.service
{
   import PVZ.Cmd.Cmd_Notice_GetRollList_CS;
   import PVZ.Cmd.Cmd_Notice_GetRollList_SC;
   import PVZ.Cmd.Cmd_Notice_GetSysList_CS;
   import PVZ.Cmd.Cmd_Notice_GetSysList_SC;
   import PVZ.Cmd.Cmd_Notice_ReadSysNotice_CS;
   import com.qq.modules.main.server.PvzSocketService;
   import com.qq.modules.notice.command.NoticeCmd;
   import com.qq.modules.notice.constant.NoticeConst;
   import com.qq.modules.notice.model.NoticeVO;
   import com.qq.utils.DateUtils;
   import com.tencent.protobuf.Message;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import org.as3commons.logging.api.getLogger;
   import org.robotlegs.mvcs.Actor;
   import tencent.io.service.events.SocketServiceEvent;
   
   public class NoticeService extends Actor
   {
       
      
      [Inject]
      public var pvzServer:PvzSocketService;
      
      public var vo:NoticeVO;
      
      private var timer:Timer;
      
      public function NoticeService()
      {
         super();
         this.vo = new NoticeVO();
      }
      
      public function init() : void
      {
         this.pvzServer.eventDispatcher.addEventListener(Cmd_Notice_GetSysList_SC.$MessageID,this.cmdHandler);
         this.pvzServer.eventDispatcher.addEventListener(Cmd_Notice_GetRollList_SC.$MessageID,this.cmdHandler);
      }
      
      private function cmdHandler(param1:SocketServiceEvent) : void
      {
         if(param1.retCode != 0)
         {
            getLogger("Socket").error("socket error: " + param1.retCode);
            return;
         }
         var _loc2_:* = param1.type;
         switch(0)
         {
         }
         this.msgDispatcher(param1.socketData as Message);
      }
      
      private function msgDispatcher(param1:Message) : void
      {
         switch(param1.$messageID)
         {
            case Cmd_Notice_GetSysList_SC.$MessageID:
               this.vo.loadSysNoticeCmd(param1 as Cmd_Notice_GetSysList_SC);
               NoticeCmd.showNoticeIcon();
               dispatch(new Event(NoticeConst.UPDATE_NOTICE));
               break;
            case Cmd_Notice_GetRollList_SC.$MessageID:
               this.vo.loadRollNoticeCmd(param1 as Cmd_Notice_GetRollList_SC);
               if(this.vo.rollNoticeList.length > 0)
               {
                  NoticeCmd.updateRollNoticeCav();
                  NoticeCmd.showNoticeIcon();
               }
               if(this.vo.hasUnread)
               {
                  NoticeCmd.flashNoticeIcon();
               }
         }
      }
      
      public function noticeGetSysList() : void
      {
         var _loc1_:Cmd_Notice_GetSysList_CS = new Cmd_Notice_GetSysList_CS();
         this.pvzServer.sendMessage(_loc1_);
      }
      
      public function noticeGetRollList() : void
      {
         var _loc1_:Cmd_Notice_GetRollList_CS = new Cmd_Notice_GetRollList_CS();
         this.pvzServer.sendMessage(_loc1_);
      }
      
      public function noticeReadSys() : void
      {
         var _loc1_:Cmd_Notice_ReadSysNotice_CS = new Cmd_Notice_ReadSysNotice_CS();
         this.pvzServer.sendMessage(_loc1_);
      }
      
      private function onTimer(param1:TimerEvent) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(this.vo.sysNoticeList)
         {
            _loc2_ = this.vo.sysNoticeList.length;
            _loc3_ = 0;
            while(_loc3_ < this.vo.sysNoticeList.length)
            {
               if(DateUtils.getInstance().getServerTime() > this.vo.sysNoticeList[_loc3_].expireTime)
               {
                  this.vo.sysNoticeList.splice(_loc3_,1);
                  _loc3_--;
               }
               _loc3_++;
            }
            if(_loc2_ != this.vo.sysNoticeList.length)
            {
               dispatch(new Event(NoticeConst.UPDATE_NOTICE));
            }
         }
      }
   }
}
