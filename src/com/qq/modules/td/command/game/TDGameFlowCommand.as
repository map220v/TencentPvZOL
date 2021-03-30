package com.qq.modules.td.command.game
{
   import asgui.blit.bone.BlitBoneData;
   import asgui.blit.bone.BlitBoneManager;
   import asgui.blit.data.BlitDataManager;
   import asgui.blit.display.BlitDisplayContainerBatchEncoderCollectorManager;
   import asgui.core.Application;
   import asgui.managers.LoaderCollection;
   import asgui.managers.PopUpManager;
   import asgui.managers.SystemManager;
   import com.qq.CommandName;
   import com.qq.GameGloble;
   import com.qq.MyApplication;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.endlessTD.command.EndlessTDProxyCmd;
   import com.qq.modules.guidePlus.GuideContext;
   import com.qq.modules.guidePlus.command.GuideViewCmd;
   import com.qq.modules.main.command.GameFlowCmd;
   import com.qq.modules.main.command.modules.ModuleMainCmd;
   import com.qq.modules.main.model.SettingsModel;
   import com.qq.modules.sound.command.GuideSoundCmd;
   import com.qq.modules.td.command.TDProxyCmd;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.logic.TDResourceUtil;
   import com.qq.modules.td.logic.log.TDLogCmd;
   import com.qq.modules.td.logic.talent.TalentManager;
   import com.qq.modules.td.logic.trigger.TDTriggerManager;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.model.TDStageInfo;
   import com.qq.modules.td.model.TDStartParam;
   import com.qq.modules.td.model.vo.TDCardData;
   import com.qq.modules.td.view.game.layer.floor.TDFloorManager;
   import com.qq.modules.td.view.ui.TDTimeTunnelEffectView;
   import com.qq.utils.CommandDispatcher;
   import com.qq.utils.GameDataReport;
   import com.qq.utils.LoadType;
   import com.qq.utils.lua.LuaManager;
   import com.tencent.protobuf.Int64;
   import flash.geom.Point;
   import flash.utils.ByteArray;
   import org.as3commons.logging.api.getLogger;
   import org.robotlegs.extend.command.StrongRobotlegCommand;

   public class TDGameFlowCommand extends StrongRobotlegCommand
   {
      
      public static const TDGameFlowCommand:String = "TDGameFlowCommand";
       
      
      [Inject]
      public var settingsModel:SettingsModel;
      
      public function TDGameFlowCommand()
      {
         super();
      }
      
      public function restartGame() : void
      {
         CommandDispatcher.send(CommandName.TD_CleanGameSence);
         CommandDispatcher.send(CommandName.TDGameEvent_RestartGame);
         CommandDispatcher.send(CommandName.TD_InitTDGame,{"noGuide":1});
      }
      
      public function gotoGuide() : void
      {
         var _loc1_:String = TDStageInfo.getInstance().scriptCode;
         LuaManager.doString(_loc1_);
      }
      
      public function reviewStageMap() : void
      {
         CommandDispatcher.send(CommandName.TD_ResetGameInfoPanelBG);
         if(!TDStageInfo.getInstance().checkGameType(TDConstant.TDGameType_Param_isChooseCard))
         {
            TDGameFlowCmd.readyTDGame();
         }
         else
         {
            CommandDispatcher.send(CommandName.TD_LockScreen);
            CommandDispatcher.send(CommandName.TDGameEvent_ReviewStageMap);
         }
      }
      
      public function reviewStageMapWhenNotRunning() : void
      {
         if(!TDGameInfo.getInstance().isRunningGame)
         {
            this.reviewStageMap();
         }
      }
      
      public function gotoChooseCard() : void
      {
         if(!TDStageInfo.getInstance().checkGameType(TDConstant.TDGameType_Param_isChooseCard))
         {
            TDGameFlowCmd.readyTDGame();
         }
         else
         {
            CommandDispatcher.send(CommandName.TD_ProcessBar_Hide);
            if(TDStageInfo.getInstance().startParam.gameType == TDStartParam.Endless)
            {
               this.enterChoosePlantCardScreenWithEndlessTD();
            }
            else
            {
               this.enterChoosePlantCardScreen();
            }
         }
         TDGameObjectCmd.reviewZombie();
      }
      
      public function enterChoosePlantCardScreen() : void
      {
         CommandDispatcher.send(CommandName.TDGameEvent_InitChooseCardPanel);
         CommandDispatcher.send(CommandName.TDGameEvent_EnterChooseCardScreen);
      }
      
      public function finishEnterChoosePlantCardScreen() : void
      {
         CommandDispatcher.send(CommandName.TD_UnlockScreen);
      }
      
      public function loadFriendCardInfo() : void
      {
         TDProxyCmd.requestFriendCardInfo(0);
      }
      
      public function enterChooseFriendCardScreen() : void
      {
         CommandDispatcher.send(CommandName.TD_LockScreen);
         CommandDispatcher.send(CommandName.TDGameEvent_EnterChooseFriendCardScreen);
      }
      
      public function finishEnterChooseFriendCardScreen() : void
      {
         CommandDispatcher.send(CommandName.TD_UnlockScreen);
      }
      
      public function backToChooseCardScreen() : void
      {
         CommandDispatcher.send(CommandName.TD_LockScreen);
         if(TDStageInfo.getInstance().startParam.gameType == TDStartParam.Endless)
         {
            CommandDispatcher.send(CommandName.TDGameEvent_EndlessTD_BackToChooseCardScreen);
         }
         else
         {
            CommandDispatcher.send(CommandName.TDGameEvent_BackToChooseCardScreen);
         }
      }
      
      public function enterChoosePlantCardScreenWithEndlessTD() : void
      {
         CommandDispatcher.send(CommandName.TDGameEvent_InitChooseCardPanelWithEndlessTD);
         CommandDispatcher.send(CommandName.TDGameEvent_EndlessTD_EnterChooseCard);
      }
      
      public function readyTDGame() : void
      {
         var _loc1_:int = 0;
         var _loc4_:Vector.<int> = null;
         var _loc8_:TDCardData = null;
         var _loc9_:String = null;
         var _loc10_:Array = null;
         var _loc11_:Array = null;
         var _loc12_:String = null;
         var _loc2_:Vector.<String> = TDGameInfo.getInstance().loadingUrls;
         var _loc3_:Vector.<String> = new Vector.<String>();
         _loc4_ = new Vector.<int>();
         var _loc5_:Vector.<Object> = new Vector.<Object>();
         var _loc6_:Array = TDGameInfo.getInstance().normalCardsData.slotCardData
         _loc6_ = _loc6_.concat(TDGameInfo.getInstance().friendCardsData.slotCardData);
         var _loc7_:Array = new Array();
         for each(_loc8_ in _loc6_)
         {
            if(!((_loc9_ = TDResourceUtil.getResUrl(TDConstant.UnitCatalog_Plant,_loc8_.plantStaticInfo.type)) == null || _loc3_.indexOf(_loc9_) != -1))
            {
               _loc3_.push(_loc9_);
               _loc4_.push(LoadType.BLIT_BONE);
               _loc5_.push({
                  "packageID":_loc8_.plantStaticInfo.baseInfo.resFileName,
                  "resName":_loc8_.plantStaticInfo.baseInfo.resName
               });
               _loc10_ = TDResourceUtil.checkExtraRes(TDConstant.UnitCatalog_Plant,_loc8_.plantStaticInfo.type);
               for each(_loc11_ in _loc10_)
               {
                  if(!((_loc12_ = TDResourceUtil.getResUrl(_loc11_[0],_loc11_[1])) == null || _loc3_.indexOf(_loc12_) != -1))
                  {
                     _loc3_.push(_loc12_);
                     _loc4_.push(LoadType.BLIT_BONE);
                     _loc5_.push({});
                  }
               }
               _loc7_.push(_loc8_.plantStaticInfo.id);
            }
         }
         TDLogCmd.recordChoosePlant(_loc7_);
         TDGameInfo.getInstance().loadingUrls = _loc2_.concat(_loc3_).concat(TDResourceUtil.getPlantAndObjectInSceneUrls());
         _loc2_ = TDGameInfo.getInstance().loadingUrls;
         ModuleMainCmd.loadingForNextStep(_loc3_,this.readyTDGameWithoutLoading,_loc4_,_loc5_);
      }
      
      public function readyTDGameWithoutLoading(param1:Array, param2:Vector.<int> = null, param3:Vector.<Object> = null) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:String = null;
         var _loc8_:String = null;
         var _loc9_:ByteArray = null;
         var _loc10_:ByteArray = null;
         if(param1 == null)
         {
            _loc5_ = 0;
         }
         else
         {
            _loc5_ = param1.length;
         }
         _loc4_ = 0;
         while(_loc4_ < _loc5_)
         {
            _loc6_ = param2 != null ? int(param2[_loc4_]) : 0;
            switch(_loc6_)
            {
               case LoadType.TD_OBJECT:
                  _loc7_ = param3[_loc4_].packageID;
                  _loc8_ = param3[_loc4_].resName;
                  if(_loc7_.length > 1)
                  {
                     (_loc9_ = (param1[_loc4_] as LoaderCollection).data).position = 0;
                     _loc10_ = new ByteArray();
                     _loc9_.readBytes(_loc10_,0,_loc9_.length);
                  }
                  break;
            }
            _loc4_++;
         }
         BlitBoneManager.impl.clearBlitClipListPool();
         BlitDisplayContainerBatchEncoderCollectorManager.instance.ClearAndDispose();
         GameGloble.tdBlitBoneManager.clearAllBoneDataCache(0,this.checkClearBoneDataFunc);
         this.requestStartTDGame();
      }
      
      private function checkClearBoneDataFunc(param1:BlitBoneData) : Boolean
      {
         var _loc3_:int = 0;
         var _loc2_:Vector.<String> = TDGameInfo.getInstance().loadingUrls;
         _loc2_ = _loc2_.concat(TDFloorManager.instance.getResourceUrls());
         _loc2_.push(GameGloble.getGuideUrlById(2300));
         _loc2_.push(GameGloble.getGuideUrlById(2500));
         var _loc4_:int = _loc2_.length;
         while(_loc3_ < _loc4_)
         {
            if(_loc2_[_loc3_] == param1.url)
            {
               break;
            }
            _loc3_++;
         }
         var _loc5_:*;
         if(!(_loc5_ = _loc3_ != _loc4_))
         {
            _loc3_ = 0;
            while(_loc3_ < param1.bitmapDatas.length)
            {
               BlitDataManager.impl.DeleteExternalBitmapMapByKey(param1.bitmapDatas[_loc3_]);
               _loc3_++;
            }
            getLogger("td").info(":::::::::::: clear ::::::::::::" + param1.url);
            param1.Dispose();
         }
         return !_loc5_;
      }
      
      public function requestStartTDGame() : void
      {
         var _loc1_:Int64 = null;
         switch(TDStageInfo.getInstance().startParam.gameType)
         {
            case TDStartParam.Daily:
               TDProxyCmd.startDailyTDGame();
               break;
            case TDStartParam.Endless:
               if(TDGameInfo.getInstance().friendCardsData.slotCardData.length > 0)
               {
                  _loc1_ = TDGameInfo.getInstance().friendCardsData.slotCardData[0].friendInfoData.roleId;
               }
               EndlessTDProxyCmd.startEndlessTDGame(TDGameInfo.getInstance().rain.get(),_loc1_);
               break;
            case TDStartParam.Yeti:
               TDProxyCmd.startYetiTD();
               break;
            default:
               if(TDGameInfo.getInstance().friendCardsData.slotCardData.length > 0)
               {
                  _loc1_ = TDGameInfo.getInstance().friendCardsData.slotCardData[0].friendInfoData.roleId;
               }
               TDProxyCmd.requestStartTDGame(TDStageInfo.getInstance().stageID,TDStageInfo.getInstance().levelID,TDStageInfo.getInstance().subLevelID,TDStageInfo.getInstance().challengeLevelID,_loc1_);
         }
      }
      
      public function finishLoadAllTDData() : void
      {
         CommandDispatcher.send(CommandName.TDGameEnter_StartReadyTDGame);
         TDSoundCmd.stopChoosePlantMusic();
      }
      
      public function startBackToWarfield() : void
      {
         var _loc3_:TDCardData = null;
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc1_:int = 0;
         while(_loc1_ < TDGameInfo.getInstance().talentList.length)
         {
            TalentManager.instance.createTalentEffect(TDGameInfo.getInstance().talentList[_loc1_]);
            _loc1_++;
         }
         var _loc2_:Array = TDGameInfo.getInstance().friendCardsData.slotCardData;
         for each(_loc3_ in _loc2_)
         {
            _loc4_ = _loc3_.talentData;
            for each(_loc5_ in _loc4_)
            {
               TalentManager.instance.createTalentEffect(_loc5_,_loc3_.roleId);
            }
         }
         CommandDispatcher.send(CommandName.TDGameEvent_StartInitUI);
         getLogger("td").info("startBackToWarfield");
         Application.application.checkSizeDispatchTime = 100000;
      }
      
      public function finishBackToWarfield() : void
      {
         TDGameObjectCmd.removeReviewZombie();
         TDSoundCmd.readyPlant();
         CommandDispatcher.send(CommandName.TD_ShowReadyTip);
         getLogger("td").info("finishBackToWarfield");
         Application.application.checkSizeDispatchTime = 100000;
         Application.application.CheckSize();
      }
      
      public function startTDGame() : void
      {
         CommandDispatcher.send(CommandName.TDGameEvent_StartTDGame);
         CommandDispatcher.send(CommandName.TD_UnlockScreen);
         CommandDispatcher.send(CommandName.TD_ChangeSun);
         CommandDispatcher.send(CommandName.TD_ProcessBar_Init);
         TDGameInfo.getInstance().resumeTime();
         TDGameInfo.getInstance().setTDGameStart();
         TDGameInfo.getInstance().isRunningGame = true;
         TDSoundCmd.playTDMusic();
         TDKeyboardCmd.registerTDKey();
         TDTriggerManager.instance.addTriggerByString(TDStageInfo.getInstance().achievementInfo,TDGameInfo.getInstance().achievementList);
         getLogger("td").info("startTDGame");
         Application.application.checkSizeDispatchTime = 0;
         Application.application.CheckSize();
         TDGameInfo.getInstance().resetTDStartTime();
      }
      
      public function reportTDResult() : void
      {
         CommandDispatcher.send(CommandName.TD_LockScreen);
         CommandDispatcher.send(CommandName.TD_PauseTDGame);
         TDGameCmd.exitGame(TDGameInfo.getInstance().lastPassStageMsgSC);
      }
      
      public function passGuideTD() : void
      {
         CommandDispatcher.send(CommandName.TD_PauseTDGame);
         CommandDispatcher.send(CommandName.TD_PauseTDGame);
         GuideSoundCmd.timeTravel();
         var _loc1_:TDTimeTunnelEffectView = new TDTimeTunnelEffectView();
         PopUpManager.AddPopUp(_loc1_,(SystemManager.instance.application as MyApplication).topEffectLayer,true,false,new Point(0,0));
         GameFlowCmd.gotoLevelSelect();
         GameDataReport.getInstance().report(GameDataReport.Data_GuideTD_END);
         GuideViewCmd.changeContext(GuideContext.NULL);
      }
   }
}
