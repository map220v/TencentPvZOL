package com.qq.modules.td.command.game
{
   import PVZ.Cmd.Dto_DailyTDInfo;
   import asgui.controls.Alert;
   import asgui.events.CloseEvent;
   import asgui.managers.PopUpManager;
   import asgui.utils.StringUtil;
   import com.qq.CommandName;
   import com.qq.GameGloble;
   import com.qq.constant.QuickPayType;
   import com.qq.constant.td.TDChallengeScoreType;
   import com.qq.constant.td.TDConstant;
   import com.qq.constant.td.TDObjTypeID;
   import com.qq.display.QAlert;
   import com.qq.modules.basic.model.templates.ServerConfigTemplateFactory;
   import com.qq.modules.dailyTD.command.DailyTdProxyCmd;
   import com.qq.modules.dailyTD.command.DailyTdViewCmd;
   import com.qq.modules.endlessTD.command.EndlessTDProxyCmd;
   import com.qq.modules.endlessTD.command.EndlessTDViewCmd;
   import com.qq.modules.guide.command.GuideCmd;
   import com.qq.modules.levelselect.model.LSProxy;
   import com.qq.modules.levelselect.model.vo.LSLevelInfoVO;
   import com.qq.modules.main.command.CommonCmd;
   import com.qq.modules.main.command.GameFlowCmd;
   import com.qq.modules.main.command.TQOSCmd;
   import com.qq.modules.main.service.ShortcutPayProxy;
   import com.qq.modules.td.command.TDProxyCmd;
   import com.qq.modules.td.command.game.drag.TDMouseActionCmd;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.logic.TDChallengeScoreManager;
   import com.qq.modules.td.logic.TDSpecialSkillTrigger;
   import com.qq.modules.td.logic.log.TDLogCmd;
   import com.qq.modules.td.logic.log.TDLogger;
   import com.qq.modules.td.logic.numeric.TDDamageCaculete;
   import com.qq.modules.td.logic.trigger.TDTrigConst;
   import com.qq.modules.td.logic.trigger.events.TriggerEvent;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.logic.unit.plant.BasicPlant;
   import com.qq.modules.td.logic.unit.zombie.BasicZombie;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.model.TDStageInfo;
   import com.qq.modules.td.model.TDStartParam;
   import com.qq.modules.td.view.components.TDInstrustationWindow;
   import com.qq.modules.yetiTD.command.YetiTDProxyCmd;
   import com.qq.modules.yetiTD.command.YetiTDViewCmd;
   import com.qq.net.IdleMessageSendManager;
   import com.qq.templates.font.FontHKHB;
   import com.qq.templates.font.FontNormal;
   import com.qq.utils.CommandDispatcher;
   import com.qq.utils.DateUtils;
   import org.as3commons.logging.api.getLogger;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   
   public class TDGameCommand extends StrongRobotlegCommand
   {
       
      
      [Inject]
      public var lsProxy:LSProxy;
      
      [Inject]
      public var shortcutProxy:ShortcutPayProxy;
      
      public function TDGameCommand()
      {
         super();
      }
      
      public function finishGame(param1:int) : void
      {
         TDGameInfo.getInstance().finalResult = param1;
         this.cleanGameDataForFinish();
         if(TDGameInfo.getInstance().finalResult == 1)
         {
            IdleMessageSendManager.getInstance().sendIdle();
            GameGloble.isTDNeedUpdateTime = true;
         }
         else
         {
            this.reportTDResult();
         }
      }
      
      private function cleanGameDataForFinish() : void
      {
         var _loc2_:IGameObject = null;
         var _loc3_:Array = null;
         var _loc4_:* = null;
         TDMouseActionCmd.cleanMouseAction();
         TDGameInfo.getInstance().isRunningGame = false;
         var _loc1_:Array = TDGameInfo.getInstance().getGameObjectMapByCatalg(TDConstant.UnitCatalog_Plant);
         for each(_loc2_ in _loc1_)
         {
            _loc3_ = _loc2_.getAllActionIDList();
            for(_loc4_ in _loc3_)
            {
               if(_loc4_.toLocaleLowerCase().indexOf("idle") != -1)
               {
                  _loc2_.setAction(_loc4_);
                  break;
               }
            }
         }
         TDSpecialSkillTrigger.getInstance().stop();
      }
      
      public function reportTDResult() : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Dto_DailyTDInfo = null;
         var _loc1_:int = TDGameInfo.getInstance().finalResult;
         if(_loc1_ == 1)
         {
            _loc2_ = DateUtils.getInstance().getServerTime();
            _loc3_ = _loc2_ - TDGameInfo.tdStartTime;
            if((_loc4_ = (_loc4_ = Math.abs(_loc3_ - TDGameInfo.getInstance().getRealPassTime())) / _loc3_) > 5)
            {
               this.reportCheatGame();
               return;
            }
         }
         switch(TDStageInfo.getInstance().startParam.gameType)
         {
            case TDStartParam.Daily:
               (_loc5_ = new Dto_DailyTDInfo()).stageId = TDStageInfo.getInstance().startParam.dailyStageID;
               _loc5_.iEnergyBean = TDGameInfo.getInstance().fuel.get();
               _loc5_.carList = TDGameInfo.getInstance().getLeftToyCarInfo();
               DailyTdProxyCmd.reportDailyTDResult(TDStageInfo.getInstance().startParam.dailyStageID,_loc1_,_loc5_,TDLogger.getInstance().getLog(),false);
               break;
            case TDStartParam.Endless:
               EndlessTDProxyCmd.reportResult(_loc1_,TDGameInfo.getInstance().endlessScore.get(),TDLogger.getInstance().getLog(),false);
               break;
            case TDStartParam.Yeti:
               YetiTDProxyCmd.reportResult(_loc1_,TDGameInfo.getInstance().yetiKillNum,TDLogger.getInstance().getLog(),false);
               break;
            default:
               TDProxyCmd.finishLevel(TDStageInfo.getInstance().levelID,TDStageInfo.getInstance().subLevelID,TDStageInfo.getInstance().challengeLevelID,TDStageInfo.getInstance().challengeScore.get(),_loc1_,TDGameInfo.getInstance().newAchievement,false);
         }
         TQOSCmd.report_TD_performence(TDStageInfo.getInstance().stageID,TDStageInfo.getInstance().levelID,TDStageInfo.getInstance().subLevelID,TDStageInfo.getInstance().challengeLevelID,TDGameInfo.statistics_totalFrame,TDGameInfo.statistics_totalTime);
      }
      
      public function winGame() : void
      {
         this.finishGame(1);
         getLogger("TD").debug("塔防胜利");
      }
      
      public function failGame() : void
      {
         this.finishGame(0);
         TDSoundCmd.lose();
         getLogger("TD").debug("塔防失败");
         CommandDispatcher.send(CommandName.TD_LockScreen);
         CommandDispatcher.send(CommandName.TD_HideGameInfoPanel);
         CommandDispatcher.send(CommandName.TD_ProcessBar_Hide);
         CommandDispatcher.send(CommandName.TD_LookHouseGate);
      }
      
      public function ImmediatelyWinGame() : void
      {
         var _loc2_:BasicZombie = null;
         TDGameInfo.getInstance().isFinishCreateWave = true;
         var _loc1_:Array = TDGameInfo.getInstance().getZombieList(null,TDConstant.TDCamp_Enemy,true,true);
         for each(_loc2_ in _loc1_)
         {
            TDDamageCaculete.executeDamage(_loc2_,-(_loc2_.objectModel.maxHp.get() + _loc2_.zombieData.getAllArmorMaxHp()),TDConstant.AttackType_Normal,TDConstant.AttackMode_Normal,_loc2_);
         }
      }
      
      public function isStopCheckEndTDGame(param1:Boolean) : void
      {
         TDGameInfo.getInstance().isStopCheckEndGame = param1;
      }
      
      public function playerPauseGame() : void
      {
         var closeHandler:Function = null;
         closeHandler = function(param1:CloseEvent):void
         {
            playerResumeGame();
         };
         CommandDispatcher.send(CommandName.TD_PauseTDGame);
         Alert.okLabel = FontHKHB.TXT_BackGame;
         QAlert.Show("Game is paused.","",Alert.YES,null,closeHandler,FontHKHB.TXT_BackGame);
         TDSoundCmd.playerPauseGame();
      }
      
      public function playerResumeGame() : void
      {
         CommandDispatcher.send(CommandName.TD_ResumeTDGame);
      }
      
      public function playerRestartGame() : void
      {
         CommandDispatcher.send(CommandName.TD_PauseTDGame);
         switch(TDStageInfo.getInstance().startParam.gameType)
         {
            case TDStartParam.Daily:
               DailyTdViewCmd.dailyTDRestartGame(TDGameInfo.getInstance().isRunningGame);
               break;
            case TDStartParam.Yeti:
               YetiTDViewCmd.yetiTDRestartGame(TDGameInfo.getInstance().isRunningGame);
               break;
            default:
               if(TDStageInfo.getInstance().challengeLevelID > 0)
               {
                  this.challengeRestartGame();
               }
               else
               {
                  this.noramlRestartGame();
               }
         }
      }
      
      private function challengeRestartGame() : void
      {
         var content:String = null;
         var closeHandler:Function = null;
         var vo:LSLevelInfoVO = null;
         closeHandler = function(param1:CloseEvent):void
         {
            if(param1.detail == Alert.YES || param1.detail == Alert.OK)
            {
               TDGameFlowCmd.restartGame();
            }
            else
            {
               playerResumeGame();
            }
         };
         if(TDGameInfo.getInstance().isRunningGame)
         {
            vo = this.lsProxy.getChallengeLevelInfo(TDStageInfo.getInstance().levelID,TDStageInfo.getInstance().subLevelID,TDStageInfo.getInstance().challengeLevelID);
            if(vo.remainFreeChallengeTimes + vo.remainPayChallengeTimes == 0)
            {
               content = FontNormal.Td_Str_DaiylTD_Restart_NoTimes;
               QAlert.Show(content,"",Alert.OK,null,function(param1:CloseEvent):void
               {
                  playerResumeGame();
               });
               return;
            }
            if(vo.remainPayChallengeTimes > 0)
            {
               if(!this.shortcutProxy.getFlag(QuickPayType.BUY_TD))
               {
                  CommonCmd.confirmUseDiamond(FontNormal.TD_BUY_CHALLENGE_TIMES,ServerConfigTemplateFactory.instance.iChallengeCost,function():void
                  {
                     TDGameFlowCmd.restartGame();
                  },function():void
                  {
                     playerResumeGame();
                  },0,true);
               }
               else
               {
                  this.playerResumeGame();
               }
               return;
            }
            content = StringUtil.substitute(FontNormal.TD_Str_DailyTD_Restart_Tip,vo.remainFreeChallengeTimes + vo.remainPayChallengeTimes - 1);
         }
         else
         {
            content = FontNormal.TD_Str_Noraml_Restart_Tip;
         }
         QAlert.Show(content,"",Alert.OK | Alert.CANCEL,null,closeHandler);
      }
      
      private function noramlRestartGame() : void
      {
         var closeHandler:Function = null;
         closeHandler = function(param1:CloseEvent):void
         {
            if(param1.detail == Alert.YES)
            {
               TDGameFlowCmd.restartGame();
            }
            else
            {
               playerResumeGame();
            }
         };
         QAlert.Show(FontNormal.TD_Str_Noraml_Restart_Tip,"",Alert.YES | Alert.NO,null,closeHandler);
      }
      
      public function playerExitGame() : void
      {
         CommandDispatcher.send(CommandName.TD_PauseTDGame);
         switch(TDStageInfo.getInstance().startParam.gameType)
         {
            case TDStartParam.Daily:
               DailyTdViewCmd.dailyTDPlayerGameExit(TDGameInfo.getInstance().isRunningGame);
               break;
            case TDStartParam.Endless:
               EndlessTDViewCmd.exitGame();
               break;
            case TDStartParam.Yeti:
               YetiTDViewCmd.yetiTDPlayerGameExit(TDGameInfo.getInstance().isRunningGame);
               break;
            default:
               if(GameGloble.isGuildTD(TDStageInfo.getInstance().stageID))
               {
                  this.guidePlayerGameExit();
               }
               else if(TDStageInfo.getInstance().challengeLevelID > 0)
               {
                  this.challengeGameExit();
               }
               else
               {
                  this.normalPlayerGameExit();
               }
         }
      }
      
      private function challengeGameExit() : void
      {
         var content:String = null;
         var closeHandler:Function = null;
         closeHandler = function(param1:CloseEvent):void
         {
            if(param1.detail == Alert.YES || param1.detail == Alert.OK)
            {
               TDGameCmd.exitGame();
            }
            else
            {
               TDGameCmd.playerResumeGame();
            }
         };
         if(TDGameInfo.getInstance().isRunningGame)
         {
            content = FontNormal.TD_Str_Exit_Tip;
         }
         else
         {
            content = FontNormal.TD_Str_Exit_Tip;
         }
         QAlert.Show(content,"",Alert.OK | Alert.CANCEL,null,closeHandler);
      }
      
      private function normalPlayerGameExit() : void
      {
         var closeHandler:Function = null;
         closeHandler = function(param1:CloseEvent):void
         {
            if(param1.detail == Alert.YES || param1.detail == Alert.OK)
            {
               exitGame();
            }
            else
            {
               playerResumeGame();
            }
         };
         QAlert.Show(FontNormal.TD_Str_Exit_Tip,"",Alert.OK | Alert.CANCEL,null,closeHandler);
      }
      
      private function guidePlayerGameExit() : void
      {
         var closeHandler:Function = null;
         closeHandler = function(param1:CloseEvent):void
         {
            if(param1.detail == Alert.YES || param1.detail == Alert.OK)
            {
               exitGame();
            }
            else
            {
               playerResumeGame();
            }
         };
         QAlert.Show(FontNormal.TD_Str_Guide_Level_Exit_Tip,"",Alert.OK | Alert.CANCEL,null,closeHandler);
      }
      
      public function pauseGame() : void
      {
         CommandDispatcher.send(CommandName.TD_PauseTDGame);
      }
      
      public function resumeGame() : void
      {
         CommandDispatcher.send(CommandName.TD_ResumeTDGame);
      }
      
      public function exitGame(param1:Object = null) : void
      {
         switch(TDStageInfo.getInstance().startParam.gameType)
         {
            case TDStartParam.Daily:
               GameFlowCmd.gotoCity();
               DailyTdViewCmd.showMainPanel();
               break;
            case TDStartParam.Endless:
               GameFlowCmd.gotoEndlessTD();
               break;
            case TDStartParam.Yeti:
               GameFlowCmd.gotoCity();
               break;
            default:
               if(GameGloble.isGuildTD(TDStageInfo.getInstance().stageID))
               {
                  TDGameFlowCmd.passGuideTD();
               }
               else
               {
                  GameFlowCmd.gotoLevelSelect(param1);
               }
         }
      }
      
      public function changeSun(param1:int) : void
      {
         TDGameInfo.getInstance().sun.set(TDGameInfo.getInstance().sun.get() + param1);
         if(param1 > 0)
         {
            CommandDispatcher._dispatcher.dispatchEvent(new TriggerEvent(TDTrigConst.TYPE_COLLECT_SUN,[param1]));
         }
         CommandDispatcher.send(CommandName.TD_ChangeSun);
         CommandDispatcher.send(CommandName.TD_ChangeSunEvent,{"changeValue":param1});
         if(param1 > 0)
         {
            TDChallengeScoreManager.instance.addScoreByType(TDChallengeScoreType.Collect_Sun,param1);
         }
         if(TDGameInfo.getInstance().maxReachedSun < TDGameInfo.getInstance().sun.get())
         {
            TDGameInfo.getInstance().maxReachedSun = TDGameInfo.getInstance().sun.get();
            if(TDGameInfo.getInstance().maxReachedSun % 25 == 0)
            {
               GuideCmd.tryGuide("td_first_sunto_" + TDGameInfo.getInstance().maxReachedSun);
            }
         }
         TDLogCmd.changeSun(param1,TDGameInfo.getInstance().sun.get());
      }
      
      public function changeFuel(param1:int) : void
      {
         var _loc2_:int = TDGameInfo.getInstance().fuel.get();
         var _loc3_:int = _loc2_ + param1;
         _loc3_ = Math.min(TDStageInfo.getInstance().fuelMax.get(),_loc3_);
         TDGameInfo.getInstance().fuel.set(_loc3_);
         CommandDispatcher.send(CommandName.TD_ChangeFuel);
         TDLogCmd.changeFuel(param1,_loc3_);
      }
      
      public function changeRain(param1:int) : void
      {
         TDGameInfo.getInstance().rain.set(TDGameInfo.getInstance().rain.get() + param1);
         CommandDispatcher.send(CommandName.TD_ChangeRain);
      }
      
      public function setRain(param1:int) : void
      {
         TDGameInfo.getInstance().rain.set(param1);
         CommandDispatcher.send(CommandName.TD_ChangeRain);
      }
      
      public function changeEndlessScore(param1:int) : void
      {
         TDGameInfo.getInstance().endlessScore.set(TDGameInfo.getInstance().endlessScore.get() + param1);
         CommandDispatcher.send(CommandName.TD_ChangeEndlessScore);
      }
      
      public function addTrackCard(param1:int) : void
      {
         CommandDispatcher.send(CommandName.TD_AddTrackCard,param1);
      }
      
      public function reportCheatGame() : void
      {
         var closeHandler:Function = null;
         closeHandler = function(param1:CloseEvent):void
         {
            if(param1.detail == Alert.OK)
            {
               exitGame();
            }
         };
         TDLogCmd.doubleCheckError();
         this.cleanGameDataForFinish();
         getLogger("TD").debug("强制结束游戏");
         QAlert.Show(FontNormal.TD_Str_ForceStopGame_Tip,"",Alert.OK,null,closeHandler);
      }
      
      public function copyTDDataForEndlessTD() : void
      {
         var _loc3_:BasicPlant = null;
         var _loc4_:Array = null;
         var _loc5_:Array = null;
         var _loc6_:IGameObject = null;
         var _loc1_:Array = TDGameInfo.getInstance().getGameObjectMapByCatalg(TDConstant.UnitCatalog_Plant);
         var _loc2_:Array = [];
         for each(_loc3_ in _loc1_)
         {
            _loc2_.push({
               "plantID":_loc3_.plantData.unitType,
               "tileIndex":_loc3_.plantData.tileIndex,
               "currentHP":_loc3_.plantData.curHp.get()
            });
         }
         _loc4_ = TDGameInfo.getInstance().getGameObjectMapByCatalgAndType(TDConstant.UnitCatalog_Object,TDObjTypeID.Obj_PowerTile5);
         _loc5_ = [];
         for each(_loc6_ in _loc4_)
         {
            _loc5_.push({
               "tileType":_loc6_.objectModel.unitType,
               "tileIndex":_loc6_.objectModel.tileIndex
            });
         }
         EndlessTDProxyCmd.copyData(_loc2_,_loc5_,TDGameInfo.getInstance().endlessScore.get(),TDGameInfo.getInstance().sun.get(),TDGameInfo.getInstance().fuel.get());
      }
      
      public function showInstrustation(param1:int, param2:int) : void
      {
         var _loc3_:TDInstrustationWindow = new TDInstrustationWindow();
         PopUpManager.AddPopUp(_loc3_,null,true);
         _loc3_.reset({
            "type":param1,
            "id":param2
         });
         TDGameCmd.pauseGame();
      }
   }
}
