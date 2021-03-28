package com.qq.modules.main.view.components
{
   public class UseDiamondView extends UseDiamondCE
   {
       
      
      public function UseDiamondView(param1:Class = null)
      {
         super(UseDiamondMediator);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
      }
      
      override public function set data(param1:Object) : void
      {
         this.textarea_desc.htmlText = String(param1);
      }
   }
}
