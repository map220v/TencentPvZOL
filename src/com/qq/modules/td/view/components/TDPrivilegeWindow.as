package com.qq.modules.td.view.components
{
   public class TDPrivilegeWindow extends TDPrivilegeWindowCE
   {
       
      
      public function TDPrivilegeWindow(param1:Class = null, param2:Boolean = true)
      {
         super(param1,param2);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.l_columnTitle_1.SetStyle("fontSize","22");
         this.l_columnTitle_1.SetStyle("textShadowColor","#000000");
         this.l_columnTitle_1.SetStyle("textShadowStrength","40");
         this.l_columnTitle_2.SetStyle("fontSize","22");
         this.l_columnTitle_2.SetStyle("textShadowColor","#000000");
         this.l_columnTitle_2.SetStyle("textShadowStrength","40");
         this.l_time.width = 220;
         this.l_time.SetStyle("textAlign","left");
         this.l_time.SetStyle("fontSize","18");
         this.l_time.SetStyle("textShadowColor","#000000");
         this.l_time.SetStyle("textShadowStrength","20");
         this.btnActive.SetStyle("textDownPaddingTop","0");
         this.list.rowHeight = 74;
      }
   }
}
