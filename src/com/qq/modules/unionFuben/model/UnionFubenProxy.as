package com.qq.modules.unionFuben.model
{
   import PVZ.Cmd.BattleTargetType;
   import PVZ.Cmd.Cmd_GuildFuben_GetChapterInfo_SC;
   import PVZ.Cmd.Cmd_GuildFuben_GetFormation_SC;
   import PVZ.Cmd.Cmd_GuildFuben_GetStageInfo_SC;
   import PVZ.Cmd.Cmd_GuildFuben_NewDayReward_GetInfo_SC;
   import PVZ.Cmd.Cmd_GuildFuben_NewDayReward_Get_SC;
   import PVZ.Cmd.Cmd_GuildFuben_StartFight_SC;
   import PVZ.Cmd.Cmd_GuildFuben_SyncChapterInfo_SC;
   import PVZ.Cmd.Dto_FightReport;
   import PVZ.Cmd.Dto_Fuben_StageInfo;
   import PVZ.Cmd.Dto_GuildFuben_ChapterInfo;
   import PVZ.Cmd.GuildPosition;
   import asgui.core.UIComponentGlobals;
   import com.qq.modules.basic.modle.BasicProxy;
   import com.qq.modules.battle.command.BattleServiceCmd;
   import com.qq.modules.battle.constant.BattleConst;
   import com.qq.modules.embattle.constant.EmbattleConst;
   import com.qq.modules.fuben.FubenGlobals;
   import com.qq.modules.fuben.model.FubenProxy;
   import com.qq.modules.fuben.model.templates.FubenTemplate;
   import com.qq.modules.fuben.model.templates.FubenTemplateFactory;
   import com.qq.modules.fuben.model.vo.FubenStageVO;
   import com.qq.modules.main.command.CommonCmd;
   import com.qq.modules.main.model.ActorModel;
   import com.qq.modules.union.model.UnionModel;
   import com.qq.modules.unionFuben.UnionFubenConst;
   import com.qq.modules.unionFuben.command.UnionFubenProxyCmd;
   import com.qq.utils.CommandDispatcher;
   import flash.events.Event;
   import tencent.io.service.events.SocketServiceEvent;
   
   public class UnionFubenProxy extends BasicProxy
   {
       
      
      [Inject]
      public var fubenProxy:FubenProxy;
      
      [Inject]
      public var actorModel:ActorModel;
      
      [Inject]
      public var unionModel:UnionModel;
      
      public var chapterVec:Vector.<Dto_GuildFuben_ChapterInfo>;
      
      private var reports:Array;
      
      private var reportIndex:int;
      
      public var curChapterId:uint;
      
      public var curStageId:uint;
      
      public var unionCohesion:uint;
      
      public var myCohesion:uint;
      
      public function UnionFubenProxy()
      {
         this.chapterVec = new Vector.<Dto_GuildFuben_ChapterInfo>();
         super();
      }
      
      override public function listMsgInterests() : Array
      {
         return [[Cmd_GuildFuben_GetChapterInfo_SC.$MessageID,this.onCmd_GuildFuben_GetChapterInfo_SC],[Cmd_GuildFuben_GetStageInfo_SC.$MessageID,this.onCmd_GuildFuben_GetStageInfo_SC],[Cmd_GuildFuben_SyncChapterInfo_SC.$MessageID,this.onCmd_GuildFuben_SyncChapterInfo_SC],[Cmd_GuildFuben_GetFormation_SC.$MessageID,this.onCmd_GuildFuben_GetFormation_SC],[Cmd_GuildFuben_StartFight_SC.$MessageID,this.onCmd_GuildFuben_StartFight_SC],[BattleConst.BATTLE_CLOSE,this.onBattleFightClose],[Cmd_GuildFuben_NewDayReward_GetInfo_SC.$MessageID,this.onCmd_GuildFuben_DayReward_GetInfo_SC],[Cmd_GuildFuben_NewDayReward_Get_SC.$MessageID,this.onCmd_GuildFuben_DayReward_Get_SC]];
      }
      
      private function onCmd_GuildFuben_GetChapterInfo_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_GuildFuben_GetChapterInfo_SC = param1.socketData as Cmd_GuildFuben_GetChapterInfo_SC;
         this.unionCohesion = _loc2_.guildCohesion;
         this.myCohesion = _loc2_.curDayCohesion;
         this.chapterVec.length = 0;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.chapterInfo.length)
         {
            this.chapterVec.push(_loc2_.chapterInfo[_loc3_]);
            _loc3_++;
         }
         dispatch(new Event(UnionFubenConst.UNION_ON_GET_CHAPTER));
      }
      
      public function getChapaterState(param1:uint) : uint
      {
         if(param1 < 5)
         {
            return UnionFubenConst.UNION_CHAPTER_STATE_NULL;
         }
         return 1;
      }
      
      private function onCmd_GuildFuben_GetStageInfo_SC(param1:SocketServiceEvent) : void
      {
         var _loc3_:Vector.<FubenTemplate> = null;
         var _loc4_:FubenStageVO = null;
         var _loc5_:Dto_Fuben_StageInfo = null;
         var _loc6_:int = 0;
         var _loc2_:Cmd_GuildFuben_GetStageInfo_SC = param1.socketData as Cmd_GuildFuben_GetStageInfo_SC;
         if(_loc2_.stageInfo)
         {
            _loc3_ = FubenTemplateFactory.instance.getFubenStageTemplateByChapterAndMode(_loc2_.stageInfo.chapterId,FubenGlobals.FUBEN_MODE_UNION);
            _loc6_ = 0;
            while(_loc6_ < _loc3_.length)
            {
               if(_loc3_[_loc6_].stageId < _loc2_.stageInfo.stageId)
               {
                  _loc4_ = this.fubenProxy.data.getFubenChapterVO(_loc2_.stageInfo.chapterId).getStageById(_loc3_[_loc6_].stageId,FubenGlobals.FUBEN_MODE_UNION);
                  (_loc5_ = new Dto_Fuben_StageInfo()).chapterid = _loc2_.stageInfo.chapterId;
                  _loc5_.stageid = _loc3_[_loc6_].stageId;
                  _loc5_.modeid = 3;
                  _loc5_.star = 3;
                  _loc4_.loadDto(_loc5_);
                  _loc4_.setUnlocked();
               }
               else if(_loc3_[_loc6_].stageId == _loc2_.stageInfo.stageId)
               {
                  _loc4_ = this.fubenProxy.data.getFubenChapterVO(_loc2_.stageInfo.chapterId).getStageById(_loc2_.stageInfo.stageId,FubenGlobals.FUBEN_MODE_UNION);
                  (_loc5_ = new Dto_Fuben_StageInfo()).chapterid = _loc2_.stageInfo.chapterId;
                  _loc5_.stageid = _loc3_[_loc6_].stageId;
                  _loc5_.modeid = 3;
                  _loc5_.star = _loc2_.stageInfo.hasCurHp && _loc2_.stageInfo.curHp.toNumber() == 0 ? uint(3) : uint(0);
                  _loc4_.loadDto(_loc5_);
                  _loc4_.curHp = _loc2_.stageInfo.curHp.toNumber();
                  _loc4_.maxHp = _loc2_.stageInfo.maxHp.toNumber();
               }
               else
               {
                  (_loc4_ = this.fubenProxy.data.getFubenChapterVO(_loc2_.stageInfo.chapterId).getStageById(_loc3_[_loc6_].stageId,FubenGlobals.FUBEN_MODE_UNION)).clearDto();
               }
               _loc6_++;
            }
         }
         dispatch(new Event(UnionFubenConst.UNION_ON_GET_STAGE));
      }
      
      private function onCmd_GuildFuben_SyncChapterInfo_SC(param1:SocketServiceEvent) : void
      {
         var _loc3_:Boolean = false;
         var _loc2_:Cmd_GuildFuben_SyncChapterInfo_SC = param1.socketData as Cmd_GuildFuben_SyncChapterInfo_SC;
         var _loc4_:int = 0;
         while(_loc4_ < this.chapterVec.length)
         {
            if(this.chapterVec[_loc4_].chapterId == _loc2_.chapterInfo.chapterId)
            {
               this.chapterVec[_loc4_] = _loc2_.chapterInfo;
               _loc3_ = true;
            }
            _loc4_++;
         }
         if(!_loc3_)
         {
            this.chapterVec.push(_loc2_.chapterInfo);
         }
         dispatch(new Event(UnionFubenConst.UNION_ON_SYNC_CHAPTER));
      }
      
      private function onCmd_GuildFuben_GetFormation_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_GuildFuben_GetFormation_SC = param1.socketData as Cmd_GuildFuben_GetFormation_SC;
         this.actorModel.battleCardModel.updateFormationTeams(EmbattleConst.MODE_UNION_FUBEN,_loc2_.formationInfo);
      }
      
      private function onCmd_GuildFuben_StartFight_SC(param1:SocketServiceEvent) : void
      {
         var _loc4_:Dto_FightReport = null;
         var _loc5_:int = 0;
         var _loc2_:Cmd_GuildFuben_StartFight_SC = param1.socketData as Cmd_GuildFuben_StartFight_SC;
         this.reports = _loc2_.report;
         var _loc3_:Array = [];
         if(this.reports.length > 1)
         {
            _loc5_ = 0;
            while(_loc5_ < this.reports.length)
            {
               _loc4_ = this.reports[_loc5_] as Dto_FightReport;
               _loc3_ = _loc3_.concat(_loc4_.leftSide.reward);
               _loc4_.leftSide.reward.length = 0;
               _loc5_++;
            }
            _loc4_.leftSide.reward = _loc3_;
         }
         BattleServiceCmd.setData(this.reports[0],[this.curChapterId,this.curStageId,FubenGlobals.FUBEN_MODE_UNION]);
         this.reportIndex = 1;
         UnionFubenProxyCmd.getUnionFubenStage(this.curChapterId);
      }
      
      private function onBattleFightClose(param1:Event) : void
      {
         if(param1["fightType"] == BattleTargetType.BattleTargetType_GuildFuben)
         {
            UIComponentGlobals.layoutManager.AdddDelayFuncCallOnce(this.timeOutPlayFight);
         }
      }
      
      private function timeOutPlayFight() : void
      {
         if(this.reportIndex < this.reports.length)
         {
            BattleServiceCmd.setData(this.reports[this.reportIndex],[this.curChapterId,this.curStageId,FubenGlobals.FUBEN_MODE_UNION]);
            ++this.reportIndex;
         }
      }
      
      private function onCmd_GuildFuben_DayReward_GetInfo_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_GuildFuben_NewDayReward_GetInfo_SC = param1.socketData as Cmd_GuildFuben_NewDayReward_GetInfo_SC;
         this.unionModel.resetDailyReward(_loc2_.itemId,_loc2_.historyNum,_loc2_.takenNum,_loc2_.currNum,_loc2_.maxNum);
         CommandDispatcher.send(UnionFubenConst.UNION_ON_GET_REWARD_INFO);
      }
      
      private function onCmd_GuildFuben_DayReward_Get_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_GuildFuben_NewDayReward_Get_SC = param1.socketData as Cmd_GuildFuben_NewDayReward_Get_SC;
         CommonCmd.itemFly(_loc2_.item);
         CommandDispatcher.send(UnionFubenConst.UNION_ON_TAKE_REWARD_SUCCESS);
      }
      
      public function getChapterVo(param1:uint) : Dto_GuildFuben_ChapterInfo
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.chapterVec.length)
         {
            if(this.chapterVec[_loc2_].chapterId == param1)
            {
               return this.chapterVec[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      public function canOpenChapter(param1:uint) : Boolean
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.chapterVec.length)
         {
            if(this.chapterVec[_loc2_].chapterId == param1 - 1)
            {
               return this.chapterVec[_loc2_].passChapter;
            }
            _loc2_++;
         }
         return false;
      }
      
      public function get hasOpenChapterRight() : Boolean
      {
         if(this.unionModel.playerUnionInfo.position == GuildPosition.GuildPosition_Leader || this.unionModel.playerUnionInfo.position == GuildPosition.GuildPosition_DeputyLeader)
         {
            return true;
         }
         return false;
      }
   }
}
