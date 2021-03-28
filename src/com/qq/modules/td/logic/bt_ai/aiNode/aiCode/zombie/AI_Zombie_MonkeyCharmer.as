package com.qq.modules.td.logic.bt_ai.aiNode.aiCode.zombie
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.bt_ai.aiNode.BaseZombieNodePvz;
   import com.qq.modules.td.logic.bt_ai.aiNode.executeNode.ExeDoAction;
   import com.qq.modules.td.logic.bt_ai.aiNode.requireNode.ReqAttackTarget;
   import com.qq.modules.td.logic.bt_ai.aiNode.requireNode.ReqZombieDurationExpire;
   import com.qq.modules.td.model.TDGameInfo;
   
   public class AI_Zombie_MonkeyCharmer extends BaseZombieNodePvz
   {
       
      
      public function AI_Zombie_MonkeyCharmer()
      {
         super();
      }
      
      override public function calculate() : Boolean
      {
         var _loc1_:Boolean = !zombie.hasRunningProp(TDConstant.Gameobject_Prop_IsHaveDisposableObj) || zombie.getRunningProp(TDConstant.Gameobject_Prop_IsHaveDisposableObj);
         var _loc2_:Array = TDGameInfo.getInstance().getPlantListByRoadIndex([zombie.objectModel.roadIndex],[TDConstant.PlantType_Sunflower,TDConstant.PlantType_TwinSunflower]);
         if(ReqZombieDurationExpire.calculateStatic(selfObj,true) && _loc1_ && _loc2_.length > 0)
         {
            ExeDoAction.calculateStatic(selfObj,TDConstant.ZAction_MonkeyCharmer_Throw,[_loc2_[0]]);
         }
         else if(ReqAttackTarget.calculateStatic(true,selfObj))
         {
            ExeDoAction.calculateStatic(selfObj,TDConstant.ZAction_Eat);
         }
         else
         {
            ExeDoAction.calculateStatic(selfObj,TDConstant.ZAction_Walk);
         }
         return true;
      }
   }
}
