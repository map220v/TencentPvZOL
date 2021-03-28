package com.qq.modules.city.logic.plan.addBuilding
{
   import com.qq.CommandName;
   import com.qq.utils.CommandDispatcher;
   import tencent.tools.planMachine.ICallBack;
   import tencent.tools.planMachine.Plan;
   
   public class StartAddBuildingPlan extends Plan
   {
       
      
      private var _buildingType:int;
      
      public function StartAddBuildingPlan(param1:int)
      {
         super();
         this._buildingType = param1;
      }
      
      override public function doPlan(param1:ICallBack) : void
      {
         super.doPlan(param1);
         CommandDispatcher.send(CommandName.City_AddBuildingEffect,{"buildingType":this._buildingType});
         setComplete();
      }
   }
}
