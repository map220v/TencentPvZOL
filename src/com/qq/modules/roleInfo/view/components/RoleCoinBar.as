package com.qq.modules.roleInfo.view.components
{
   import asgui.controls.Image;
   import asgui.controls.Label;
   import asgui.resources.AssetManager;
   import com.greensock.TweenMax;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   
   public class RoleCoinBar extends BasicRoleBar
   {
       
      
      public var buyBar:DisplayObject;
      
      private var _coinMax_tween:TweenMax;
      
      public function RoleCoinBar()
      {
         super();
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         bg = new Image();
         bg.source = AssetManager.instance.GetClass("ModuleRoleInfo_CoinBar");
         bg.name = "Role_coinBar";
         addChild(bg);
         tf = new Label();
         tf.width = 60;
         tf.styleName = ".ProgressBar_Level";
         tf.x = 38;
         tf.y = 15;
         addChild(tf);
         this.buyBar = (bg.mcHolder as MovieClip).getChildByName("btn") as DisplayObject;
      }
      
      override public function setValue(param1:uint, param2:Boolean = false, param3:Boolean = false) : void
      {
         super.setValue(param1,param2,param3);
         this.cleanCoinMaxTween();
         if(param3)
         {
            this.addCoinMaxTween();
         }
      }
      
      private function addCoinMaxTween() : void
      {
         if(this._coinMax_tween == null)
         {
            tf.SetStyle("color","#ff0000");
            this._coinMax_tween = TweenMax.to(tf,1,{"glowFilter":{
               "color":16711680,
               "alpha":1,
               "blurX":2,
               "blurY":2,
               "strength":10,
               "quality":3
            }});
            this._coinMax_tween.repeat = -1;
            this._coinMax_tween.yoyo = true;
         }
      }
      
      private function cleanCoinMaxTween() : void
      {
         if(this._coinMax_tween != null)
         {
            tf.SetStyle("color","#ffffff");
            this._coinMax_tween.pause();
            this._coinMax_tween.kill();
            this._coinMax_tween = null;
            tf.filters = null;
         }
      }
      
      override public function Dispose() : void
      {
         this.cleanCoinMaxTween();
         super.Dispose();
      }
   }
}
