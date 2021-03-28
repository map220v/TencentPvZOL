package com.qq.modules.td.logic.bt_ai.aiNode.aiCode.plant
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.bt_ai.aiNode.BaseNodePvz;
   import com.qq.modules.td.logic.bt_ai.aiNode.executeNode.ExeDoAction;
   import com.qq.modules.td.logic.bt_ai.aiNode.requireNode.ReqHasShootZombie;
   import com.qq.modules.td.logic.bt_ai.aiNode.requireNode.ReqPlantDurationExpire;
   
   public class AI_plant_ThunderPine extends BaseNodePvz
   {
       
      
      public function AI_plant_ThunderPine(param1:int = 30)
      {
         super(param1);
      }
      
      override public function calculate() : Boolean
      {
         if(ReqHasShootZombie.calculate(selfObj) && ReqPlantDurationExpire.calculate(selfObj))
         {
            ExeDoAction.calculateStatic(selfObj,TDConstant.PThunderPine_Attack);
         }
         else
         {
            ExeDoAction.calculateStatic(selfObj,TDConstant.PlantAction_Idle);
         }
         return true;
      }
   }
}
