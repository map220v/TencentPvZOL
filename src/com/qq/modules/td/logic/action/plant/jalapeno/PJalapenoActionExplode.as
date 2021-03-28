package com.qq.modules.td.logic.action.plant.jalapeno
{
   import com.qq.constant.td.TDConstant;
   import com.qq.constant.td.TDElementType;
   import com.qq.modules.td.command.game.TDGameObjectCmd;
   import com.qq.modules.td.logic.action.plant.BasicPlantAction;
   import com.qq.modules.td.logic.bt_ai.aiUtils.TDSearchTargetUtils;
   import com.qq.modules.td.logic.numeric.TDDamageCaculete;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.events.Event;
   
   public class PJalapenoActionExplode extends BasicPlantAction
   {
       
      
      public function PJalapenoActionExplode()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _plant.animation.addEventListener(Event.COMPLETE,this.onComplete);
         _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_Attack);
      }
      
      override public function runningState() : void
      {
         super.runningState();
      }
      
      override public function leaveState() : void
      {
         _plant.animation.removeEventListener(Event.COMPLETE,this.onComplete);
         super.leaveState();
      }
      
      private function onComplete(param1:Event) : void
      {
         var _loc4_:Array = null;
         var _loc2_:int = _gameObject.objectModel.staticInfo.getParam(TDConstant.Plant_Param_GenerateItemType);
         var _loc3_:int = _plant.plantData.plantStaticInfo.baseInfo.damageValue;
         (_loc4_ = [])[TDConstant.Gameobject_Prop_InitUnitParam] = [0,_loc3_];
         TDGameObjectCmd.addGameObjectByColAndRow(TDConstant.UnitCatalog_Object,_loc2_,_plant.objectModel.column,_plant.objectModel.roadIndex,_loc4_);
         if(_plant.objectModel.column > TDGameInfo.getInstance().minCol)
         {
            (_loc4_ = [])[TDConstant.Gameobject_Prop_InitUnitParam] = [-1,_loc3_];
            TDGameObjectCmd.addGameObjectByColAndRow(TDConstant.UnitCatalog_Object,_loc2_,_plant.objectModel.column - 1,_plant.objectModel.roadIndex,_loc4_);
         }
         if(_plant.objectModel.column < TDGameInfo.getInstance().maxCol)
         {
            (_loc4_ = [])[TDConstant.Gameobject_Prop_InitUnitParam] = [1,_loc3_];
            TDGameObjectCmd.addGameObjectByColAndRow(TDConstant.UnitCatalog_Object,_loc2_,_plant.objectModel.column + 1,_plant.objectModel.roadIndex,_loc4_);
         }
         this.doHit();
         _plant.Dispose();
      }
      
      private function doHit() : void
      {
         var _loc1_:Array = TDSearchTargetUtils.getZombieList(_plant,[_plantModel.roadIndex]);
         TDDamageCaculete.caculatePlantDamage(_plant,_loc1_,false,-1,TDElementType.FIRE_TYPE);
      }
   }
}
