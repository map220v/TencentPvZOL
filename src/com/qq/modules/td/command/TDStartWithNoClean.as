package com.qq.modules.td.command
{
   import com.qq.CommandName;
   import com.qq.modules.basic.command.BasicCommand;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.td.command.game.TDGameCmd;
   import com.qq.modules.td.command.game.TDGameFlowCmd;
   import com.qq.modules.td.command.game.TDGameObjectCmd;
   import com.qq.modules.td.logic.log.TDLogger;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.model.TDStageInfo;
   import com.qq.modules.td.model.TDStartParam;
   import com.qq.utils.CommandDispatcher;
   
   public class TDStartWithNoClean extends BasicCommand
   {
       
      
      [Inject]
      public var event:CommonEvent;
      
      private const Max_Sun_Num:int = 3000;
      
      public function TDStartWithNoClean()
      {
         super();
      }
      
      override public function execute() : void
      {
         TDGameObjectCmd.cleanAllSampleMower();
         TDGameInfo.getInstance().setNormalPlantSlot(TDStageInfo.getInstance().cardSlotNum.get());
         TDGameInfo.getInstance().setFriendPlantSlot(1);
         TDGameInfo.getInstance().rain.set(TDStageInfo.getInstance().rain.get());
         TDGameInfo.getInstance().cleanQuickSand();
         if(TDStageInfo.getInstance().startParam.gameType == TDStartParam.Endless && TDGameInfo.getInstance().sun.get() > this.Max_Sun_Num)
         {
            TDGameCmd.changeSun(this.Max_Sun_Num - TDGameInfo.getInstance().sun.get());
         }
         TDLogger.getInstance().reset();
         TDGameFlowCmd.reviewStageMap();
         CommandDispatcher.send(CommandName.TD_ProcessBar_Hide);
      }
   }
}
