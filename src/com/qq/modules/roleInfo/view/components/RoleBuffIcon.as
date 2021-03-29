package com.qq.modules.roleInfo.view.components
{
   import asgui.resources.AssetManager;
   import com.qq.display.QCanvas;
   import com.qq.utils.UtilsManager;
   import flash.display.MovieClip;
   
   public class RoleBuffIcon extends QCanvas
   {
       
      
      public const ICON_WIDTH:uint = 25;
      
      public const ICON_HEIGHT:uint = 25;
      
      public var iconName:String;
      
      public var flashEffectMc:MovieClip;
      
      public function RoleBuffIcon()
      {
         super();
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         var _loc1_:MovieClip = AssetManager.instance.GetNewClass("ModuleRole_Buff_BG") as MovieClip;
         addChild(_loc1_);
      }
      
      public function removeFlashEffect() : void
      {
         if(this.flashEffectMc != null)
         {
            this.flashEffectMc.stop();
            UtilsManager.removeFromContainer(this.flashEffectMc);
         }
      }
      
      public function addFlashEffect() : void
      {
         if(this.flashEffectMc == null)
         {
            this.flashEffectMc = AssetManager.GetNewClass("module_entry_icon_effect") as MovieClip;
            if(this.flashEffectMc == null)
            {
               return;
            }
            this.flashEffectMc.mouseChildren = false;
            this.flashEffectMc.mouseEnabled = false;
            this.flashEffectMc.scaleX = this.flashEffectMc.scaleY = 0.4;
         }
         this.parent.addChild(this.flashEffectMc);
         this.flashEffectMc.x = this.x + this.ICON_WIDTH * 0.5;
         this.flashEffectMc.y = this.y + this.ICON_HEIGHT * 0.5;
         this.flashEffectMc.play();
      }
   }
}
