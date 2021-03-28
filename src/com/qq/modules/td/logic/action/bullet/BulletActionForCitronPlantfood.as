package com.qq.modules.td.logic.action.bullet
{
   import com.qq.constant.td.TDConstant;
   import com.qq.constant.td.TDZombieBodySizeType;
   import com.qq.modules.td.logic.bt_ai.aiUtils.TDSearchTargetUtils;
   import com.qq.modules.td.logic.numeric.TDCheckCollision;
   import com.qq.modules.td.logic.numeric.TDDamageCaculete;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.logic.unit.object.TDNormalObject;
   import com.qq.modules.td.logic.unit.zombie.BasicZombie;
   import com.qq.modules.td.model.TDGameInfo;
   
   public class BulletActionForCitronPlantfood extends BulletActionLine
   {
       
      
      public function BulletActionForCitronPlantfood()
      {
         super();
      }
      
      override protected function updateBulletState() : void
      {
         var _loc1_:Vector.<IGameObject> = null;
         var _loc2_:IGameObject = null;
         if(!TDGameInfo.getInstance().isInScreen(_bullet.x + 100,_bullet.y))
         {
            doBulletBoom();
         }
         else
         {
            _loc1_ = TDSearchTargetUtils.searchTargetForBullet(_bullet,[TDCheckCollision.getNewObjRect(_bullet,_bullet.damageArea)],[_bullet.objectModel.roadIndex]);
            for each(_loc2_ in _loc1_)
            {
               if(!this.getIsCanKickAway(_loc2_))
               {
                  if(!this.getIsCanGoThrough(_loc2_))
                  {
                     doBulletBoom(_loc2_);
                  }
                  TDDamageCaculete.caculateBulletDamage(_bullet,_loc2_);
               }
               _loc2_.setAction(TDConstant.ObjectAction_KickedAway);
            }
         }
      }
      
      private function getIsCanKickAway(param1:IGameObject) : Boolean
      {
         if(param1.objectModel.unitCatalog == TDConstant.UnitCatalog_Zombie && ((param1 as BasicZombie).zombieData.zombiestaticInfo.bodySize == TDZombieBodySizeType.ZOMBIE_BODY_SIZE_SMALL || (param1 as BasicZombie).zombieData.zombiestaticInfo.bodySize == TDZombieBodySizeType.ZOMBIE_BODY_SIZE_NORMAL || (param1 as BasicZombie).zombieData.zombiestaticInfo.bodySize == TDZombieBodySizeType.ZOMBIE_BODY_SIZE_LARGE))
         {
            return true;
         }
         if(param1.objectModel.unitCatalog == TDConstant.UnitCatalog_Object)
         {
            return (param1 as TDNormalObject).objData.objectStaticInfo.isCanMove > 0;
         }
         return false;
      }
      
      private function getIsCanGoThrough(param1:IGameObject) : Boolean
      {
         if(param1.objectModel.unitCatalog == TDConstant.UnitCatalog_Zombie && (param1 as BasicZombie).zombieData.zombiestaticInfo.bodySize == TDZombieBodySizeType.ZOMBIE_BODY_SIZE_GIANT)
         {
            return false;
         }
         return true;
      }
   }
}
