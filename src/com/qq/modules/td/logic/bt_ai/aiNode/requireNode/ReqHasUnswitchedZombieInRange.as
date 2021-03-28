package com.qq.modules.td.logic.bt_ai.aiNode.requireNode
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.bt_ai.aiNode.BaseNodePvz;
   import com.qq.modules.td.logic.numeric.TDCheckCollision;
   import com.qq.modules.td.logic.unit.zombie.BasicZombie;
   import com.qq.modules.td.model.TDGameInfo;
   import tencent.tools.behaviourTrees.BehaviourTreeNodeType;
   
   public class ReqHasUnswitchedZombieInRange extends BaseNodePvz
   {
       
      
      public function ReqHasUnswitchedZombieInRange()
      {
         super(BehaviourTreeNodeType.REQUIRE);
      }
      
      override public function calculate() : Boolean
      {
         var _loc2_:* = undefined;
         var _loc3_:BasicZombie = null;
         var _loc1_:Array = TDGameInfo.getInstance().getZombieList([mySelfData.roadIndex],TDConstant.TDCamp_Enemy);
         for each(_loc2_ in _loc1_)
         {
            _loc3_ = _loc2_ as BasicZombie;
            if(_loc3_ != null)
            {
               if(TDCheckCollision.isCollision(_loc3_,_loc3_.attackArea,selfObj,selfObj.damageArea))
               {
                  if(!_loc3_.zombieData.hasSwitched)
                  {
                     selfObj.setAttackTarget(_loc3_);
                     return true;
                  }
               }
            }
         }
         return false;
      }
   }
}
