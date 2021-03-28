package com.qq.modules.td.view.components
{
   import asgui.resources.AssetManager;
   import com.qq.constant.td.TDShootingGameConstant;
   import com.qq.display.QCanvas;
   import com.qq.modules.td.view.game.layer.ITDLocationUpdatable;
   import flash.display.MovieClip;
   
   public class TDWindForcePanel extends QCanvas implements ITDLocationUpdatable
   {
       
      
      private var _windBar:MovieClip;
      
      public function TDWindForcePanel(param1:Class = null)
      {
         super(TDWindForcePanelMediator);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.width = 389;
         this.height = 74;
         this.x = 500;
         this._windBar = AssetManager.GetNewClass("TDUI_ShootingGameWindForceBar") as MovieClip;
         this._windBar.stop();
         this.addChild(this._windBar);
      }
      
      public function set windForce(param1:int) : void
      {
         this._windBar.gotoAndStop(param1 + 1 - TDShootingGameConstant.MIN_WIND_FORCE);
      }
      
      public function updateLocation() : void
      {
      }
   }
}
