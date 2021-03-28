package com.qq.modules.td.logic.action.zombie.basic
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.data.game.unit.basic.TDGameObjectData;
   
   public class ZombieActionWalk2 extends ZombieActionWalk
   {
       
      
      public function ZombieActionWalk2()
      {
         super();
         _walkAnimFlagName = TDConstant.ZombieAnmi_Walk2;
         _speedType = TDGameObjectData.SPEED_WALK;
      }
   }
}
