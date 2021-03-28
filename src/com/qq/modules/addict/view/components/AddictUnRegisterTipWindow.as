package com.qq.modules.addict.view.components
{
   public class AddictUnRegisterTipWindow extends AddictUnRegisterTipWindowCE
   {
       
      
      public function AddictUnRegisterTipWindow()
      {
         super();
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         leftTimeTipLabel.visible = false;
         contentText.SetStyle("fontSize","14");
         leftTimeTipLabel.SetStyle("textAlign","left");
         leftTimeTipLabel.SetStyle("color","#FF0000");
      }
   }
}
