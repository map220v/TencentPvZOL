package com.qq.modules.td.logic.action.object.switcher
{
   import com.qq.modules.td.logic.action.basic.BasicAction;
   import com.qq.modules.td.logic.unit.object.TDNormalObject;
   
   public class SwitcherActionIdle extends BasicAction
   {
       
      
      private var _lastUpdateTime:Number;
      
      private var _existTime:int;
      
      public function SwitcherActionIdle()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _gameObject.animation.gotoAndPlay("idle",true);
      }
      
      override public function runningState() : void
      {
         (_gameObject as TDNormalObject).runAI();
      }
   }
}
