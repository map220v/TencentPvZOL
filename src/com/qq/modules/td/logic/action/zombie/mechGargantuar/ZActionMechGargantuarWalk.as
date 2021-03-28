package com.qq.modules.td.logic.action.zombie.mechGargantuar
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.action.zombie.basic.ZombieActionWalk;
   import com.qq.modules.td.logic.unit.zombie.BasicZombie;
   
   public class ZActionMechGargantuarWalk extends ZombieActionWalk
   {
       
      
      public function ZActionMechGargantuarWalk()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         if(_gameObject.getRunningProp(TDConstant.Gameobject_Prop_Mech_Gargantuar_Has_Summoned) == true)
         {
            (_gameObject as BasicZombie).setBoneVisible("pod",false);
         }
      }
   }
}
