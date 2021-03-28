package com.qq.modules.td.logic.action.zombie.emperorQin
{
   import com.qq.modules.td.logic.action.basic.BasicAction;
   
   public class ZActionEmperorQinSecondPhaseAttack extends BasicAction
   {
       
      
      public function ZActionEmperorQinSecondPhaseAttack()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _gameObject.animation.gotoAndPlay("idle",true);
      }
      
      override public function leaveState() : void
      {
         super.leaveState();
      }
   }
}
