package com.qq.modules.battle.model
{
   import com.qq.modules.battle.planMachine.PlanFactory;
   import com.tencent.protobuf.Int64;
   import org.as3commons.logging.api.getLogger;
   import tencent.tools.planMachine.IPlan;
   
   public class BattleRoundStateModel
   {
      
      private static var _instance:BattleRoundStateModel;
       
      
      public var curRound:int;
      
      public var totalRoundNum:int;
      
      public var curActionUid:Int64;
      
      public var cacheRoundPlanList:Array;
      
      public var cacheRoundPlan:IPlan;
      
      private var _planFactory:PlanFactory;
      
      private var _curRoundState:String;
      
      public function BattleRoundStateModel()
      {
         super();
         this._planFactory = new PlanFactory();
      }
      
      public static function getInstance() : BattleRoundStateModel
      {
         if(_instance == null)
         {
            _instance = new BattleRoundStateModel();
         }
         return _instance;
      }
      
      public function get planFactory() : PlanFactory
      {
         return this._planFactory;
      }
      
      public function get curRoundState() : String
      {
         return this._curRoundState;
      }
      
      public function set curRoundState(param1:String) : void
      {
         this._curRoundState = param1;
         getLogger("Battle").debug("第" + this.curRound + "回合: " + param1);
      }
      
      public function closeBattle() : void
      {
         var _loc1_:int = 0;
         var _loc2_:IPlan = null;
         if(this.cacheRoundPlan)
         {
            this.cacheRoundPlan.cancelPlan();
            this.cacheRoundPlan = null;
         }
         if(this.cacheRoundPlanList)
         {
            _loc1_ = 0;
            while(_loc1_ < this.cacheRoundPlanList.length)
            {
               _loc2_ = this.cacheRoundPlanList[_loc1_] as IPlan;
               _loc2_.cancelPlan();
               _loc1_++;
            }
            this.cacheRoundPlanList = [];
         }
      }
   }
}
