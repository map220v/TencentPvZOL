package com.qq.modules.battle.planMachine.plan
{
   import com.qq.modules.battle.constant.BattleConst;
   import flash.geom.Point;
   import tencent.tools.planMachine.ICallBack;
   import tencent.tools.planMachine.IPlan;
   
   public class MovePlanArchor extends MovePlanWarrior implements IPlan
   {
       
      
      public function MovePlanArchor()
      {
         super();
      }
      
      override public function doPlan(param1:ICallBack) : void
      {
         super.doPlan(param1);
      }
      
      override protected function getMoveToXY(param1:int) : Point
      {
         var _loc2_:int = 0;
         var _loc3_:Point = null;
         if(param1 % 2 == 0)
         {
            _loc2_ = param1 - 1;
            _loc3_ = BattleConst.getCardXYByPosindex(_loc2_);
            _loc3_.x = BattleConst.GRID_WIDTH * 3;
         }
         else
         {
            _loc2_ = param1 + 1;
            _loc3_ = BattleConst.getCardXYByPosindex(_loc2_);
            _loc3_.x = BattleConst.GRID_WIDTH * (BattleConst.GRID_WIDTH_NUM - 4);
         }
         return _loc3_;
      }
   }
}
