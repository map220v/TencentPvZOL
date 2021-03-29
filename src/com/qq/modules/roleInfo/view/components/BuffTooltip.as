package com.qq.modules.roleInfo.view.components
{
   import asgui.controls.Text;
   import asgui.core.IToolTip;
   import com.qq.display.QCanvas;
   
   public class BuffTooltip extends QCanvas implements IToolTip
   {
       
      
      public var txtCountDown:Text;
      
      public function BuffTooltip(param1:Class = null)
      {
         super(BuffTooltipMediator);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.styleName = "ToolTip";
         this.txtCountDown = new Text();
         this.txtCountDown.top = 2;
         this.txtCountDown.left = 2;
         this.txtCountDown.right = 2;
         this.txtCountDown.bottom = 0;
         this.addChild(this.txtCountDown);
      }
      
      public function get text() : Object
      {
         return null;
      }
      
      public function set text(param1:Object) : void
      {
         (getMediator() as BuffTooltipMediator).update(int(param1));
      }
      
      override public function Dispose() : void
      {
         this.txtCountDown = null;
         super.Dispose();
      }
   }
}
