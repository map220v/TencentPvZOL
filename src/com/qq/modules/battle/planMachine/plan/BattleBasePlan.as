package com.qq.modules.battle.planMachine.plan
{
   import PVZ.Cmd.Dto_FightActor;
   import com.qq.GameGloble;
   import com.qq.modules.battle.constant.BattleConst;
   import com.qq.modules.battle.model.BattleUnitModel;
   import com.qq.modules.battle.planMachine.core.PlanGroup;
   import com.qq.utils.tqos.TQOSUtils;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   import flash.utils.getQualifiedClassName;
   import org.as3commons.logging.api.getLogger;
   import tencent.tools.planMachine.ICallBack;
   import tencent.tools.planMachine.Plan;
   
   public class BattleBasePlan extends Plan
   {
      
      public static var planNum:int = 0;
      
      public static const Param_Shooter:int = 0;
      
      public static const Param_Targets:int = 1;
      
      public static const Param_PlanGroup:int = 2;
       
      
      public var planGroup:PlanGroup;
      
      public var actor:Dto_FightActor;
      
      public var damageList:Array;
      
      protected var staticParams:Array;
      
      protected var runBackUpTime:Boolean = true;
      
      private var backUpTimer:Timer;
      
      public function BattleBasePlan()
      {
         super();
         GameGloble.injector.injectInto(this,false);
         ++planNum;
      }
      
      public final function setStaticParams(param1:Array) : void
      {
         this.actor = param1[Param_Shooter];
         this.damageList = param1[Param_Targets];
         this.planGroup = param1[Param_PlanGroup];
         this.staticParams = param1;
      }
      
      override public function doPlan(param1:ICallBack) : void
      {
         if(isDebug)
         {
            getLogger("battle").debug(" posIndex: " + this.actor.actorIndex);
         }
         super.doPlan(param1);
         if(this.runBackUpTime)
         {
            this.backUpTimer = new Timer(12000,1);
            BattleUnitModel.getInstance().battleTimer.addTimer(this.backUpTimer);
            this.backUpTimer.addEventListener(TimerEvent.TIMER_COMPLETE,this.debugCallBack);
            this.backUpTimer.start();
         }
      }
      
      private function debugCallBack(param1:TimerEvent) : void
      {
         var _loc2_:String = null;
         if(!isCanceled)
         {
            _loc2_ = getQualifiedClassName(this);
            _loc2_ = _loc2_.replace("com.qq.modules.battle.planMachine.plan::","");
            if(_loc2_ == "ActorFrameEventPlan" || _loc2_ == "TriggerReceivePlan" || _loc2_ == "DamageSplitPlan" || _loc2_ == "ActorShieldJudge")
            {
               return;
            }
            TQOSUtils.getInstance().reportMsg("[battle plan no cancel:" + _loc2_ + "|" + BattleUnitModel.getInstance().battleTimer.timeRate + "]");
            if(this.actor)
            {
               getLogger("battle").debug("[battle plan no cancel:" + _loc2_ + "|" + BattleUnitModel.getInstance().battleTimer.timeRate + "|" + this.actor.actorIndex + "]");
            }
            else
            {
               getLogger("battle").debug("[battle plan no cancel:" + _loc2_ + "|" + BattleUnitModel.getInstance().battleTimer.timeRate + "]");
            }
            this.setComplete();
         }
      }
      
      override protected function setComplete() : void
      {
         if(isDebug)
         {
            getLogger("battle").debug(" posIndex: " + this.actor.actorIndex);
         }
         super.setComplete();
      }
      
      protected function get isRightSide() : Boolean
      {
         if(this.actor)
         {
            return this.actor.actorIndex % 2 == 0;
         }
         return false;
      }
      
      override protected function dispose() : void
      {
         if(this.backUpTimer)
         {
            this.backUpTimer.stop();
            BattleUnitModel.getInstance().battleTimer.removeTimer(this.backUpTimer);
            this.backUpTimer.removeEventListener(TimerEvent.TIMER_COMPLETE,this.debugCallBack);
            this.backUpTimer = null;
         }
         this.planGroup = null;
         --planNum;
         super.dispose();
      }
      
      protected function getMoveToXY(param1:int) : Point
      {
         var _loc2_:int = 0;
         var _loc3_:Point = null;
         if(param1 % 2 == 0)
         {
            _loc2_ = param1;
            _loc3_ = BattleConst.getCardXYByPosindex(_loc2_);
            _loc3_.x -= BattleConst.GRID_WIDTH;
         }
         else
         {
            _loc2_ = param1;
            _loc3_ = BattleConst.getCardXYByPosindex(_loc2_);
            _loc3_.x += BattleConst.GRID_WIDTH;
         }
         return _loc3_;
      }
   }
}
