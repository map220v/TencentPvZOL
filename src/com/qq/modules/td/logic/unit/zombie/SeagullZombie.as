package com.qq.modules.td.logic.unit.zombie
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.numeric.TDDamageCaculete;
   
   public class SeagullZombie extends BasicZombie
   {
       
      
      public var isHaveButter:Boolean;
      
      public function SeagullZombie()
      {
         super();
      }
      
      override public function revive(param1:Array = null) : void
      {
         super.revive(param1);
         this.objectModel.isFlying = true;
      }
      
      override public function update() : void
      {
         super.update();
         if(this.objectModel.hasBuffByType(TDConstant.TDBuffType_Butter))
         {
            this.isHaveButter = true;
            TDDamageCaculete.executeDamage(this,int.MIN_VALUE,TDConstant.AttackType_Normal,TDConstant.AttackMode_Normal,null);
         }
      }
   }
}
