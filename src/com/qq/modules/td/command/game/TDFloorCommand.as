package com.qq.modules.td.command.game
{
   import com.qq.constant.td.TDConditionID;
   import com.qq.modules.guide.command.GuideCmd;
   import com.qq.modules.td.command.tips.ShowTipCmd;
   import com.qq.modules.td.data.map.TDMapPathUpdateInfo;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.TDConditionTriggerManager;
   import com.qq.modules.td.logic.process.TDEnemyWaveProcess;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.model.vo.TDPathPointVO;
   import com.qq.modules.td.view.game.layer.floor.TDFloorManager;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   
   public class TDFloorCommand extends StrongRobotlegCommand
   {
      
      public static const NAME:String = "TDFloorCommand";
       
      
      public function TDFloorCommand()
      {
         super();
      }
      
      public function addPowerTile(param1:int, param2:int, param3:int) : void
      {
         var _loc4_:TDMapTileData = TDGameInfo.getInstance().getRoadTileInf(param2,param3);
         TDGameObjectCmd.addNormalGameObjectByTile(param1,_loc4_);
      }
      
      public function updatePath(param1:Object) : void
      {
         var _loc3_:TDPathPointVO = null;
         var _loc4_:int = 0;
         var _loc2_:TDMapPathUpdateInfo = param1 as TDMapPathUpdateInfo;
         if(_loc2_.mode.toLowerCase() == "add")
         {
            TDFloorManager.instance.scheduleAddPathList(_loc2_.pathVec);
            if(_loc2_.pathVec.length > 0)
            {
               _loc3_ = _loc2_.pathVec[0];
               _loc4_ = _loc3_.row;
               GuideCmd.tryGuide("td_path_add_guide_" + _loc4_);
            }
         }
         else if(_loc2_.mode.toLowerCase() == "remove")
         {
            TDFloorManager.instance.scheduleRemovePathList(_loc2_.pathVec);
         }
      }
      
      public function addLightAreaAfterWave(param1:int, param2:int, param3:int, param4:int, param5:int, param6:String = null) : void
      {
         var _loc7_:TDEnemyWaveProcess;
         if((_loc7_ = TDGameInfo.getInstance().updateProcessList[TDEnemyWaveProcess.ID] as TDEnemyWaveProcess) == null || _loc7_.curWaveIndex < param1)
         {
            TDConditionTriggerManager.instance.setActTimes(TDConditionID.PLANT_CARD_GRAB_UP,0);
            return;
         }
         GuideCmd.addLightArea(param2,param3,param4,param5);
         if(param6 != null && param6 != "")
         {
            ShowTipCmd.showPlantWaveTip(param6);
         }
      }
      
      public function removeLightAreaAfterWave(param1:int) : void
      {
         var _loc2_:TDEnemyWaveProcess = TDGameInfo.getInstance().updateProcessList[TDEnemyWaveProcess.ID] as TDEnemyWaveProcess;
         if(_loc2_ == null || _loc2_.curWaveIndex < param1)
         {
            TDConditionTriggerManager.instance.setActTimes(TDConditionID.PLANT_CARD_DROP_DOWN,0);
            return;
         }
         GuideCmd.clearArea();
      }
   }
}
