package com.qq.modules.embattle.view.components
{
   import asgui.controls.Button;
   import asgui.controls.CheckBox;
   import asgui.controls.Label;
   import asgui.controls.TextInput;
   import com.qq.display.QCanvas;
   
   public class HeathAutoRecoverSettingPanelCE extends QCanvas
   {
       
      
      public var textinput_value:TextInput;
      
      public var button_left:Button;
      
      public var button_right:Button;
      
      public var label_tip1:Label;
      
      public var checkbox_auto:CheckBox;
      
      public function HeathAutoRecoverSettingPanelCE(param1:Class = null, param2:Boolean = true)
      {
         super(!!param2 ? (!!param1 ? param1 : HeathAutoRecoverSettingPanelMediator) : null);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.width = 589;
         this.height = 40;
         this.textinput_value = new TextInput();
         this.textinput_value.x = 15;
         this.textinput_value.y = 13;
         this.textinput_value.width = 48;
         this.textinput_value.height = 20;
         this.textinput_value.id = "textinput_value";
         this.textinput_value.styleName = ".TextInput_Gray_Font_White";
         this.addChild(this.textinput_value);
         this.button_left = new Button();
         this.button_left.styleName = ".Button_To_LeftSmall";
         this.button_left.x = 2;
         this.button_left.y = 15;
         this.button_left.width = 14;
         this.button_left.height = 19;
         this.button_left.id = "button_left";
         this.addChild(this.button_left);
         this.button_right = new Button();
         this.button_right.styleName = ".Button_To_RightSmall";
         this.button_right.x = 66;
         this.button_right.y = 15;
         this.button_right.width = 13;
         this.button_right.height = 22;
         this.button_right.id = "button_right";
         this.addChild(this.button_right);
         this.label_tip1 = new Label();
         this.label_tip1.text = "健康度小于等于该值则自动恢复";
         this.label_tip1.styleName = ".TXT_HKHB_16_YELLOW_CENTER";
         this.label_tip1.x = 78;
         this.label_tip1.y = 12;
         this.label_tip1.width = 229;
         this.label_tip1.height = 24;
         this.label_tip1.id = "label_tip1";
         this.addChild(this.label_tip1);
         this.checkbox_auto = new CheckBox();
         this.checkbox_auto.label = "防守部队自动恢复健康度、生命";
         this.checkbox_auto.x = 318;
         this.checkbox_auto.y = 10;
         this.checkbox_auto.width = 253;
         this.checkbox_auto.height = 25;
         this.checkbox_auto.id = "checkbox_auto";
         this.checkbox_auto.styleName = ".CheckBox_Yellow";
         this.addChild(this.checkbox_auto);
      }
      
      override public function Dispose() : void
      {
         this.textinput_value = null;
         this.button_left = null;
         this.button_right = null;
         this.label_tip1 = null;
         this.checkbox_auto = null;
         super.Dispose();
      }
   }
}
