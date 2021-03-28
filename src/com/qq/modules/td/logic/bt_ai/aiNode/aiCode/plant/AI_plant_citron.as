package com.qq.modules.td.logic.bt_ai.aiNode.aiCode.plant
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.bt_ai.aiNode.BasePlantNodePvz;
   import com.qq.modules.td.logic.bt_ai.aiNode.executeNode.ExeDoAction;
   import com.qq.modules.td.logic.bt_ai.aiNode.requireNode.ReqHasShootZombie;
   
   public class AI_plant_citron extends BasePlantNodePvz
   {
       
      
      public function AI_plant_citron(param1:int = 30)
      {
         super(param1);
      }
      
      override public function calculate() : Boolean
      {
         var _loc1_:Boolean = plant.getRunningProp(TDConstant.Gameobject_Prop_IsReadyToAttack);
         if(_loc1_)
         {
            if(ReqHasShootZombie.calculate(plant))
            {
               ExeDoAction.calculateStatic(plant,TDConstant.PCitronAction_Shoot);
            }
            else
            {
               ExeDoAction.calculateStatic(selfObj,TDConstant.PlantAction_Idle,[[TDConstant.PlantAnmi_Armed]],false,true);
            }
         }
         else
         {
            ExeDoAction.calculateStatic(plant,TDConstant.PCitronAction_Charge,null,false,true);
         }
         return true;
      }
   }
}
