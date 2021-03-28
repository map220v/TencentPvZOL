package com.qq.modules.td.command
{
   import asgui.utils.WorldClock;
   import com.qq.CommandName;
   import com.qq.GameGloble;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.basic.command.BasicCommand;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.guide.command.GuideCmd;
   import com.qq.modules.td.command.debug.TDDebugCmd;
   import com.qq.modules.td.command.game.TDGameFlowCmd;
   import com.qq.modules.td.command.game.TDGameObjectCmd;
   import com.qq.modules.td.command.game.TDKeyboardCmd;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.data.GlobelProtectValue;
   import com.qq.modules.td.logic.log.TDLogger;
   import com.qq.modules.td.logic.trigger.TDTriggerManager;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.model.TDStageInfo;
   import com.qq.modules.td.model.TDStartParam;
   import com.qq.modules.td.model.vo.TDCardData;
   import com.qq.utils.CommandDispatcher;
   import com.qq.utils.data.PDataKeyManager;
   import com.qq.utils.lua.LuaManager;
   
   public class TDInitGameCommand extends BasicCommand
   {
       
      
      [Inject]
      public var event:CommonEvent;
      
      public function TDInitGameCommand()
      {
         super();
      }
      
      override public function execute() : void
      {
         var _loc2_:Array = null;
         var _loc3_:TDCardData = null;
         var _loc4_:int = 0;
         GlobelProtectValue.getInstance().set(GlobelProtectValue.KEY_FIGHTPOWER,GameGloble.actorModel.actorFightPower);
         GlobelProtectValue.getInstance().set(GlobelProtectValue.KEY_VALUE_1,1);
         GlobelProtectValue.getInstance().set(GlobelProtectValue.KEY_VALUE_001,0.01);
         this.initGround();
         CommandDispatcher.send(CommandName.TD_InitTDView);
         TDGameInfo.getInstance().reset(TDStageInfo.getInstance().sun.get(),GameGloble.actorModel.roleId);
         if(TDStageInfo.getInstance().startParam.gameType == TDStartParam.Endless || TDStageInfo.getInstance().startParam.gameType == TDStartParam.Normal || TDStageInfo.getInstance().startParam.gameType == TDStartParam.Daily)
         {
            _loc2_ = [TDConstant.PlantType_Cherrybomb,TDConstant.PlantType_Jalapeno,TDConstant.PlantType_icebean];
            for each(_loc4_ in _loc2_)
            {
               _loc3_ = new TDCardData(GameGloble.actorModel.getUnlockPlant(_loc4_));
               TDGameInfo.getInstance().skillCardsData.addCardToSlot(_loc3_);
            }
            CommandDispatcher.send(CommandName.TD_Init_SkillCardSlot_UI);
         }
         var _loc1_:Boolean = this.event.hasCustmeParam("noGuide");
         TDTriggerManager.instance.reset();
         GuideCmd.unregisterGuidesWithoutInitcode();
         PDataKeyManager.getInstance().generateNewKey();
         TDLogger.getInstance().reset();
         TDSoundCmd.playChoosePlantMusic();
         if(!TDGameInfo.getInstance().startImmediately)
         {
            if(TDStageInfo.getInstance().hasGuide)
            {
               TDGameFlowCmd.gotoGuide();
            }
            else
            {
               TDGameFlowCmd.reviewStageMap();
            }
         }
         else
         {
            if(TDStageInfo.getInstance().hasGuide)
            {
               LuaManager.doString(TDStageInfo.getInstance().scriptCode);
            }
            TDDebugCmd.startGameImmediately();
         }
         WorldClock.clock.resume();
         TDGameObjectCmd.showInitUnit();
         TDKeyboardCmd.registerDebugKey();
      }
      
      private function initGround() : void
      {
         TDGameInfo.getInstance().initRoadTile(TDStageInfo.getInstance().warfieldData.roadList);
         CommandDispatcher.send(CommandName.TD_InitGround);
      }
   }
}
