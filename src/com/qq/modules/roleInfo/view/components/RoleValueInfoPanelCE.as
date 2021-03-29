package com.qq.modules.roleInfo.view.components
{
   import asgui.controls.Button;
   import asgui.controls.Image;
   import asgui.controls.Label;
   import asgui.resources.AssetManager;
   import com.qq.display.QCanvas;
   
   public class RoleValueInfoPanelCE extends QCanvas
   {
       
      
      public var image_bg:Image;
      
      public var label_coin:Label;
      
      public var label_gold_diamond:Label;
      
      public var label_gift_diamond:Label;
      
      public var label_vip_time:Label;
      
      public var label_fight_power:Label;
      
      public var button_stronger:Button;
      
      public var image_add_coin:Image;
      
      public var image_add_gold_diamond:Image;
      
      public var image_vip_flag:Image;
      
      public function RoleValueInfoPanelCE(param1:Class = null, param2:Boolean = true)
      {
         super(!!param2 ? (!!param1 ? param1 : RoleValueInfoPanelMediator) : null);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.width = 347;
         this.height = 71;
         this.image_bg = new Image();
         this.image_bg.width = 347;
         this.image_bg.height = 71;
         this.image_bg.source = AssetManager.GetClass("ModuleRole_Role_Info_BG");
         this.image_bg.x = 0;
         this.image_bg.y = 0;
         this.image_bg.id = "image_bg";
         this.addChild(this.image_bg);
         this.label_coin = new Label();
         this.label_coin.styleName = ".TXT_HKHB_14_White_Black_Right";
         this.label_coin.x = 10;
         this.label_coin.y = 9;
         this.label_coin.width = 72;
         this.label_coin.height = 20;
         this.label_coin.id = "label_coin";
         this.label_coin.text = "0";
         this.addChild(this.label_coin);
         this.label_gold_diamond = new Label();
         this.label_gold_diamond.x = 120;
         this.label_gold_diamond.y = 9;
         this.label_gold_diamond.width = 77;
         this.label_gold_diamond.height = 20;
         this.label_gold_diamond.id = "label_gold_diamond";
         this.label_gold_diamond.styleName = ".TXT_HKHB_14_White_Black_Right";
         this.label_gold_diamond.text = "0";
         this.addChild(this.label_gold_diamond);
         this.label_gift_diamond = new Label();
         this.label_gift_diamond.x = 235;
         this.label_gift_diamond.y = 9;
         this.label_gift_diamond.width = 98;
         this.label_gift_diamond.height = 20;
         this.label_gift_diamond.id = "label_gift_diamond";
         this.label_gift_diamond.styleName = ".TXT_HKHB_14_White_Black_Right";
         this.label_gift_diamond.text = "0";
         this.addChild(this.label_gift_diamond);
         this.label_vip_time = new Label();
         this.label_vip_time.x = 255;
         this.label_vip_time.y = 40;
         this.label_vip_time.width = 75;
         this.label_vip_time.height = 20;
         this.label_vip_time.id = "label_vip_time";
         this.label_vip_time.text = "0";
         this.label_vip_time.styleName = ".TXT_HKHB_14_White_Black_Right";
         this.addChild(this.label_vip_time);
         this.label_fight_power = new Label();
         this.label_fight_power.x = 35;
         this.label_fight_power.y = 37;
         this.label_fight_power.width = 118;
         this.label_fight_power.height = 24;
         this.label_fight_power.id = "label_fight_power";
         this.label_fight_power.text = "0";
         this.label_fight_power.styleName = ".TXT_HKHB_21_Yellow_Shadow";
         this.addChild(this.label_fight_power);
         this.button_stronger = new Button();
         this.button_stronger.label = "变强";
         this.button_stronger.styleName = ".GreenButtonMid";
         this.button_stronger.x = 157;
         this.button_stronger.y = 36;
         this.button_stronger.width = 58;
         this.button_stronger.height = 24;
         this.button_stronger.id = "button_stronger";
         this.addChild(this.button_stronger);
         this.image_add_coin = new Image();
         this.image_add_coin.width = 31;
         this.image_add_coin.height = 31;
         this.image_add_coin.source = AssetManager.GetClass("ModuleRole_Button_Add");
         this.image_add_coin.x = 86;
         this.image_add_coin.y = 2;
         this.image_add_coin.id = "image_add_coin";
         this.addChild(this.image_add_coin);
         this.image_add_gold_diamond = new Image();
         this.image_add_gold_diamond.width = 31;
         this.image_add_gold_diamond.height = 31;
         this.image_add_gold_diamond.x = 200;
         this.image_add_gold_diamond.y = 2;
         this.image_add_gold_diamond.id = "image_add_gold_diamond";
         this.image_add_gold_diamond.source = AssetManager.GetClass("ModuleRole_Button_Add");
         this.addChild(this.image_add_gold_diamond);
         this.image_vip_flag = new Image();
         this.image_vip_flag.width = 35;
         this.image_vip_flag.height = 36;
         this.image_vip_flag.source = AssetManager.GetClass("ModuleRole_VIP_Flag");
         this.image_vip_flag.x = 220;
         this.image_vip_flag.y = 33;
         this.image_vip_flag.id = "image_vip_flag";
         this.addChild(this.image_vip_flag);
      }
      
      override public function Dispose() : void
      {
         this.image_bg = null;
         this.label_coin = null;
         this.label_gold_diamond = null;
         this.label_gift_diamond = null;
         this.label_vip_time = null;
         this.label_fight_power = null;
         this.button_stronger = null;
         this.image_add_coin = null;
         this.image_add_gold_diamond = null;
         this.image_vip_flag = null;
         super.Dispose();
      }
   }
}
