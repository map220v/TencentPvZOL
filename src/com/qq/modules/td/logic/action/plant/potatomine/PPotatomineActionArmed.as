package com.qq.modules.td.logic.action.plant.potatomine
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.action.plant.BasicPlantAction;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.events.Event;
   
   public class PPotatomineActionArmed extends BasicPlantAction
   {
       
      
      public function PPotatomineActionArmed()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _plant.setFrozenAI(true);
         _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_Armed,false);
         _plant.animation.addEventListener(Event.COMPLETE,this.onFinishArmed);
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
      
      private function onFinishArmed(param1:Event) : void
      {
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishArmed);
         _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_Idle,true);
         _plant.setAction();
         _plant.setFrozenAI(false);
      }
      
      override public function leaveState() : void
      {
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishArmed);
      }
   }
}
