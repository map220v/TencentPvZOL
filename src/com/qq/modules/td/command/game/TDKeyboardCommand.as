package com.qq.modules.td.command.game
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.drag.TDMouseActionCmd;
   import com.qq.modules.td.model.TDStageInfo;
   import com.qq.utils.KeyManager;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   
   public class TDKeyboardCommand extends StrongRobotlegCommand
   {
      
      public static const NAME:String = "TDKeyboardCommand";
       
      
      public function TDKeyboardCommand()
      {
         super();
      }
      
      public function registerDebugKey() : void
      {
      }
      
      public function unregisterDebugKey() : void
      {
      }
      
      public function registerTDKey() : void
      {
         if(TDStageInfo.getInstance().checkGameType(TDConstant.TDgameType_Param_hasShovelPanel))
         {
            KeyManager.getInstance().register(84,TDMouseActionCmd.startUseShovel,null);
         }
         KeyManager.getInstance().register(27,TDMouseActionCmd.cleanMouseAction,null);
      }
      
      public function unregisterTDKey() : void
      {
         KeyManager.getInstance().unregister(81);
         KeyManager.getInstance().unregister(87);
         KeyManager.getInstance().unregister(69);
         KeyManager.getInstance().unregister(82);
         KeyManager.getInstance().unregister(84);
         KeyManager.getInstance().unregister(70);
         KeyManager.getInstance().unregister(71);
         KeyManager.getInstance().unregister(27);
      }
   }
}
