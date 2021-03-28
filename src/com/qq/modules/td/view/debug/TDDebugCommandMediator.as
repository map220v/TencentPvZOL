package com.qq.modules.td.view.debug
{
   import PVZ.Cmd.Cmd_DoGm_CS;
   import asgui.controls.Button;
   import com.qq.CommandName;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.endlessTD.command.EndlessTDViewCmd;
   import com.qq.modules.main.command.GameFlowCmd;
   import com.qq.modules.main.server.PvzSocketService;
   import com.qq.modules.td.command.debug.TDDebugCmd;
   import com.qq.modules.td.command.game.TDGameCmd;
   import com.qq.modules.td.command.game.TDGameFlowCmd;
   import com.qq.modules.td.model.TDStageInfo;
   import com.qq.utils.CommandDispatcher;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.utils.setTimeout;
   
   public class TDDebugCommandMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:TDDebugCommandLayer;
      
      [Inject]
      public var server:PvzSocketService;
      
      public function TDDebugCommandMediator()
      {
         super();
      }
      
      override protected function initListener() : void
      {
         var _loc1_:Button = null;
         super.initListener();
         for each(_loc1_ in this.view.btnList)
         {
            addComponentListener(_loc1_,MouseEvent.CLICK,this.onClick,MouseEvent);
         }
      }
      
      private function onClick(param1:Event) : void
      {
         var _loc2_:Button = param1.currentTarget as Button;
         switch(_loc2_.label)
         {
            case "显示路径":
               CommandDispatcher.send(CommandName.TD_Debug_ShowRoad);
               break;
            case "隐藏路径":
               CommandDispatcher.send(CommandName.TD_Debug_HideRoad);
               break;
            case "显示单位区域":
               CommandDispatcher.send(CommandName.TD_Debug_ShowUnitArea);
               break;
            case "隐藏单位区域":
               CommandDispatcher.send(CommandName.TD_Debug_HideUnitArea);
               break;
            case "显示游戏区域":
               CommandDispatcher.send(CommandName.TD_Debug_ShowGameArea);
               break;
            case "隐藏游戏区域":
               CommandDispatcher.send(CommandName.TD_Debug_HideGameArea);
               break;
            case "暂停游戏":
               TDGameCmd.playerPauseGame();
               break;
            case "继续游戏":
               TDGameCmd.playerResumeGame();
               break;
            case "重开游戏":
               TDGameFlowCmd.restartGame();
               break;
            case "速度x1":
               TDDebugCmd.changeGameSpeed(1);
               break;
            case "速度x2":
               TDDebugCmd.changeGameSpeed(2);
               break;
            case "速度x4":
               TDDebugCmd.changeGameSpeed(4);
               break;
            case "速度x0.5":
               TDDebugCmd.changeGameSpeed(0.5);
               break;
            case "弹出弹窗":
               EndlessTDViewCmd.openSavePanel(false);
               break;
            case "增加阳光":
               TDDebugCmd.changeSun(5000);
               break;
            case "增加燃料":
               TDDebugCmd.changeFuel(1);
               break;
            case "跳过关卡":
               CommandDispatcher.send(CommandName.TD_PauseTDGame);
               this.finishLevel(TDStageInfo.getInstance().stageID,TDStageInfo.getInstance().levelID,TDStageInfo.getInstance().subLevelID,TDStageInfo.getInstance().challengeLevelID,1,[]);
               setTimeout(GameFlowCmd.gotoLevelSelect,2000);
               break;
            case "增加10个植物":
               TDDebugCmd.addPlant(10);
               break;
            case "增加10个僵尸":
               TDDebugCmd.addZombie(10);
               break;
            case "增加100硬币":
               break;
            case "跳至第?关":
               TDDebugCmd.showChooseStagePanel();
               break;
            case "弹出天赋面板":
               TDGameCmd.showInstrustation(TDConstant.UnitCatalog_Plant,3400);
         }
      }
      
      public function finishLevel(param1:int, param2:int, param3:int, param4:int, param5:int, param6:Array) : void
      {
         var _loc7_:Cmd_DoGm_CS = new Cmd_DoGm_CS();
         if(param4 > 0)
         {
            _loc7_.requestCmd = "pass_td_level " + param1 + " " + param2 + " " + param3 + " " + param4 + " 1000";
         }
         else
         {
            _loc7_.requestCmd = "pass_td_level " + param1 + " " + param2 + " " + param3 + " " + param4 + " 0 10";
         }
         this.server.sendMessage(_loc7_);
      }
   }
}
