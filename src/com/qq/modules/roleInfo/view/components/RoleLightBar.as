package com.qq.modules.roleInfo.view.components
{
   import asgui.controls.Image;
   import asgui.controls.Label;
   import asgui.resources.AssetManager;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   
   public class RoleLightBar extends BasicRoleBar
   {
       
      
      private var m_bar:DisplayObject;
      
      private var m_btnBuy:DisplayObject;
      
      public function RoleLightBar()
      {
         super();
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         bg = new Image();
         bg.source = AssetManager.GetClass("ModuleRoleInfo_lightBar");
         bg.name = "Role_lightBar";
         addChild(bg);
         tf = new Label();
         tf.width = 70;
         tf.styleName = ".ProgressBar_Level";
         tf.x = 34;
         tf.y = 15;
         addChild(tf);
         this.m_bar = (bg.mcHolder as DisplayObjectContainer).getChildByName("bar") as DisplayObject;
         this.m_btnBuy = (bg.mcHolder as DisplayObjectContainer).getChildByName("btn") as DisplayObject;
      }
      
      public function get btnBuy() : DisplayObject
      {
         return this.m_btnBuy;
      }
      
      public function update(param1:Number, param2:Number) : void
      {
         tf.text = param1 + "/" + param2;
         var _loc3_:Number = Math.min(param1 / param2,1);
         this.m_bar.scaleX = _loc3_;
      }
   }
}
