package com.qq.modules.td.command.game
{
   import com.qq.CommandName;
   import com.qq.modules.basic.command.BasicCommand;
   import com.qq.modules.td.command.TDCleanResCmd;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.logic.TDSpecialSkillTrigger;
   import com.qq.modules.td.logic.TDUILayerManager;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.utils.CommandDispatcher;
   
   public class TDCleanTDGameResCommand extends BasicCommand
   {
       
      
      public function TDCleanTDGameResCommand()
      {
         super();
      }
      
      override public function execute() : void
      {
         TDGameInfo.getInstance().cleanGameobjectMap();
         TDGameInfo.getInstance().clean();
         TDUILayerManager.clean();
         TDSpecialSkillTrigger.getInstance().clean();
         CommandDispatcher.send(CommandName.TD_CleanGround);
         CommandDispatcher.send(CommandName.TD_ProcessBar_Hide);
         TDKeyboardCmd.unregisterTDKey();
         TDSoundCmd.cleanAllTDSound();
         TDCleanResCmd.cleanTDRes();
      }
   }
}
