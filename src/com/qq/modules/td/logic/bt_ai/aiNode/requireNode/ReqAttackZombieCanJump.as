package com.qq.modules.td.logic.bt_ai.aiNode.requireNode
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.data.game.unit.TDZombieData;
   import com.qq.modules.td.logic.bt_ai.aiNode.BasePlantNodePvz;
   import tencent.tools.behaviourTrees.BehaviourTreeNodeType;
   
   public class ReqAttackZombieCanJump extends BasePlantNodePvz
   {
       
      
      private var param1:Boolean = false;
      
      public function ReqAttackZombieCanJump()
      {
         super(BehaviourTreeNodeType.REQUIRE);
      }
      
      override public function setDynamicParams(param1:Array) : void
      {
         if(param1[0] == "false")
         {
            this.param1 = false;
         }
         if(param1[0] == "true")
         {
            this.param1 = true;
         }
      }
      
      override public function calculate() : Boolean
      {
         var _loc1_:Boolean = false;
         if(plant.curAttackTarget.objectModel.unitCatalog == TDConstant.UnitCatalog_Zombie)
         {
            _loc1_ = (plant.curAttackTarget.objectModel as TDZombieData).canJump;
         }
         if(this.param1 == true)
         {
            return !!_loc1_ ? true : false;
         }
         return !!_loc1_ ? false : true;
      }
   }
}
