package com.qq.modules.mergeServer.view.components
{
   public class MergeServerTipPanel extends MergeServerTipPanelCE
   {
       
      
      public function MergeServerTipPanel()
      {
         super();
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         txtTitle.SetStyle("fontSize","30");
         this.contentBox.visible = false;
      }
   }
}
