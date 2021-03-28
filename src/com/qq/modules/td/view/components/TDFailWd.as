package com.qq.modules.td.view.components
{
   import flash.display.SimpleButton;
   
   public class TDFailWd extends TDFailWdCE
   {
       
      
      public var btnTalent:SimpleButton;
      
      public var btnRestart:SimpleButton;
      
      public var btnExit:SimpleButton;
      
      public function TDFailWd(param1:Class = null, param2:Boolean = true)
      {
         super(param1,param2);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.btnTalent = this.img_bk.mcHolder["btnTalent"];
         this.btnRestart = this.img_bk.mcHolder["btnRestart"];
         this.btnExit = this.img_bk.mcHolder["btnExit"];
      }
   }
}
