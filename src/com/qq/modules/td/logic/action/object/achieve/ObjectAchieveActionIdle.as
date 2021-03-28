package com.qq.modules.td.logic.action.object.achieve
{
   import com.qq.modules.td.logic.action.basic.BasicAction;
   
   public class ObjectAchieveActionIdle extends BasicAction
   {
       
      
      public function ObjectAchieveActionIdle()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _gameObject.animation.gotoAndPlay("idle",true);
      }
   }
}
