package com.qq.modules.td.logic.action.zombie.paper
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.data.game.unit.basic.TDGameObjectData;
   import com.qq.modules.td.logic.action.zombie.basic.ZombieActionWalk;
   
   public class ZombieActionWalkNoPaper extends ZombieActionWalk
   {
       
      
      public function ZombieActionWalkNoPaper()
      {
         super();
         _walkAnimFlagName = TDConstant.ZombieAnmi_WalkNopaper;
         _speedType = TDGameObjectData.SPEED_RUN;
      }
   }
}
