package com.qq.modules.td.logic.action.bullet
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.bt_ai.aiUtils.TDSearchTargetUtils;
   import com.qq.modules.td.logic.numeric.TDCheckCollision;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.logic.unit.object.TDNormalObject;
   import com.qq.modules.td.logic.unit.zombie.BasicZombie;
   import com.qq.modules.td.model.TDGameInfo;
   
   public class BActionForCococnutPlantfood extends BulletActionLine
   {
       
      
      public function BActionForCococnutPlantfood()
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
               if(!this.getIsCanPushTarget(_loc2_))
               {
                  doBulletBoom();
               }
               if(_loc2_.objectModel.unitCatalog == TDConstant.UnitCatalog_Zombie)
               {
                  _loc2_.objectModel.addBuff(TDConstant.TDBuffID_SpikeStun,_bullet);
               }
               _loc2_.setLocation(_bullet.x + _bullet.damageArea.right,_loc2_.y);
            }
         }
      }
      
      private function getIsCanPushTarget(param1:IGameObject) : Boolean
      {
         if(param1.objectModel.unitCatalog == TDConstant.UnitCatalog_Zombie && (param1 as BasicZombie).zombieData.zombiestaticInfo.catalog != TDConstant.ZombieCatalog_Boss)
         {
            return true;
         }
         if(param1.objectModel.unitCatalog == TDConstant.UnitCatalog_Object && !(param1 as TDNormalObject).objData.objectStaticInfo.isCanMove)
         {
            return false;
         }
         return false;
      }
   }
}
