package com.qq.modules.login.command
{
   import PVZ.Cmd.Cmd_CheckOldUser_CS;
   import PVZ.Cmd.Cmd_ClientDownLog_CS;
   import PVZ.Cmd.Cmd_Init_CS;
   import PVZ.Cmd.Cmd_SetSignature_CS;
   import PVZ.Cmd.Cmd_TD_PrivilegeInfo_CS;
   import PVZ.Cmd.Cmd_TD_RequestTDInfo_CS;
   import PVZ.Cmd.Cmd_VipInfo_CS;
   import com.qq.GameGloble;
   import com.qq.modules.login.service.LoginService;
   import com.qq.modules.main.server.PvzSocketService;
   import com.qq.utils.external.QExternalUtil;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   
   public class LoginServerCommand extends StrongRobotlegCommand
   {
       
      
      [Inject]
      public var pvzSocketServer:PvzSocketService;
      
      [Inject]
      public var loginService:LoginService;
      
      public function LoginServerCommand()
      {
         super();
      }
      
      public function requestTDInfo(param1:int, param2:int, param3:int, param4:int = 0) : void
      {
         var _loc5_:Cmd_TD_RequestTDInfo_CS;
         (_loc5_ = new Cmd_TD_RequestTDInfo_CS()).stageId = param1;
         _loc5_.levelId = param2;
         _loc5_.subLevelId = param3;
         _loc5_.challengeLevelId = param4;
         this.pvzSocketServer.sendMessage(_loc5_);
      }
      
      public function requestPrivilegeAndUnlockPlantInfo(param1:int, param2:int, param3:int, param4:int = 0) : void
      {
         var _loc5_:Cmd_TD_PrivilegeInfo_CS;
         (_loc5_ = new Cmd_TD_PrivilegeInfo_CS()).stageId = param1;
         _loc5_.levelId = param2;
         _loc5_.subLevelId = param3;
         _loc5_.challengeLevelId = param4;
         this.pvzSocketServer.sendMessage(_loc5_);
      }
      
      public function sendFirstMessage() : void
      {
         var _loc1_:Cmd_CheckOldUser_CS = new Cmd_CheckOldUser_CS();
         this.pvzSocketServer.sendMessage(_loc1_);
      }
      
      public function sendInitMessage(param1:String = null, param2:int = 0) : void
      {
         var _loc3_:Cmd_Init_CS = new Cmd_Init_CS();
         _loc3_.pf = ExternalVars.SFrom;
         _loc3_.openid = ExternalVars.OPEN_ID;
         _loc3_.openkey = ExternalVars.OPEN_KEY;
         _loc3_.pfKey = ExternalVars.PLATFORM_KEY;
         _loc3_.inviteParam = ExternalVars.INVITE_PARAM;
         _loc3_.channel = ExternalVars.Channel;
         _loc3_.adtag = ExternalVars.ADTAG;
         _loc3_.wdpid = QExternalUtil.getMicroClientId();
         _loc3_.needActive = ExternalVars.Need_Active;
         _loc3_.roleName = param1;
         _loc3_.sex = param2;
         _loc3_.realpf = ExternalVars.PF;
         _loc3_.appcustom = ExternalVars.APP_CUSTOM;
         this.pvzSocketServer.sendMessage(_loc3_);
         if(param1 != null)
         {
            GameGloble.isNew = true;
         }
      }
      
      public function sendClientErrorTrack(param1:String) : void
      {
         var _loc2_:Cmd_ClientDownLog_CS = new Cmd_ClientDownLog_CS();
         _loc2_.logText = param1;
         this.pvzSocketServer.sendMessage(_loc2_);
      }
      
      public function requestVipInfo() : void
      {
         var _loc1_:Cmd_VipInfo_CS = new Cmd_VipInfo_CS();
         this.pvzSocketServer.sendMessage(_loc1_);
      }
      
      public function getPlayerBattleCardInfo(param1:uint = 0) : void
      {
         this.loginService.getPlayerBattleCardInfo(param1);
      }
      
      public function saveMyWord(param1:String) : void
      {
         var _loc2_:Cmd_SetSignature_CS = new Cmd_SetSignature_CS();
         _loc2_.signature = param1;
         this.pvzSocketServer.sendMessage(_loc2_);
      }
   }
}
