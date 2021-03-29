package com.qq.modules.roleInfo.view.components
{
   import asgui.controls.Image;
   import asgui.controls.Label;
   import asgui.resources.AssetManager;
   import com.greensock.TweenLite;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   
   public class RolePhysicalBar extends BasicRoleBar
   {
       
      
      private var bar:Sprite;
      
      public var buyBar:DisplayObject;
      
      public function RolePhysicalBar()
      {
         super();
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         bg = new Image();
         bg.source = AssetManager.instance.GetClass("ModuleRoleInfo_physicalBar");
         bg.name = "Role_physicalBar";
         addChild(bg);
         tf = new Label();
         tf.width = 70;
         tf.styleName = ".ProgressBar_Level";
         tf.x = 22;
         tf.y = 15;
         addChild(tf);
         this.bar = (bg.mcHolder as MovieClip).getChildByName("bar") as Sprite;
         this.buyBar = (bg.mcHolder as MovieClip).getChildByName("btn") as DisplayObject;
      }
      
      public function update(param1:Number, param2:Number, param3:Boolean) : void
      {
         tf.text = param1 + "/" + param2;
         var _loc4_:Number = Math.min(param1 / param2,1);
         if(param3)
         {
            TweenLite.to(this.bar,3,{"scaleX":_loc4_});
         }
         else
         {
            this.bar.scaleX = _loc4_;
         }
      }
   }
}
