package com.qq.modules.td.logic.bt_ai.aiNode.executeNode.plant
{
   import com.qq.modules.td.logic.bt_ai.aiNode.BasePlantNodePvz;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import tencent.tools.behaviourTrees.BehaviourTreeNodeType;
   
   public class ExePlantAttack extends BasePlantNodePvz
   {
       
      
      private var actionID:String = "PPeaShooterAction_Shoot";
      
      public function ExePlantAttack()
      {
         super(BehaviourTreeNodeType.EXECUTE);
      }
      
      public static function calculate(param1:IGameObject, param2:String, param3:Array = null) : Boolean
      {
         if(param1.getActionID() == param2)
         {
            return true;
         }
         param1.setAction(param2,param3);
         return true;
      }
      
      override public function setDynamicParams(param1:Array) : void
      {
         this.actionID = param1[0];
      }
      
      override public function calculate() : Boolean
      {
         if(selfObj.getActionID() == this.actionID)
         {
            return true;
         }
         selfObj.setAction(this.actionID);
         return true;
      }
   }
}
