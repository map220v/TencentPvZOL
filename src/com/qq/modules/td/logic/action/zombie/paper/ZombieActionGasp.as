package com.qq.modules.td.logic.action.zombie.paper
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.action.zombie.BasicZombieAction;
   import flash.events.Event;
   
   public class ZombieActionGasp extends BasicZombieAction
   {
       
      
      public function ZombieActionGasp()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _zombie.animation.gotoAndPlay(TDConstant.ZombieAnmi_Gasp);
         _zombie.animation.addEventListener(Event.COMPLETE,this.onFinishGasp);
      }
      
      override public function leaveState() : void
      {
         _zombie.animation.removeEventListener(Event.COMPLETE,this.onFinishGasp);
      }
      
      private function onFinishGasp(param1:Event) : void
      {
         _zombie.setAction();
      }
   }
}
