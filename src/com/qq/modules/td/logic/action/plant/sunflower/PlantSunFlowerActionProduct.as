package com.qq.modules.td.logic.action.plant.sunflower
{
   import asgui.events.FrameEvent;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.action.plant.BasicPlantAction;
   import com.qq.modules.td.logic.talent.TalentManager;
   import flash.events.Event;
   import tencent.tools.planMachine.IPlan;
   import tencent.tools.planMachine.SerialPlan;
   
   public class PlantSunFlowerActionProduct extends BasicPlantAction
   {
       
      
      public var actionPlan:IPlan;
      
      public function PlantSunFlowerActionProduct()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_Working);
         _plant.animation.addEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onProduct);
         _plant.animation.addEventListener(Event.COMPLETE,this.onFinishAction);
      }
      
      override public function leaveState() : void
      {
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishAction);
         _plant.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onProduct);
         this.clearPlan();
         super.leaveState();
      }
      
      private function onProduct(param1:FrameEvent) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:PlanProductItem = null;
         var _loc7_:SerialPlan = null;
         if(param1.frameLabel == "product")
         {
            if(_gameObject != null && _gameObject.objectModel.isVaild)
            {
               this.clearPlan();
               _loc2_ = _gameObject.objectModel.staticInfo.getParam(TDConstant.Plant_Param_GenerateItemType);
               _loc3_ = _gameObject.objectModel.staticInfo.getParam(TDConstant.Plant_Param_GenerateItemNum);
               _loc4_ = _gameObject.objectModel.staticInfo.getParam(TDConstant.Plant_Param_GenerateItem_PosOffsetX);
               _loc5_ = _gameObject.objectModel.staticInfo.getParam(TDConstant.Plant_Param_GenerateItem_PosOffsetY);
               if(TalentManager.instance.isProductBigSun(_plant.plantData.plantStaticInfo))
               {
                  _loc2_ = TDConstant.UnitType_BigSun;
                  (_loc6_ = new PlanProductItem(_gameObject,_loc2_,_loc3_,_loc4_,_loc5_)).addItemParams("isBig",true);
               }
               else
               {
                  _loc6_ = new PlanProductItem(_gameObject,_loc2_,_loc3_,_loc4_,_loc5_);
               }
               _loc7_ = new SerialPlan([_loc6_]);
               this.actionPlan = _loc7_;
               _loc7_.doPlan(null);
            }
         }
      }
      
      protected function onFinishAction(param1:Event) : void
      {
         this.clearPlan();
         if(_gameObject == null || !_gameObject.objectModel.isVaild)
         {
            return;
         }
         _plant.setAction();
      }
      
      private function clearPlan() : void
      {
         if(this.actionPlan)
         {
            this.actionPlan.cancelPlan();
            this.actionPlan = null;
         }
      }
   }
}
