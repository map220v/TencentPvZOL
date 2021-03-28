package com.qq.modules.td.logic.action.object.nutsShield
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.action.basic.BasicAction;
   import flash.events.Event;
   
   public class NutsShieldOnAction extends BasicAction
   {
       
      
      public function NutsShieldOnAction()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _gameObject.animation.addEventListener(Event.COMPLETE,this.onFinish);
         _gameObject.animation.gotoAndPlay("plantfood_shieldON");
      }
      
      protected function onFinish(param1:Event) : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinish);
         _gameObject.setAction(TDConstant.NutsShieldIdleAction);
      }
   }
}
