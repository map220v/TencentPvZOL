package com.qq.modules.td.command.ui
{
   import asgui.controls.Alert;
   import asgui.events.CloseEvent;
   import asgui.managers.PopUpManager;
   import com.qq.CommandName;
   import com.qq.display.QAlert;
   import com.qq.modules.main.command.modules.ModuleMainCmd;
   import com.qq.modules.td.command.game.TDGameCmd;
   import com.qq.modules.td.command.game.drag.TDMouseActionCmd;
   import com.qq.modules.td.command.game.effect.TDTipEffectCmd;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.data.TDDataFactory;
   import com.qq.modules.td.data.game.unit.TDPlantStaticInfo;
   import com.qq.modules.td.logic.TDCropUtil;
   import com.qq.modules.td.logic.TDSpecialSkillTrigger;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.view.components.TDFailWd;
   import com.qq.modules.td.view.components.TDPrivilegeWindow;
   import com.qq.templates.font.FontHKHB;
   import com.qq.templates.font.FontNormal;
   import com.qq.utils.CommandDispatcher;
   import flash.geom.Rectangle;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   
   public class TDUICommand extends StrongRobotlegCommand
   {
       
      
      public function TDUICommand()
      {
         super();
      }
      
      public function specialSkillUpdatePosAt(param1:int, param2:int) : void
      {
         TDSpecialSkillTrigger.getInstance().updatePosAt(param1,param2);
      }
      
      public function showFinishedPopup() : void
      {
         var closeHandler:Function = null;
         closeHandler = function(param1:CloseEvent):void
         {
            ModuleMainCmd.gotoChooseStage();
         };
         Alert.okLabel = FontHKHB.TXT_Goto_MainMenu;
         QAlert.Show("通关了！\nRTX tianchi领取神秘奖励！","",4,null,closeHandler);
      }
      
      public function showNormalFailedPopup() : void
      {
         var _loc1_:TDFailWd = new TDFailWd();
         PopUpManager.AddPopUp(_loc1_,null,true);
      }
      
      public function showChallengeFailedPopup() : void
      {
         var closeHandler:Function = null;
         closeHandler = function(param1:CloseEvent):void
         {
            TDGameCmd.exitGame();
         };
         QAlert.Show(FontNormal.TD_Str_Failed,"",Alert.OK,null,closeHandler,null,null);
      }
      
      public function showMenuPopup() : void
      {
      }
      
      public function startPlantSettingByID(param1:int, param2:String, param3:Boolean = false, param4:Rectangle = null, param5:Boolean = true) : void
      {
         var _loc6_:TDPlantStaticInfo;
         if((_loc6_ = TDDataFactory.instance.getPlantInfoByID(param1)) == null)
         {
            return;
         }
         if(!param3 && TDCropUtil.isPlantUsable(param1) != 0)
         {
            return;
         }
         TDSoundCmd.pickupPlantCard();
         TDMouseActionCmd.startCropPlant(_loc6_.id,param2,param4,param5);
         CommandDispatcher.send(CommandName.TD_StartCropPlant,{"cardID":param2});
         TDTipEffectCmd.showAllLevelupPlantTipCommand(_loc6_.baseInfo.prePlantType);
      }
      
      public function startPlantSettingByIndex(param1:int) : void
      {
         var _loc2_:int = TDGameInfo.getInstance().normalCardsData.getPlantTypeByIndex(param1);
         CommandDispatcher.send(CommandName.TD_ClickPlantCard,{"type":_loc2_});
      }
      
      public function startEnergyTileByType(param1:int, param2:String) : void
      {
         TDSoundCmd.pickupPlantCard();
         TDMouseActionCmd.startLayEnergyTile(param1,param2);
      }
      
      public function showUI() : void
      {
         CommandDispatcher.send(CommandName.TD_showUI);
      }
      
      public function hideUI() : void
      {
         CommandDispatcher.send(CommandName.TD_hideUI);
      }
      
      public function addCardSlot(param1:int) : void
      {
         TDGameInfo.getInstance().normalCardsData.maxSlotNum = TDGameInfo.getInstance().normalCardsData.maxSlotNum + param1;
         CommandDispatcher.send(CommandName.TD_ResetGameInfoPanelBG);
      }
      
      public function releaseSkillByIndex(param1:int) : void
      {
      }
      
      public function releaseSkillByType(param1:int) : void
      {
      }
      
      public function showNewZombieTip(param1:int) : void
      {
         CommandDispatcher.send(CommandName.TDAddNewZombieTip,{"zombieType":param1});
      }
      
      public function showPrivilegeWindow() : void
      {
         var _loc1_:TDPrivilegeWindow = new TDPrivilegeWindow();
         PopUpManager.AddPopUp(_loc1_,null,true);
      }
   }
}
