package com.qq.modules.roleInfo.view.components
{
   import asgui.controls.Image;
   import com.qq.constant.BattleCardStatus;
   import com.qq.modules.main.model.templates.CardHealthTemplateFactory;
   
   public class RoleHealthIcon extends RoleBuffIcon
   {
      
      public static const FULL_HEALTH:int = 0;
      
      public static const HAS_DAMAGE:int = 1;
       
      
      private var img:Image;
      
      private var _minHealth:int;
      
      public function RoleHealthIcon()
      {
         super();
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.img = new Image();
         this.addChild(this.img);
         this.buttonMode = true;
      }
      
      public function get minHealth() : int
      {
         return this._minHealth;
      }
      
      public function set minHealth(param1:int) : void
      {
         this._minHealth = param1;
         this.img.source = BattleCardStatus.getCardHealthIcon(this._minHealth);
         this.toolTip = CardHealthTemplateFactory.instance.getCardHealthTip(this._minHealth);
      }
      
      override public function Dispose() : void
      {
         super.Dispose();
      }
   }
}
