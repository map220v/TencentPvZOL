package com.qq.modules.td.logic.action.zombie.basic
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.action.zombie.BasicZombieAction;
   import flash.events.Event;
   
   public class ZombieActionIntro extends BasicZombieAction
   {
       
      
      public function ZombieActionIntro()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _zombie.setFrozenAI(true);
         _zombie.setShadeVisible(false);
         _zombie.objectModel.addBuff(TDConstant.TDBuffID_God,null);
         _zombie.animation.gotoAndPlay("intro",false);
         _zombie.animation.addEventListener(Event.COMPLETE,this.onFinish,false,0,true);
      }
      
      private function onFinish(param1:Event = null) : void
      {
         _zombie.animation.removeEventListener(Event.COMPLETE,this.onFinish);
         _zombie.setShadeVisible(true);
         _zombie.setAction();
         _zombie.setFrozenAI(false);
      }
      
      override public function leaveState() : void
      {
         _zombie.animation.removeEventListener(Event.COMPLETE,this.onFinish);
         _zombie.objectModel.removeBuff(TDConstant.TDBuffID_God);
      }
   }
}
