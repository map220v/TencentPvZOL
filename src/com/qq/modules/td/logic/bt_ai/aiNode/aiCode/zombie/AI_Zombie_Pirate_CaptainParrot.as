package com.qq.modules.td.logic.bt_ai.aiNode.aiCode.zombie
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.bt_ai.aiNode.BaseNodePvz;
   import com.qq.modules.td.logic.bt_ai.aiNode.executeNode.ExeDoAction;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.model.TDGameInfo;
   
   public class AI_Zombie_Pirate_CaptainParrot extends BaseNodePvz
   {
       
      
      public function AI_Zombie_Pirate_CaptainParrot(param1:int = 30)
      {
         super(param1);
      }
      
      override public function calculate() : Boolean
      {
         var _loc1_:Array = null;
         var _loc2_:Array = null;
         var _loc3_:IGameObject = null;
         if(selfObj.curAttackTarget == null || !selfObj.curAttackTarget.isVaild)
         {
            _loc1_ = TDGameInfo.getInstance().getGameObjectMapByCatalg(TDConstant.UnitCatalog_Plant);
            _loc2_ = [];
            for each(_loc3_ in _loc1_)
            {
               _loc2_.push(_loc3_);
            }
            if(_loc2_.length > 0)
            {
               selfObj.setAttackTarget(_loc2_[int(Math.random() * _loc2_.length)]);
            }
            else
            {
               selfObj.Dispose();
            }
         }
         if(selfObj.getActionID() != TDConstant.ZAction_PirateParrot_Fly && selfObj.getActionID() != TDConstant.ZAction_PirateParrot_Carry)
         {
            ExeDoAction.calculateStatic(selfObj,TDConstant.ZAction_PirateParrot_Fly);
         }
         return true;
      }
   }
}
