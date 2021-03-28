package com.qq.modules.td.view.components
{
   import asgui.controls.Image;
   import com.qq.display.EmbattlePlant;
   import flash.display.SimpleButton;
   
   public class TalentAdvancedWindow extends TalentAdvancedWindowCE
   {
       
      
      public var avater:EmbattlePlant;
      
      public var closeBtn:SimpleButton;
      
      public var icon:Image;
      
      public function TalentAdvancedWindow(param1:Class = null, param2:Boolean = true)
      {
         super(param1,param2);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.closeBtn = this.img_bk.mcHolder["close_btn"];
         this.l_plantName.SetStyle("color","#ffffff");
         this.l_ability.SetStyle("color","#f7e3be");
         this.l_ability.SetStyle("textShadowColor","#0");
         this.l_ability.SetStyle("textShadowStrength","6");
         this.l_ability.SetStyle("fontSize","14");
         this.l_ability.SetStyle("textAlign","left");
         this.l_ability.SetStyle("fontWeight","bold");
         this.l_power.SetStyle("textAlign","left");
         this.l_condition.SetStyle("textAlign","center");
         this.l_power.SetStyle("color","#63F5F0");
         this.l_condition.SetStyle("color","#00ff22");
         this.l_power.SetStyle("textDecoration","underline");
         this.l_condition.SetStyle("textDecoration","underline");
         this.l_power.buttonMode = true;
         this.l_condition.buttonMode = true;
         this.l_condition.width = 200;
         this.l_abilityName.SetStyle("textAlign","left");
         this.icon = new Image();
         this.icon.width = this.icon.height = 50;
         addChild(this.icon);
         this.icon.x = 237;
         this.icon.y = 101;
         this.avater = new EmbattlePlant();
         this.avater.x = 95;
         this.avater.y = 201;
         addChild(this.avater);
      }
   }
}
