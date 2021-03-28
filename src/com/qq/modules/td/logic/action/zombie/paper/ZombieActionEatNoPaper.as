package com.qq.modules.td.logic.action.zombie.paper
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.action.zombie.basic.ZombieActionEat;
   
   public class ZombieActionEatNoPaper extends ZombieActionEat
   {
       
      
      public function ZombieActionEatNoPaper()
      {
         super();
         _walkAnimFlagName = TDConstant.ZombieAnmi_WalkNopaper;
      }
   }
}
