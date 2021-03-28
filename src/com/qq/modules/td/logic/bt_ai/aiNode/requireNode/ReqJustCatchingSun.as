package com.qq.modules.td.logic.bt_ai.aiNode.requireNode
{
   import asgui.utils.WorldClock;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.bt_ai.aiNode.BaseNodePvz;
   import com.qq.modules.td.logic.unit.zombie.TDRaZombie;
   import tencent.tools.behaviourTrees.BehaviourTreeNodeType;
   
   public class ReqJustCatchingSun extends BaseNodePvz
   {
       
      
      private var param1:Boolean = false;
      
      public function ReqJustCatchingSun()
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
         var _loc1_:TDRaZombie = selfObj as TDRaZombie;
         if(_loc1_ == null)
         {
            return false;
         }
         if(_loc1_.getActionID() == TDConstant.ZAction_CatchSun)
         {
            return true;
         }
         var _loc2_:Number = WorldClock.clock.time;
         if(_loc1_.lastSetCatchingTime + _loc1_.zombieData.duration / 1000 < _loc2_)
         {
            return true;
         }
         return false;
      }
   }
}
