package com.qq.modules.td.view.game.ui
{
   import asgui.resources.AssetManager;
   import com.qq.GameGloble;
   import com.qq.display.QCanvas;
   import flash.display.MovieClip;
   
   public class TDSpecailSkillCastIcon extends QCanvas
   {
       
      
      public var specialSkillFlag:MovieClip;
      
      public function TDSpecailSkillCastIcon()
      {
         super(TDSpecailSkillCastIconMediator);
         buttonMode = true;
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.name = "TDSpecailSkillPanel";
         this.specialSkillFlag = AssetManager.instance.GetNewClass("TDUI_PlantFoodFlag") as MovieClip;
         this.specialSkillFlag.mc.stop();
         this.specialSkillFlag.x = this.specialSkillFlag.width * 0.5;
         addChild(this.specialSkillFlag);
         width = this.specialSkillFlag.width;
         height = this.specialSkillFlag.height;
         if(GameGloble.debugUIGraphics)
         {
            SetStyle("backgroundColor","#ff0000");
            SetStyle("backgroundAlpha","0.6");
         }
      }
      
      public function setVisable(param1:Boolean) : void
      {
         visible = param1;
         if(visible)
         {
            this.specialSkillFlag.mc.play();
         }
         else
         {
            this.specialSkillFlag.mc.stop();
         }
      }
   }
}
