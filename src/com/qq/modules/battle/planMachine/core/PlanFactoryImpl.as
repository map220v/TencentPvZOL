package com.qq.modules.battle.planMachine.core
{
   import PVZ.Cmd.Dto_FightActor;
   import com.qq.modules.battle.model.vo.FightDamageVo;
   import com.qq.modules.battle.planMachine.plan.ActorFrameEventPlan;
   import com.qq.modules.battle.planMachine.plan.ActorShieldJudge;
   import com.qq.modules.battle.planMachine.plan.BattleBasePlan;
   import com.qq.modules.battle.planMachine.plan.BattleDelayPlan;
   import com.qq.modules.battle.planMachine.plan.DamageSplitPlan;
   import com.qq.modules.battle.planMachine.plan.TriggerReceivePlan;
   import com.qq.modules.main.model.settings.battle.planSettings.PlanNode;
   import com.qq.modules.main.model.settings.battle.planSettings.PlanTree;
   import flash.net.getClassByAlias;
   import tencent.base.utils.ObjectUtil;
   import tencent.tools.planMachine.IPlan;
   import tencent.tools.planMachine.ParallelPlan;
   import tencent.tools.planMachine.Plan;
   import tencent.tools.planMachine.SerialPlan;
   
   public class PlanFactoryImpl
   {
       
      
      public function PlanFactoryImpl()
      {
         super();
      }
      
      public function createPlanByTree(param1:Dto_FightActor, param2:Array, param3:PlanGroup, param4:PlanTree) : IPlan
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:Array = null;
         var _loc8_:IPlan = null;
         _loc5_ = param4.planNodeList.length;
         _loc7_ = [];
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _loc7_.push(this.createPlanByNode(param1,param2,param3,param4.planNodeList[_loc6_]));
            _loc6_++;
         }
         return new SerialPlan(_loc7_);
      }
      
      public function createPlanByNode(param1:Dto_FightActor, param2:Array, param3:PlanGroup, param4:PlanNode) : IPlan
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:Array = null;
         var _loc8_:IPlan = null;
         var _loc10_:Array = null;
         var _loc11_:int = 0;
         var _loc12_:Class = null;
         var _loc13_:BattleDelayPlan = null;
         var _loc9_:Boolean = false;
         if(param4.planType == "SerialPlan")
         {
            if(param4.params.length > 0 && param4.params[0] == "true")
            {
               _loc9_ = true;
            }
            _loc8_ = this.createSerialPlan(_loc9_,param1,param2,param3,param4);
         }
         else if(param4.planType == "ParallelPlan")
         {
            if(param4.params.length > 0 && param4.params[0] == "true")
            {
               _loc9_ = true;
            }
            _loc8_ = this.createParallelPlan(_loc9_,param1,param2,param3,param4);
         }
         else if(param4.planType == "ActorFrameEventPlan")
         {
            _loc5_ = param4.planNodeList.length;
            _loc7_ = [];
            _loc6_ = 0;
            while(_loc6_ < _loc5_)
            {
               _loc7_.push(this.createPlanByNode(param1,param2,param3,param4.planNodeList[_loc6_]));
               _loc6_++;
            }
            ((_loc8_ = new ActorFrameEventPlan(_loc7_)) as BattleBasePlan).setStaticParams([param1,param2,param3]);
            (_loc8_ as BattleBasePlan).setDynamicParams(param4.params);
         }
         else if(param4.planType == "TriggerReceivePlan")
         {
            _loc5_ = param4.planNodeList.length;
            _loc7_ = [];
            _loc6_ = 0;
            while(_loc6_ < _loc5_)
            {
               _loc7_.push(this.createPlanByNode(param1,param2,param3,param4.planNodeList[_loc6_]));
               _loc6_++;
            }
            ((_loc8_ = new TriggerReceivePlan(_loc7_)) as BattleBasePlan).setStaticParams([param1,param2,param3]);
            (_loc8_ as BattleBasePlan).setDynamicParams(param4.params);
         }
         else if(param4.planType == "DamageSplitPlan")
         {
            ((_loc8_ = new DamageSplitPlan()) as DamageSplitPlan).setStaticParams([param1,param2,param3]);
            (_loc8_ as DamageSplitPlan).setDynamicParams(param4.params);
            _loc10_ = ((_loc8_ as DamageSplitPlan)[String(param4.params[0])] as Function).call();
            _loc5_ = param4.planNodeList.length;
            _loc7_ = [];
            _loc6_ = 0;
            while(_loc6_ < _loc5_)
            {
               if(_loc6_ != 0)
               {
                  _loc11_ = 0;
                  while(_loc11_ < _loc10_[_loc6_].length)
                  {
                     FightDamageVo(_loc10_[_loc6_][_loc11_]).isAddBuff = false;
                     _loc11_++;
                  }
               }
               _loc7_.push(this.createPlanByNode(param1,_loc10_[_loc6_] as Array,param3,param4.planNodeList[_loc6_]));
               _loc6_++;
            }
            _loc8_ = new ParallelPlan(_loc7_);
         }
         else if(param4.planType == "ActorShieldJudge")
         {
            _loc5_ = param4.planNodeList.length;
            _loc7_ = [];
            _loc6_ = 0;
            while(_loc6_ < _loc5_)
            {
               _loc7_.push(this.createPlanByNode(param1,param2,param3,param4.planNodeList[_loc6_]));
               _loc6_++;
            }
            ((_loc8_ = new ActorShieldJudge(_loc7_)) as ActorShieldJudge).setStaticParams([param1,param2,param3]);
            (_loc8_ as ActorShieldJudge).setDynamicParams(param4.params);
         }
         else
         {
            ((_loc8_ = new (_loc12_ = getClassByAlias(param4.planType))() as BattleBasePlan) as BattleBasePlan).setStaticParams([param1,param2,param3]);
            (_loc8_ as BattleBasePlan).setDynamicParams(param4.params);
         }
         if(param4.delay > 0)
         {
            _loc8_ = _loc13_ = new BattleDelayPlan(_loc8_,param4.delay);
         }
         if(param4.isDebug == 1 && _loc8_ is Plan)
         {
            (_loc8_ as Plan).isDebug = true;
         }
         return _loc8_;
      }
      
      private function createParallelPlan(param1:Boolean, param2:Dto_FightActor, param3:Array, param4:PlanGroup, param5:PlanNode) : Plan
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:Array = null;
         var _loc10_:Array = null;
         if(param1)
         {
            _loc10_ = [];
            _loc7_ = 0;
            while(_loc7_ < param3.length)
            {
               _loc8_ = param5.planNodeList.length;
               _loc9_ = new Array();
               _loc6_ = 0;
               while(_loc6_ < _loc8_)
               {
                  _loc9_.push(this.createPlanByNode(param2,[param3[_loc7_]],param4,param5.planNodeList[_loc6_]));
                  _loc6_++;
               }
               _loc10_.push(new ParallelPlan(_loc9_));
               _loc7_++;
            }
            return new ParallelPlan(_loc10_);
         }
         _loc8_ = param5.planNodeList.length;
         _loc9_ = new Array();
         _loc6_ = 0;
         while(_loc6_ < _loc8_)
         {
            _loc9_.push(this.createPlanByNode(param2,param3,param4,param5.planNodeList[_loc6_]));
            _loc6_++;
         }
         return new ParallelPlan(_loc9_);
      }
      
      private function createSerialPlan(param1:Boolean, param2:Dto_FightActor, param3:Array, param4:PlanGroup, param5:PlanNode) : Plan
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:Array = null;
         var _loc10_:Dto_FightActor = null;
         var _loc11_:Array = null;
         if(param1)
         {
            ObjectUtil.registerClass(Dto_FightActor);
            _loc10_ = ObjectUtil.clone(param2) as Dto_FightActor;
            _loc11_ = [];
            _loc7_ = 0;
            while(_loc7_ < param3.length)
            {
               _loc8_ = param5.planNodeList.length;
               _loc10_.targetIndex = FightDamageVo(param3[_loc7_]).targetIndex;
               _loc9_ = new Array();
               _loc6_ = 0;
               while(_loc6_ < _loc8_)
               {
                  _loc9_.push(this.createPlanByNode(_loc10_,[param3[_loc7_]],param4,param5.planNodeList[_loc6_]));
                  _loc6_++;
               }
               _loc11_.push(new SerialPlan(_loc9_));
               _loc7_++;
            }
            return new SerialPlan(_loc11_);
         }
         _loc8_ = param5.planNodeList.length;
         _loc9_ = new Array();
         _loc6_ = 0;
         while(_loc6_ < _loc8_)
         {
            _loc9_.push(this.createPlanByNode(param2,param3,param4,param5.planNodeList[_loc6_]));
            _loc6_++;
         }
         return new SerialPlan(_loc9_);
      }
   }
}
