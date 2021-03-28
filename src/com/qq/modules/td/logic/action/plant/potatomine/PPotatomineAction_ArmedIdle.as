package com.qq.modules.td.logic.action.plant.potatomine
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.action.plant.BasicPlantAction;
   import com.qq.modules.td.model.TDGameInfo;
   
   public class PPotatomineAction_ArmedIdle extends BasicPlantAction
   {
       
      
      public function PPotatomineAction_ArmedIdle()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_Idle,true);
         var _loc2_:TDMapTileData = TDGameInfo.getInstance().getRoadTileByIndex(_plant.plantData.tileIndex);
         if(_loc2_ && _loc2_.hasState(TDConstant.RoadTileState_Poison))
         {
            if(!_plant.plantData.hasBuff(TDConstant.TDBuffID_Poisoned))
            {
               _plant.plantData.addBuff(TDConstant.TDBuffID_Poisoned,_plant);
               _loc2_.cleanState(TDConstant.RoadTileState_Poison);
            }
         }
      }
   }
}
