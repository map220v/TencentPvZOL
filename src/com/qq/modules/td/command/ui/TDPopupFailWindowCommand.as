package com.qq.modules.td.command.ui
{
   import com.qq.CommandName;
   import com.qq.modules.basic.command.BasicCommand;
   import com.qq.modules.dailyTD.command.DailyTdViewCmd;
   import com.qq.modules.endlessTD.command.EndlessTDViewCmd;
   import com.qq.modules.td.model.TDStageInfo;
   import com.qq.modules.td.model.TDStartParam;
   import com.qq.utils.CommandDispatcher;
   
   public class TDPopupFailWindowCommand extends BasicCommand
   {
       
      
      public function TDPopupFailWindowCommand()
      {
         super();
      }
      
      override public function execute() : void
      {
         CommandDispatcher.send(CommandName.TD_PauseTDGame);
         switch(TDStageInfo.getInstance().startParam.gameType)
         {
            case TDStartParam.Daily:
               DailyTdViewCmd.showDailyTDFailedPopup();
               break;
            case TDStartParam.Endless:
               EndlessTDViewCmd.showFailedPopup();
               break;
            case TDStartParam.Yeti:
               break;
            default:
               if(TDStageInfo.getInstance().challengeLevelID > 0)
               {
                  TDUICmd.showChallengeFailedPopup();
               }
               else
               {
                  TDUICmd.showNormalFailedPopup();
               }
         }
      }
   }
}
