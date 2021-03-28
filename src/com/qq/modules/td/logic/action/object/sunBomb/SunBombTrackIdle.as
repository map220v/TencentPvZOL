package com.qq.modules.td.logic.action.object.sunBomb
{
   import com.qq.modules.td.logic.action.basic.BasicAction;
   
   public class SunBombTrackIdle extends BasicAction
   {
       
      
      public function SunBombTrackIdle()
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
      }
   }
}
