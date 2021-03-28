package com.qq.modules.main.model.settings.battle.planSettings
{
   import com.qq.modules.battle.constant.BattleConst;
   import com.qq.modules.battle.model.BattleRoundStateModel;
   import com.qq.modules.battle.planMachine.PlanFactory;
   import com.qq.modules.dummy.model.DummyDataFactory;
   import com.qq.modules.dummy.model.DummyZombieSkillTemplate;
   import com.qq.modules.main.model.SettingsModel;
   import com.qq.modules.main.model.settings.battle.BattleLineupCardSkillTemplate;
   
   public class PlanSetting
   {
       
      
      public var attackPlanList:Vector.<PlanTree>;
      
      public var lossShieldPlanTree:Vector.<PlanTree>;
      
      public var assetTree:AssetTree;
      
      public var rageEffectType:int;
      
      public var planCardId:int;
      
      private var xml:XML;
      
      public function PlanSetting(param1:XML)
      {
         super();
         this.xml = param1;
      }
      
      public function init() : void
      {
         this.loadXml(this.xml);
      }
      
      public function loadXml(param1:XML) : void
      {
         var _loc2_:PlanTree = null;
         var _loc3_:XML = null;
         var _loc4_:XML = null;
         this.planCardId = param1.@cardId;
         if(param1.rageTree[0] != null)
         {
            this.rageEffectType = param1.rageTree[0].@rageEffectType;
         }
         this.attackPlanList = new Vector.<PlanTree>();
         for each(_loc3_ in param1.attackTree[0]..tree)
         {
            _loc2_ = new PlanTree(_loc3_);
            this.attackPlanList.push(_loc2_);
         }
         this.lossShieldPlanTree = new Vector.<PlanTree>();
         if(param1.lossShieldTree[0])
         {
            for each(_loc4_ in param1.lossShieldTree[0]..tree)
            {
               _loc2_ = new PlanTree(_loc4_);
               this.lossShieldPlanTree.push(_loc2_);
            }
         }
         this.assetTree = new AssetTree(param1.assetsTree[0]);
      }
      
      public function getAttackPlanTree(param1:int, param2:int) : PlanTree
      {
         var _loc3_:int = 0;
         var _loc4_:BattleLineupCardSkillTemplate = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:DummyZombieSkillTemplate = null;
         if(!BattleConst.isDummyZombieByPos(param1))
         {
            if(BattleRoundStateModel.getInstance().curRound == 0)
            {
               return PlanFactory.createLeaderSkillPlanTree();
            }
            if((_loc4_ = SettingsModel.instance.battleCardSkillSetting.getBattleLineupCardSkillTemplateById(param2)).animId != 0)
            {
               param2 = _loc4_.animId;
            }
            _loc3_ = this.attackPlanList.length;
            _loc5_ = 0;
            while(_loc5_ < _loc3_)
            {
               _loc6_ = this.attackPlanList[_loc5_].skillIdList.length;
               _loc7_ = 0;
               while(_loc7_ < _loc6_)
               {
                  if(this.attackPlanList[_loc5_].skillIdList[_loc7_] == param2)
                  {
                     return this.attackPlanList[_loc5_];
                  }
                  _loc7_++;
               }
               _loc5_++;
            }
            return PlanFactory.createLeaderSkillPlanTree();
         }
         if((_loc8_ = DummyDataFactory.getInstance().getSkillInfoByID(param2)) != null)
         {
            if(BattleRoundStateModel.getInstance().curRound == 0)
            {
               return new PlanTree();
            }
            _loc3_ = this.attackPlanList.length;
            if(_loc3_ > 0)
            {
               return this.attackPlanList[0];
            }
         }
         return PlanFactory.createDummyPassiveSkillPlanTree();
      }
      
      public function getLossShieldPlanTree() : PlanTree
      {
         var _loc1_:int = this.lossShieldPlanTree.length;
         if(_loc1_ > 0)
         {
            return this.lossShieldPlanTree[0];
         }
         return null;
      }
   }
}
