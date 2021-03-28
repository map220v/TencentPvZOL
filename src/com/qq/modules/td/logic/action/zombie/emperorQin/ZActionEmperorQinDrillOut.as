package com.qq.modules.td.logic.action.zombie.emperorQin
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.action.basic.BasicAction;
   import flash.events.Event;
   
   public class ZActionEmperorQinDrillOut extends BasicAction
   {
       
      
      public function ZActionEmperorQinDrillOut()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _gameObject.setFrozenAI(true);
         _gameObject.objectModel.addBuff(TDConstant.TDBuffID_God,_gameObject);
         _gameObject.animation.addEventListener(Event.COMPLETE,this.onComplete);
         _gameObject.animation.gotoAndPlay("drillOut");
      }
      
      private function onComplete(param1:Event) : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onComplete);
         _gameObject.setAction();
         _gameObject.setRunningProp(TDConstant.GameObject_Prop_EmperorQin_State,1);
         _gameObject.setRunningProp(TDConstant.GameObject_Prop_BossStateChangeFinished,true);
         _gameObject.setFrozenAI(false);
      }
      
      override public function runningState() : void
      {
         super.runningState();
      }
      
      override public function leaveState() : void
      {
         super.leaveState();
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onComplete);
      }
   }
}
