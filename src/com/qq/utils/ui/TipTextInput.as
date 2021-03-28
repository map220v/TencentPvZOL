package com.qq.utils.ui
{
   import asgui.controls.Label;
   import asgui.controls.TextInput;
   import flash.events.Event;
   import flash.events.FocusEvent;
   
   public class TipTextInput extends TextInput
   {
       
      
      protected var _inputTooltip:String;
      
      private var _tooltipLabel:Label;
      
      private var _isSelectable:Boolean = true;
      
      public function TipTextInput()
      {
         this._tooltipLabel = new Label();
         this._tooltipLabel.y = 5;
         this._tooltipLabel.height = 25;
         this._tooltipLabel.mouseEnabled = false;
         this._tooltipLabel.mouseChildren = false;
         this._tooltipLabel.SetStyle("embedFonts","true");
         this._tooltipLabel.SetStyle("fontFamily","hkhb");
         this._tooltipLabel.SetStyle("textLeading","4");
         this._tooltipLabel.textField.wordWrap = true;
         addChild(this._tooltipLabel);
         addEventListener(FocusEvent.FOCUS_IN,this.onFocusIn);
         addEventListener(FocusEvent.FOCUS_OUT,this.onFocusOut);
         super();
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
      }
      
      override public function set width(param1:Number) : void
      {
         super.width = param1;
         this._tooltipLabel.width = param1;
      }
      
      override public function set height(param1:Number) : void
      {
         super.height = param1;
         this._tooltipLabel.height = param1;
      }
      
      public function set inputTooltip(param1:String) : void
      {
         this._inputTooltip = param1;
         this.updateInputTooltip();
      }
      
      private function updateInputTooltip() : void
      {
         if(this._inputTooltip == null || this._inputTooltip.length == 0)
         {
            this._tooltipLabel.text = "";
         }
         else
         {
            this._tooltipLabel.text = this._inputTooltip;
         }
      }
      
      override public function set selectable(param1:Boolean) : void
      {
         super.selectable = param1;
         this._isSelectable = param1;
      }
      
      private function onFocusIn(param1:Event) : void
      {
         if(!this._isSelectable)
         {
            return;
         }
         this._tooltipLabel.visible = false;
         InvalidateDisplayList();
      }
      
      private function onFocusOut(param1:Event) : void
      {
         if(!this._isSelectable)
         {
            return;
         }
         this.checkTipTextVisible(text);
         InvalidateDisplayList();
      }
      
      private function checkTipTextVisible(param1:String) : void
      {
         if(param1 != null && param1.length > 0)
         {
            this._tooltipLabel.visible = false;
         }
         else
         {
            this._tooltipLabel.visible = true;
         }
      }
      
      override public function set text(param1:String) : void
      {
         super.text = param1;
         this.checkTipTextVisible(param1);
      }
      
      override public function Dispose() : void
      {
         removeEventListener(FocusEvent.FOCUS_IN,this.onFocusIn);
         removeEventListener(FocusEvent.FOCUS_OUT,this.onFocusOut);
         super.Dispose();
      }
   }
}
