package com.qq.modules.td.view.game.layer
{
   import asgui.utils.WorldClock;
   import com.greensock.TweenMax;
   import com.qq.CommandName;
   import com.qq.GameGloble;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.view.BasicScreenSupportStarlingMediator;
   import com.qq.modules.guide.command.GuideCmd;
   import com.qq.modules.td.command.game.TDGameFlowCmd;
   import com.qq.modules.td.command.game.TDKeyboardCmd;
   import com.qq.modules.td.command.game.drag.TDMouseActionCmd;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.logic.TDSpecialSkillTrigger;
   import com.qq.modules.td.logic.log.TDLogCmd;
   import com.qq.modules.td.logic.log.TDLogger;
   import com.qq.modules.td.logic.process.IProcess;
   import com.qq.modules.td.logic.process.TDAddUnitDelayProcess;
   import com.qq.modules.td.logic.process.TDBehaviourTreeProcess;
   import com.qq.modules.td.logic.process.TDEffectDelayProcess;
   import com.qq.modules.td.logic.process.TDEndGameProcess;
   import com.qq.modules.td.logic.process.TDEnemyWaveProcess;
   import com.qq.modules.td.logic.process.TDGameObjectUpdateProcess;
   import com.qq.modules.td.logic.process.TDGenerateSunProcess;
   import com.qq.modules.td.logic.process.TDPathUpdateProcess;
   import com.qq.modules.td.logic.process.TDShakeEffectProcess;
   import com.qq.modules.td.logic.process.TDSunBombProcess;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.model.TDStageInfo;
   import com.qq.utils.CommandDispatcher;
   import com.qq.utils.tqos.TQOSUtils;
   import flash.events.Event;
   
   public class TDSceneMediator extends BasicScreenSupportStarlingMediator
   {
       
      
      [Inject]
      public var view:TDScene;
      
      public function TDSceneMediator()
      {
         super();
      }
      
      override protected function init() : void
      {
         super.init();
         TDGameInfo.getInstance().updateProcessList[TDGameObjectUpdateProcess.ID] = new TDGameObjectUpdateProcess();
         TDGameInfo.getInstance().updateProcessList[TDEnemyWaveProcess.ID] = new TDEnemyWaveProcess();
         TDGameInfo.getInstance().updateProcessList[TDGenerateSunProcess.ID] = new TDGenerateSunProcess();
         var _loc1_:TDShakeEffectProcess = new TDShakeEffectProcess();
         _loc1_.shakeScreen = this.view;
         TDGameInfo.getInstance().updateProcessList[TDShakeEffectProcess.ID] = _loc1_;
         TDGameInfo.getInstance().updateProcessList[TDEffectDelayProcess.ID] = new TDEffectDelayProcess();
         TDGameInfo.getInstance().updateProcessList[TDEndGameProcess.ID] = new TDEndGameProcess();
         TDGameInfo.getInstance().updateProcessList[TDBehaviourTreeProcess.ID] = new TDBehaviourTreeProcess();
         TDGameInfo.getInstance().updateProcessList[TDSunBombProcess.ID] = new TDSunBombProcess();
         if(TDStageInfo.getInstance().updatePaths != null && TDStageInfo.getInstance().updatePaths.length() > 0)
         {
            TDGameInfo.getInstance().updateProcessList[TDPathUpdateProcess.ID] = new TDPathUpdateProcess();
         }
         TDGameInfo.getInstance().updateProcessList[TDAddUnitDelayProcess.ID] = new TDAddUnitDelayProcess();
         TDLogger.getInstance().init();
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         addContextListener(CommandName.TD_InitTDView,this.onInitTDGame,CommonEvent);
         addContextListener(CommandName.TD_StartTDGame,this.onStartTDGame,CommonEvent);
         addContextListener(CommandName.TDGameEvent_RestartGame,this.onRestartGame,CommonEvent);
         addContextListener(CommandName.TD_PauseTDGame,this.onPauseGame,CommonEvent);
         addContextListener(CommandName.TD_ResumeTDGame,this.onResumeTDGame,CommonEvent);
         addContextListener(CommandName.TDGameEvent_ReviewStageMap,this.onReviewStageMap,CommonEvent);
         addContextListener(CommandName.TD_LockScreen,this.onLockScreen,CommonEvent);
         addContextListener(CommandName.TD_UnlockScreen,this.onUnlockScreen,CommonEvent);
         addContextListener(CommandName.TD_LookHouseGate,this.onLookHouseGate,CommonEvent);
         addContextListener(CommandName.TD_PlayShakeEffect,this.onPlayShakeEffect,CommonEvent);
         addContextListener(CommandName.TD_EffectDelay,this.onEffectDelay,CommonEvent);
         addContextListener(CommandName.TDGameEvent_StartInitUI,this.onStartInitUI,CommonEvent);
      }
      
      private function onEffectDelay(param1:CommonEvent) : void
      {
         var _loc2_:TDEffectDelayProcess = TDGameInfo.getInstance().updateProcessList[TDEffectDelayProcess.ID];
         _loc2_.effectsForDelay.push(param1.param);
      }
      
      override public function dispose() : void
      {
         var _loc1_:IProcess = null;
         for each(_loc1_ in TDGameInfo.getInstance().updateProcessList)
         {
            _loc1_.dispose();
         }
         TDGameInfo.getInstance().updateProcessList = new Array();
         TDKeyboardCmd.unregisterDebugKey();
         super.dispose();
      }
      
      private function onInitTDGame(param1:CommonEvent) : void
      {
         addComponentListener(this.view,Event.ENTER_FRAME,this.onEnterFrame);
      }
      
      private function onStartTDGame(param1:Event) : void
      {
         var _loc2_:IProcess = null;
         for each(_loc2_ in TDGameInfo.getInstance().updateProcessList)
         {
            _loc2_.reset();
         }
         TDSpecialSkillTrigger.getInstance().start();
         TDGameFlowCmd.startTDGame();
         TDLogCmd.startGame();
         GuideCmd.tryGuide("td_first_crop_guide");
      }
      
      private function onRestartGame(param1:Event) : void
      {
         var _loc3_:IProcess = null;
         var _loc2_:Array = TDGameInfo.getInstance().updateProcessList;
         for each(_loc3_ in TDGameInfo.getInstance().updateProcessList)
         {
            _loc3_.reset();
         }
      }
      
      private function onPauseGame(param1:Event) : void
      {
         TDGameInfo.getInstance().pauseTime();
         if(TDGameInfo.getInstance().isFinishCreateWave && TDGameInfo.getInstance().realAliveZombieNum == 0 && TDGameInfo.getInstance().aliveZombieNum > 0)
         {
            TQOSUtils.getInstance().reportMsg("TD pause on endding!");
         }
         WorldClock.clock.pause();
         TDSoundCmd.pauseAllSound();
         removeComponentListener(this.view,Event.ENTER_FRAME,this.onEnterFrame);
         TDSpecialSkillTrigger.getInstance().stop();
         TDMouseActionCmd.cleanMouseAction();
      }
      
      private function onResumeTDGame(param1:Event) : void
      {
         if(!TDGameInfo.getInstance().isPause)
         {
            return;
         }
         TDGameInfo.getInstance().resumeTime();
         WorldClock.clock.resume();
         TDSoundCmd.resumeAllSound();
         TDSpecialSkillTrigger.getInstance().start();
         addComponentListener(this.view,Event.ENTER_FRAME,this.onEnterFrame);
      }
      
      private function onEnterFrame(param1:Event) : void
      {
         if(TDGameInfo.getInstance().isPause)
         {
            return;
         }
         this.processUpdate();
      }
      
      private function processUpdate() : void
      {
         var _loc1_:IProcess = null;
         for each(_loc1_ in TDGameInfo.getInstance().updateProcessList)
         {
            _loc1_.update();
         }
      }
      
      private function onUnlockScreen(param1:Event) : void
      {
         this.view.setEnable(true);
      }
      
      private function onLockScreen(param1:Event) : void
      {
         this.view.setEnable(false);
      }
      
      private function onReviewStageMap(param1:Event) : void
      {
         var e:Event = param1;
         this.view.x = 0;
         this.view.y = 0;
         var targetX:int = -(GameGloble.groundWidth - GameGloble.TDScreenW - 100);
         TweenMax.to(this.view,1,{
            "x":targetX,
            "delay":1.5,
            "onComplete":function():void
            {
               TDGameFlowCmd.gotoChooseCard();
            }
         });
      }
      
      private function onStartInitUI(param1:CommonEvent) : void
      {
         var _loc2_:int = GameGloble.xForScene;
         TweenMax.to(this.view,1,{
            "x":_loc2_,
            "onComplete":this.onFinishInitUI
         });
      }
      
      private function onFinishInitUI() : void
      {
         TDGameFlowCmd.finishBackToWarfield();
      }
      
      private function onLookHouseGate(param1:Event) : void
      {
         var e:Event = param1;
         var targetX:int = 0;
         TweenMax.to(this.view,0.5,{
            "x":targetX,
            "onComplete":function():void
            {
               CommandDispatcher.send(CommandName.TD_TextTip_Show,{
                  "tipTextName":"TD_EndGameTipMc",
                  "nextCommandName":CommandName.TD_PopupFailWindow
               });
            }
         });
      }
      
      private function onPlayShakeEffect(param1:CommonEvent) : void
      {
         if(TDGameInfo.getInstance().isShakeScreen == 0)
         {
            if(param1.param)
            {
               TDGameInfo.getInstance().isShakeScreen = Number(param1.param);
            }
            else
            {
               TDGameInfo.getInstance().isShakeScreen = Number(1);
            }
         }
      }
   }
}
