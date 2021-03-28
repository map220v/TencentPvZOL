package com.qq.modules.td.logic.action.zombie.basic
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.TDGameObjectCmd;
   
   public class ZombieActionDeathCamel extends ZombieActionDeath
   {
       
      
      public function ZombieActionDeathCamel()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         TDGameObjectCmd.addGameObjectByPos(TDConstant.UnitCatalog_Zombie,TDConstant.ZombieType_Egypt_Basic,_zombie.x,_zombie.y);
      }
   }
}
