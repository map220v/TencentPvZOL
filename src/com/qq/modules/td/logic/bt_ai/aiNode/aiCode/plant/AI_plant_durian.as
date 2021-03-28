package com.qq.modules.td.logic.bt_ai.aiNode.aiCode.plant
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.bt_ai.aiNode.BasePlantNodePvz;
   import com.qq.modules.td.logic.bt_ai.aiNode.executeNode.ExeDoAction;
   
   public class AI_plant_durian extends BasePlantNodePvz
   {
       
      
      public function AI_plant_durian(param1:int = 30)
      {
         super(param1);
      }
      
      override public function calculate() : Boolean
      {
         if(selfObj.objectModel.hasBuffByType(TDConstant.TDBuffType_BeAttacked))
         {
            ExeDoAction.calculateStatic(selfObj,TDConstant.PDurianAction_Attack);
         }
         else
         {
            ExeDoAction.calculateStatic(selfObj,TDConstant.PlantAction_Idle);
         }
         return true;
      }
   }
}
