package com.qq.modules.fuben.model
{
   import PVZ.Cmd.BattleTargetType;
   import PVZ.Cmd.Cmd_Battle_Fight_SC;
   import PVZ.Cmd.Cmd_Fuben_GetChapterInfo_SC;
   import PVZ.Cmd.Cmd_Fuben_GetStageInfo_SC;
   import PVZ.Cmd.Cmd_Fuben_RequestRewardBox_SC;
   import PVZ.Cmd.Cmd_Fuben_Sweep_SC;
   import PVZ.Cmd.Cmd_Fuben_SyncStageInfo_SC;
   import PVZ.Cmd.Dto_ItemInfo;
   import com.qq.CommandName;
   import com.qq.GameGloble;
   import com.qq.SceneCenter;
   import com.qq.constant.SceneName;
   import com.qq.modules.bag.model.vo.ItemVO;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.modle.BasicProxy;
   import com.qq.modules.battle.command.BattleServiceCmd;
   import com.qq.modules.fuben.FubenGlobals;
   import com.qq.modules.fuben.command.FubenProxyCmd;
   import com.qq.modules.fuben.command.FubenViewCmd;
   import com.qq.modules.fuben.model.vo.FubenChapterVO;
   import com.qq.modules.fuben.model.vo.FubenStageVO;
   import com.qq.modules.guide.command.GuideCmd;
   import com.qq.modules.main.command.CommonCmd;
   import flash.events.Event;
   import flash.utils.Dictionary;
   import org.as3commons.logging.api.getLogger;
   import tencent.io.service.events.SocketServiceEvent;
   
   public class FubenProxy extends BasicProxy
   {
       
      
      private var msgCacheList:Array;
      
      private var _viewChapterId:int = 1;
      
      private var _viewModeId:int = 1;
      
      private var m_data:FubenData;
      
      private var m_hasFirstInfo:Boolean;
      
      private var m_initMap:Dictionary;
      
      public var sweepChapterId:uint;
      
      public var sweepStageId:uint;
      
      public var sweepModelId:uint;
      
      public var curStage:FubenStageVO;
      
      public function FubenProxy()
      {
         this.msgCacheList = [];
         super();
      }
      
      public function get data() : FubenData
      {
         if(this.m_data == null)
         {
            this.m_data = new FubenData();
         }
         return this.m_data;
      }
      
      public function getViewChapterId() : int
      {
         return this._viewChapterId;
      }
      
      public function getViewModeId() : int
      {
         return this._viewModeId;
      }
      
      public function setViewChapter(param1:int, param2:int) : void
      {
         this._viewChapterId = param1;
         this._viewModeId = param2;
         this.dispatch(new CommonEvent(FubenGlobals.FUBEN_VIEW_CHAPTER_SWITCHED));
      }
      
      public function getViewChapter() : FubenChapterVO
      {
         return this.data.getFubenChapterVO(this.getViewChapterId());
      }
      
      override public function init(param1:Array = null) : void
      {
         super.init();
      }
      
      override public function listMsgInterests() : Array
      {
         return [[Cmd_Fuben_GetChapterInfo_SC.$MessageID,this.onCmd_Fuben_GetChapterInfo_SC],[Cmd_Fuben_GetStageInfo_SC.$MessageID,this.onCmd_Fuben_GetStageInfo_SC],[Cmd_Fuben_SyncStageInfo_SC.$MessageID,this.onCmd_Fuben_SyncStageInfo_SC],[Cmd_Fuben_Sweep_SC.$MessageID,this.onCmd_Fuben_Sweep_SC],[Cmd_Fuben_RequestRewardBox_SC.$MessageID,this.onCmd_Fuben_RequestRewardBox_SC],[Cmd_Battle_Fight_SC.$MessageID,this.onBattleFightHandler]];
      }
      
      private function onCmd_Fuben_GetChapterInfo_SC(param1:SocketServiceEvent) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:FubenChapterVO = null;
         var _loc2_:Cmd_Fuben_GetChapterInfo_SC = param1.socketData as Cmd_Fuben_GetChapterInfo_SC;
         this.data.loadCmd_Fuben_GetChapterInfo_SC(_loc2_);
         this.m_hasFirstInfo = true;
         if(SceneCenter.getInstance().currentScene == SceneName.fuben)
         {
            if(FubenGlobals.TEMP_FIGHT_CHAPTER != 0)
            {
               _loc3_ = FubenGlobals.TEMP_FIGHT_CHAPTER;
               _loc4_ = FubenGlobals.TEMP_FIGHT_MODE;
               FubenGlobals.TEMP_FIGHT_CHAPTER = 0;
            }
            else if(FubenGlobals.LAST_FIGHT_CHAPTER != 0)
            {
               _loc3_ = FubenGlobals.LAST_FIGHT_CHAPTER;
               _loc4_ = FubenGlobals.LAST_FIGHT_MODE;
               if(!FubenGlobals.IS_AGAIN_FIGHT)
               {
                  FubenGlobals.LAST_FIGHT_CHAPTER = 0;
               }
               else
               {
                  FubenGlobals.IS_AGAIN_FIGHT = false;
               }
            }
            else
            {
               _loc3_ = (_loc5_ = this.data.getLastUnlockedFubenStageVo()).chapterId;
               _loc4_ = FubenGlobals.FUBEN_MODE_NORMAL;
            }
            FubenGlobals.NEED_ENTER_CHAPTER = _loc3_;
            FubenGlobals.NEED_ENTER_MODE = _loc4_;
            FubenViewCmd.setChapter(FubenGlobals.NEED_ENTER_CHAPTER,FubenGlobals.NEED_ENTER_MODE);
            GuideCmd.checkProgressGuide(SceneName.fuben);
         }
         this.dispatch(new CommonEvent(FubenGlobals.FUBEN_MAPS_UPDATED));
      }
      
      private function onCmd_Fuben_GetStageInfo_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_Fuben_GetStageInfo_SC = param1.socketData as Cmd_Fuben_GetStageInfo_SC;
         var _loc3_:String = this.data.loadCmd_Fuben_GetStageInfo_SC(_loc2_);
         this.dispatch(new CommonEvent(FubenGlobals.FUBEN_CHAPTER_UPDATED,_loc3_));
      }
      
      public function get hasFirstInfo() : Boolean
      {
         return this.m_hasFirstInfo;
      }
      
      private function onCmd_Fuben_SyncStageInfo_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_Fuben_SyncStageInfo_SC = param1.socketData as Cmd_Fuben_SyncStageInfo_SC;
         this.msgCacheList.push(_loc2_);
      }
      
      private function doLoadCmd_Fuben_SyncStageInfo_SC(param1:Cmd_Fuben_SyncStageInfo_SC) : void
      {
         var _loc2_:Cmd_Fuben_SyncStageInfo_SC = param1 as Cmd_Fuben_SyncStageInfo_SC;
         var _loc3_:FubenStageVO = this.data.loadCmd_Fuben_SyncStageInfo_SC(_loc2_);
         var _loc4_:FubenChapterVO = this.data.getFubenChapterVO(_loc2_.stageinfo.chapterid);
         this.dispatch(new CommonEvent(FubenGlobals.FUBEN_STAGE_NEW_OPEN,_loc3_));
      }
      
      private function onCmd_Fuben_RequestRewardBox_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_Fuben_RequestRewardBox_SC = null;
         var _loc3_:FubenChapterVO = null;
         var _loc4_:ItemVO = null;
         var _loc5_:Dto_ItemInfo = null;
         if(param1.retCode == 0)
         {
            _loc2_ = param1.socketData as Cmd_Fuben_RequestRewardBox_SC;
            _loc3_ = this.data.getFubenChapterVO(_loc2_.chapterid);
            _loc3_.setTakenReward(_loc2_.mode,true);
            _loc4_ = _loc3_.template.getBonusTemplate(_loc2_.mode).getBonusItem();
            (_loc5_ = new Dto_ItemInfo()).id = _loc4_.itemId;
            _loc5_.num = _loc4_.amount;
            CommonCmd.itemFly([_loc5_]);
            this.dispatch(new CommonEvent(FubenGlobals.FUBEN_CHEST_OPENED));
         }
      }
      
      public function onCmd_Fuben_Sweep_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_Fuben_Sweep_SC = null;
         if(param1.retCode == 0)
         {
            _loc2_ = param1.socketData as Cmd_Fuben_Sweep_SC;
            this.data.fubenSweepList = _loc2_.result;
            dispatch(new Event(CommandName.FUBEN_SWEEP_BACK));
         }
      }
      
      public function onBattleFightHandler(param1:SocketServiceEvent) : void
      {
         getLogger().debug("begin to fight !!!");
         var _loc2_:Cmd_Battle_Fight_SC = param1.socketData as Cmd_Battle_Fight_SC;
         if(_loc2_.report.fightType == BattleTargetType.BattleTargetType_Fuben)
         {
            BattleServiceCmd.setData(_loc2_.report,[this.curStage.template.chapterId,this.curStage.template.mode,this.curStage.template.stageId],FubenProxyCmd.againStartFight);
            GameGloble.actorModel.battleCardModel.defaultFormationVo.removeHelpCard();
         }
      }
      
      public function popMsgCacheList() : void
      {
         var _loc2_:Object = null;
         var _loc1_:* = this.msgCacheList.length > 0;
         while(this.msgCacheList.length > 0)
         {
            _loc2_ = this.msgCacheList.shift();
            if(_loc2_ is Cmd_Fuben_SyncStageInfo_SC)
            {
               this.doLoadCmd_Fuben_SyncStageInfo_SC(_loc2_ as Cmd_Fuben_SyncStageInfo_SC);
            }
         }
         if(_loc1_)
         {
            FubenProxyCmd.requestMapInfo();
         }
      }
   }
}
