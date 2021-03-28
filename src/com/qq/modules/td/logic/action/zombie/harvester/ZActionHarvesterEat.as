package com.qq.modules.td.logic.action.zombie.harvester
{
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.logic.action.zombie.basic.ZombieActionEat;
   import com.qq.modules.td.logic.numeric.TDDamageCaculete;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   
   public class ZActionHarvesterEat extends ZombieActionEat
   {
       
      
      private var m_targetList:Array;
      
      public function ZActionHarvesterEat()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         this.m_targetList = param1[0] as Array;
         super.enterState(param1);
         _gameObject.animation.gotoAndPlay("attack",true);
      }
      
      override protected function onEat() : void
      {
         var _loc1_:IGameObject = null;
         if(this.m_targetList == null)
         {
            return;
         }
         for each(_loc1_ in this.m_targetList)
         {
            this.damageTarget(_loc1_);
         }
         TDSoundCmd.zombieEat();
      }
      
      private function damageTarget(param1:IGameObject) : void
      {
         TDDamageCaculete.caculateZombieDamage(_zombie,param1);
      }
   }
}
