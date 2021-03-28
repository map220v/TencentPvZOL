package com.qq.modules.arena.service
{
   import PVZ.Cmd.Cmd_Arena_Challenge_CS;
   import PVZ.Cmd.Cmd_Arena_Challenge_SC;
   import PVZ.Cmd.Cmd_Arena_ClearCoolDown_CS;
   import PVZ.Cmd.Cmd_Arena_ClearCoolDown_SC;
   import PVZ.Cmd.Cmd_Arena_GetFormation_CS;
   import PVZ.Cmd.Cmd_Arena_GetFormation_SC;
   import PVZ.Cmd.Cmd_Arena_GetMyInfo_CS;
   import PVZ.Cmd.Cmd_Arena_GetMyInfo_SC;
   import PVZ.Cmd.Cmd_Arena_GetTopPlayers_CS;
   import PVZ.Cmd.Cmd_Arena_GetTopPlayers_SC;
   import PVZ.Cmd.Cmd_Arena_ShowDailyReward_CS;
   import PVZ.Cmd.Cmd_Arena_ShowDailyReward_SC;
   import PVZ.Cmd.Cmd_Arena_TakeDailyReward_CS;
   import PVZ.Cmd.Cmd_Arena_TakeDailyReward_SC;
   import com.qq.GameGloble;
   import com.qq.modules.arena.constant.ArenaConst;
   import com.qq.modules.arena.model.ArenaModel;
   import com.qq.modules.embattle.constant.EmbattleConst;
   import com.qq.modules.main.command.CommonCmd;
   import com.qq.modules.main.command.GameFlowCmd;
   import com.qq.modules.main.server.PvzSocketService;
   import flash.events.Event;
   import org.as3commons.logging.api.getLogger;
   import org.robotlegs.mvcs.Actor;
   import tencent.base.utils.DelayCall;
   import tencent.io.service.events.SocketServiceEvent;
   
   public class ArenaService extends Actor
   {
       
      
      [Inject]
      public var pvzServer:PvzSocketService;
      
      [Inject]
      public var arenaModel:ArenaModel;
      
      private var isInit:Boolean = false;
      
      public function ArenaService()
      {
         super();
      }
      
      public function init() : void
      {
         if(this.isInit)
         {
            return;
         }
         this.isInit = true;
         this.pvzServer.eventDispatcher.addEventListener(Cmd_Arena_GetTopPlayers_SC.$MessageID,this.cmdHandler);
         this.pvzServer.eventDispatcher.addEventListener(Cmd_Arena_GetMyInfo_SC.$MessageID,this.cmdHandler);
         this.pvzServer.eventDispatcher.addEventListener(Cmd_Arena_ShowDailyReward_SC.$MessageID,this.cmdHandler);
         this.pvzServer.eventDispatcher.addEventListener(Cmd_Arena_Challenge_SC.$MessageID,this.cmdHandler);
         this.pvzServer.eventDispatcher.addEventListener(Cmd_Arena_TakeDailyReward_SC.$MessageID,this.cmdHandler);
         this.pvzServer.eventDispatcher.addEventListener(Cmd_Arena_GetFormation_SC.$MessageID,this.cmdHandler);
         this.pvzServer.eventDispatcher.addEventListener(Cmd_Arena_ClearCoolDown_SC.$MessageID,this.cmdHandler);
      }
      
      private function cmdHandler(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_Arena_GetTopPlayers_SC = null;
         var _loc3_:Cmd_Arena_GetMyInfo_SC = null;
         var _loc4_:Cmd_Arena_ShowDailyReward_SC = null;
         var _loc5_:Cmd_Arena_Challenge_SC = null;
         var _loc6_:Cmd_Arena_GetFormation_SC = null;
         var _loc7_:Cmd_Arena_ClearCoolDown_SC = null;
         if(param1.retCode != 0)
         {
            getLogger("Socket").error("socket error: " + param1.retCode);
            return;
         }
         switch(param1.type)
         {
            case Cmd_Arena_GetTopPlayers_SC.$MessageID:
               _loc2_ = param1.socketData as Cmd_Arena_GetTopPlayers_SC;
               this.arenaModel.topPlayerInfoList = _loc2_.players;
               this.arenaModel.serverTopGrade = _loc2_.grade;
               dispatch(new Event(ArenaConst.EVENT_UPDATE));
               break;
            case Cmd_Arena_GetMyInfo_SC.$MessageID:
               _loc3_ = param1.socketData as Cmd_Arena_GetMyInfo_SC;
               this.arenaModel.curRank = _loc3_.rank;
               this.arenaModel.curGrade = _loc3_.curGrade;
               if(this.arenaModel.curGrade == 0)
               {
                  this.arenaModel.curGrade = 1;
               }
               this.arenaModel.curScore = _loc3_.score;
               this.arenaModel.coolTime = _loc3_.coolDown;
               this.arenaModel.leftFightNum = _loc3_.leftChallengeNum;
               this.arenaModel.nextGrade = _loc3_.nextGrade;
               this.arenaModel.recorderInfoList = _loc3_.recorders;
               dispatch(new Event(ArenaConst.EVENT_UPDATE));
               break;
            case Cmd_Arena_ShowDailyReward_SC.$MessageID:
               _loc4_ = param1.socketData as Cmd_Arena_ShowDailyReward_SC;
               this.arenaModel.ydayGradeResult = _loc4_.yesterdayResult;
               this.arenaModel.ydayRank = _loc4_.yesterdayRank;
               this.arenaModel.curFeatureId = _loc4_.curFeatureId;
               this.arenaModel.nextFeatureId = _loc4_.nextFeatureId;
               this.arenaModel.hasGetReward = _loc4_.hasTakeReward;
               this.arenaModel.rewardList = _loc4_.rewardList;
               dispatch(new Event(ArenaConst.EVENT_UPDATE));
               dispatch(new Event(ArenaConst.EVENT_REWARD_UPDATE));
               break;
            case Cmd_Arena_Challenge_SC.$MessageID:
               _loc5_ = param1.socketData as Cmd_Arena_Challenge_SC;
               this.arenaModel.curRank = _loc5_.rank;
               this.arenaModel.curScore = _loc5_.score;
               this.arenaModel.addRecorder(_loc5_.recorder);
               GameFlowCmd.queryReport(_loc5_.recorder.reportUid);
               DelayCall.call(5000,this.getMyInfo);
               DelayCall.call(5000,this.getTopPlayer);
               break;
            case Cmd_Arena_TakeDailyReward_SC.$MessageID:
               CommonCmd.itemFly(this.arenaModel.rewardList);
               this.arenaModel.rewardList = [];
               this.arenaModel.hasGetReward = true;
               dispatch(new Event(ArenaConst.EVENT_REWARD_GOT));
               break;
            case Cmd_Arena_GetFormation_SC.$MessageID:
               _loc6_ = param1.socketData as Cmd_Arena_GetFormation_SC;
               GameGloble.actorModel.battleCardModel.setFormationInfo(EmbattleConst.MODE_ARENA,_loc6_.formation);
               break;
            case Cmd_Arena_ClearCoolDown_SC.$MessageID:
               _loc7_ = param1.socketData as Cmd_Arena_ClearCoolDown_SC;
               this.arenaModel.coolTime = 0;
         }
      }
      
      public function getTopPlayer() : void
      {
         var _loc1_:Cmd_Arena_GetTopPlayers_CS = new Cmd_Arena_GetTopPlayers_CS();
         this.pvzServer.sendMessage(_loc1_);
      }
      
      public function getMyInfo() : void
      {
         var _loc1_:Cmd_Arena_GetMyInfo_CS = new Cmd_Arena_GetMyInfo_CS();
         this.pvzServer.sendMessage(_loc1_);
         this.arenaModel.coolTime = 0;
      }
      
      public function getDailyReward() : void
      {
         var _loc1_:Cmd_Arena_ShowDailyReward_CS = new Cmd_Arena_ShowDailyReward_CS();
         this.pvzServer.sendMessage(_loc1_);
      }
      
      public function challenge() : void
      {
         var _loc1_:Cmd_Arena_Challenge_CS = new Cmd_Arena_Challenge_CS();
         this.pvzServer.sendMessage(_loc1_);
      }
      
      public function takeDailyReward() : void
      {
         var _loc1_:Cmd_Arena_TakeDailyReward_CS = new Cmd_Arena_TakeDailyReward_CS();
         this.pvzServer.sendMessage(_loc1_);
      }
      
      public function getFormation() : void
      {
         var _loc1_:Cmd_Arena_GetFormation_CS = new Cmd_Arena_GetFormation_CS();
         this.pvzServer.sendMessage(_loc1_);
      }
      
      public function reduceCD() : void
      {
         var _loc1_:Cmd_Arena_ClearCoolDown_CS = new Cmd_Arena_ClearCoolDown_CS();
         this.pvzServer.sendMessage(_loc1_);
      }
   }
}
