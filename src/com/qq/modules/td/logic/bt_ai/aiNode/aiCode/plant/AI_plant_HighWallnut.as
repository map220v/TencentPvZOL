package com.qq.modules.td.logic.bt_ai.aiNode.aiCode.plant
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.bt_ai.aiNode.BasePlantNodePvz;
   import com.qq.modules.td.logic.bt_ai.aiNode.executeNode.ExeDoAction;
   
   public class AI_plant_HighWallnut extends BasePlantNodePvz
   {
       
      
      public function AI_plant_HighWallnut(param1:int = 30)
      {
         super(param1);
      }
      
      override public function calculate() : Boolean
      {
         ExeDoAction.calculateStatic(selfObj,TDConstant.PHighWallNuts_Idle);
         return true;
      }
   }
}
