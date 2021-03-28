package com.qq.modules.td.logic.action.bullet
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.numeric.TDCheckCollision;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.model.TDGameInfo;
   
   public class BulletActionForDaffodil extends BulletActionLine
   {
       
      
      public function BulletActionForDaffodil()
      {
         super();
      }
      
      override protected function getFireTarget() : IGameObject
      {
         var _loc2_:IGameObject = null;
         var _loc1_:Array = TDGameInfo.getInstance().getGameObjectMapByCatalgAndType(TDConstant.UnitCatalog_Object,7800);
         for each(_loc2_ in _loc1_)
         {
            if(TDCheckCollision.isCollision(_loc2_,_loc2_.damageArea,_bullet,_bullet.damageArea))
            {
               return _loc2_;
            }
         }
         return super.getFireTarget();
      }
   }
}
