package com.qq.modules.battle.planMachine.plan
{
   import com.qq.modules.battle.model.BattleRoundStateModel;
   import com.qq.modules.battle.model.vo.FightDamageVo;
   import com.qq.modules.main.model.settings.battle.planSettings.PlanNode;
   import tencent.tools.planMachine.ICallBack;
   import tencent.tools.planMachine.IPlan;
   import tencent.tools.planMachine.ParallelPlan;
   
   public class DamageSplitPlan extends BattleBasePlan
   {
       
      
      public function DamageSplitPlan()
      {
         super();
      }
      
      override public function doPlan(param1:ICallBack) : void
      {
         super.doPlan(param1);
      }
      
      public function repeaterDamageList() : Array
      {
         var _loc4_:FightDamageVo = null;
         var _loc5_:Number = NaN;
         var _loc6_:FightDamageVo = null;
         var _loc7_:FightDamageVo = null;
         var _loc1_:Array = [];
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         while(_loc3_ < damageList.length)
         {
            _loc5_ = ((_loc4_ = damageList[_loc3_] as FightDamageVo).changeHp + _loc4_.changeShield) * 0.5;
            (_loc6_ = new FightDamageVo()).clone(_loc4_);
            (_loc7_ = new FightDamageVo()).clone(_loc4_);
            if(_loc5_ <= _loc4_.changeShield)
            {
               _loc6_.changeHp = _loc5_ - _loc4_.changeShield;
               _loc6_.changeShield = _loc4_.changeShield;
               _loc7_.changeShield = 0;
               _loc7_.changeHp = _loc4_.changeHp - _loc6_.changeHp;
               _loc7_.changeRage = 0;
            }
            else
            {
               _loc6_.changeHp = 0;
               _loc6_.changeShield = _loc5_;
               _loc7_.changeHp = _loc4_.changeHp;
               _loc7_.changeShield -= _loc5_;
               _loc7_.changeRage = 0;
            }
            _loc1_[_loc3_] = _loc6_;
            _loc2_[_loc3_] = _loc7_;
            _loc3_++;
         }
         return [_loc1_,_loc2_];
      }
      
      private function createLittleBulletPlan(param1:Array) : IPlan
      {
         var _loc2_:PlanNode = new PlanNode();
         _loc2_.createNodeByData("BulletFlyPlanLineOneTarget",["pea_projectile","25","-30","300","50","1500"]);
         var _loc3_:IPlan = BattleRoundStateModel.getInstance().planFactory.createPlanByNode(actor,param1,planGroup,_loc2_);
         _loc2_ = new PlanNode();
         _loc2_.createNodeByData("InjuredPlanNomalGroup",["12","100"],1000);
         var _loc4_:IPlan = BattleRoundStateModel.getInstance().planFactory.createPlanByNode(actor,param1,planGroup,_loc2_);
         return new ParallelPlan([_loc3_,_loc4_]);
      }
      
      private function createBigBulletPlan(param1:Array) : IPlan
      {
         var _loc2_:PlanNode = new PlanNode();
         _loc2_.createNodeByData("BulletFlyPlanLineOneTarget",["bullet_xiaomoteng","25","-30","300","1","1"]);
         var _loc3_:IPlan = BattleRoundStateModel.getInstance().planFactory.createPlanByNode(actor,param1,planGroup,_loc2_);
         _loc2_ = new PlanNode();
         _loc2_.createNodeByData("InjuredPlanNomalGroup",["1","0"],1000);
         var _loc4_:IPlan = BattleRoundStateModel.getInstance().planFactory.createPlanByNode(actor,param1,planGroup,_loc2_);
         return new ParallelPlan([_loc3_,_loc4_]);
      }
   }
}
