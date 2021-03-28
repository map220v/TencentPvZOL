package com.qq.modules.td.logic.bt_ai.aiNode.requireNode
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.data.game.unit.TDPlantData;
   import com.qq.modules.td.data.game.unit.TDZombieData;
   import com.qq.modules.td.logic.bt_ai.aiNode.BaseNodePvz;
   import com.qq.modules.td.logic.bt_ai.aiUtils.DataCompareUtils;
   import org.as3commons.logging.api.getLogger;
   import tencent.tools.behaviourTrees.BehaviourTreeNodeType;
   
   public class ReqSelfHP extends BaseNodePvz
   {
       
      
      private var param1:String;
      
      private var param2:int;
      
      public function ReqSelfHP()
      {
         super(BehaviourTreeNodeType.REQUIRE);
      }
      
      override public function setDynamicParams(param1:Array) : void
      {
         this.param1 = param1[0];
         this.param2 = Number(param1[1]);
      }
      
      override public function calculate() : Boolean
      {
         var _loc1_:Number = NaN;
         if(this.mySelfData.unitCatalog == TDConstant.UnitCatalog_Plant)
         {
            _loc1_ = (this.mySelfData as TDPlantData).curHp.get();
         }
         else if(this.mySelfData.camp == TDConstant.UnitCatalog_Zombie)
         {
            _loc1_ = (this.mySelfData as TDZombieData).curHp.get();
         }
         else
         {
            getLogger("BehaviourTree").error("阵营错误，无法判断HP");
         }
         return Boolean(DataCompareUtils.compareNumber(_loc1_,this.param1,this.param2));
      }
   }
}
