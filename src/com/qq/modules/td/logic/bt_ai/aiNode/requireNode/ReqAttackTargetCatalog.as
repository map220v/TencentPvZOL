package com.qq.modules.td.logic.bt_ai.aiNode.requireNode
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.bt_ai.aiNode.BaseNodePvz;
   import org.as3commons.logging.api.getLogger;
   import tencent.tools.behaviourTrees.BehaviourTreeNodeType;
   
   public class ReqAttackTargetCatalog extends BaseNodePvz
   {
       
      
      private var param1:String = "plant";
      
      public function ReqAttackTargetCatalog()
      {
         super(BehaviourTreeNodeType.REQUIRE);
      }
      
      override public function setDynamicParams(param1:Array) : void
      {
         this.param1 = param1[0];
      }
      
      override public function calculate() : Boolean
      {
         if(!selfObj.curAttackTarget)
         {
            getLogger("BT").warn("没有攻击目标，无法判断攻击目标大类");
            return false;
         }
         if(this.param1 == "plant")
         {
            return selfObj.curAttackTarget.objectModel.unitCatalog == TDConstant.UnitCatalog_Plant ? true : false;
         }
         if(this.param1 == "zombie")
         {
            return selfObj.curAttackTarget.objectModel.unitCatalog == TDConstant.UnitCatalog_Zombie ? true : false;
         }
         return false;
      }
   }
}
