package com.qq.modules.td.logic.bt_ai.aiNode.requireNode
{
   import com.qq.modules.td.logic.bt_ai.aiNode.BaseZombieNodePvz;
   import com.qq.modules.td.model.TDGameInfo;
   import tencent.tools.behaviourTrees.BehaviourTreeNodeType;
   
   public class ReqMeetTombCondition extends BaseZombieNodePvz
   {
       
      
      private var param1:Boolean = false;
      
      public function ReqMeetTombCondition()
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
         if(zombie.isVaild)
         {
            _loc1_ = TDGameInfo.getInstance().hasTileBuildTomb(zombie.x);
         }
         return _loc1_ == this.param1;
      }
   }
}
