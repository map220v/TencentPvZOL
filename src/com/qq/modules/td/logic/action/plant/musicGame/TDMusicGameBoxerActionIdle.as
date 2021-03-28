package com.qq.modules.td.logic.action.plant.musicGame
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.action.basic.BasicAction;
   
   public class TDMusicGameBoxerActionIdle extends BasicAction
   {
       
      
      public function TDMusicGameBoxerActionIdle()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _gameObject.animation.gotoAndPlay(TDConstant.PlantAnmi_Idle,true);
      }
   }
}
