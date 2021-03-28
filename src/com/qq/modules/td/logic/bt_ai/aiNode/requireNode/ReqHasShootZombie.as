package com.qq.modules.td.logic.bt_ai.aiNode.requireNode
{
   import com.qq.modules.td.logic.bt_ai.aiNode.BaseNodePvz;
   import com.qq.modules.td.logic.bt_ai.aiUtils.TDSearchTargetUtils;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.logic.unit.plant.BasicPlant;
   import tencent.tools.behaviourTrees.BehaviourTreeNodeType;
   
   public class ReqHasShootZombie extends BaseNodePvz
   {
       
      
      private var isUseExtraValue:Boolean;
      
      private var isFlying:Boolean = false;
      
      private var containNomalObj:Boolean = true;
      
      public function ReqHasShootZombie()
      {
         super(BehaviourTreeNodeType.REQUIRE);
      }
      
      public static function calculate(param1:IGameObject) : Boolean
      {
         var _loc2_:IGameObject = TDSearchTargetUtils.searchOneTargetByRoads(param1);
         if(_loc2_ == null)
         {
            return false;
         }
         param1.setAttackTarget(_loc2_);
         return true;
      }
      
      public static function calculateTheLastOne(param1:IGameObject) : Boolean
      {
         var _loc2_:IGameObject = TDSearchTargetUtils.searchTheLastOneTargetByRoad(param1);
         if(_loc2_ == null)
         {
            return false;
         }
         param1.setAttackTarget(_loc2_);
         return true;
      }
      
      public static function calculateAttackArea(param1:BasicPlant, param2:int, param3:int, param4:int, param5:int) : Boolean
      {
         var _loc6_:Vector.<IGameObject>;
         if((_loc6_ = TDSearchTargetUtils.searchTargetsByColRow(param2,param3,param4,param5,param1)) != null && _loc6_.length > 0)
         {
            return true;
         }
         return false;
      }
      
      override public function setDynamicParams(param1:Array) : void
      {
         this.isUseExtraValue = param1.length > 0;
         if(param1[0] == "false")
         {
            this.containNomalObj = false;
         }
         else
         {
            this.containNomalObj = true;
         }
         this.isFlying = param1[1] == "true";
      }
      
      override public function calculate() : Boolean
      {
         var _loc1_:IGameObject = null;
         if(this.isUseExtraValue)
         {
            _loc1_ = TDSearchTargetUtils.getOneTargetByRoad(this.isFlying,this.containNomalObj,selfObj);
         }
         else
         {
            _loc1_ = TDSearchTargetUtils.searchOneTargetByRoads(selfObj);
         }
         if(_loc1_ == null)
         {
            return false;
         }
         selfObj.setAttackTarget(_loc1_);
         return true;
      }
   }
}
