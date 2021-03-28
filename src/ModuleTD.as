package
{
   import asgui.blit.display.BlitDisplayContainerBatchEncoderCollectorManager;
   import asgui.core.Application;
   import com.qq.CommandName;
   import com.qq.GameGloble;
   import com.qq.display.ScreenViewContainer;
   import com.qq.modules.basic.BaseModule;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.view.MixLayer;
   import com.qq.modules.td.command.GotoTDScreen;
   import com.qq.modules.td.command.StartTDGameCommand;
   import com.qq.modules.td.command.TDCleanResCommand;
   import com.qq.modules.td.command.TDInitGameCommand;
   import com.qq.modules.td.command.TDItemCommand;
   import com.qq.modules.td.command.TDProxyCommand;
   import com.qq.modules.td.command.TDStartLoadResCommand;
   import com.qq.modules.td.command.TDStartWithNoClean;
   import com.qq.modules.td.command.debug.TDDebugCommand;
   import com.qq.modules.td.command.effects.TDEffectCommand;
   import com.qq.modules.td.command.game.TDCleanGameSenceCommand;
   import com.qq.modules.td.command.game.TDCleanTDGameResCommand;
   import com.qq.modules.td.command.game.TDExplodeCommand;
   import com.qq.modules.td.command.game.TDFireBulletCommand;
   import com.qq.modules.td.command.game.TDFloorCommand;
   import com.qq.modules.td.command.game.TDGameCommand;
   import com.qq.modules.td.command.game.TDGameFlowCommand;
   import com.qq.modules.td.command.game.TDGameObjectCommand;
   import com.qq.modules.td.command.game.TDHurtPlantCommand;
   import com.qq.modules.td.command.game.TDKeyboardCommand;
   import com.qq.modules.td.command.game.TDShowReadyTipCommand;
   import com.qq.modules.td.command.game.TDStartZombieWalkCommand;
   import com.qq.modules.td.command.game.TDTriggerCommand;
   import com.qq.modules.td.command.game.drag.TDMouseActionCommand;
   import com.qq.modules.td.command.game.effect.TDTipEffectCommand;
   import com.qq.modules.td.command.game.skill.TDSkillCommand;
   import com.qq.modules.td.command.game.sound.TDSoundCommand;
   import com.qq.modules.td.command.tips.ShowTipCommand;
   import com.qq.modules.td.command.ui.TDPopupFailWindowCommand;
   import com.qq.modules.td.command.ui.TDUICommand;
   import com.qq.modules.td.logic.TDUILayerManager;
   import com.qq.modules.td.logic.bt_ai.AINodeConstant;
   import com.qq.modules.td.logic.log.TDLogCommand;
   import com.qq.modules.td.logic.log.TDLogger;
   import com.qq.modules.td.logic.mouseAction.TDCropPlantAction;
   import com.qq.modules.td.logic.mouseAction.TDLayEnergyTileAction;
   import com.qq.modules.td.logic.mouseAction.TDReleaseAreaSkillAction;
   import com.qq.modules.td.logic.mouseAction.TDUseShovelAction;
   import com.qq.modules.td.logic.talent.TalentManager;
   import com.qq.modules.td.logic.trigger.TDTriggerManager;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.model.TDProxy;
   import com.qq.modules.td.model.TDStageInfo;
   import com.qq.modules.td.model.TDStartParam;
   import com.qq.modules.td.model.vo.TDDataVO;
   import com.qq.modules.td.view.debug.TDDebugCommandLayer;
   import com.qq.modules.td.view.debug.TDDebugCommandMediator;
   import com.qq.modules.td.view.game.TDBGView;
   import com.qq.modules.td.view.game.TDBGViewMediator;
   import com.qq.modules.td.view.game.TDTopEffectLayer;
   import com.qq.modules.td.view.game.TDTopEffectLayerMediator;
   import com.qq.modules.td.view.game.TDTopSceneLayer;
   import com.qq.modules.td.view.game.TDTopSceneLayerMediator;
   import com.qq.modules.td.view.game.TDUIPanel;
   import com.qq.modules.td.view.game.TDUIPanelMediator;
   import com.qq.modules.td.view.game.layer.TDBulletLayer;
   import com.qq.modules.td.view.game.layer.TDBulletLayerMediator;
   import com.qq.modules.td.view.game.layer.TDEffectLayer;
   import com.qq.modules.td.view.game.layer.TDEffectLayerMediator;
   import com.qq.modules.td.view.game.layer.TDGroundLayer;
   import com.qq.modules.td.view.game.layer.TDGroundLayerMediator;
   import com.qq.modules.td.view.game.layer.TDScene;
   import com.qq.modules.td.view.game.layer.TDSceneMediator;
   import com.qq.modules.td.view.game.layer.TDSkyLayer;
   import com.qq.modules.td.view.game.layer.TDSkyLayerMediator;
   import com.qq.modules.td.view.game.layer.TDUnitLayer;
   import com.qq.modules.td.view.game.layer.TDUnitLayerMediator;
   import com.qq.modules.td.view.game.ui.TDGameInfoPanel;
   import com.qq.modules.td.view.game.ui.TDGameInfoPanelMediator;
   import com.qq.modules.td.view.game.ui.TDGameTipTextMediator;
   import com.qq.modules.td.view.game.ui.TDGameTipTextView;
   import com.qq.modules.td.view.game.ui.TDProcessBar;
   import com.qq.modules.td.view.game.ui.TDProcessBarMediator;
   import com.qq.modules.td.view.game.ui.TDShovelPanel;
   import com.qq.modules.td.view.game.ui.TDShovelPanelMediator;
   import com.qq.modules.td.view.game.ui.TDSpecailSkillCastIcon;
   import com.qq.modules.td.view.game.ui.plant.TDCardSlot;
   import com.qq.modules.td.view.game.ui.plant.TDCardSlotMediator;
   import com.qq.modules.td.view.game.ui.plant.TDCardSlotPanel;
   import com.qq.modules.td.view.game.ui.plant.TDCardSlotPanelMediator;
   import com.qq.modules.td.view.game.ui.skill.TDSkillSlot;
   import com.qq.modules.td.view.game.ui.skill.TDSkillSlotMediator;
   import com.qq.modules.td.view.game.ui.skill.TDSkillSlotPanel;
   import com.qq.modules.td.view.game.ui.skill.TDSkillSlotPanelMediator;
   import com.qq.modules.td.view.loading.TDLoadMediator;
   import com.qq.modules.td.view.loading.TDLoadPage;
   import com.qq.utils.CommandDispatcher;
   import com.qq.utils.lua.LuaManager;
   import flash.events.Event;
   import org.as3commons.logging.api.getLogger;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   import tencent.tools.planMachine.PlanCacheManager;
   
   public class ModuleTD extends BaseModule
   {
       
      
      private var counter:int = 0;
      
      private var levelID:int;
      
      private var subLevelID:int;
      
      private var challengeLevelID:int;
      
      public function ModuleTD()
      {
         super();
      }
      
      override protected function init() : void
      {
         super.init();
         LuaManager.impl;
         Application.application.removeEventListener(Event.ENTER_FRAME,this.enterFrameHandler);
         registerClassSingtlonRule(TDDataVO);
         registerProxyList(TDProxy);
         registerViewClass(TDLoadPage,TDLoadMediator);
         registerViewClass(TDBGView,TDBGViewMediator);
         registerViewClass(TDUIPanel,TDUIPanelMediator);
         registerViewClass(TDScene,TDSceneMediator);
         registerViewClass(TDGroundLayer,TDGroundLayerMediator);
         registerViewClass(TDBulletLayer,TDBulletLayerMediator);
         registerViewClass(TDUnitLayer,TDUnitLayerMediator);
         registerViewClass(TDEffectLayer,TDEffectLayerMediator);
         registerViewClass(TDDebugCommandLayer,TDDebugCommandMediator);
         registerViewClass(TDGameInfoPanel,TDGameInfoPanelMediator);
         registerViewClass(TDCardSlotPanel,TDCardSlotPanelMediator);
         registerViewClass(TDCardSlot,TDCardSlotMediator);
         registerViewClass(TDSkillSlotPanel,TDSkillSlotPanelMediator);
         registerViewClass(TDSkillSlot,TDSkillSlotMediator);
         registerViewClass(TDTopEffectLayer,TDTopEffectLayerMediator);
         registerViewClass(TDTopSceneLayer,TDTopSceneLayerMediator);
         registerViewClass(TDSkyLayer,TDSkyLayerMediator);
         registerViewClass(TDProcessBar,TDProcessBarMediator);
         registerViewClass(TDGameTipTextView,TDGameTipTextMediator);
         registerViewClass(TDShovelPanel,TDShovelPanelMediator);
         registerClassSingtlonRule(TDEffectLayerMediator);
         registerClassSingtlonRule(TDCropPlantAction);
         registerClassSingtlonRule(TDUseShovelAction);
         registerClassSingtlonRule(TDReleaseAreaSkillAction);
         registerClassSingtlonRule(TDSpecailSkillCastIcon);
         registerClassSingtlonRule(TDLayEnergyTileAction);
         registerCommandList(CommandName.TD_EnterGame,StartTDGameCommand,CommonEvent);
         registerCommandList(CommandName.TD_StartLoadRes,TDStartLoadResCommand,CommonEvent);
         registerCommandList(CommandName.TD_GotoTDScreen,GotoTDScreen,CommonEvent);
         registerCommandList(CommandName.TD_StartWithNoClean,TDStartWithNoClean,CommonEvent);
         registerCommandList(CommandName.TD_InitTDGame,TDInitGameCommand,CommonEvent);
         registerCommandList(CommandName.TD_StartZombieWalk,TDStartZombieWalkCommand,CommonEvent);
         registerCommandList(CommandName.TD_CleanGameSence,TDCleanGameSenceCommand,CommonEvent);
         registerCommandList(CommandName.TD_ShowReadyTip,TDShowReadyTipCommand,CommonEvent);
         registerCommandList(CommandName.TD_PopupFailWindow,TDPopupFailWindowCommand,CommonEvent);
         registerCommandList(CommandName.TD_CleanTDGameRes,TDCleanTDGameResCommand,CommonEvent);
         registerCommandList("TDProxyCommand",TDProxyCommand,StrongRobotlegCommandEvent);
         registerCommandList(CommandName.ShowTipCommand,ShowTipCommand,StrongRobotlegCommandEvent);
         registerCommandList(CommandName.TDEffectCommand,TDEffectCommand,StrongRobotlegCommandEvent);
         registerCommandList(CommandName.TDItemCommand,TDItemCommand,StrongRobotlegCommandEvent);
         registerCommandList(CommandName.TD_CleanResCommand,TDCleanResCommand,StrongRobotlegCommandEvent);
         registerCommandList(CommandName.TDTipEffectCommand,TDTipEffectCommand,StrongRobotlegCommandEvent);
         registerCommandList(CommandName.TDSoundCommand,TDSoundCommand,StrongRobotlegCommandEvent);
         registerCommandList("TDGameCommand",TDGameCommand,StrongRobotlegCommandEvent);
         registerCommandList(CommandName.TDDebugCommand,TDDebugCommand,StrongRobotlegCommandEvent);
         registerCommandList(CommandName.TDGameObjectCommand,TDGameObjectCommand,StrongRobotlegCommandEvent);
         registerCommandList(TDKeyboardCommand.NAME,TDKeyboardCommand,StrongRobotlegCommandEvent);
         registerCommandList(TDFloorCommand.NAME,TDFloorCommand,StrongRobotlegCommandEvent);
         registerCommandList("TDUICommand",TDUICommand,StrongRobotlegCommandEvent);
         registerCommandList("TDSkillCommand",TDSkillCommand,StrongRobotlegCommandEvent);
         registerCommandList(TDMouseActionCommand.TDMouseActionCommand,TDMouseActionCommand,StrongRobotlegCommandEvent);
         registerCommandList(TDGameFlowCommand.TDGameFlowCommand,TDGameFlowCommand,StrongRobotlegCommandEvent);
         registerCommandList(CommandName.TDExplodeCommand,TDExplodeCommand,StrongRobotlegCommandEvent);
         registerCommandList(CommandName.TDFireBulletCommand,TDFireBulletCommand,StrongRobotlegCommandEvent);
         registerCommandList("TDTriggerCommand",TDTriggerCommand,StrongRobotlegCommandEvent);
         registerCommandList("TDHurtPlantCommand",TDHurtPlantCommand,StrongRobotlegCommandEvent);
         registerCommandList("TDLogCommand",TDLogCommand,StrongRobotlegCommandEvent);
         this.registerAIClass();
      }
      
      private function registerAIClass() : void
      {
         new AINodeConstant();
      }
      
      override public function set data(param1:Object) : void
      {
         super.data = param1;
         if(param1 as Array == null && (param1 as Array).length == 0)
         {
            getLogger("td").info("no send CommandName.TD_EnterGame  value is NULL");
            return;
         }
         var _loc2_:TDStartParam = (param1 as Array)[0] as TDStartParam;
         if(_loc2_ != null)
         {
            getLogger("td").info("send CommandName.TD_EnterGame");
            CommandDispatcher.send(CommandName.TD_EnterGame,{"startParam":_loc2_});
         }
         else
         {
            getLogger("td").info("no send CommandName.TD_EnterGame  value[0] is not TDStartParam");
         }
      }
      
      override public function Unload() : void
      {
         BlitDisplayContainerBatchEncoderCollectorManager.instance.ClearAndDispose();
         PlanCacheManager.removeAllCachePlan();
         TDUILayerManager.clean();
         MixLayer.cleanAllNeedClearedRes();
         CommandDispatcher.send(CommandName.TD_CleanTDGameRes);
         GameGloble.disposeResizeHelper();
         TDLogger.dispose();
         this.levelID = TDStageInfo.getInstance().levelID;
         this.subLevelID = TDStageInfo.getInstance().subLevelID;
         this.challengeLevelID = TDStageInfo.getInstance().challengeLevelID;
         this.counter = 0;
         Application.application.addEventListener(Event.ENTER_FRAME,this.enterFrameHandler);
         while(ScreenViewContainer.getInstance().bglayer.numChildren > 0)
         {
            ScreenViewContainer.getInstance().bglayer.removeChildAt(0);
         }
         super.Unload();
      }
      
      private function enterFrameHandler(param1:Event) : void
      {
         if(++this.counter > 10)
         {
            Application.application.removeEventListener(Event.ENTER_FRAME,this.enterFrameHandler);
            this.counter = 0;
            this.unloadDelay(this.levelID,this.subLevelID,this.challengeLevelID);
         }
      }
      
      public function unloadDelay(param1:int, param2:int, param3:int) : void
      {
         TDGameInfo.dispose(param1,param2,param3);
         TDStageInfo.dispose(param1,param2,param3);
         TalentManager.disposeInstance();
         TDTriggerManager.disposeInstance();
         this.counter = 0;
      }
   }
}
