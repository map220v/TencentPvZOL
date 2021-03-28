package com.qq.modules.td.logic.bt_ai.aiNode.aiCode.zombie
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.bt_ai.aiNode.BaseNodePvz;
   import com.qq.modules.td.logic.bt_ai.aiNode.executeNode.ExeDoAction;
   import com.qq.modules.td.logic.bt_ai.aiNode.requireNode.ReqAttackTarget;
   import com.qq.modules.td.logic.bt_ai.aiNode.requireNode.ReqCurAction;
   import com.qq.modules.td.logic.bt_ai.aiNode.requireNode.ReqZombieDurationExpire;
   import com.qq.modules.td.model.TDGameInfo;
   
   public class AI_Zombie_Quicksand extends BaseNodePvz
   {
       
      
      public function AI_Zombie_Quicksand()
      {
         super();
      }
      
      override public function calculate() : Boolean
      {
         var _loc2_:Array = null;
         if(ReqCurAction.calculate(selfObj,true,TDConstant.ZAction_ThrowQuickSand))
         {
            return true;
         }
         var _loc1_:Boolean = ReqZombieDurationExpire.calculateStatic(selfObj,true);
         if(_loc1_)
         {
            _loc2_ = TDGameInfo.getInstance().getGameObjectMapByCatalgAndType(TDConstant.UnitCatalog_Object,TDConstant.UnitType_QuickSand);
            if(_loc2_.length == 0)
            {
               ExeDoAction.calculateStatic(selfObj,TDConstant.ZAction_ThrowQuickSand);
               return true;
            }
         }
         if(ReqAttackTarget.calculateStatic(true,selfObj))
         {
            ExeDoAction.calculateStatic(selfObj,TDConstant.ZAction_Eat);
         }
         else
         {
            ExeDoAction.calculateStatic(selfObj,TDConstant.ZAction_Walk);
         }
         return true;
      }
   }
}
