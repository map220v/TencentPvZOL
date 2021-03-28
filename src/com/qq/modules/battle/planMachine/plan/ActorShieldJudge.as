package com.qq.modules.battle.planMachine.plan
{
   import com.qq.modules.battle.model.BattleFightModel;
   import com.qq.modules.battle.model.BattleUnitInfo;
   import org.as3commons.logging.api.getLogger;
   import tencent.tools.planMachine.ICallBack;
   import tencent.tools.planMachine.IPlan;
   
   public class ActorShieldJudge extends BattleBasePlan
   {
       
      
      private var planTrue:IPlan;
      
      private var planFalse:IPlan;
      
      public function ActorShieldJudge(param1:Array)
      {
         this.planTrue = param1[0];
         this.planFalse = param1[1];
         if(param1.length > 2)
         {
            getLogger().warn("ActoShieldJudge 计划器只接受2个子节点!");
         }
         super();
      }
      
      override protected function dispose() : void
      {
         if(this.planTrue.isDoing)
         {
            this.planTrue.cancelPlan();
            this.planTrue = null;
         }
         if(this.planFalse.isDoing)
         {
            this.planFalse.cancelPlan();
            this.planFalse = null;
         }
         super.dispose();
      }
      
      override public function doPlan(param1:ICallBack) : void
      {
         super.doPlan(param1);
         var _loc2_:BattleUnitInfo = BattleFightModel.getInstance().getFightCardByPosIndex(actor.actorIndex);
         if(_loc2_.shield.toNumber() > 0)
         {
            this.planTrue.doPlan(this);
         }
         else
         {
            this.planFalse.doPlan(this);
         }
      }
   }
}
