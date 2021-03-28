package com.qq.modules.td.logic.bt_ai.aiNode.requireNode
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.bt_ai.aiNode.BaseZombieNodePvz;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.logic.unit.zombie.BasicZombie;
   import com.qq.modules.td.model.TDGameInfo;
   import tencent.tools.behaviourTrees.BehaviourTreeNodeType;
   
   public class ReqZombieDurationExpire extends BaseZombieNodePvz
   {
       
      
      private var param1:Boolean = false;
      
      public function ReqZombieDurationExpire()
      {
         super(BehaviourTreeNodeType.REQUIRE);
      }
      
      public static function calculateStatic(param1:IGameObject, param2:Boolean) : Boolean
      {
         var _loc3_:Number = param1.getTimeRecord(TDConstant.TimeRecord_ZombieDuration);
         var _loc5_:*;
         var _loc4_:Number;
         return (_loc5_ = (_loc4_ = TDGameInfo.getInstance().getCurGameTime()) - _loc3_ > (param1 as BasicZombie).zombieData.duration) == param2;
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
         return calculateStatic(selfObj,this.param1);
      }
   }
}
