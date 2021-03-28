package com.qq.modules.td.view.components
{
   import com.qq.modules.basic.view.BasicScreenMediator;
   
   public class TDPrivilegeItemCellMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:TDPrivilegeItemCell;
      
      public function TDPrivilegeItemCellMediator()
      {
         super();
      }
      
      override protected function init() : void
      {
         super.init();
      }
      
      override protected function initListener() : void
      {
         super.initListener();
      }
      
      override public function reset(param1:Object = null) : void
      {
         super.reset(param1);
         this.view.l_name.text = param1.name;
         this.view.l_desc_1.text = param1.desc;
         this.view.l_desc_2.text = param1.subDesc;
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
