package com.qq.modules.td.logic.action.object.other
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.action.basic.BasicAction;
   
   public class ElectromagneticShieldIdle extends BasicAction
   {
       
      
      public function ElectromagneticShieldIdle()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _gameObject.animation.gotoAndPlay(TDConstant.ObjectAnmi_Idle,true);
      }
      
      override public function runningState() : void
      {
         super.runningState();
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
