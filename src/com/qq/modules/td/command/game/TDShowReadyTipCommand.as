package com.qq.modules.td.command.game
{
   import com.qq.CommandName;
   import com.qq.modules.basic.command.BasicCommand;
   import com.qq.utils.CommandDispatcher;
   
   public class TDShowReadyTipCommand extends BasicCommand
   {
       
      
      public function TDShowReadyTipCommand()
      {
         super();
      }
      
      override public function execute() : void
      {
         CommandDispatcher.send(CommandName.TD_LockScreen);
         TDGameObjectCmd.showLastProtecter();
         CommandDispatcher.send(CommandName.TD_TextTip_Show,{
            "tipTextName":"TD_StartGameTipMC",
            "nextCommandName":CommandName.TD_StartTDGame
         });
      }
   }
}
