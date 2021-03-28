package com.qq.modules.td.command
{
   import PVZ.Cmd.Cmd_DailyTD_BuyCart_CS;
   import PVZ.Cmd.Cmd_DailyTD_BuyEnergyBean_CS;
   import PVZ.Cmd.Cmd_DailyTD_BuySun_CS;
   import PVZ.Cmd.Cmd_DailyTD_StartTDGame_CS;
   import PVZ.Cmd.Cmd_DailyTD_UseSkill_CS;
   import PVZ.Cmd.Cmd_Friend_GetList_CS;
   import PVZ.Cmd.Cmd_NoEndTD_BuyCart_CS;
   import PVZ.Cmd.Cmd_NoEndTD_BuyEnergyBean_CS;
   import PVZ.Cmd.Cmd_NoEndTD_BuySun_CS;
   import PVZ.Cmd.Cmd_NoEndTD_UseSkill_CS;
   import PVZ.Cmd.Cmd_SnowMan_KillSnowMan_CS;
   import PVZ.Cmd.Cmd_SnowMan_StartTDGame_CS;
   import PVZ.Cmd.Cmd_TD_AfterReportResult_CS;
   import PVZ.Cmd.Cmd_TD_BeforeReportResult_CS;
   import PVZ.Cmd.Cmd_TD_BuyCart_CS;
   import PVZ.Cmd.Cmd_TD_BuyEnergyBean_CS;
   import PVZ.Cmd.Cmd_TD_BuySun_CS;
   import PVZ.Cmd.Cmd_TD_ReportLevelResult_CS;
   import PVZ.Cmd.Cmd_TD_StartTDGame_CS;
   import PVZ.Cmd.Cmd_TD_UnlockPrivilegePlant_CS;
   import PVZ.Cmd.Cmd_TD_UseSkill_CS;
   import PVZ.Cmd.FriendModuleType;
   import com.qq.GameGloble;
   import com.qq.constant.ls.LSConstant;
   import com.qq.modules.levelselect.model.LSProxy;
   import com.qq.modules.levelselect.model.vo.LSLevelInfoVO;
   import com.qq.modules.main.command.CommonCmd;
   import com.qq.modules.main.command.GameFlowCmd;
   import com.qq.modules.main.server.PvzSocketService;
   import com.qq.modules.td.logic.TDDebugManager;
   import com.qq.modules.td.logic.log.TDLogger;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.model.TDStageInfo;
   import com.qq.modules.td.model.TDStartParam;
   import com.qq.modules.td.model.vo.TDDataVO;
   import com.qq.utils.UtilsManager;
   import com.tencent.protobuf.Int64;
   import flash.utils.ByteArray;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   
   public class TDProxyCommand extends StrongRobotlegCommand
   {
       
      
      [Inject]
      public var server:PvzSocketService;
      
      [Inject]
      public var lsProxy:LSProxy;
      
      public function TDProxyCommand()
      {
         super();
      }
      
      public function requestFriendCardInfo(param1:int) : void
      {
         GameFlowCmd.lockScreen(2);
         var _loc2_:Cmd_Friend_GetList_CS = new Cmd_Friend_GetList_CS();
         _loc2_.moduleType = FriendModuleType.FRIEND_MODULE_TYPE_TD_PLANT;
         _loc2_.page = param1;
         _loc2_.pageSize = TDDataVO.PageSize;
         this.server.sendMessage(_loc2_);
      }
      
      public function requestStartTDGame(param1:int, param2:int, param3:int, param4:int, param5:Int64 = null) : void
      {
         var _loc7_:LSLevelInfoVO = null;
         GameFlowCmd.lockScreen(2);
         var _loc6_:Cmd_TD_StartTDGame_CS;
         (_loc6_ = new Cmd_TD_StartTDGame_CS()).stageId = param1;
         _loc6_.levelId = param2;
         _loc6_.subLevelId = param3;
         _loc6_.challengeLevelId = param4;
         if(param5 != null)
         {
            _loc6_.friendRoleId = param5;
         }
         else
         {
            _loc6_.friendRoleId = new Int64(0,0);
         }
         this.server.sendMessage(_loc6_);
         if(param4 > 0)
         {
            if(_loc7_ = this.lsProxy.getChallengeLevelInfo(param2,param3,param4))
            {
               if(_loc7_.remainFreeChallengeTimes > 0)
               {
                  --_loc7_.remainFreeChallengeTimes;
               }
               else if(_loc7_.remainPayChallengeTimes > 0)
               {
                  --_loc7_.remainPayChallengeTimes;
               }
            }
         }
      }
      
      public function finishLevel(param1:int, param2:int, param3:int, param4:int, param5:int, param6:Array, param7:Boolean) : void
      {
         GameFlowCmd.lockScreen(5);
         if(param5 > 0 && TDStageInfo.getInstance().stageID != 0)
         {
            TDGameInfo.getInstance().addNewAchievement(LSConstant.ACHIEVEMENT_PASS_ID);
         }
         var _loc8_:Cmd_TD_BeforeReportResult_CS;
         (_loc8_ = new Cmd_TD_BeforeReportResult_CS()).bRepeat = param7;
         this.server.sendMessage(_loc8_);
         var _loc9_:Cmd_TD_ReportLevelResult_CS;
         (_loc9_ = new Cmd_TD_ReportLevelResult_CS()).stageId = TDStageInfo.getInstance().stageID;
         _loc9_.levelId = param1;
         _loc9_.subLevelId = param2;
         _loc9_.passResult = param5;
         if(param3 == 0)
         {
            _loc9_.achievementList = param6;
         }
         else
         {
            _loc9_.achievementList = [];
         }
         _loc9_.challengeLevelId = param3;
         _loc9_.score = param4;
         var _loc10_:ByteArray = new ByteArray();
         _loc9_.srcsize = UtilsManager.compressLog(TDLogger.getInstance().getLog(),_loc10_);
         _loc9_.bytelogs = _loc10_;
         _loc9_.bRepeat = param7;
         this.server.sendMessage(_loc9_);
         if(!param7)
         {
            TDDebugManager.getInstance().checkTDServerMsg(TDStartParam.Normal,_loc9_,TDLogger.getInstance().getLog());
         }
         var _loc11_:Cmd_TD_AfterReportResult_CS;
         (_loc11_ = new Cmd_TD_AfterReportResult_CS()).bRepeat = param7;
         this.server.sendMessage(_loc11_);
      }
      
      public function startDailyTDGame() : void
      {
         var _loc1_:Cmd_DailyTD_StartTDGame_CS = new Cmd_DailyTD_StartTDGame_CS();
         _loc1_.stageId = TDStageInfo.getInstance().startParam.dailyStageID;
         this.server.sendMessage(_loc1_);
      }
      
      public function startYetiTD() : void
      {
         var _loc1_:Cmd_SnowMan_StartTDGame_CS = new Cmd_SnowMan_StartTDGame_CS();
         _loc1_.modeId = TDStageInfo.getInstance().startParam.yetiModeID;
         _loc1_.fountainId = TDStageInfo.getInstance().startParam.wishID;
         this.server.sendMessage(_loc1_);
      }
      
      public function useSkillPlant(param1:int) : void
      {
         var _loc2_:Cmd_NoEndTD_UseSkill_CS = new Cmd_NoEndTD_UseSkill_CS();
         _loc2_.mode = 1;
         _loc2_.plantId = param1;
         this.server.sendMessage(_loc2_);
      }
      
      public function useSkillPlantByDiamond(param1:int) : void
      {
         var _loc2_:Cmd_TD_UseSkill_CS = null;
         var _loc3_:Cmd_DailyTD_UseSkill_CS = null;
         if(TDStageInfo.getInstance().startParam.gameType == TDStartParam.Normal)
         {
            _loc2_ = new Cmd_TD_UseSkill_CS();
            _loc2_.stageId = TDStageInfo.getInstance().stageID;
            _loc2_.levelId = TDStageInfo.getInstance().levelID;
            _loc2_.subLevelId = TDStageInfo.getInstance().subLevelID;
            _loc2_.challengeLevelId = TDStageInfo.getInstance().challengeLevelID;
            _loc2_.plantId = param1;
            this.server.sendMessage(_loc2_);
         }
         else
         {
            _loc3_ = new Cmd_DailyTD_UseSkill_CS();
            _loc3_.stageId = TDStageInfo.getInstance().stageID;
            _loc3_.plantId = param1;
            this.server.sendMessage(_loc3_);
         }
      }
      
      public function buyEnergyBean(param1:int) : void
      {
         var _loc2_:Cmd_TD_BuyEnergyBean_CS = null;
         var _loc3_:Cmd_DailyTD_BuyEnergyBean_CS = null;
         var _loc4_:Cmd_NoEndTD_BuyEnergyBean_CS = null;
         switch(param1)
         {
            case 0:
               _loc2_ = new Cmd_TD_BuyEnergyBean_CS();
               _loc2_.stageId = TDStageInfo.getInstance().stageID;
               _loc2_.levelId = TDStageInfo.getInstance().levelID;
               _loc2_.subLevelId = TDStageInfo.getInstance().subLevelID;
               _loc2_.challengeLevelId = TDStageInfo.getInstance().challengeLevelID;
               this.server.sendMessage(_loc2_);
               break;
            case 1:
               _loc3_ = new Cmd_DailyTD_BuyEnergyBean_CS();
               _loc3_.stageId = TDStageInfo.getInstance().stageID;
               this.server.sendMessage(_loc3_);
               break;
            case 2:
               (_loc4_ = new Cmd_NoEndTD_BuyEnergyBean_CS()).mode = 1;
               this.server.sendMessage(_loc4_);
         }
      }
      
      public function buySun(param1:int) : void
      {
         var _loc2_:Cmd_TD_BuySun_CS = null;
         var _loc3_:Cmd_DailyTD_BuySun_CS = null;
         var _loc4_:Cmd_NoEndTD_BuySun_CS = null;
         switch(param1)
         {
            case 0:
               _loc2_ = new Cmd_TD_BuySun_CS();
               _loc2_.stageId = TDStageInfo.getInstance().stageID;
               _loc2_.levelId = TDStageInfo.getInstance().levelID;
               _loc2_.subLevelId = TDStageInfo.getInstance().subLevelID;
               _loc2_.challengeLevelId = TDStageInfo.getInstance().challengeLevelID;
               this.server.sendMessage(_loc2_);
               break;
            case 1:
               _loc3_ = new Cmd_DailyTD_BuySun_CS();
               _loc3_.stageId = TDStageInfo.getInstance().stageID;
               this.server.sendMessage(_loc3_);
               break;
            case 2:
               (_loc4_ = new Cmd_NoEndTD_BuySun_CS()).mode = 1;
               this.server.sendMessage(_loc4_);
         }
      }
      
      public function killSnowMan() : void
      {
         ++TDGameInfo.getInstance().yetiKillNum;
         var _loc1_:Cmd_SnowMan_KillSnowMan_CS = new Cmd_SnowMan_KillSnowMan_CS();
         this.server.sendMessage(_loc1_);
      }
      
      public function ticketUnlockPlant(param1:int) : void
      {
         var _loc2_:Cmd_TD_UnlockPrivilegePlant_CS = new Cmd_TD_UnlockPrivilegePlant_CS();
         _loc2_.plantId = param1;
         this.server.sendMessage(_loc2_);
      }
      
      public function buyMower(param1:int, param2:int) : void
      {
         var _loc3_:Cmd_DailyTD_BuyCart_CS = null;
         var _loc4_:Cmd_NoEndTD_BuyCart_CS = null;
         var _loc5_:Cmd_TD_BuyCart_CS = null;
         if(GameGloble.actorModel.isEnoughDiamond(param1,true))
         {
            switch(TDStageInfo.getInstance().startParam.gameType)
            {
               case TDStartParam.Daily:
                  _loc3_ = new Cmd_DailyTD_BuyCart_CS();
                  _loc3_.stageId = TDStageInfo.getInstance().stageID;
                  _loc3_.cartId = param2;
                  this.server.sendMessage(_loc3_);
                  break;
               case TDStartParam.Endless:
                  (_loc4_ = new Cmd_NoEndTD_BuyCart_CS()).mode = 1;
                  _loc4_.cartId = param2;
                  this.server.sendMessage(_loc4_);
                  break;
               case TDStartParam.Normal:
                  (_loc5_ = new Cmd_TD_BuyCart_CS()).stageId = TDStageInfo.getInstance().stageID;
                  _loc5_.levelId = TDStageInfo.getInstance().levelID;
                  _loc5_.subLevelId = TDStageInfo.getInstance().subLevelID;
                  _loc5_.challengeLevelId = TDStageInfo.getInstance().challengeLevelID;
                  _loc5_.cartId = param2;
                  this.server.sendMessage(_loc5_);
            }
         }
         else
         {
            CommonCmd.showDiamondNotEnough(param1,true);
         }
      }
   }
}
