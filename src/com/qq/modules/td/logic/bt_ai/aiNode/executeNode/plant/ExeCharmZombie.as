package com.qq.modules.td.logic.bt_ai.aiNode.executeNode.plant
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.bt_ai.aiNode.BaseNodePvz;
   import tencent.tools.behaviourTrees.BehaviourTreeNodeType;
   
   public class ExeCharmZombie extends BaseNodePvz
   {
       
      
      public function ExeCharmZombie()
      {
         super(BehaviourTreeNodeType.EXECUTE);
      }
      
      override public function calculate() : Boolean
      {
         var _loc1_:int = 0;
         if(selfObj.curAttackTarget != null)
         {
            if(selfObj.objectModel.staticInfo.hasParam(TDConstant.Plant_Param_EffectBuffID))
            {
               _loc1_ = selfObj.objectModel.staticInfo.getParam(TDConstant.Plant_Param_EffectBuffID);
               selfObj.curAttackTarget.objectModel.addBuff(_loc1_,selfObj);
            }
         }
         selfObj.dispose();
         return true;
      }
   }
}
