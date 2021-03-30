package com.qq.net
{
   import PVZ.Cmd.Cmd_Idle_CS;
   import PVZ.Cmd.Cmd_Idle_SC;
   import asgui.controls.Alert;
   import asgui.managers.ConfigManager;
   import com.qq.CommandName;
   import com.qq.GameGloble;
   import com.qq.SceneCenter;
   import com.qq.constant.SceneName;
   import com.qq.display.QAlert;
   import com.qq.modules.main.server.PvzSocketService;
   import com.qq.templates.font.FontNormal;
   import com.qq.utils.CommandDispatcher;
   import com.qq.utils.DateUtils;
   import com.qq.utils.UtilsManager;
   import com.qq.utils.tqos.TQOSUtils;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import org.as3commons.logging.api.getLogger;
   import tencent.io.service.events.SocketServiceEvent;
   
   public class IdleMessageSendManager
   {
      
      private static var _instance:IdleMessageSendManager;
       
      
      private var _timer:Timer;
      
      private var _senderSecondCounter:uint;
      
      private var _isSenderRunning:Boolean;
      
      private var _responseSecondCounter:uint;
      
      private var _isResponseRunning:Boolean;
      
      private var _service:PvzSocketService;
      
      private var _counter:Number;
      
      private var _lastSeqID:int;
      
      private var _responseCounter:int;
      
      public function IdleMessageSendManager()
      {
         super();
         this.resetSenderTimer();
         this.resetResponseTimer();
         this._counter = 0;
         this._responseCounter = 0;
      }
      
      public static function getInstance() : IdleMessageSendManager
      {
         if(_instance == null)
         {
            _instance = new IdleMessageSendManager();
         }
         return _instance;
      }
      
      public function init(param1:PvzSocketService) : void
      {
         this._service = param1;
         param1.eventDispatcher.addEventListener(Cmd_Idle_SC.$MessageID,this.serverDataHandler);
         this._timer = new Timer(1000,0);
         this._timer.addEventListener(TimerEvent.TIMER,this.onTimer);
         this._timer.start();
         this.startSenderTimer();
      }
      
      private function onTimer(param1:Event) : void
      {
         if(this._isSenderRunning)
         {
            ++this._senderSecondCounter;
            if(this._senderSecondCounter >= 30)
            {
               this._senderSecondCounter = 0;
               this.sendIdle();
            }
         }
         if(this._isResponseRunning)
         {
            ++this._responseSecondCounter;
            if(this._responseSecondCounter >= 10)
            {
               this._responseSecondCounter = 0;
               this.onTimeOut();
            }
         }
      }
      
      public function delayIdleTimer() : void
      {
         this._senderSecondCounter = 0;
      }
      
      private function serverDataHandler(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_Idle_SC = param1.socketData as Cmd_Idle_SC;
         this.resetResponseTimer();
         this.resetSenderTimer();
         this.startSenderTimer();
         DateUtils.getInstance().setServerTime(_loc2_.serverTime);
         this._responseCounter = 0;
         if(SceneCenter.getInstance().currentScene == SceneName.TD && GameGloble.isTDNeedUpdateTime)
         {
            GameGloble.isTDNeedUpdateTime = false;
            CommandDispatcher.send(CommandName.TD_UPDATE_SERVER_TIME);
         }
      }
      
      public function sendIdle() : void
      {
         /*var _loc1_:Cmd_Idle_CS = new Cmd_Idle_CS();
         this._lastSeqID = ++PvzSocketService.seqId;
         _loc1_.seqID = this._lastSeqID.toString();
         this._service.sendMessage(_loc1_);*/

         var testData:SocketServiceEvent = new SocketServiceEvent(Cmd_Idle_SC.$MessageID);
         var testMessage:Cmd_Idle_SC = new Cmd_Idle_SC();

         testMessage.seqID = this._lastSeqID.toString();
         var date:uint = new Date().time;
         testMessage.serverTime = date;

         testData.socketDataCmdName = Cmd_Idle_SC.$MessageID;

         testData.socketData = testMessage;
         testData.retCode = 0;

         this.serverDataHandler(testData)

         this.resetResponseTimer();
         this.startResponseTimer();
      }
      
      private function onTimeOut() : void
      {
         var homesiteUrl:String = null;
         var isDebug:Boolean = false;
         ++this._responseCounter;
         if(this._responseCounter >= 3)
         {
            this.resetResponseTimer();
            this.resetSenderTimer();
            homesiteUrl = ConfigManager.GetConfig("homesite");
            isDebug = false;
            if(!isDebug)
            {
               QAlert.Show(FontNormal.Main_Offline,"",Alert.OK,null,function():void
               {
                  UtilsManager.gotoUrl(homesiteUrl,"_self");
               });
            }
            getLogger("idle").info("idle检测到服务器断开");
            TQOSUtils.getInstance().reportMsg("idle_has_trid_3_times_server_offline");
         }
         else
         {
            getLogger("idle").info("idle失败" + this._responseCounter + "次");
            TQOSUtils.getInstance().reportMsg("idle_try_" + this._responseCounter + "_times");
            this.resetResponseTimer();
            this.resetSenderTimer();
            this.startSenderTimer();
         }
      }
      
      public function stop() : void
      {
         this.resetSenderTimer();
         this.resetResponseTimer();
      }
      
      private function resetSenderTimer() : void
      {
         this._senderSecondCounter = 0;
         this._isSenderRunning = false;
      }
      
      private function startSenderTimer() : void
      {
         this._isSenderRunning = true;
      }
      
      private function resetResponseTimer() : void
      {
         this._responseSecondCounter = 0;
         this._isResponseRunning = false;
      }
      
      private function startResponseTimer() : void
      {
         this._isResponseRunning = true;
      }
   }
}
