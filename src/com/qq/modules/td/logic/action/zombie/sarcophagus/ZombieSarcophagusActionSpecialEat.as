package com.qq.modules.td.logic.action.zombie.sarcophagus
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.action.zombie.basic.ZombieActionEat;
   
   public class ZombieSarcophagusActionSpecialEat extends ZombieActionEat
   {
       
      
      public function ZombieSarcophagusActionSpecialEat()
      {
         super();
         _walkAnimFlagName = TDConstant.ZombieAnmi_SpecialEat;
      }
   }
}
