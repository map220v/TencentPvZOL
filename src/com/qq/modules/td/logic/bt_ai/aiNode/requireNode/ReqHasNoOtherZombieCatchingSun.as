package com.qq.modules.td.logic.bt_ai.aiNode.requireNode
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.bt_ai.aiNode.BaseNodePvz;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.model.TDGameInfo;
   import tencent.tools.behaviourTrees.BehaviourTreeNodeType;
   
   public class ReqHasNoOtherZombieCatchingSun extends BaseNodePvz
   {
       
      
      private var param1:Boolean = false;
      
      public function ReqHasNoOtherZombieCatchingSun()
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
         var _loc2_:int = 0;
         var _loc4_:IGameObject = null;
         var _loc1_:Array = TDGameInfo.getInstance().getZombieList();
         var _loc3_:int = _loc1_.length;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            if((_loc4_ = _loc1_[_loc2_]).getActionID() == TDConstant.ZAction_CatchSun && _loc4_ != selfObj)
            {
               return false;
            }
            _loc2_++;
         }
         return true;
      }
   }
}
