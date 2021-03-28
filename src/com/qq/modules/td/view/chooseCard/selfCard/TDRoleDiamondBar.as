package com.qq.modules.td.view.chooseCard.selfCard
{
   import asgui.controls.Image;
   import asgui.controls.Label;
   import com.qq.constant.ResLibID;
   import com.qq.modules.roleInfo.view.components.BasicRoleBar;
   import com.qq.utils.ResLibManager;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   
   public class TDRoleDiamondBar extends BasicRoleBar
   {
       
      
      public var buyBar:DisplayObject;
      
      public function TDRoleDiamondBar()
      {
         super();
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         bg = new Image();
         bg.source = ResLibManager.getInstance().getClassFromRes("TD_UI_DiamondBar",ResLibID.TDRes);
         bg.name = "TD_Role_diamondBar";
         addChild(bg);
         tf = new Label();
         tf.width = 60;
         tf.styleName = ".ProgressBar_Level";
         tf.SetStyle("fontSize","15");
         tf.x = 17;
         tf.y = 7;
         addChild(tf);
         this.buyBar = (bg.mcHolder as MovieClip).getChildByName("btnAdd") as DisplayObject;
      }
   }
}
