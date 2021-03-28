package com.qq.modules.td.logic.action.zombie.monkeyCharmer
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.action.zombie.basic.ZombieActionEat;
   import com.qq.modules.td.logic.numeric.TDDamageCaculete;
   
   public class ZActionMonkeyAttack extends ZombieActionEat
   {
       
      
      public function ZActionMonkeyAttack()
      {
         super();
      }
      
      override public function runningState() : void
      {
         super.runningState();
         if(_zombie.curAttackTarget && _zombie.curAttackTarget.isVaild)
         {
            _zombie.curAttackTarget.objectModel.addBuff(TDConstant.TDBuffID_MonkeyEmbrace,_zombie);
            TDDamageCaculete.caculateZombieDamage(_zombie,_zombie.curAttackTarget);
         }
         else
         {
            _gameObject.Dispose();
         }
      }
   }
}
