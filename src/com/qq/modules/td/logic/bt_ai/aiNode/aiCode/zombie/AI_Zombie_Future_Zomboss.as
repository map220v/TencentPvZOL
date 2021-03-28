package com.qq.modules.td.logic.bt_ai.aiNode.aiCode.zombie
{
   import com.qq.constant.td.TDConstant;
   
   public class AI_Zombie_Future_Zomboss extends AI_Zombie_Pirate_Zomboss
   {
       
      
      public function AI_Zombie_Future_Zomboss(param1:int = 30)
      {
         super(param1);
      }
      
      override public function calculate() : Boolean
      {
         super.calculate();
         return true;
      }
      
      override protected function get rocketLaunchAction() : String
      {
         return TDConstant.ZAction_FutureZomboss_RocketLaunch;
      }
   }
}
