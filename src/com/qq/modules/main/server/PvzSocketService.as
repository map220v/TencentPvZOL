package com.qq.modules.main.server
{
   import PVZ.Cmd.Cmd_Idle_CS;
   import PVZ.Cmd.Cmd_LogicError_SC;
   import PVZ.Cmd.Cmd_NotifyLogout_SC;
   import asgui.controls.Alert;
   import com.ied.pptc.tconnd.TConnDClient;
   import com.ied.pptc.tconnd.TConnDError;
   import com.qq.display.QAlert;
   import com.qq.modules.secondaryPassword.model.SecondaryPasswordProtocolCacher;
   import com.qq.net.IdleMessageSendManager;
   import com.qq.net.PvzProtocol;
   import com.qq.net.PvzSocketDecoder;
   import com.qq.net.PvzSocketEncoder;
   import com.qq.net.Uin;
   import com.qq.templates.font.FontNormal;
   import com.qq.utils.UtilsManager;
   import com.tencent.protobuf.Message;
   import flash.utils.ByteArray;
   import org.as3commons.logging.api.getLogger;
   import org.robotlegs.mvcs.Actor;
   import tencent.io.service.TConnDSocketService;
   import tencent.io.service.events.SocketServiceEvent;
   import tencent.io.service.interfaces.IProtocol;
   
   public class PvzSocketService extends Actor
   {
      
      private static const SOCKET_KEY:String = "gameServer";
      
      private static const LOG_MSG_JSON:Boolean = false;
      
      public static var seqId:uint = 0;
       
      
      public var socketService:TConnDSocketService;
      
      private var isInited:Boolean = false;
      
      public function PvzSocketService()
      {
         super();
      }
      
      public function connect() : void
      {
         this.socketService.connect();
      }
      
      public function init(param1:String) : void
      {
         if(this.isInited)
         {
            return;
         }
         if(!ExternalVars.UIN)
         {
            ExternalVars.UIN = new Uin(0);
         }
         getLogger("socket").info("test uid : " + ExternalVars.UIN.data);
         getLogger("socket").info("uin : " + ExternalVars.UIN.data);
         getLogger("socket").info("skey : " + ExternalVars.SKEY);
         getLogger("socket").info("tgw : " + ExternalVars.TGW_PATH);
         this.socketService = new TConnDSocketService();
         this.socketService.init(param1,TConnDClient.PROTOCOL_MODE_SOCKET,5000,this.onReceived,this.onErrord,ExternalVars.RECONNET_PORTS);
         this.socketService.decoder = new PvzSocketDecoder();
         this.socketService.encoder = new PvzSocketEncoder(ExternalVars.UIN.data,ExternalVars.SKEY);
         this.isInited = true;
         eventDispatcher.addEventListener(Cmd_NotifyLogout_SC.$MessageID,this.serverDataHandler);
      }
      
      protected function onReceived(param1:Array) : void
      {
         var _loc5_:String = null;
         if(param1 == null || param1.length != 2)
         {
            return;
         }
         var _loc2_:int = param1[0];
         var _loc3_:IProtocol = param1[1] as IProtocol;
         if(_loc3_ == null)
         {
            getLogger("socket").error("收到socket数据错误!");
            return;
         }
         var _loc4_:Message;
         if((_loc4_ = _loc3_.protoData as Message) != null)
         {
            if(_loc2_ != 0)
            {
               if((_loc5_ = (_loc3_.protoData as Message).$messageID) != Cmd_LogicError_SC.$MessageID && _loc5_ != Cmd_NotifyLogout_SC.$MessageID)
               {
                  ErrorHanderManager.errorHandler(_loc2_);
               }
            }
            this.dispatchMessage(_loc3_.protoData as Message,_loc2_);
         }
      }
      
      protected function onErrord(param1:int) : void
      {
         var errNo:int = param1;
         IdleMessageSendManager.getInstance().delayIdleTimer();
         if(errNo == TConnDError.ERR_CONNECT_CLOSE)
         {
            QAlert.Show(FontNormal.Main_LoginoutServer,"",Alert.OK,null,function():void
            {
               UtilsManager.gotoUrl("javascript:window.location.reload( false );","_self");
            });
         }
         getLogger("socket").error("socket Error: " + errNo);
      }
      
      public function dispatchMessage(param1:Message, param2:int = 0) : void
      {
         var _loc3_:SocketServiceEvent = new SocketServiceEvent(param1.$messageID);
         _loc3_.socketDataCmdName = param1.$messageID;
         _loc3_.socketData = param1;
         _loc3_.retCode = param2;
         eventDispatcher.dispatchEvent(_loc3_);
      }
      
      public function sendMessage(param1:Message) : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:PvzProtocol = new PvzProtocol();
         _loc3_.protoData = param1;
         if(_loc2_)
         {
            getLogger().info("使用 ProtocolTester");
         }
         else
         {
            if(param1.$messageID != Cmd_Idle_CS.$MessageID)
            {
               IdleMessageSendManager.getInstance().delayIdleTimer();
            }
            SecondaryPasswordProtocolCacher.instance.checkProtocol(param1);
            this.socketService.send(_loc3_);
         }
      }
      
      public function sendByte(param1:ByteArray) : void
      {
         this.socketService.sendByte(param1);
      }
      
      private function serverDataHandler(param1:SocketServiceEvent) : void
      {
         var _loc2_:int = 0;
         this.socketService.closeConnect();
         IdleMessageSendManager.getInstance().stop();
         if(param1.retCode != 0)
         {
            _loc2_ = param1.retCode;
            ErrorHanderManager.errorHandler(_loc2_);
         }
      }
      
      public function closeConnect() : void
      {
         this.socketService.closeConnect();
      }
   }
}
