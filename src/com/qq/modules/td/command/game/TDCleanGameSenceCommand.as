package com.qq.modules.td.command.game
{
   import com.qq.CommandName;
   import com.qq.modules.basic.command.BasicCommand;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.utils.CommandDispatcher;
   
   public class TDCleanGameSenceCommand extends BasicCommand
   {
       
      
      public function TDCleanGameSenceCommand()
      {
         super();
      }
      
      override public function execute() : void
      {
         TDGameInfo.getInstance().cleanGameobjectMap();
         TDGameInfo.getInstance().clean();
         CommandDispatcher.send(CommandName.TD_CleanGround);
         CommandDispatcher.send(CommandName.TD_ProcessBar_Hide);
         TDSoundCmd.cleanBackgoundMusic();
         CommandDispatcher.send(CommandName.TD_TextTip_Hide);
      }
   }
}
