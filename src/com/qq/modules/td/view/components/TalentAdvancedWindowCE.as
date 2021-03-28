package com.qq.modules.td.view.components
{
   import asgui.controls.Button;
   import asgui.controls.Image;
   import asgui.controls.Label;
   import asgui.controls.Text;
   import asgui.resources.AssetManager;
   import com.qq.display.QCanvas;
   
   public class TalentAdvancedWindowCE extends QCanvas
   {
       
      
      public var img_bk:Image;
      
      public var btnAdvanced:Button;
      
      public var l_plantName:Label;
      
      public var label_412:Label;
      
      public var label_413:Label;
      
      public var l_power:Label;
      
      public var l_condition:Label;
      
      public var l_ability:Text;
      
      public var l_abilityName:Label;
      
      public var label_408:Label;
      
      public function TalentAdvancedWindowCE(param1:Class = null, param2:Boolean = true)
      {
         super(!!param2 ? (!!param1 ? param1 : TalentAdvancedWindowMediator) : null);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.width = 504;
         this.height = 354;
         this.scrollRectEnabled = false;
         this.img_bk = new Image();
         this.img_bk.width = 504;
         this.img_bk.height = 354;
         this.img_bk.source = AssetManager.GetClass("UI_Talent_Advanced_Bg");
         this.img_bk.x = 0;
         this.img_bk.y = 0;
         this.img_bk.id = "img_bk";
         this.img_bk.scrollRectEnabled = false;
         this.addChild(this.img_bk);
         this.btnAdvanced = new Button();
         this.btnAdvanced.label = "学 习";
         this.btnAdvanced.styleName = ".GreenButton";
         this.btnAdvanced.x = 195;
         this.btnAdvanced.y = 297;
         this.btnAdvanced.width = 120;
         this.btnAdvanced.height = 50;
         this.btnAdvanced.id = "btnAdvanced";
         this.addChild(this.btnAdvanced);
         this.l_plantName = new Label();
         this.l_plantName.text = "钻地荔枝果";
         this.l_plantName.styleName = ".TXT_HKHB_24_Yellow_Shadow";
         this.l_plantName.x = 170;
         this.l_plantName.y = 25;
         this.l_plantName.width = 150;
         this.l_plantName.height = 35;
         this.l_plantName.id = "l_plantName";
         this.addChild(this.l_plantName);
         this.label_412 = new Label();
         this.label_412.text = "获得能力";
         this.label_412.styleName = ".TXT_HKHB_18_Yellow_Shadow";
         this.label_412.x = 284;
         this.label_412.y = 71;
         this.label_412.width = 80;
         this.label_412.height = 24;
         this.label_412.id = "label_412";
         this.addChild(this.label_412);
         this.label_413 = new Label();
         this.label_413.text = "进阶条件";
         this.label_413.styleName = ".TXT_HKHB_18_Yellow_Shadow";
         this.label_413.x = 288;
         this.label_413.y = 207;
         this.label_413.width = 80;
         this.label_413.height = 24;
         this.label_413.id = "label_413";
         this.addChild(this.label_413);
         this.l_power = new Label();
         this.l_power.text = "99999";
         this.l_power.styleName = ".TXT_HKHB_16_Yellow_Shadow";
         this.l_power.x = 224;
         this.l_power.y = 248;
         this.l_power.width = 100;
         this.l_power.height = 24;
         this.l_power.id = "l_power";
         this.addChild(this.l_power);
         this.l_condition = new Label();
         this.l_condition.text = "中级闪避：100级";
         this.l_condition.styleName = ".TXT_HKHB_16_Yellow_Shadow";
         this.l_condition.x = 284;
         this.l_condition.y = 248;
         this.l_condition.width = 150;
         this.l_condition.height = 24;
         this.l_condition.id = "l_condition";
         this.addChild(this.l_condition);
         this.l_ability = new Text();
         this.l_ability.x = 174;
         this.l_ability.y = 156;
         this.l_ability.width = 300;
         this.l_ability.height = 40;
         this.l_ability.id = "l_ability";
         this.addChild(this.l_ability);
         this.l_abilityName = new Label();
         this.l_abilityName.text = "龙争虎斗";
         this.l_abilityName.styleName = ".TXT_HKHB_18_Yellow_Shadow";
         this.l_abilityName.x = 293;
         this.l_abilityName.y = 114;
         this.l_abilityName.width = 160;
         this.l_abilityName.height = 24;
         this.l_abilityName.id = "l_abilityName";
         this.addChild(this.l_abilityName);
         this.label_408 = new Label();
         this.label_408.text = "战力：";
         this.label_408.styleName = ".TXT_HKHB_16_Yellow_Shadow";
         this.label_408.x = 172;
         this.label_408.y = 248;
         this.label_408.width = 48;
         this.label_408.height = 24;
         this.label_408.id = "label_408";
         this.addChild(this.label_408);
      }
      
      override public function Dispose() : void
      {
         this.img_bk = null;
         this.btnAdvanced = null;
         this.l_plantName = null;
         this.label_412 = null;
         this.label_413 = null;
         this.l_power = null;
         this.l_condition = null;
         this.l_ability = null;
         this.l_abilityName = null;
         this.label_408 = null;
         super.Dispose();
      }
   }
}
