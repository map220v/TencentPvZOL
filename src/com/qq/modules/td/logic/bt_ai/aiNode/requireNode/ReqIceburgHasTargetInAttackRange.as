package com.qq.modules.td.logic.bt_ai.aiNode.requireNode
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.bt_ai.aiUtils.TDSearchTargetUtils;
   import com.qq.modules.td.logic.numeric.TDCheckCollision;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.model.TDGameInfo;
   
   public class ReqIceburgHasTargetInAttackRange extends ReqHasZombieInAttackRange
   {
       
      
      public function ReqIceburgHasTargetInAttackRange()
      {
         super();
      }
      
      override public function calculate() : Boolean
      {
         var _loc2_:IGameObject = null;
         var _loc3_:Array = null;
         var _loc4_:IGameObject = null;
         var _loc1_:Array = TDSearchTargetUtils.getZombieList(selfObj,[mySelfData.roadIndex]);
         for each(_loc2_ in _loc1_)
         {
            if(TDCheckCollision.isCollision(_loc2_,_loc2_.damageArea,selfObj,selfObj.attackArea))
            {
               selfObj.setAttackTarget(_loc2_);
               return true;
            }
         }
         _loc3_ = TDGameInfo.getInstance().getGameObjectMapByCatalgAndType(TDConstant.UnitCatalog_Bullet,TDConstant.BulletType_FireBall);
         for each(_loc4_ in _loc3_)
         {
            if(TDCheckCollision.isCollision(_loc4_,_loc4_.attackArea,selfObj,selfObj.attackArea))
            {
               selfObj.setAttackTarget(_loc3_[0]);
               return true;
            }
         }
         return false;
      }
   }
}
