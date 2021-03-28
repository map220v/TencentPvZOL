package com.qq.modules.td.logic.log
{
   import com.qq.modules.td.data.GlobelProtectValue;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.model.TDStageInfo;
   import org.as3commons.logging.api.getLogger;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   
   public class TDLogCommand extends StrongRobotlegCommand
   {
       
      
      public function TDLogCommand()
      {
         super();
      }
      
      public function initTDLog(param1:String, param2:int) : void
      {
         TDLogger.getInstance().write(TDLogger.LOG_TYPE_InitData,[param1,param2]);
      }
      
      public function startGame() : void
      {
         TDLogger.getInstance().write(TDLogger.LOG_TYPE_StartData,[GlobelProtectValue.getInstance().get(GlobelProtectValue.KEY_FIGHTPOWER),TDGameInfo.getInstance().sun.get(),TDGameInfo.getInstance().fuel.get(),TDStageInfo.getInstance().totalFuel]);
      }
      
      public function replaceStartGameLog() : void
      {
         getLogger("check").info("report fuel create:" + TDStageInfo.getInstance().totalFuel);
         TDLogger.getInstance().updateStartDatalog(TDStageInfo.getInstance().totalFuel);
      }
      
      public function changeSun(param1:int, param2:int) : void
      {
         TDLogger.getInstance().write(TDLogger.LOG_TYPE_ChangeSun,[param1,param2]);
      }
      
      public function cropPlant(param1:int, param2:int, param3:int, param4:Boolean) : void
      {
         TDLogger.getInstance().write(TDLogger.LOG_TYPE_CropPlant,[param1,param2,param3,!!param4 ? 1 : 0]);
      }
      
      public function changeFuel(param1:int, param2:int) : void
      {
         TDLogger.getInstance().write(TDLogger.LOG_TYPE_ChangeFuel,[param1,param2]);
      }
      
      public function killZombie(param1:int, param2:int, param3:int, param4:int) : void
      {
      }
      
      public function recordZombieDamage(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int) : void
      {
      }
      
      public function recordPlantDamage(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int) : void
      {
      }
      
      public function doubleCheckError() : void
      {
         TDLogger.getInstance().write(TDLogger.LOG_TYPE_DoubleCheckError,[]);
      }
      
      public function recordChoosePlant(param1:Array) : void
      {
         TDLogger.getInstance().write(TDLogger.LOG_TYPE_ChoosePlantList,param1);
      }
   }
}
