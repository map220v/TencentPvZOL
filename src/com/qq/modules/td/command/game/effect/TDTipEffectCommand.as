package com.qq.modules.td.command.game.effect
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.unit.plant.BasicPlant;
   import com.qq.modules.td.model.TDGameInfo;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   
   public class TDTipEffectCommand extends StrongRobotlegCommand
   {
       
      
      public function TDTipEffectCommand()
      {
         super();
      }
      
      public function showAllLevelupPlantTipCommand(param1:int) : void
      {
         var _loc2_:Array = null;
         var _loc3_:BasicPlant = null;
         if(param1 != 0)
         {
            _loc2_ = TDGameInfo.getInstance().getGameObjectMapByCatalg(TDConstant.UnitCatalog_Plant);
            for each(_loc3_ in _loc2_)
            {
               if(_loc3_.plantData.plantStaticInfo.baseInfo.id == param1)
               {
                  _loc3_.startLevelupTip();
               }
            }
         }
      }
      
      public function hideLevelupPlantTip(param1:int) : void
      {
         var _loc2_:Array = null;
         var _loc3_:BasicPlant = null;
         if(param1 != 0)
         {
            _loc2_ = TDGameInfo.getInstance().getGameObjectMapByCatalg(TDConstant.UnitCatalog_Plant);
            for each(_loc3_ in _loc2_)
            {
               if(_loc3_.plantData.plantStaticInfo.baseInfo.id == param1)
               {
                  _loc3_.stopLevelUpTip();
               }
            }
         }
      }
      
      public function hideAllLevelupPlantTip() : void
      {
         var _loc2_:BasicPlant = null;
         var _loc1_:Array = TDGameInfo.getInstance().getGameObjectMapByCatalg(TDConstant.UnitCatalog_Plant);
         for each(_loc2_ in _loc1_)
         {
            _loc2_.stopLevelUpTip();
         }
      }
   }
}
