package com.qq.modules.td.logic.action.plant.bambooGun
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.action.plant.BasicPlantAction;
   import com.qq.modules.td.model.TDGameInfo;
   
   public class PBambooGunActionIdle extends BasicPlantAction
   {
       
      
      public function PBambooGunActionIdle()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_Idle);
      }
      
      override public function runningState() : void
      {
         var _loc1_:Number = TDGameInfo.getInstance().getCurGameTime();
         var _loc2_:int = _plant.timeRecordMap[TDConstant.TimeRecord_PlantDuration];
         if(_loc1_ - _loc2_ > _plant.plantData.duration)
         {
            _plant.timeRecordMap[TDConstant.TimeRecord_PlantDuration] = _loc1_;
         }
      }
   }
}
