package com.qq.utils.ui
{
   import asgui.styles.StyleDeclaration;
   import asgui.styles.StyleManager;
   import com.qq.modules.td.view.game.layer.IDisplay;
   import flash.display.Sprite;
   import flash.text.TextField;
   import flash.text.TextFormat;
   
   public class MixTextField extends Sprite implements IDisplay
   {
       
      
      private var _display:Object;
      
      private var _tf:Object;
      
      private var _textFormat:TextFormat;
      
      public function MixTextField(param1:int, param2:int, param3:int, param4:int, param5:String = null, param6:uint = 0, param7:int = 0, param8:String = null)
      {
         var _loc9_:StyleDeclaration = null;
         var _loc10_:TextField = null;
         super();
         if(param8 == null)
         {
            param8 = "宋体";
         }
         if(param8.substr(0,1) == ".")
         {
            _loc9_ = StyleManager.GetStyleDeclaration(param8);
         }
         this._display = this;
         this._tf = new TextField();
         if(param3 != 0)
         {
            this._tf.width = param3;
         }
         if(param4 != 0)
         {
            this._tf.height = param4;
         }
         if(_loc9_)
         {
            _loc10_ = this._tf as TextField;
            _loc9_.SetTextFieldStyle(_loc10_,false);
            if(param7 != 0)
            {
               _loc10_.defaultTextFormat.size = param7;
            }
            if(param5 != null)
            {
               _loc10_.defaultTextFormat.align = param5;
            }
            _loc10_.defaultTextFormat = _loc10_.defaultTextFormat;
         }
         else if(param7 != 12 || param8 != null || param5 != null)
         {
            this._textFormat = new TextFormat(param8,param7);
            if(param5 != null)
            {
               this._textFormat.align = param5;
            }
         }
         this.setSelectable(false);
         this.setTextColor(param6);
         this._tf.x = param1;
         this._tf.y = param2;
         this._display.addChild(this._tf);
      }
      
      public function get assetLayer() : Object
      {
         return this._display;
      }
      
      public function setTextColor(param1:uint) : void
      {
         this._tf.textColor = param1;
      }
      
      public function setText(param1:String) : void
      {
         this._tf.text = param1;
         if(this._textFormat != null)
         {
            this._tf.setTextFormat(this._textFormat);
         }
      }
      
      public function setSelectable(param1:Boolean) : void
      {
         this._tf.selectable = param1;
         this._tf.mouseEnabled = param1;
      }
   }
}
