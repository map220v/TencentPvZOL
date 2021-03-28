package com.qq.modules.td.logic.bt_ai.aiNode.aiCode.plant
{
   import com.qq.CommandName;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.td.logic.bt_ai.aiNode.BaseNodePvz;
   import com.qq.modules.td.logic.bt_ai.aiNode.executeNode.ExeDoAction;
   import com.qq.modules.td.logic.unit.plant.BasicPlant;
   import com.qq.modules.td.logic.unit.zombie.BasicZombie;
   import com.qq.utils.CommandDispatcher;
   
   public class AI_plant_Garlic extends BaseNodePvz
   {
       
      
      public function AI_plant_Garlic(param1:int = 30)
      {
         super(param1);
      }
      
      override protected function initlize() : void
      {
         super.initlize();
         CommandDispatcher._dispatcher.addEventListener(CommandName.TD_ZombieEatPlant,this.onEatHandler);
      }
      
      private function onEatHandler(param1:CommonEvent) : void
      {
         var _loc2_:Array = param1.param as Array;
         if(!(_loc2_[0] is BasicPlant))
         {
            return;
         }
         var _loc3_:BasicPlant = _loc2_[0];
         var _loc4_:BasicZombie = _loc2_[1];
         if(_loc3_.uid == selfObj.uid && _loc4_ && _loc4_.zombieData.zombiestaticInfo.getParam(TDConstant.Zombie_Param_IsMachine) == 0 && !_loc4_.zombieData.hasBuff(TDConstant.TDBuffID_God))
         {
            if(_loc4_.zombieData.zombiestaticInfo.getParam(TDConstant.Zombie_Param_Forbid_ChangePath) == 0 && _loc4_.zombieData.zombiestaticInfo.bodySize < 4)
            {
               _loc4_.setAction(TDConstant.ZAction_WalkToAnotherRow,null,true);
            }
         }
      }
      
      override public function calculate() : Boolean
      {
         var _loc1_:Number = selfObj.objectModel.curHp.get() / selfObj.objectModel.maxHp.get();
         if(_loc1_ >= 0.67)
         {
            ExeDoAction.calculateStatic(selfObj,TDConstant.PGarlic_Idle1);
         }
         else if(_loc1_ >= 0.34)
         {
            ExeDoAction.calculateStatic(selfObj,TDConstant.PGarlic_Idle2);
         }
         else if(_loc1_ > 0)
         {
            ExeDoAction.calculateStatic(selfObj,TDConstant.PGarlic_Idle3);
         }
         return true;
      }
   }
}
