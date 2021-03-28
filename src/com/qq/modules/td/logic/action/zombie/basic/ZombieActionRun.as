package com.qq.modules.td.logic.action.zombie.basic
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.data.game.unit.basic.TDGameObjectData;
   
   public class ZombieActionRun extends ZombieActionWalk
   {
       
      
      public function ZombieActionRun()
      {
         super();
         _walkAnimFlagName = TDConstant.ZombieAnmi_Run;
         _speedType = TDGameObjectData.SPEED_RUN;
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
      }
   }
}
