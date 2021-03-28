package com.qq.modules.battle.planMachine.plan
{
   import com.qq.modules.battle.model.BattleUnitModel;
   import com.qq.modules.battle.view.control.BaseUnitControler;
   import com.qq.modules.battle.view.control.UnitBloodCtr;
   import com.qq.modules.battle.view.control.UnitShiedCtr;
   import tencent.tools.planMachine.ICallBack;
   
   public class ResetUnitTotalBlood extends BattleBasePlan
   {
       
      
      public function ResetUnitTotalBlood()
      {
         super();
      }
      
      override public function doPlan(param1:ICallBack) : void
      {
         var _loc4_:UnitBloodCtr = null;
         var _loc5_:UnitShiedCtr = null;
         super.doPlan(param1);
         var _loc2_:int = BattleUnitModel.getInstance().unitList.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(_loc4_ = BattleUnitModel.getInstance().unitList[_loc3_].getControlByType(BaseUnitControler.TYPE_BLOOD) as UnitBloodCtr)
            {
               _loc4_.resetBlood();
            }
            if(_loc5_ = BattleUnitModel.getInstance().unitList[_loc3_].getControlByType(BaseUnitControler.TYPE_SHIED) as UnitShiedCtr)
            {
               _loc5_.resetBlood();
            }
            _loc3_++;
         }
         setComplete();
      }
   }
}
