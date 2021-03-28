package com.qq.modules.td.view.components
{
   public class TDPrivilegeItemCell extends TDPrivilegeItemCellCE
   {
       
      
      public function TDPrivilegeItemCell(param1:Class = null, param2:Boolean = true)
      {
         super(param1,param2);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.l_desc_1.SetStyle("fontSize","16");
         this.l_desc_2.SetStyle("fontSize","16");
         this.l_desc_2.SetStyle("color","#00ff33");
      }
      
      override public function set data(param1:Object) : void
      {
         reset(param1);
      }
   }
}
