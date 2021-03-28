package com.qq.modules.main.view.components
{
   public class VIPConfirmPanel extends VIPConfirmPanelCE
   {
       
      
      public function VIPConfirmPanel(param1:Class = null, param2:Boolean = true)
      {
         super(param1,param2);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         l_desc.y = 5;
         l_desc.height = 80;
      }
      
      override public function set data(param1:Object) : void
      {
         l_desc.text = String(param1);
      }
   }
}
