package com.qq.modules.td.logic.action.zombie.sarcophagus
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.action.zombie.basic.ZombieActionWalk;
   
   public class ZombieSarcophagusActionSpecialWalk extends ZombieActionWalk
   {
       
      
      public function ZombieSarcophagusActionSpecialWalk()
      {
         super();
         _walkAnimFlagName = TDConstant.ZombieAnmi_SpecialWalk;
      }
   }
}
